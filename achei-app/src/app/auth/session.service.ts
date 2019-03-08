import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SessionService {

  private token = new BehaviorSubject<string>('');
  private email = new BehaviorSubject<string>('');
  private nome = new BehaviorSubject<string>('');
  private logado = new BehaviorSubject<boolean>(false);

  constructor() {
    if (localStorage.getItem('nome')) {
      this.logado.next(true);
      this.nome.next('lucas');
    }
  }

  iniciarSessao(email: string, senha: string) {
    localStorage.setItem('nome', 'lucas');
    this.nome.next('lucas');
    this.logado.next(true);
    this.email.next(email);
  }

  logout() {
    localStorage.clear();
    this.logado.next(false);
    this.nome.next('');
  }

  isLogado(): Observable<boolean> {
    return this.logado.asObservable();
  }

  getNomeUsuarioLogado(): Observable<string> {
    return this.nome.asObservable();
  }
}
