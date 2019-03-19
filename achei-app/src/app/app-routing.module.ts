import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { LostpwdComponent } from './lostpwd/lostpwd.component';
import { ProfileComponent } from './profile/profile.component';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './auth/guard/auth.guard';
import { LogadoGuard } from './auth/guard/logado.guard';

const routes: Routes = [
  { path: '', component: LoginComponent, canActivate: [LogadoGuard] },
  { path: 'signup', component: SignupComponent, canActivate: [LogadoGuard] },
  { path: 'recoverpwd', component: LostpwdComponent, canActivate: [LogadoGuard] },
  { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
