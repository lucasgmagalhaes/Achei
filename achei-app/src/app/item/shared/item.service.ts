import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ItemPerdido, ItemEncontrado, Tag, Regiao } from './item.interface';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ItemService {

  constructor(private http: HttpClient) { }

  cadastrarPerdido(item: ItemPerdido): Promise<boolean> {
    return this.http.post<boolean>(`${environment.apiUrl}/itemPerdido`, item).toPromise();
  }

  cadastrarchado(item: ItemEncontrado): Promise<boolean> {
    return this.http.post<boolean>(`${environment.apiUrl}/itemAchado`, item).toPromise();
  }

  /**
   * Busca um item **Perdido** baseado no seu *Id*
   * @async
   * @param id Id do item
   */
  buscarPerdido(id: number): Promise<ItemPerdido> {
    return this.http.get<ItemPerdido>(`${environment.apiUrl}/itemPerdido/${id}`).toPromise();
  }

  /**
   * Busca um item **Achado** baseado no seu *Id*
   * @param id Id do item
   */
  buscarAchado(id: number): Promise<ItemPerdido> {
    return this.http.get<ItemPerdido>(`${environment.apiUrl}/itemAchado/${id}`).toPromise();
  }

  buscarTagPorItemPerdidoId(id: number): Promise<Tag[]> {
    return this.http.get<Tag[]>(`${environment.apiUrl}/itemPerdido/${id}/tags`).toPromise();
  }

  buscarTagPorItemAchadoId(id: number): Promise<Tag[]> {
    return this.http.get<Tag[]>(`${environment.apiUrl}/itemAchado/${id}/tags`).toPromise();
  }

  buscarRegiaoPorItemPerdidoId(id: number): Promise<Regiao> {
    return this.http.get<Regiao>(`${environment.apiUrl}/itemPerdido/${id}/regiao`).toPromise();
  }

  buscarRegiaoPorItemAchadoId(id: number): Promise<Regiao> {
    return this.http.get<Regiao>(`${environment.apiUrl}/itemAchado/${id}/regiao`).toPromise();
  }
}
