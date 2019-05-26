import { Component, OnInit } from '@angular/core';
import { ItensUsuarioService } from './shared/itens-usuario.service';
import { ItemEncontrado, ItemPerdido, Item } from '../item/shared/item.interface';
import { SessionService } from '../auth/session.service';
import { MatDialog } from '@angular/material';
import { ItemDetalheComponent } from '../item-detalhe/item-detalhe.component';

@Component({
  selector: 'app-achados',
  templateUrl: './achados.component.html',
  styleUrls: ['./achados.component.scss']
})
export class AchadosComponent implements OnInit {

  itensAchados: ItemEncontrado[] = [];
  itensPerdidos: ItemPerdido[] = [];

  next: boolean;

  constructor(private itensService: ItensUsuarioService, private sessionService: SessionService,
    public dialog: MatDialog) {
    this.sessionService.getIdUsuario().subscribe(id => {
      this.itensService.buscarAchados(id).then(achados => this.itensAchados = achados);
      this.itensService.buscarPerdidos(id).then(perdidos => {
        console.log(perdidos);
        this.itensPerdidos = perdidos;
      });
    });
  }

  ngOnInit() {
  }

  abrirItem(item: Item) {
    const dialogRef = this.dialog.open(ItemDetalheComponent, {
      width: '250px'
    });
  }

}
