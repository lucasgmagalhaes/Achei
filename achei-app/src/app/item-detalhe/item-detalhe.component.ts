import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Item } from '../item/shared/item.interface';

@Component({
  selector: 'app-item-detalhe',
  templateUrl: './item-detalhe.component.html',
  styleUrls: ['./item-detalhe.component.scss']
})
export class ItemDetalheComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<ItemDetalheComponent>,
    @Inject(MAT_DIALOG_DATA) public data: Item) { }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
