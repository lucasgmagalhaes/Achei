import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { ItemPerdido, ItemEncontrado } from 'src/app/item/shared/item.interface';

@Injectable({
  providedIn: 'root'
})
export class ItensUsuarioService {

  constructor(private http: HttpClient) { }

  buscarPerdidos(idUsuario: number): Promise<ItemPerdido[]> {
    return this.http.get<ItemPerdido[]>(`${environment.apiUrl}/usuario/${idUsuario}/itensPerdidos`).toPromise();
  }

  buscarAchados(idUsuario: number): Promise<ItemEncontrado[]> {
    return this.http.get<ItemEncontrado[]>(`${environment.apiUrl}/usuario/${idUsuario}/itensAchados`).toPromise();
  }

}
