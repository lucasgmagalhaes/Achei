import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { FormControl } from '@angular/forms';
import { map, startWith } from 'rxjs/operators';
import regioes from './estados.json';
@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

  baseImg = '../../assets/undefined_user.png';
  url = this.baseImg;

  myControl = new FormControl();
  options: string[] = regioes.estados.map(estado => estado.nome);

  filteredOptions: Observable<string[]>;

  constructor() { }

  ngOnInit() {
    this.filteredOptions = this.myControl.valueChanges
      .pipe(
        startWith(''),
        map(value => this._filter(value))
      );
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.options.filter(option => option.toLowerCase().includes(filterValue));
  }

  selectImg() {
    document.getElementById('imgupload').click();
  }

  removeImg() {
    this.url = this.baseImg;
  }

  setFile(event) {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();

      reader.readAsDataURL(event.target.files[0]);

      reader.onload = (_event) => {
        this.url = (<FileReader>_event.target).result.toString();
      };
    }
  }
}
