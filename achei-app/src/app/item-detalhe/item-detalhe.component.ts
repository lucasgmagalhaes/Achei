import { Component, OnInit, Inject } from '@angular/core';
import { Item, tipoItem, ItemEncontrado, ItemPerdido, Tag } from '../item/shared/item.interface';
import { FormBuilder, FormGroup, Validators, FormArray, FormControl } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { ItemService } from '../item/shared/item.service';
import { Observable } from 'rxjs';
import { startWith, map } from 'rxjs/operators';
import { MouseEvent } from '@agm/core';
import { MatChipInputEvent, MatDatepickerInputEvent, MatSnackBar, MatStepper } from '@angular/material';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { SessionService } from '../auth/session.service';
import { Route } from '@angular/compiler/src/core';

declare interface Marker {
  lat: number;
  lng: number;
  label?: string;
  draggable: boolean;
}

@Component({
  selector: 'app-item-detalhe',
  templateUrl: './item-detalhe.component.html',
  styleUrls: ['./item-detalhe.component.scss']
})
export class ItemDetalheComponent implements OnInit {

  itemForm: FormGroup;
  item: Item;

  horasFiltradas: Observable<string[]>;
  minutosFiltrados: Observable<string[]>;

  horas: string[] = [];
  minutos: string[] = [];

  tipoItem: tipoItem;
  id: number;
  matchItem: boolean;

  addOnBlur = true;
  marker: Marker;

  readonly separatorKeysCodes: number[] = [ENTER, COMMA];

  constructor(private formBuilder: FormBuilder,
    private activeRoute: ActivatedRoute,
    private itemService: ItemService,
    private sessionService: SessionService,
    private notificacao: MatSnackBar,
    private router: Router
  ) {

    this.matchItem = this.activeRoute.snapshot.params['match'];

    this.itemForm = this.formBuilder.group({
      titulo: this.formBuilder.control({ value: '', disabled: this.matchItem }),
      tags: this.formBuilder.array([]),
      detalhe: this.formBuilder.control({ value: '', disabled: this.matchItem }),
      latitudeLocal: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      longitudeLocal: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      dataInicial: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      dataFinal: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      hora: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      minuto: this.formBuilder.control({ value: '', disabled: this.matchItem }, Validators.required),
      imagem: this.formBuilder.control({ value: '', disabled: this.matchItem }),
      marcado: this.formBuilder.control({ value: '', disabled: this.matchItem })
    });

    this.itemForm.get('tags').disable();

    this.id = this.activeRoute.snapshot.params['id'];
    this.tipoItem = this.activeRoute.snapshot.params['tipo'];

    if (this.tipoItem === 'achado') {
      this.itemService.buscarAchado(this.id).then(item => this.preencherForm(item));
    } else if (this.tipoItem === 'perdido') {
      this.itemService.buscarPerdido(this.id).then(item => this.preencherForm(item));
    }

    this.addToArray(this.horas, 24);
    this.addToArray(this.minutos, 59);
  }

  private addToArray(array: string[], value: number) {
    for (let i = 0; i < value + 1; i++) {
      if (i < 9) {
        array.push(`0${i}`);
      } else {
        array.push(`${i}`);
      }
    }
  }

  async preencherForm(item: Item) {
    this.item = item;
    this.itemForm.get('titulo').setValue(item.titulo);
    this.itemForm.get('detalhe').setValue(item.detalhe);

    const tags = this.itemForm.get('tags') as FormArray;
    const itemTags = await this.itemService.buscarTagPorItemPerdidoId(item.id);
    itemTags.forEach(tag => tags.push(new FormControl(tag)));

    const regiao = await this.itemService.buscarRegiaoPorItemPerdidoId(item.id);
    this.itemForm.get('latitudeLocal').setValue(regiao.latitude);
    this.itemForm.get('longitudeLocal').setValue(regiao.longitude);

    item.tags = itemTags;
    item.regiao = regiao;

    this.itemForm.get('dataInicial').setValue(item.dataInicio);
    this.itemForm.get('dataFinal').setValue(item.dataFim);

    this.itemForm.get('hora').setValue(item.hora.split(':')[0]);
    this.itemForm.get('minuto').setValue(item.hora.split(':')[1]);

    this.itemForm.get('imagem').setValue(item.imagem);

    if (this.tipoItem === 'achado') {
      this.itemForm.get('marcado').setValue((<ItemEncontrado>item).devolvido);
    } else if (this.tipoItem === 'perdido') {
      this.itemForm.get('marcado').setValue((<ItemPerdido>item).recuperado);
    }
  }

  ngOnInit() {

    this.horasFiltradas = this.itemForm.get('hora').valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value, this.horas))
    );

    this.minutosFiltrados = this.itemForm.get('minuto').valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value, this.minutos))
    );

  }

  private _filter(value: string, array: string[]): string[] {
    return array.filter(option => option.includes(value));
  }

  clickedMarker(label: string, index: number) {
    console.log(`clicked the marker: ${label || index}`);
  }

  mapClicked($event: MouseEvent) {
    this.itemForm.get('latitudeLocal').setValue($event.coords.lat);
    this.itemForm.get('longitudeLocal').setValue($event.coords.lng);
  }

  add(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    if ((value || '').trim()) {
      const tags = this.itemForm.get('tags') as FormArray;
      tags.push(this.createItem({ nome: value.trim() }));
    }

    if (input) {
      input.value = '';
    }
  }

  createItem(tag: Tag): FormControl {
    return new FormControl(tag);
  }

  remove(tagIndex: number): void {
    const tags = this.itemForm.get('tags') as FormArray;
    tags.removeAt(tagIndex);
  }

  salvar() {
    this.sessionService.getIdUsuario().subscribe(id => {

      const item: Item = {
        titulo: this.itemForm.get('titulo').value,
        detalhe: this.itemForm.get('detalhe').value,
        tags: this.itemForm.get('tags').value as Tag[],
        imagem: this.itemForm.get('imagem').value,
        regiao: {
          latitude: this.itemForm.get('latitudeLocal').value,
          longitude: this.itemForm.get('longitudeLocal').value,
        },
        usuarioId: id,
        dataInicio: this.itemForm.get('dataInicial').value,
        dataFim: this.itemForm.get('dataFinal').value,
        hora: `${this.itemForm.get('hora').value}:${this.itemForm.get('minuto').value}`,
        id: this.id
      };

      if (this.tipoItem === 'achado') {
        const itemEncontrado: ItemEncontrado = <ItemEncontrado>item;
        itemEncontrado.devolvido = this.itemForm.get('marcado').value;

        this.itemService.atualizarAchado(itemEncontrado).then(() => {
          this.cadastroOk();
        });

      } else {

        const itemPerdido: ItemPerdido = <ItemPerdido>item;
        itemPerdido.recuperado = this.itemForm.get('marcado').value;

        this.itemService.atualizarPerdido(itemPerdido).then(() => {
          this.cadastroOk();
        });
      }
    });
  }

  cadastroOk() {
    this.notificacao.open('Item atualizado com sucesso!', 'Ok', { duration: 2000 });
  }

  excluir() {
    if (this.tipoItem === 'achado') {
      this.itemService.excluirAchado(this.id).then(() => {
        this.router.navigate(['/achados']);
      });
    } else {
      this.itemService.excluirPerdido(this.id).then(() => {
        this.router.navigate(['/achados']);
      });
    }
  }

  setDefaultDate(event: MatDatepickerInputEvent<Date>) {
    console.log(event.value);
    this.itemForm.get('dataFinal').setValue(event.value);
  }

  markerDragEnd(m: Marker, $event: MouseEvent) {
    console.log('dragEnd', m, $event);
  }

  itemAchado() {
    const itemAchado: ItemEncontrado = <ItemEncontrado>this.item;
    itemAchado.devolvido = true;

    this.itemService.atualizarAchado(itemAchado).then(() => {
      this.notificacao.open('Item recuperado com sucesso', 'Ok', { duration: 2000 });
    });
  }
}
