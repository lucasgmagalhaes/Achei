import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Usuario } from '../interfaces/usuario.interface';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignupService {

  constructor(private http: HttpClient) { }

  criarUsuario(usuario: Usuario): Observable<Object> {
    console.log(`${environment.apiUrl}/usuario`);
    return this.http.post(`${environment.apiUrl}/usuario`, usuario);
  }
}
