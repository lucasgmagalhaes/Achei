import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { SignupService } from './signup.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {

  cadastroUsuario: FormGroup;
  submitted: boolean;

  constructor(private form: FormBuilder, private signUpService: SignupService) { }

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
    this.signUpService.criarUsuario({
      nome: this.cadastroUsuario.get('nome').value,
      email: this.cadastroUsuario.get('email').value,
      senha: this.cadastroUsuario.get('senha').value,
    }).subscribe(response => console.log(response));
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
