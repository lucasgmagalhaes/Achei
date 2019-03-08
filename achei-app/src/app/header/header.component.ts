import { Component, OnInit } from '@angular/core';
import { SessionService } from '../login/shared/session.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(private sessionService: SessionService) { }

  ngOnInit() {
  }

  usuarioLogado() {
    return this.sessionService.usuarioLogado();
  }

  getNomeUsuario(): string {
    return this.sessionService.getNomeUsuarioLogado();
  }
}
