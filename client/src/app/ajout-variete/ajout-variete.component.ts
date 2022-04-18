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
  nomPlantes: string[];
  nomSemencier: string;
  isModified: boolean;
  duplicateError: boolean = false;
  action : string = "Ajouter";

  constructor( private communicationService: CommunicationService, public nameInputDialog: MatDialogRef<AjoutVarieteComponent>, @Inject(MAT_DIALOG_DATA) public data: Variete) {
    if (data) {
      this.getVariete(data.nomvariete);
      this.action = "Modifier"
    }
    this.getSemenciers();
    this.getNomPlantes();
   }

   annuler(): void {
    this.nameInputDialog.close();
   }

   soumettre() {  
    this.insertVariete();
    this.varieteFormulaire = new Variete();
    this.nameInputDialog.close();
  }

   getSemenciers(){
    this.communicationService.getSemenciers().subscribe((semenciers: Semencier[]) => {
      this.semenciers = semenciers;
    });
   }

   getNomPlantes(){
    this.communicationService.getNomPlantes().subscribe((noms: string[]) => {
      this.nomPlantes = noms;
    });
   }

  getVariete(nomVariete: string){
    this.communicationService.getVariete(nomVariete).subscribe((variete: Variete[]) => {
      this.varieteFormulaire = {...variete[0]}
    });
  }
  public insertVariete(): void {
    const variete: Variete = { ... this.varieteFormulaire };
    if (this.action === 'Ajouter'){
      this.communicationService.insertVariete(variete).subscribe((res: number) => {
        if (res > 0) {
          this.communicationService.filter("update");
        }
        this.duplicateError = res === -1;
      });
      return;
    }
    this.communicationService.modifierVariete(variete, this.data.nomvariete).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
      this.duplicateError = res === -1;
    });
  }


}
