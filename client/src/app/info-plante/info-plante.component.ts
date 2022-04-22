import { Component} from '@angular/core';
import { CommunicationService } from '@app/communication.service';
import { Plante } from '@common/tables/Plante';

@Component({
  selector: 'app-info-plante',
  templateUrl: './info-plante.component.html',
  styleUrls: ['./info-plante.component.css']
})
export class InfoPlanteComponent {

  plantes: Plante[] = [];
  partieNom: string;

  constructor(private communicationService: CommunicationService) { }

  getPlantes(){
    this.plantes = [];
    this.communicationService.getPlantes(this.partieNom.toLowerCase()).subscribe((plantes: Plante[]) => {
      this.plantes = plantes;
    });
  }

}
