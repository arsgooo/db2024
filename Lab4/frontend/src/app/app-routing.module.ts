import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BandsComponent } from './pages/bands/bands.component';
import { CreateComponent } from './pages/create/create.component';

const routes: Routes = [
  { path: '', component: BandsComponent },
  { path: 'create', component: CreateComponent },
  { path: 'edit/:id', component: CreateComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
