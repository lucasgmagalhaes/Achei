import { Component, OnInit } from '@angular/core';
import { SessionService } from '../login/shared/session.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  logado: boolean;
  nomeUsuario: string;

  constructor(private sessionService: SessionService) {
    this.sessionService.isLogado().subscribe(logado => this.logado = logado);
    this.sessionService.getNomeUsuarioLogado().subscribe(nome => this.nomeUsuario = nome);
  }

  logout() {
    this.sessionService.logout();
  }

  ngOnInit() { }

}
