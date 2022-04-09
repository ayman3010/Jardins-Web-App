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
      this.jardins = jardins;
    });
  }

  getTypeJardin(jardin: Jardin): string{
    let typeJardin: string = '';
    if (jardin.ornement) typeJardin +="ornement ";
    if (jardin.verger)  typeJardin +="verger ";
    if (jardin.potager) typeJardin +="potager ";
    return typeJardin;
  }


}
