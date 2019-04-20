import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { MatChipInputEvent } from '@angular/material';
import { FormBuilder, FormGroup, FormArray } from '@angular/forms';
import { TooltipPosition } from '@angular/material';
import { MouseEvent } from '@agm/core';
import { FormControl } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';

// just an interface for type safety.
declare interface Marker {
  lat: number;
  lng: number;
  label?: string;
  draggable: boolean;
}

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

  constructor(private formBuilder: FormBuilder, private changeDetector: ChangeDetectorRef) {
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

    this.itemFormGroup = this.formBuilder.group({
      tags: this.formBuilder.control(''),
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
      this.tags.push(value.trim());
    }

    if (input) {
      input.value = '';
    }
  }

  remove(tag: string): void {
    const index = this.tags.indexOf(tag);

    if (index >= 0) {
      this.tags.splice(index, 1);
    }
  }

  clickedMarker(label: string, index: number) {
    console.log(`clicked the marker: ${label || index}`);
  }

  mapClicked($event: MouseEvent) {
    this.marker.lat = $event.coords.lat;
    this.marker.lng = $event.coords.lng;
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
}
