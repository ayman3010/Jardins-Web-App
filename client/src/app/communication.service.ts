import { Semencier } from './../../../common/tables/Semencier';
import { Rang } from './../../../common/tables/Rang';
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
// tslint:disable-next-line:ordered-imports
import { of, Observable, Subject } from "rxjs";
import { catchError } from "rxjs/operators";
import { Hotel } from "../../../common/tables/Hotel";
import { Room } from "../../../common/tables/Room";
import { HotelPK } from "../../../common/tables/HotelPK";
import { Guest } from "../../../common/tables/Guest";
import { Jardin } from "../../../common/tables/Jardins";
import { Parcelle } from "../../../common/tables/Parcelle";
import { Variete } from '../../../common/tables/Variete';


@Injectable()
export class CommunicationService {
  private readonly BASE_URL: string = "http://localhost:3000/database";
  public constructor(private http: HttpClient) {}

  private _listners: any = new Subject<any>();

  public listen(): Observable<any> {
    return this._listners.asObservable();
  }

  public filter(filterBy: string): void {
    this._listners.next(filterBy);
  }

  public getParcelles(jardinId: string): Observable<Parcelle[]> {
    return this.http
      .get<Parcelle[]>(this.BASE_URL + `/parcelles?jardinId=${jardinId}`)
      .pipe(catchError(this.handleError<Parcelle[]>("getParcelles")));
  }

  public getSemenciers(): Observable<Semencier[]> {
    return this.http
      .get<Semencier[]>(this.BASE_URL + `/semenciers`)
      .pipe(catchError(this.handleError<Semencier[]>("getSemenciers")));
  }

  getNomPlantes():  Observable<string[]> {
    return this.http
    .get<string[]>(this.BASE_URL + `/nomplantes`)
    .pipe(catchError(this.handleError<string[]>("getNomPlantes")));
  }

  public getRangs(jardinId: string, coordonnees: string): Observable<Rang[]> {
    return this.http
      .get<Rang[]>(this.BASE_URL + `/parcelles/${jardinId}/${coordonnees}`)
      .pipe(catchError(this.handleError<Rang[]>("getRangs")));
  }

  public getVarieteByRang(jardinId: string, coordonnees: string, numero: number): Observable<string[]> {
    return this.http
      .get<string[]>(this.BASE_URL + `/varietes/${jardinId}/${coordonnees}/${numero}`)
      .pipe(catchError(this.handleError<string[]>("getVarieteByRang")));
  }

  public getJardins(): Observable<Jardin[]> {
    return this.http
      .get<Jardin[]>(this.BASE_URL + "/jardins")
      .pipe(catchError(this.handleError<Jardin[]>("getJardins")));
  }

  public getVarietes(): Observable<Variete[]> {
    return this.http
          .get<Variete[]>(this.BASE_URL + "/variete")
          .pipe(catchError(this.handleError<Variete[]>("getVariete")))
  }


  public getVariete(nomVariete: string): Observable<Variete[]> {
    return this.http
          .get<Variete[]>(this.BASE_URL + `/variete/:${nomVariete}`)
          .pipe(catchError(this.handleError<Variete[]>("getVariete")))
  }

  public getHotels(): Observable<Hotel[]> {
    return this.http
      .get<Hotel[]>(this.BASE_URL + "/hotels")
      .pipe(catchError(this.handleError<Hotel[]>("getHotels")));
  }

  public insertHotel(hotel: Hotel): Observable<number> {
    return this.http
      .post<number>(this.BASE_URL + "/hotels/insert", hotel)
      .pipe(catchError(this.handleError<number>("insertHotel")));
  }

  public insertVariete(variete: Variete): Observable<number> {
    return this.http
      .post<number>(this.BASE_URL + "/variete/insert", variete)
      .pipe(catchError(this.handleError<number>("insertVariet")));
  }

  public updateHotel(hotel: Hotel): Observable<number> {
    return this.http
      .put<number>(this.BASE_URL + "/hotels/update", hotel)
      .pipe(catchError(this.handleError<number>("updateHotel")));
  }

  public deleteHotel(hotelNb: string): Observable<number> {
    return this.http
      .post<number>(this.BASE_URL + "/hotels/delete/" + hotelNb, {})
      .pipe(catchError(this.handleError<number>("deleteHotel")));
  }

  public deleteVariete(nomVariete: string): Observable<number> {
    return this.http
    .post<number>(this.BASE_URL + "/variete/delete/" + nomVariete, {})
    .pipe(catchError(this.handleError<number>("deleteVariete")));
  }

  public modifierVariete(variete: Variete, nomVariete: string): Observable<number> {
    return this.http
    .post<number>(this.BASE_URL + "/variete/modifier/" + nomVariete, variete)
    .pipe(catchError(this.handleError<number>("modifierVariete")));
  }

  public getHotelPKs(): Observable<HotelPK[]> {
    return this.http
      .get<HotelPK[]>(this.BASE_URL + "/hotels/hotelNb")
      .pipe(catchError(this.handleError<HotelPK[]>("getHotelPKs")));
  }

  public getRooms(hotelNb: string): Observable<Room[]> {
    return this.http
      .get<Room[]>(this.BASE_URL + `/rooms?hotelNb=${hotelNb}`)
      .pipe(catchError(this.handleError<Room[]>("getRooms")));
  }

  public insertRoom(room: Room): Observable<number> {
    return this.http
      .post<number>(this.BASE_URL + "/rooms/insert", room)
      .pipe(catchError(this.handleError<number>("inserHotel")));
  }

  public updateRoom(room: Room): Observable<number> {
    return this.http
      .put<number>(this.BASE_URL + "/rooms/update", room)
      .pipe(catchError(this.handleError<number>("updateRoom")));
  }

  public deleteRoom(hotelNb: string, roomNb: string): Observable<number> {
    return this.http
      .post<number>(this.BASE_URL + `/rooms/delete/${hotelNb}/${roomNb}`, {})
      .pipe(catchError(this.handleError<number>("deleteRoom")));
  }

  public getGuests(hotelNb: string, roomNb: string): Observable<Guest[]> {
    return this.http
      .get<Guest[]>(this.BASE_URL + `/guests/${hotelNb}/${roomNb}`)
      .pipe(catchError(this.handleError<Guest[]>("getGuests")));
  }

  private handleError<T>(
    request: string,
    result?: T
  ): (error: Error) => Observable<T> {
    return (error: Error): Observable<T> => {
      return of(result as T);
    };
  }
}
