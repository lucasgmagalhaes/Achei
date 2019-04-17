import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AchadosComponent } from './achados.component';

describe('AchadosComponent', () => {
  let component: AchadosComponent;
  let fixture: ComponentFixture<AchadosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AchadosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AchadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
