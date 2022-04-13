import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../communication.service';
import { Variete } from './../../../../common/tables/Variete';

@Component({
  selector: 'app-variete',
  templateUrl: './variete.component.html',
  styleUrls: ['./variete.component.css']
})
export class VarieteComponent implements OnInit {
  varietes: Variete[];
  constructor(private communicationService: CommunicationService) { }

  ngOnInit() {
    this.getVarietes();
  }

  getVarietes(){
    this.communicationService.getVarietes().subscribe((jardins: Variete[]) => {
      this.varietes = jardins;
    });
  }

  deleteVariete(nomVariete: string) {
    this.communicationService.deleteVariete(nomVariete).subscribe((res: any) => {
      this.getVarietes();
    });
  }
}
