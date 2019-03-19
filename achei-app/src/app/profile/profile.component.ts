import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { Observable } from 'rxjs';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import regioes from './estados.json';
import { ProfileService } from './shared/profile.service';
import { Usuario } from '../interfaces/usuario.interface';
import { MatSnackBar } from '@angular/material';
import { SessionService } from '../auth/session.service';
import { checkPasswords, FormErroVerificador } from '../utils/passwordCheck';
@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

  baseImg = '../../assets/undefined_user.png';
  url = this.baseImg;

  estadoFormControl = new FormControl();
  cidadeFormControl = new FormControl();

  estados: string[] = regioes.estados.map(estado => estado.nome);
  cidades: string[];

  estadosFiltrados: Observable<string[]>;
  cidadesFiltradas: Observable<string[]>;

  formPerfil: FormGroup;
  usuarioId: number;

  verificador = new FormErroVerificador();

  constructor(private formBuilder: FormBuilder,
    private changeDetector: ChangeDetectorRef,
    private profileService: ProfileService,
    private notificacao: MatSnackBar,
    private sessionService: SessionService) { }

  ngOnInit() {

    this.formPerfil = this.formBuilder.group({
      nome: this.formBuilder.control('', [Validators.required]),
      email: this.formBuilder.control('', [Validators.required, Validators.email]),
      senha: this.formBuilder.control('', [Validators.required]),
      confirmarSenha: this.formBuilder.control(''),
      dataNascimento: this.formBuilder.control('', [Validators.required]),
      telefone: this.formBuilder.control('', [Validators.required]),
      estado: this.estadoFormControl,
      cidade: this.cidadeFormControl,
      sexo: this.formBuilder.control(''),
      fotoPerfil: this.formBuilder.control('')
    },
      { validator: checkPasswords }
    );

    this.estadosFiltrados = this.estadoFormControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filter(value))
      );

    this.sessionService.getIdUsuario().subscribe(id => {

      this.usuarioId = id;

      this.profileService.buscarPerfil(id).then(usuario => {
        if (usuario) {
          if (usuario.email) {
            this.formPerfil.get('email').setValue(usuario.email);
          }

          if (usuario.nome) {
            this.formPerfil.get('nome').setValue(usuario.nome);
          }

          if (usuario.cidade) {
            this.formPerfil.get('cidade').setValue(usuario.cidade);
          }

          if (usuario.estado) {
            this.formPerfil.get('estado').setValue(usuario.estado);
          }

          if (usuario.dataNascimento) {
            this.formPerfil.get('dataNascimento').setValue(usuario.dataNascimento);
          }

          if (usuario.sexo) {
            this.formPerfil.get('sexo').setValue(usuario.sexo);
          }

          if (usuario.telefone) {
            this.formPerfil.get('telefone').setValue(usuario.telefone);
          }

          if (usuario.fotoPerfil && usuario.fotoPerfil.trim() !== '') {
            this.formPerfil.get('fotoPerfil').setValue(usuario.fotoPerfil);
          } else {
            this.formPerfil.get('fotoPerfil').setValue(this.baseImg);
          }

        }
      }).catch(error => {
        this.notificacao.open('Não foi possível carregar o perfil', 'Ok', { duration: 2000 });
        console.error(error);
      });

    });
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.estados.filter(option => option.toLowerCase().includes(filterValue));
  }

  setCidades() {
    if (this.estadoFormControl.value) {
      this.cidadeFormControl.setValue('');
      this.cidades = this.filtrarCidadesPorEstado((<string>this.estadoFormControl.value));
      this.cidadesFiltradas = this.cidadeFormControl.valueChanges
        .pipe(
          startWith(''),
          map(value => this.filtrarCidades(value))
        );
    }
  }

  private filtrarCidadesPorEstado(estado: string): string[] {
    const estadoCidades = regioes.estados
      .filter(_estado => _estado.nome.toLocaleLowerCase()
        .includes(estado.toLocaleLowerCase()));

    if (estadoCidades && estadoCidades.length > 0) {
      this.cidades = estadoCidades[0].cidades;
      return estadoCidades[0].cidades;
    }
    return [];
  }

  private filtrarCidades(cidade: string): string[] {
    if (this.cidades) {
      const filterValue = cidade.toLowerCase();
      return this.cidades.filter(option => option.toLowerCase().includes(filterValue));
    }
  }

  selectImg() {
    document.getElementById('imgupload').click();
  }

  removeImg() {
    this.formPerfil.get('fotoPerfil').setValue(this.baseImg);
  }

  setFile(event) {
    const reader = new FileReader();

    if (event.target.files && event.target.files.length) {
      const [file] = event.target.files;
      reader.readAsDataURL(file);

      reader.onload = () => {
        this.formPerfil.get('fotoPerfil').setValue(reader.result.toString());
        // need to run CD since file load runs outside of zone
        this.changeDetector.markForCheck();
      };
    }
  }

  salvar(usuario: Usuario) {
    usuario.id = this.usuarioId;
    this.profileService.salvar(usuario).then(() => {
      this.sessionService.setNomeUsuario(usuario.nome);
      this.notificacao.open('Perfil salvo', 'Ok', { duration: 2000 });
    }).catch(error => {
      this.notificacao.open('Não foi possível salvar o perfil', 'Ok', { duration: 2000 });
      console.error(error);
    });
  }

  getForm() {
    return this.formPerfil.controls;
  }
}
