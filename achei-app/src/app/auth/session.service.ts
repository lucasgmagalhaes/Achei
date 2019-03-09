import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SessionService {

  private token = new BehaviorSubject<string>('');
  private email = new BehaviorSubject<string>('');
  private nome = new BehaviorSubject<string>('');
  private logado = new BehaviorSubject<boolean>(false);

  constructor(private router: Router) {
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
    this.router.navigate(['/']);
  }

  isLogado(): Observable<boolean> {
    return this.logado.asObservable();
  }

  getNomeUsuarioLogado(): Observable<string> {
    return this.nome.asObservable();
  }
}
