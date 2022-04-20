import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {Parcelle} from '../../../../common/tables/Parcelle'
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-parcelle',
  templateUrl: './parcelle.component.html',
  styleUrls: ['./parcelle.component.css']
})
export class ParcelleComponent implements OnInit {

  jardinId: string;
  parcelles: Parcelle[];
  constructor(private route: ActivatedRoute , private communicationService: CommunicationService) {
    this.route.params.subscribe(params => {
      this.jardinId = params.id;
    });
   }
  ngOnInit() {
    this.getParcelles();
  }
  getParcelles(){
    this.communicationService.getParcelles(this.jardinId).subscribe((parcelles: Parcelle[]) => {
      this.parcelles = parcelles;
    });
  }
}
