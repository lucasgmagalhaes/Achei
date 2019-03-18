import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { SessionService } from './session.service';

@Injectable({
  providedIn: 'root'
})
export class SignUpGuard implements CanActivate {

  isLogado: boolean;
  constructor(private sessionService: SessionService, private router: Router) {
    this.sessionService.isLogado().subscribe(logado => this.isLogado = logado);
  }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {

    if (!this.isLogado) {
      return true;
    } else {
      this.router.navigate(['/home']);
      return false;
    }
  }
}
