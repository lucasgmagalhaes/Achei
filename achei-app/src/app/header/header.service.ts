import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HeaderService {

  barra = new BehaviorSubject<boolean>(false);
  constructor() { }

  esconderBarraDeProgresso() {
    this.barra.next(false);
  }

  exibirBarraDeProgresso() {
    this.barra.next(true);
  }

  statusBarraDeProgresso(): Observable<boolean> {
    return this.barra.asObservable();
  }
}
