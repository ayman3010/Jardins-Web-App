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

  @Input() jardinId: string = 'JD01';
  @Input() coordonneesParcelle: string = '(0,0)';
  rangs: Rang[];

  ngOnInit() {
    this.getRangs();
  }
  getRangs(){
    this.communicationService.getRangs(this.jardinId, this.coordonneesParcelle).subscribe((rangs: Rang[]) => {
      this.rangs = rangs;
    });
  }

}
