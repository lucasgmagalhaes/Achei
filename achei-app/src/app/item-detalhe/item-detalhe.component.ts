import { Component, OnInit, Inject } from '@angular/core';
import { Item, tipoItem, ItemEncontrado, ItemPerdido } from '../item/shared/item.interface';
import { FormBuilder, FormGroup, Validators, FormArray, FormControl } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ItemService } from '../item/shared/item.service';

@Component({
  selector: 'app-item-detalhe',
  templateUrl: './item-detalhe.component.html',
  styleUrls: ['./item-detalhe.component.scss']
})
export class ItemDetalheComponent implements OnInit {

  itemForm: FormGroup;
  item: Item;

  constructor(private formBuilder: FormBuilder,
    private activeRoute: ActivatedRoute,
    private itemService: ItemService) {
    this.itemForm = this.formBuilder.group({
      titulo: this.formBuilder.control('', Validators.required),
      tags: this.formBuilder.array([]),
      detalhe: this.formBuilder.control(''),
      latitudeLocal: this.formBuilder.control('', Validators.required),
      longitudeLocal: this.formBuilder.control('', Validators.required),
      dataInicial: this.formBuilder.control('', Validators.required),
      dataFinal: this.formBuilder.control('', Validators.required),
      hora: this.formBuilder.control('', Validators.required),
      minuto: this.formBuilder.control('', Validators.required),
      imagens: this.formBuilder.array([])
    });

    const id = this.activeRoute.snapshot.params['id'];
    const tipo: tipoItem = this.activeRoute.snapshot.params['tipo'];

    if (tipo === 'achado') {
      this.itemService.buscarAchado(id).then(item => this.preencherForm(item));
    } else if (tipo === 'perdido') {
      this.itemService.buscarPerdido(id).then(item => this.preencherForm(item));
    }
  }

  preencherForm(item: Item) {
    this.itemForm.get('titulo').setValue(item.titulo);
    this.itemForm.get('detalhe').setValue(item.detalhe);

    const tags = this.itemForm.get('tags') as FormArray;
    item.tags.forEach(tag => tags.push(new FormControl(tag)));

    this.itemForm.get('latitudeLocal').setValue(item.regiao.latitude);
    this.itemForm.get('longitudeLocal').setValue(item.regiao.longitude);

    this.itemForm.get('dataInicial').setValue(item.dataInicio);
    this.itemForm.get('dataFinal').setValue(item.dataFim);

    this.itemForm.get('hora').setValue(item.hora.split(':')[0]);
    this.itemForm.get('minuto').setValue(item.hora.split(':')[1]);

    const imagens = this.itemForm.get('imagens') as FormArray;
    item.imagens.forEach(imagem => imagens.push(new FormControl(imagem)));

    if (item as ItemEncontrado !== undefined)  {

    } else {

    }
  }

  ngOnInit() {
  }

}
