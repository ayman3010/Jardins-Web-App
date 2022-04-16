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
  duplicateError: boolean = false;

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
  public insertVariete(): void {
    const variete: Variete = {
      nomvariete         : this.varieteFormulaire.nomvariete,
      anneemisemarche    : this.varieteFormulaire.anneemisemarche,
      descriptionsemis   : this.varieteFormulaire.descriptionsemis,
	    plantation         : this.varieteFormulaire.plantation,
      entretien          : this.varieteFormulaire.entretien,
      recolte            : this.varieteFormulaire.recolte,
	    periodemiseplace   : this.varieteFormulaire.periodemiseplace,
      perioderecolte     : this.varieteFormulaire.perioderecolte,
      commentaire        : this.varieteFormulaire.commentaire,
      typesol            : this.varieteFormulaire.typesol,
      estbiologique      : this.varieteFormulaire.estbiologique,
    };

    this.communicationService.insertVariete(variete).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
      this.duplicateError = res === -1;
    });
  }

  submit() {  
    this.insertVariete();
    this.varieteFormulaire = new Variete();
  }
}
