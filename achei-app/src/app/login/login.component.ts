import { Component, OnInit } from '@angular/core';
import { SessionService } from './shared/session.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(private sessionService: SessionService) { }

  ngOnInit() {
  }

  login() {
    this.sessionService.iniciarSessao('lucas@hotmail.com', '1123');
  }

}
