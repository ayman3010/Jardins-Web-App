import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./communication.service";
import { JardinsComponent } from './jardins/jardins.component';
import { ParcelleComponent } from './parcelle/parcelle.component';
import { RangComponent } from './rang/rang.component';
import { VarieteComponent } from "./varietes/variete.component";
import { AjoutVarieteComponent } from "./ajout-variete/ajout-variete.component";
import { AppMaterialModule } from '@app/material.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogRef } from '@angular/material/dialog';
import { InfoPlanteComponent } from './info-plante/info-plante.component';

@NgModule({
  declarations: [
    AppComponent,
    JardinsComponent,
    ParcelleComponent,
    RangComponent,
    VarieteComponent,
    AjoutVarieteComponent,
    InfoPlanteComponent,
  ],
  imports: [
    AppRoutingModule,
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    AppMaterialModule,
  ],

  providers: [CommunicationService,  {
    provide: MatDialogRef,
    useValue: {},
},],
  bootstrap: [AppComponent],
})
export class AppModule { }
