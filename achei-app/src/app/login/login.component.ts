import { Component, OnInit } from '@angular/core';
import { SessionService } from '../auth/session.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  formLogin: FormGroup;
  constructor(
    private sessionService: SessionService,
    private form: FormBuilder,
    private route: Router,
    private notificacao: MatSnackBar) { }

  ngOnInit() {
    this.formLogin = this.form.group({
      email: this.form.control('', [Validators.required, Validators.email]),
      senha: this.form.control('', [Validators.required])
    });
  }

  login() {
    this.sessionService.iniciarSessao(this.formLogin.get('email').value,
      this.formLogin.get('senha').value)
      .then(() => this.route.navigate(['/home']))
      .catch(error => this.notificacao.open(error, 'Ok', { duration: 2000 }));
  }

  getForm() {
    return this.formLogin.controls;
  }

}
