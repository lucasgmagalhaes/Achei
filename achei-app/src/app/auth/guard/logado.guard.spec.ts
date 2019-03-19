import { TestBed, async, inject } from '@angular/core/testing';

import { LogadoGuard } from './logado.guard';

describe('LogadoGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [LogadoGuard]
    });
  });

  it('should ...', inject([LogadoGuard], (guard: LogadoGuard) => {
    expect(guard).toBeTruthy();
  }));
});
