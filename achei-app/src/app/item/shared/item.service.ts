import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ItemPerdido, ItemEncontrado } from './item.interface';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ItemService {

  constructor(private http: HttpClient) { }

  cadastrarPerdido(item: ItemPerdido): Observable<Object> {
    return this.http.post(`${environment.apiUrl}/itemPerdido`, item);
  }

  cadastrarchado(item: ItemEncontrado): Observable<Object> {
    return this.http.post(`${environment.apiUrl}/itemAchado`, item);
  }
}
