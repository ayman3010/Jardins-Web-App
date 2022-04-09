import { RangComponent } from './rang/rang.component';
import { JardinsComponent } from './jardins/jardins.component';
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "./app.component";
import { HotelComponent } from "./hotel/hotel.component";
import { RoomComponent } from "./room/room.component";
import { GuestComponent } from "./guest/guest.component";
import { ParcelleComponent } from './parcelle/parcelle.component';

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "rooms", component: RoomComponent },
  { path: "hotels", component: HotelComponent },
  { path: "guests", component: GuestComponent },
  { path: "jardins", component: JardinsComponent },
  { path: "rang", component: RangComponent },
  { path: "parcelle/:id", component: ParcelleComponent },
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }