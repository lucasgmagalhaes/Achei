import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ItemPerdido, ItemEncontrado } from '../item/shared/item.interface';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  constructor(private http: HttpClient) { }

  buscarMatchPerdidos(idUsuario: number): Promise<ItemPerdido[]> {
    return this.http.get<ItemPerdido[]>(`${environment.apiUrl}/usuario/${idUsuario}/itensPerdidosMatch`).toPromise();
  }

  buscarMatchAchados(idUsuario: number): Promise<ItemEncontrado[]> {
    return this.http.get<ItemEncontrado[]>(`${environment.apiUrl}/usuario/${idUsuario}/itensAchadosMatch`).toPromise();
  }
}
