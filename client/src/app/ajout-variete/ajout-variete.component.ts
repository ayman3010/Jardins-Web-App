import { Semencier } from './../../../../common/tables/Semencier';
import { Component, Inject} from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Variete } from '../../../../common/tables/Variete';

import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-ajout-variete',
  templateUrl: './ajout-variete.component.html',
  styleUrls: ['./ajout-variete.component.css']
})
export class AjoutVarieteComponent {

  varieteFormulaire: Variete = new Variete();
  nomPlante: string;
  semenciers: Semencier[];
  typeSols: string[];
  nomSemencier: string;
  isModified: boolean;
  duplicateError: boolean = false;
  action : string = "Ajouter";
  estValide : boolean = true;

  constructor( private communicationService: CommunicationService, public nameInputDialog: MatDialogRef<AjoutVarieteComponent>, @Inject(MAT_DIALOG_DATA) public data: Variete) {
    if (data) {
      this.getVariete(data.nomvariete);
      this.action = "Modifier"
    }
    this.getTypeSol();
   }

   annuler(): void {
    this.nameInputDialog.close();
   }

   formulaireEstValide(){
     return (this.varieteFormulaire.nomvariete && this.varieteFormulaire.anneemisemarche);
   }

   soumettre() {  
    if (!this.varieteFormulaire.nomvariete || !this.varieteFormulaire.anneemisemarche){
      this.estValide = false;
      return;
    }
    this.insertVariete();
    console.log(this.duplicateError);
    if (!this.duplicateError){
      this.varieteFormulaire = new Variete();
      this.nameInputDialog.close();
    }
  }

   getTypeSol(){
    this.communicationService.getTypeSols().subscribe((noms: string[]) => {
      this.typeSols = noms;
    });
   }

  getVariete(nomVariete: string){
    this.communicationService.getVariete(nomVariete).subscribe((variete: Variete[]) => {
      this.varieteFormulaire = {...variete[0]}
    });
  }


 insertVariete(): void {
   this.estValide = true;
   const variete: Variete = { ... this.varieteFormulaire };
    if (this.action === 'Ajouter'){
      this.communicationService.insertVariete(variete).subscribe((res: number) => {
        if (res > 0) {
          this.duplicateError = false;
          this.communicationService.filter("update");
        }
        if(res === -1){
           this.duplicateError = true;
        }
      });
      return;
    }
    this.communicationService.modifierVariete(variete, this.data.nomvariete).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
    });
    
  }


}
