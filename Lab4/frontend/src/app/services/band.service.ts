import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Band } from '../models/band';

@Injectable({
  providedIn: 'root'
})
export class BandService {
  headers: HttpHeaders;
  constructor(private client: HttpClient) { 
    this.headers = new HttpHeaders({'content-type': 'application/json'})
  }

  GetBands(): Observable<Band[]> {
    return this.client.get<Band[]>('http://localhost:3000/api/band');
  }
  GetBand(id: string): Observable<Band> {
    return this.client.get<Band>('http://localhost:3000/api/band/' + id);
  }
  AddBand(band: Band): Observable<HttpResponse<any>> {
    return this.client.post<HttpResponse<any>>('http://localhost:3000/api/band/', JSON.stringify(band),
    {headers: this.headers, observe: 'response'});
  }
  UpdateBand(band: Band): Observable<HttpResponse<any>> {
    return this.client.put('http://localhost:3000/api/band/' + band._id, JSON.stringify(band),
    {headers: this.headers, observe: 'response'});
  }
  DeleteBand(id: string): Observable<HttpResponse<any>> {
    return this.client.delete<HttpResponse<any>>('http://localhost:3000/api/band/' + id, {observe: 'response'});
  }
}
