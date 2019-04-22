import { Component, OnInit } from '@angular/core';
import { ItensUsuarioService } from './shared/itens-usuario.service';
import { ItemEncontrado, ItemPerdido } from '../item/shared/item.interface';
import { SessionService } from '../auth/session.service';

@Component({
  selector: 'app-achados',
  templateUrl: './achados.component.html',
  styleUrls: ['./achados.component.scss']
})
export class AchadosComponent implements OnInit {

  itensAchados: ItemEncontrado[];
  itensPerdidos: ItemPerdido[];

  constructor(private itensService: ItensUsuarioService, private sessionService: SessionService) {
    this.sessionService.getIdUsuario().subscribe(id => {
      this.itensService.buscarAchados(id).then(achados => this.itensAchados = achados);
      this.itensService.buscarPerdidos(id).then(perdidos => this.itensPerdidos = perdidos);
    });

   }

  ngOnInit() {
  }

}
