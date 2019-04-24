import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { LostpwdComponent } from './lostpwd/lostpwd.component';
import { ProfileComponent } from './profile/profile.component';
import { AchadosComponent } from './achados/achados.component';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './auth/guard/auth.guard';
import { LogadoGuard } from './auth/guard/logado.guard';
import { CadastrarItemComponent } from './cadastrar-item/cadastrar-item.component';
import { ItemDetalheComponent } from './item-detalhe/item-detalhe.component';

const routes: Routes = [
  { path: '', component: LoginComponent, canActivate: [LogadoGuard] },
  { path: 'signup', component: SignupComponent, canActivate: [LogadoGuard] },
  { path: 'recoverpwd', component: LostpwdComponent, canActivate: [LogadoGuard] },
  { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
  { path: 'home', component: HomeComponent, canActivate: [AuthGuard] },
  { path: 'achados', component: AchadosComponent },
  { path: 'achados/item-detalhe/:tipo/:id', component: ItemDetalheComponent },
  { path: 'achados/cadastrarachado', component: CadastrarItemComponent, canActivate: [AuthGuard] },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
