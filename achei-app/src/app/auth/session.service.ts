import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { RequestResponse } from '../interfaces/requestResponse.interface';
import { environment } from 'src/environments/environment';
import { Usuario } from '../interfaces/usuario.interface';

@Injectable({
  providedIn: 'root'
})
export class SessionService {

  private token = new BehaviorSubject<string>('');
  private id = new BehaviorSubject<number>(0);
  private email = new BehaviorSubject<string>('');
  private nome = new BehaviorSubject<string>('');
  private logado = new BehaviorSubject<boolean>(false);

  constructor(private router: Router, private http: HttpClient) {
    const nome = localStorage.getItem('nome');
    const token = localStorage.getItem('token');
    const email = localStorage.getItem('email');
    const id = localStorage.getItem('id');

    if (nome) {
      this.nome.next(nome);
    }

    if (token) {
      this.logado.next(true);
      this.token.next(token);
    }

    if (email) {
      this.email.next(email);
    }

    if (id) {
      // tslint:disable-next-line: radix
      this.id.next(Number.parseInt(id));
    }
  }

  /**
   * Faz a autenticação do usuário na api, salvando seu Id, Nome e token
   * na sessão se o email e senha informados pertencerem a um usuário, retornando
   * uma promisse void se isso acontecer.
   * rejeita a promisse se houver algum problema na autenticação do usuário,
   * onde a promisse contém a mensagem de erro retornada pelo servidor.
   * @param email Email do usuário a logar
   * @param senha Senha do usuário a logar
   */
  iniciarSessao(email: string, senha: string): Promise<void> {
    return this.http.post<RequestResponse>(`${environment.apiUrl}/autenticacao`,
      { email: email, senha: senha }).toPromise().then(response => {
        if (response.authenticated) {
          if (response.usuario) {
            const usuario = (<Usuario>response.usuario);
            localStorage.setItem('nome', usuario.nome);
            this.nome.next(usuario.nome);

            localStorage.setItem('id', usuario.id.toString());
            this.id.next(usuario.id);
          }

          localStorage.setItem('token', response.token);
          this.token.next(response.token);

          this.logado.next(true);
          this.email.next(email);
          return Promise.resolve();
        }
        return Promise.reject(response.message);
      });
  }

  logout() {
    localStorage.clear();
    this.logado.next(false);
    this.nome.next('');
    this.router.navigate(['/']);
  }

  getIdUsuario(): Observable<number> {
    return this.id.asObservable();
  }

  isLogado(): Observable<boolean> {
    return this.logado.asObservable();
  }

  getNomeUsuarioLogado(): Observable<string> {
    return this.nome.asObservable();
  }

  setNomeUsuario(nome: string) {
    localStorage.setItem('nome', nome);
    this.nome.next(nome);
  }

  getToken(): Observable<string> {
    return this.token.asObservable();
  }
}
