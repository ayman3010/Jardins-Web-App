import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '@app/communication.service';
import { Plante } from '@common/tables/Plante';

@Component({
  selector: 'app-info-plante',
  templateUrl: './info-plante.component.html',
  styleUrls: ['./info-plante.component.css']
})
export class InfoPlanteComponent implements OnInit {

  plantes: Plante[] = [];
  partieNom: string;

  constructor(private communicationService: CommunicationService) { }


  ngOnInit() {
  }

  getPlantes(){
    this.plantes = [];
    this.communicationService.getPlantes(this.partieNom.toLowerCase()).subscribe((plantes: Plante[]) => {
      this.plantes = plantes;
    });
  }

}
