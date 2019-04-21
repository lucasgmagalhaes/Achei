import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { MatChipInputEvent, MatDatepickerInputEvent, MatSnackBar } from '@angular/material';
import { FormBuilder, FormGroup, FormArray, Validators } from '@angular/forms';
import { TooltipPosition } from '@angular/material';
import { MouseEvent } from '@agm/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { ItemService } from '../item/shared/item.service';
import { SessionService } from '../auth/session.service';
import { Item, ItemEncontrado, ItemPerdido } from '../item/shared/item.interface';

// just an interface for type safety.
declare interface Marker {
  lat: number;
  lng: number;
  label?: string;
  draggable: boolean;
}

declare type TipoSituacao = 'perda' | 'encontro';

@Component({
  selector: 'app-cadastrar-item',
  templateUrl: './cadastrar-item.component.html',
  styleUrls: ['./cadastrar-item.component.scss']
})
export class CadastrarItemComponent implements OnInit {

  visible = true;
  selectable = true;
  removable = true;
  addOnBlur = true;
  readonly separatorKeysCodes: number[] = [ENTER, COMMA];
  tags: string[] = [];
  positionOptions: TooltipPosition = 'right';
  textareaMaxSize = 100;

  // google maps zoom level
  startzoom = 8;

  // initial center position for the map
  startlat = -11.0234343;
  startlng = -51.9324519;
  marker: Marker;
  itemFormGroup: FormGroup;

  horaControl = new FormControl();
  horasFiltradas: Observable<string[]>;

  minutoControl = new FormControl();
  minutosFiltrados: Observable<string[]>;

  horas: string[] = [];
  minutos: string[] = [];

  tipoSituacao: TipoSituacao;

  constructor(private formBuilder: FormBuilder,
    private changeDetector: ChangeDetectorRef,
    private itemService: ItemService,
    private sessionService: SessionService,
    private notificacao: MatSnackBar
  ) {
    this.marker = { lat: 0, lng: 0, draggable: true };
    this.marker.lat = -11.0234343;
    this.marker.lng = -51.9324519;
    this.marker.draggable = true;

    this.addToArray(this.horas, 24);
    this.addToArray(this.minutos, 59);
  }

  private addToArray(array: string[], value: number) {
    array.push('00');
    for (let i = 0; i < value + 1; i++) {
      if (i < 9) {
        array.push(`0${i}`);
      } else {
        array.push(`${i}`);
      }
    }
  }

  ngOnInit() {

    this.tipoSituacao = 'encontro';

    this.itemFormGroup = this.formBuilder.group({

      // Página 2
      titulo: this.formBuilder.control('', Validators.required),
      tags: this.formBuilder.array([]),
      detalhe: this.formBuilder.control(''),

      // Página 3
      latitudeLocal: this.formBuilder.control(0, Validators.required),
      longitudeLocal: this.formBuilder.control(0, Validators.required),

      // Página 4
      dataInicial: this.formBuilder.control('', Validators.required),
      dataFinal: this.formBuilder.control('', Validators.required),
      hora: this.formBuilder.control('', Validators.required),
      minuto: this.formBuilder.control('', Validators.required),
      // Página 5
      images: this.formBuilder.array([])
    });

    this.horasFiltradas = this.horaControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value, this.horas))
    );

    this.minutosFiltrados = this.minutoControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value, this.minutos))
    );
  }

  add(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    if ((value || '').trim()) {
      const tags = this.itemFormGroup.get('tags') as FormArray;
      tags.push(this.createItem(value.trim()));
    }

    if (input) {
      input.value = '';
    }
  }

  remove(tagIndex: number): void {
    const tags = this.itemFormGroup.get('tags') as FormArray;
    tags.removeAt(tagIndex);
  }

  clickedMarker(label: string, index: number) {
    console.log(`clicked the marker: ${label || index}`);
  }

  mapClicked($event: MouseEvent) {
    this.itemFormGroup.get('latitudeLocal').setValue($event.coords.lat);
    this.itemFormGroup.get('longitudeLocal').setValue($event.coords.lng);
    this.marker.draggable = true;
  }

  markerDragEnd(m: Marker, $event: MouseEvent) {
    console.log('dragEnd', m, $event);
  }

  private _filter(value: string, array: string[]): string[] {
    return array.filter(option => option.includes(value));
  }

  setFile(event) {
    const reader = new FileReader();

    if (event.target.files && event.target.files.length) {
      const [file] = event.target.files;
      reader.readAsDataURL(file);

      reader.onload = () => {
        const images = this.itemFormGroup.get('images') as FormArray;
        images.push(this.createItem(reader.result.toString()));
        this.changeDetector.markForCheck();
      };
    }
  }

  createItem(src: string): FormControl {
    return new FormControl(src);
  }

  selectImg() {
    document.getElementById('imgupload').click();
  }

  getForm() {
    return this.itemFormGroup.controls;
  }

  setDefaultDate(event: MatDatepickerInputEvent<Date>) {
    console.log(event.value);
    this.itemFormGroup.get('dataFinal').setValue(event.value);
  }

  async registrar() {
    this.sessionService.getIdUsuario().subscribe(id => {

      const item: Item = {
        titulo: this.itemFormGroup.get('titulo').value,
        detalhe: this.itemFormGroup.get('detalhe').value,
        imagens: this.itemFormGroup.get('images').value,
        regiao: {
          latitude: this.itemFormGroup.get('latitudeLocal').value,
          longitude: this.itemFormGroup.get('longitudeLocal').value,
        },
        tags: this.itemFormGroup.get('tags').value,
        usuarioId: id
      };

      if (this.tipoSituacao === 'encontro') {
        const itemEncontrado: ItemEncontrado = <ItemEncontrado>item;
        itemEncontrado.devolvido = false;

        this.itemService.cadastrarchado(itemEncontrado).then(() => {
          this.cadastroOk();
        });

      } else {

        const itemPerdido: ItemPerdido = <ItemPerdido>item;
        itemPerdido.recuperado = false;

        this.itemService.cadastrarPerdido(itemPerdido).then(() => {
          this.cadastroOk();
        });

      }

    });

  }

  cadastroOk() {
    this.notificacao.open('Item cadastrado com sucesso!', 'Ok', { duration: 2000 });
  }
}
