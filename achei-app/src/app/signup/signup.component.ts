import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SignupService } from './shared/signup.service';
import { HeaderService } from '../header/shared/header.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material';
import { SessionService } from '../auth/session.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {

  cadastroUsuario: FormGroup;
  submitted: boolean;
  criando: boolean;

  constructor(
    private form: FormBuilder,
    private signUpService: SignupService,
    private headerService: HeaderService,
    private route: Router,
    private notificacao: MatSnackBar,
    private sessionService: SessionService) { }

  ngOnInit() {

    this.cadastroUsuario = this.form.group({
      nome: this.form.control('', [Validators.required]),
      email: this.form.control('', [Validators.required, Validators.email]),
      senha: this.form.control('', [Validators.required, Validators.minLength(6)]),
      confirmarSenha: this.form.control('', [Validators.required, Validators.minLength(6)])
    });
  }

  getForm() {
    return this.cadastroUsuario.controls;
  }

  cadastrar() {
    this.submitted = true;
    this.criando = true;
    this.headerService.esconderBarraDeProgresso();

    this.signUpService.criarUsuario({
      nome: this.cadastroUsuario.get('nome').value,
      email: this.cadastroUsuario.get('email').value,
      senha: this.cadastroUsuario.get('senha').value,
    }).then(response => {

      const email = this.cadastroUsuario.get('email').value;
      const senha = this.cadastroUsuario.get('senha').value;

      this.headerService.esconderBarraDeProgresso();
      const status = response.status;

      if (status) {
        if (status.toString().substring(0, 1) === '2') {
          console.log('Usuário criado com sucesso');
          this.sessionService.iniciarSessao(email, senha).then(() => {
            this.route.navigate(['/home']);
          })
            // Não foi possível realizar o login (Não faz sentido isso acontecer logo)
            // após cadastrar o usuário. Mas...
            .catch(error => {
              this.notificacao.open(error.message, 'Ok', { duration: 2000 });
              this.submitted = false;
              this.criando = false;
            });

        } else {
          console.error('Não foi possível criar o usuário', response);
          this.notificacao.open('Não foi possível cadastrar o usuário', 'Ok', { duration: 2000 });
          this.criando = false;
        }
      }
    }).catch(error => {
      console.error('Não foi possível criar o usuário', error);
      this.notificacao.open(error.message, 'Ok', { duration: 2000 });
    });
  }

  checkSenhas(controlName: string, matchingControlName: string) {
    return (formGroup: FormGroup) => {
      const control = formGroup.controls[controlName];
      const matchingControl = formGroup.controls[matchingControlName];

      if (matchingControl.errors && !matchingControl.errors.mustMatch) {
        // return if another validator has already found an error on the matchingControl
        return;
      }

      // set error on matchingControl if validation fails
      if (control.value !== matchingControl.value) {
        matchingControl.setErrors({ mustMatch: true });
      } else {
        matchingControl.setErrors(null);
      }
    };
  }
}
