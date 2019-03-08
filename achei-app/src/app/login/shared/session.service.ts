import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SessionService {

  private token: string;
  private email: string;
  private nome: string;

  constructor() { }

  iniciarSessao(email: string, senha: string) {
    this.email = email;
  }

  usuarioLogado(): boolean {
    return this.token !== undefined;
  }

  getNomeUsuarioLogado(): string {
    return this.nome;
  }
}
