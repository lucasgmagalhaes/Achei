import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { MatChipInputEvent, MatDatepickerInputEvent, MatSnackBar, MatStepper } from '@angular/material';
import { FormBuilder, FormGroup, FormArray, Validators } from '@angular/forms';
import { TooltipPosition } from '@angular/material';
import { MouseEvent } from '@agm/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { ItemService } from '../item/shared/item.service';
import { SessionService } from '../auth/session.service';
import { Item, ItemEncontrado, ItemPerdido, Tag } from '../item/shared/item.interface';

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

  detalhesFormsGroup: FormGroup;
  localFormsGroup: FormGroup;
  horarioFormGroup: FormGroup;
  imagensFormGroup: FormGroup;

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

    this.detalhesFormsGroup = this.formBuilder.group({
      titulo: this.formBuilder.control('', Validators.required),
      tags: this.formBuilder.array([]),
      detalhe: this.formBuilder.control('')
    });

    this.localFormsGroup = this.formBuilder.group({
      latitudeLocal: this.formBuilder.control('', Validators.required),
      longitudeLocal: this.formBuilder.control('', Validators.required)
    });

    this.horarioFormGroup = this.formBuilder.group({
      dataInicial: this.formBuilder.control('', Validators.required),
      dataFinal: this.formBuilder.control('', Validators.required),
      hora: this.formBuilder.control('', Validators.required),
      minuto: this.formBuilder.control('', Validators.required)
    });

    this.imagensFormGroup = this.formBuilder.group({
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
      const tags = this.detalhesFormsGroup.get('tags') as FormArray;
      tags.push(this.createItem(value.trim()));
    }

    if (input) {
      input.value = '';
    }
  }

  remove(tagIndex: number): void {
    const tags = this.detalhesFormsGroup.get('tags') as FormArray;
    tags.removeAt(tagIndex);
  }

  clickedMarker(label: string, index: number) {
    console.log(`clicked the marker: ${label || index}`);
  }

  mapClicked($event: MouseEvent) {
    this.localFormsGroup.get('latitudeLocal').setValue($event.coords.lat);
    this.localFormsGroup.get('longitudeLocal').setValue($event.coords.lng);
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
        const images = this.imagensFormGroup.get('images') as FormArray;
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

  setDefaultDate(event: MatDatepickerInputEvent<Date>) {
    console.log(event.value);
    this.horarioFormGroup.get('dataFinal').setValue(event.value);
  }

  registrar() {
    this.sessionService.getIdUsuario().subscribe(id => {

      const item: Item = {
        titulo: this.detalhesFormsGroup.get('titulo').value,
        detalhe: this.detalhesFormsGroup.get('detalhe').value,
        tags: this.getTags(),
        imagens: this.imagensFormGroup.get('images').value,
        regiao: {
          latitude: this.localFormsGroup.get('latitudeLocal').value,
          longitude: this.localFormsGroup.get('longitudeLocal').value,
        },
        usuarioId: id,
        dataInicio: this.horarioFormGroup.get('dataInicial').value.toISOString(),
        dataFim: this.horarioFormGroup.get('dataFinal').value.toISOString(),
        hora: `${this.horarioFormGroup.get('hora').value}:${this.horarioFormGroup.get('minuto').value}`
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

  getTags(): Tag[] {
    const tags = this.detalhesFormsGroup.get('tags').value as [];
    const tagsReturn: Tag[] = [];

    for (const tag of tags) {
      console.log(tag);
      tagsReturn.push({ nome: tag });
    }

    return tagsReturn;
  }
  cadastroOk() {
    this.notificacao.open('Item cadastrado com sucesso!', 'Ok', { duration: 2000 });
  }

  goForward(stepper: MatStepper, tipo: TipoSituacao) {
    this.tipoSituacao = tipo;
    stepper.next();
  }
}
