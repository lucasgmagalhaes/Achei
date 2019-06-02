import { Component, OnInit } from '@angular/core';
import { HomeService } from './home.service';
import { ItemEncontrado, ItemPerdido } from '../item/shared/item.interface';
import { SessionService } from '../auth/session.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  matchAchados: ItemEncontrado[] = [];

  constructor(private homeService: HomeService, private sessionService: SessionService) {
    this.sessionService.getIdUsuario().subscribe(id => {
      this.homeService.buscarMatchAchados(id).then(achados => this.matchAchados = achados);
    });
   }

  ngOnInit() {
  }

}
