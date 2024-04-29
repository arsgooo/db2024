import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CreateComponent } from './pages/create/create.component';
import { BandsComponent } from './pages/bands/bands.component';
import { BandService } from './services/band.service';

@NgModule({
  declarations: [
    AppComponent,
    CreateComponent,
    BandsComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule
  ],
  providers: [BandService],
  bootstrap: [AppComponent]
})
export class AppModule { }
