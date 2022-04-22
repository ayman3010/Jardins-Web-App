import {AjoutVarieteComponent } from './../ajout-variete/ajout-variete.component';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { CommunicationService } from '../communication.service';
import { Variete } from './../../../../common/tables/Variete';

@Component({
  selector: 'app-variete',
  templateUrl: './variete.component.html',
  styleUrls: ['./variete.component.css']
})
export class VarieteComponent implements OnInit {
  varietes: Variete[];
  constructor(private communicationService: CommunicationService, public dialog: MatDialog, ) { }

  ngOnInit() {
    this.getVarietes();
  }

  getVarietes(){
    this.communicationService.getVarietes().subscribe((varietes: Variete[]) => {
      this.varietes = varietes;
    });
  }

  deleteVariete(nomVariete: string) {
    this.communicationService.deleteVariete(nomVariete).subscribe((res: any) => {
      this.getVarietes();
    });
  }


  openDialog(variete?: Variete): void {
    const nameInputDialog = this.dialog.open(AjoutVarieteComponent, {
        height: '1200px',
        width: '1000px',
        data: {variete, liste: this.varietes},
    });
    nameInputDialog.afterClosed().subscribe((result: Variete) => {
           this.ngOnInit();
    });
}
}
