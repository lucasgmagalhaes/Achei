import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// Angular Material
import { HeaderComponent } from './header/header.component';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatRadioModule } from '@angular/material/radio';
import { MatIconModule } from '@angular/material/icon';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';

import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { LostpwdComponent } from './lostpwd/lostpwd.component';
import { ProfileComponent } from './profile/profile.component';
import { MatNativeDateModule } from '@angular/material/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './auth/guard/auth.guard';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { TokenInterceptor } from './http/token-interceptor.service';
import { MatTabsModule } from '@angular/material/tabs';
import { MatBadgeModule } from '@angular/material/badge';
import { MatDividerModule } from '@angular/material/divider';
import { MatListModule } from '@angular/material/list';
import { MatChipsModule } from '@angular/material/chips';
import { MatStepperModule } from '@angular/material/stepper';
import { AchadosComponent } from './achados/achados.component';
import { ItemComponent } from './item/item.component';
import { CadastrarItemComponent } from './cadastrar-item/cadastrar-item.component';
import { AgmCoreModule } from '@agm/core';
import { NumberOnlyDirective, MinutesValueDirective, HoursValueDirective } from './directives/number-only.directive';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    LoginComponent,
    SignupComponent,
    LostpwdComponent,
    ProfileComponent,
    HomeComponent,
    AchadosComponent,
    ItemComponent,
    CadastrarItemComponent,
    NumberOnlyDirective,
    MinutesValueDirective,
    HoursValueDirective
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatMenuModule,
    MatToolbarModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatGridListModule,
    MatDatepickerModule,
    MatRadioModule,
    MatNativeDateModule,
    MatIconModule,
    MatAutocompleteModule,
    MatProgressBarModule,
    MatSnackBarModule,
    MatTabsModule,
    MatBadgeModule,
    MatDividerModule,
    MatListModule,
    MatChipsModule,
    MatStepperModule,
    MatTooltipModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyCD2ayUDqoyxyI4kHdoJVRBP2JomI3Mc7g'
    }),
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [MatDatepickerModule, AuthGuard, {
    provide: HTTP_INTERCEPTORS,
    useClass: TokenInterceptor,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
