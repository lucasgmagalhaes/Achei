import { Component, OnInit } from '@angular/core';
import { SessionService } from '../auth/session.service';
import { HeaderService } from './shared/header.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  logado: boolean;
  nomeUsuario: string;
  exibirBarra: boolean;

  constructor(private sessionService: SessionService, private headerService: HeaderService) {
    this.sessionService.isLogado().subscribe(logado => {
      this.logado = logado;
      console.log(logado);
    });
    this.sessionService.getNomeUsuarioLogado().subscribe(nome => this.nomeUsuario = nome);
    this.headerService.statusBarraDeProgresso().subscribe(status => this.exibirBarra = status);
  }

  logout() {
    this.sessionService.logout();
  }

  ngOnInit() { }

}
