import { Variete } from './../../../../common/tables/Variete';
import { Semencier } from './../../../../common/tables/Semencier';
import { Component, Inject} from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

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
  typeSols: string[] = ["Argileux", "Limoneux", "Silicieux", "Tourbeux", "Sableux"];
  nomSemencier: string;
  isModified: boolean;
  duplicateError: boolean = false;
  action : string = "Ajouter";
  estValide : boolean = true;
  existe: boolean = false;

  constructor( private communicationService: CommunicationService, public nameInputDialog: MatDialogRef<AjoutVarieteComponent>, @Inject(MAT_DIALOG_DATA) public data: any) {
    if (data.variete) {
      this.getVariete(data.variete.nomvariete);
      this.action = "Modifier"
    }
   }

   annuler(): void {
    this.nameInputDialog.close();
   }

   formulaireEstValide(): boolean{
     if  (this.varieteFormulaire.nomvariete && this.varieteFormulaire.anneemisemarche) return true;
     return false;
   }

   variteExiste(nomVariete: string): boolean {
     for ( const variete of this.data.liste ){
       if (variete.nomvariete === nomVariete) return true;
     }
     return false;

   }

   soumettre() {  
    if (!this.formulaireEstValide || this.varieteFormulaire.anneemisemarche > 9999){
      this.estValide = false;
      return;
    }
    if (this.variteExiste(this.varieteFormulaire.nomvariete) && this.action === 'Ajouter'){
      this.existe = true;
      return;
    }
    this.insertVariete();
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
          this.varieteFormulaire = new Variete();
          this.nameInputDialog.close();
        }
        if(res === -1){
          this.duplicateError = true;
        }
      });
      return;
    }
    this.modifierVariete();
  }
  modifierVariete(){
    const variete: Variete = { ... this.varieteFormulaire };

    this.communicationService.modifierVariete(variete, this.data.variete.nomvariete).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
                  this.varieteFormulaire = new Variete();
          this.nameInputDialog.close();
      }
    });
  }

}
