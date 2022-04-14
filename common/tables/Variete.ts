export class Variete {
    nomvariete         : string
    anneemisemarche    : number;
    descriptionsemis   : string;
	plantation         : string;
    entretien          : string;
    recolte            : string;
	periodemiseplace   : string;
    perioderecolte     : string;
    commentaire        : string;
    typesol            : string;
    estbiologique      : boolean;
    constructor() {
        this.nomvariete         = "Tuberosum";
        this.anneemisemarche    = 2022;
        this.descriptionsemis   = "Semis en surface, ne pas mettre sous terre, proche d'un cours d'eau";
        this.plantation         = "Rangées en rang, exposées au soleil";
        this.entretien          = "Arrosage tous les jours, ne pas mettre à l'ombre";
        this.recolte            = "Coupés par faux, laisser la racine en terre";
        this.periodemiseplace   = "En saison froide";
        this.perioderecolte     = "De janvier à mars";
        this.commentaire        = "Sensible aux changements de température, prendre soin";
        this.typesol            = "";
        this.estbiologique      = false;
    }
}