import { Jardin } from './../../../../common/tables/Jardins';
import { CommunicationService } from './../communication.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-jardins',
  templateUrl: './jardins.component.html',
  styleUrls: ['./jardins.component.css']
})
export class JardinsComponent implements OnInit {

  jardins: Jardin[];
  constructor(private communicationService: CommunicationService) { }


  ngOnInit() {
    this.getJardins()
  }
  getJardins(){
    this.communicationService.getJardins().subscribe((jardins: Jardin[]) => {
      console.log(JSON.stringify(jardins))
      this.jardins = jardins;
      console.log(JSON.stringify(this.jardins));
    });
  }


}
