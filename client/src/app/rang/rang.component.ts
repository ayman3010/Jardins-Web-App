import { Component, Input, OnInit } from '@angular/core';
import { Rang } from '../../../../common/tables/Rang';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-rang',
  templateUrl: './rang.component.html',
  styleUrls: ['./rang.component.css']
})
export class RangComponent implements OnInit {

  constructor( private communicationService: CommunicationService) { }

  @Input() jardinId: string;
  @Input() coordonneesParcelle: string;
  rangs: Rang[];
  variete: string[];

  ngOnInit() {
    this.getRangs();    
  }
  getRangs(){
    this.communicationService.getRangs(this.jardinId, this.coordonneesParcelle).subscribe((rangs: Rang[]) => {
      this.rangs = rangs;
      for (let i = 0; i< this.rangs.length; i++ ){
        this.communicationService.getVarieteByRang(this.jardinId, this.coordonneesParcelle, this.rangs[i].numero ).subscribe((varietes: string[]) => {
          this.rangs[i].variete = varietes.join(',\n') ;
        });
      }
    });
  }
}
