export class Variete {
    nomVariete         : string
    anneeMiseMarche    : number;
    descriptionSemis   : string;
	plantation         : string;
    entretien          : string;
    recolte            : string;
	periodeMisePlace   : string;
    periodeRecolte     : string;
    commentaire        : string;
    typeSol            : string;
    estBiologique      : boolean;
    constructor() {
        this.nomVariete         = "";
        this.anneeMiseMarche    = 2022;
        this.descriptionSemis   = "";
        this.plantation         = "";
        this.entretien          = "";
        this.recolte            = "";
        this.periodeMisePlace   = "";
        this.periodeRecolte     = "De janvier à mars";
        this.commentaire        = "";
        this.typeSol            = "";
        this.estBiologique      = false;
    }
}