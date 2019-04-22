import { TestBed } from '@angular/core/testing';

import { ItensUsuarioService } from './itens-usuario.service';

describe('ItensUsuarioService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ItensUsuarioService = TestBed.get(ItensUsuarioService);
    expect(service).toBeTruthy();
  });
});
