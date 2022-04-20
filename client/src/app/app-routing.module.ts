import { RangComponent } from './rang/rang.component';
import { JardinsComponent } from './jardins/jardins.component';
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AppComponent } from "./app.component";
import { ParcelleComponent } from './parcelle/parcelle.component';
import { VarieteComponent } from './varietes/variete.component';
import { AjoutVariete } from './ajout-variete/ajout-variete.component';

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "jardins", component: JardinsComponent },
  { path: "rang", component: RangComponent },
  { path : "variete", component: VarieteComponent},
  { path : "ajoutvariete/:nomVariete", component: AjoutVariete},
  { path: "parcelle/:id", component: ParcelleComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }