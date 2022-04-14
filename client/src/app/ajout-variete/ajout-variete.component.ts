import { Component} from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Variete } from '../../../../common/tables/Variete';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-ajout-variete',
  templateUrl: './ajout-variete.component.html',
  styleUrls: ['./ajout-variete.component.css']
})
export class AjoutVariete {

  varieteFormulaire: Variete = new Variete();
  nomPlante: string;
  nomSemancier: string;
  isModified: boolean;

  constructor(private route: ActivatedRoute, private communicationService: CommunicationService) {
    this.route.params.subscribe(params => {
      this.getVariete(params.nomVariete);
    });
   }

  getVariete(nomVariete: string){
    this.communicationService.getVariete(nomVariete).subscribe((variete: Variete[]) => {
      this.varieteFormulaire.anneemisemarche = variete[0].anneemisemarche;
      this.varieteFormulaire.commentaire = variete[0].commentaire;
      this.varieteFormulaire.descriptionsemis = variete[0].descriptionsemis;
      this.varieteFormulaire.entretien = variete[0].entretien;
      this.varieteFormulaire.estbiologique = variete[0].estbiologique;
      this.varieteFormulaire.nomvariete = variete[0].nomvariete;
      this.varieteFormulaire.periodemiseplace = variete[0].periodemiseplace;
      this.varieteFormulaire.perioderecolte = variete[0].perioderecolte;
      this.varieteFormulaire.plantation = variete[0].plantation;
      this.varieteFormulaire.recolte = variete[0].recolte;
      this.varieteFormulaire.typesol = variete[0].typesol;
    });
  }

  submit() {  
    this.varieteFormulaire = new Variete();
  }
}
