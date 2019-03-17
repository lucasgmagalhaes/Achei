import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Usuario } from 'src/app/interfaces/usuario.interface';
import { SessionService } from 'src/app/auth/session.service';

@Injectable({
  providedIn: 'root'
})
export class ProfileService {

  constructor(private http: HttpClient) { }

  /**
   * Busca o perfil do usuário baseado no id dele
   * @param id Id do usuário
   */
  buscarPerfil(id: number): Promise<Usuario> {
    return this.http.get(`${environment.apiUrl}/usuario/${id}`).toPromise();
  }

  /**
   * Persiste as informações do usuário no banco
   * @param usuario usuário a ser persistido
   */
  salvar(usuario: Usuario): Promise<Usuario> {
    return this.http.put(`${environment.apiUrl}/usuario`, usuario).toPromise();
  }
}
