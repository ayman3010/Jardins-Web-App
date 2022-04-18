import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./communication.service";
import { GuestComponent } from "./guest/guest.component";
import { HotelComponent } from "./hotel/hotel.component";
import { RoomComponent } from "./room/room.component";
import { JardinsComponent } from './jardins/jardins.component';
import { ParcelleComponent } from './parcelle/parcelle.component';
import { RangComponent } from './rang/rang.component';
import { VarieteComponent } from "./varietes/variete.component";
import { AjoutVariete } from "./ajout-variete/ajout-variete.component";
import { MatTableModule } from '@angular/material/table'  
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

@NgModule({
  declarations: [
    AppComponent,
    RoomComponent,
    HotelComponent,
    GuestComponent,
    JardinsComponent,
    ParcelleComponent,
    RangComponent,
    VarieteComponent,
    AjoutVariete,
  ],
  imports: [
    AppRoutingModule,
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatTableModule,
  ],

  providers: [CommunicationService],
  bootstrap: [AppComponent],
})
export class AppModule { }
