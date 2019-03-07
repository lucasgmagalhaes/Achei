import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import regioes from './estados.json';
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

  constructor() { }

  ngOnInit() {
    this.estadosFiltrados = this.estadoFormControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filter(value))
      );
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
    this.url = this.baseImg;
  }

  setFile(event) {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();

      reader.readAsDataURL(event.target.files[0]);

      reader.onload = (_event) => {
        this.url = (<FileReader>_event.target).result.toString();
      };
    }
  }
}
