import { FormGroup, FormGroupDirective, FormControl, NgForm } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material';

export function checkPasswords(group: FormGroup) { // here we have the 'passwords' group
    const pass = group.controls.senha.value;
    const confirmPass = group.controls.confirmarSenha.value;

    return pass === confirmPass ? null : { notSame: true };
}

export class FormErroVerificador implements ErrorStateMatcher {
    isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
        const invalidCtrl = !!(control && control.invalid && control.parent.dirty);
        const invalidParent = !!(control && control.parent && control.parent.invalid && control.parent.dirty);

        return (invalidCtrl || invalidParent);
    }
}
