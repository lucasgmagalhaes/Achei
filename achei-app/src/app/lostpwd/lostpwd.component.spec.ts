import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LostpwdComponent } from './lostpwd.component';

describe('LostpwdComponent', () => {
  let component: LostpwdComponent;
  let fixture: ComponentFixture<LostpwdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LostpwdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LostpwdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
