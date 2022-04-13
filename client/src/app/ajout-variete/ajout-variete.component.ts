import { Component} from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Variete } from '../../../../common/tables/Variete';

@Component({
  selector: 'app-ajout-variete',
  templateUrl: './ajout-variete.component.html',
  styleUrls: ['./ajout-variete.component.css']
})
export class AjoutVariete {

  varieteFormulaire: Variete = new Variete();
  nomPlante: string;
  nomSemancier: string;




  form: FormGroup;
  
  submit() {  
    this.varieteFormulaire = new Variete();
  }
}
