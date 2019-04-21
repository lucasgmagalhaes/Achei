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

  cadastrarPerdido(item: ItemPerdido): Promise<boolean> {
    return this.http.post<boolean>(`${environment.apiUrl}/itemPerdido`, item).toPromise();
  }

  cadastrarchado(item: ItemEncontrado): Promise<boolean> {
    return this.http.post<boolean>(`${environment.apiUrl}/itemAchado`, item).toPromise();
  }

}
