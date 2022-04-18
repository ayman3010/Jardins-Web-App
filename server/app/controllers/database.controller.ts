import { Semencier } from './../../../common/tables/Semencier';
import { Rang } from './../../../common/tables/Rang';
import { Jardin } from "../../../common/tables/Jardins";
import { Variete } from "../../../common/tables/Variete";
import { NextFunction, Request, Response, Router } from "express";
import { inject, injectable } from "inversify";
import * as pg from "pg";

import { Hotel } from "../../../common/tables/Hotel";
import { HotelPK } from "../../../common/tables/HotelPK";
import { Parcelle } from "../../../common/tables/parcelle";

import { Guest } from "../../../common/tables/Guest";

import { DatabaseService } from "../services/database.service";
import Types from "../types";

@injectable()
export class DatabaseController {
  public constructor(
    @inject(Types.DatabaseService) private databaseService: DatabaseService
  ) {}

  public get router(): Router {
    const router: Router = Router();


    router.get("/nomplantes", (req: Request, res: Response, _: NextFunction) => {
      this.databaseService
        .filtrerPlantes()
        .then((result: pg.QueryResult) => {
          const nomPlantes: string[] = result.rows.map((plante: any) => (
             plante.nom
          ));
          res.json(nomPlantes);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });


    router.get("/semenciers", (req: Request, res: Response, _: NextFunction) => {
      this.databaseService
        .filtrerSemenciers()
        .then((result: pg.QueryResult) => {
          const semenciers: Semencier[] = result.rows.map((semencier: any) => ({
            id: semencier.semencierid,
            nom: semencier.nom,
          }));
          res.json(semenciers);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    router.get("/jardins", (req: Request, res: Response, _: NextFunction) => {
      this.databaseService
        .filterJardins()
        .then((result: pg.QueryResult) => {
          const jardins: Jardin[] = result.rows.map((jardin: any) => ({
            jardinid: jardin.jardinid,
            nom: jardin.nom,
            surface: jardin.surface,
            potager:   jardin.estpotager,
            ornement : jardin.estornement,
            verger  :   jardin.estverger,
            typesol     :  jardin.typesol,
            hauteur  : jardin.hauteurmax,
          }));
          res.json(jardins);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    router.get("/variete", (req: Request, res: Response, _: NextFunction) => {
      this.databaseService
        .filterVarietes()
        .then((result: pg.QueryResult) => {
          const varietes: Variete[] = result.rows.map((variete: any) => ({
            nomvariete           : variete.nomvariete,
            anneemisemarche     : variete.anneemisemarche,
            descriptionsemis    : variete.descriptionsemis,
	          plantation          : variete.plantation,
            entretien           : variete.entretien,
            recolte             : variete.recolte,
	          periodemiseplace    : variete.periodemiseplace,
            perioderecolte      : variete.perioderecolte,
            commentaire         : variete.commentaire,
            typesol             : variete.typesol,
            estbiologique       : variete.estbiologique,
          }));
          res.json(varietes);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    router.get(
      "/variete/:nomVariete",
      (req: Request, res: Response, _: NextFunction) => {
        const nomVariete: string = req.params.nomVariete;
        this.databaseService
        .getVariete(nomVariete)
        .then((result: pg.QueryResult) => {
          const variete: Variete[] = result.rows.map((variete: any) => (
            {
            nomvariete           : variete.nomvariete,
            anneemisemarche     : variete.anneemisemarche,
            descriptionsemis    : variete.descriptionsemis,
	          plantation          : variete.plantation,
            entretien           : variete.entretien,
            recolte             : variete.recolte,
	          periodemiseplace    : variete.periodemiseplace,
            perioderecolte      : variete.perioderecolte,
            commentaire         : variete.commentaire,
            typesol             : variete.typesol,
            estbiologique       : variete.estbiologique,
          }));
          res.json(variete);
        })
        .catch((e: Error) => {
          console.error(e.stack);
          res.json(-1);
        });
      }
    );

    


    router.get("/parcelles", (req: Request, res: Response, _: NextFunction) => {
      const jardinId = req.query.jardinId ? req.query.jardinId.toString() : "";
      this.databaseService
        .filtrerParcelles(jardinId)
        .then((result: pg.QueryResult) => {
          const parcelles: Parcelle[] = result.rows.map((parcelle: any) => ({
               jardinId: parcelle.jardinid,
               dimensions: parcelle.dimensions,
               coordonnees: parcelle.coordonnees,
          }));
          res.json(parcelles);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    router.get(
      "/parcelles/:jardinId/:coordonnees",
      (req: Request, res: Response, _: NextFunction) => {
        const jardinId: string = req.params.jardinId;
        const coordonnees: string = req.params.coordonnees;
        this.databaseService
        .filtrerRangs(jardinId, coordonnees)
        .then((result: pg.QueryResult) => {
          const rangs: Rang[] = result.rows.map((rang: any) => ({
            numero: rang.numero,
            variete: rang.variete,
            periodeJachere: rang.periodejachere,
            estJachere: rang.estjachere ,
            coordGeo: rang.cordonnesgeo
          }));
          res.json(rangs);
        })
        .catch((e: Error) => {
          console.error(e.stack);
          res.json(-1);
        });
      }
    );

    router.get(
      "/varietes/:jardinId/:coordonnees/:numero",
      (req: Request, res: Response, _: NextFunction) => {
        const jardinId: string = req.params.jardinId;
        const coordonnees: string = req.params.coordonnees;
        const numero: number = parseInt(req.params.numero);
        this.databaseService
        .filtrerVarietebyRang(jardinId, coordonnees, numero)
        .then((result: pg.QueryResult) => {
          const varietes: string[] = result.rows.map((variete: any) => (
             variete.nomvariete
          ));
          res.json(varietes);
        })
        .catch((e: Error) => {
          console.error(e.stack);
          res.json(-1);
        });
      }
    );

    router.post(
      "/variete/modifier/:nomVariete",
      (req: Request, res: Response, _: NextFunction) => {
        const nomVariete: string = req.params.nomVariete;
        const variete: Variete = {
          nomvariete         : req.body.nomvariete,
          anneemisemarche    : req.body.anneemisemarche,
          descriptionsemis   : req.body.descriptionsemis,
	        plantation         : req.body.plantation,
          entretien          : req.body.entretien,
          recolte            : req.body.recolte,
	        periodemiseplace   : req.body.periodemiseplace,
          perioderecolte     : req.body.perioderecolte,
          commentaire        : req.body.commentaire,
          typesol            : req.body.typesol,
          estbiologique      : req.body.estbiologique,
        };
        this.databaseService
          .modifierVariete(variete, nomVariete)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
            res.json(-1);
          });
      }
    );

    router.post(
      "/variete/insert",
      (req: Request, res: Response, _: NextFunction) => {
        const variete: Variete = {
          nomvariete         : req.body.nomvariete,
          anneemisemarche    : req.body.anneemisemarche,
          descriptionsemis   : req.body.descriptionsemis,
	        plantation         : req.body.plantation,
          entretien          : req.body.entretien,
          recolte            : req.body.recolte,
	        periodemiseplace   : req.body.periodemiseplace,
          perioderecolte     : req.body.perioderecolte,
          commentaire        : req.body.commentaire,
          typesol            : req.body.typesol,
          estbiologique      : req.body.estbiologique,
        };
        this.databaseService
          .creerVariete(variete)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
            res.json(-1);
          });
      }
    );


    router.post(
      "/variete/delete/:nomVariete",
      (req: Request, res: Response, _: NextFunction) => {
        const nomVariete: string = req.params.nomVariete;
        this.databaseService.deleteVariete(nomVariete).then((result: pg.QueryResult) => {
          res.json(result.rowCount);
        }).catch((e: Error) => {
          console.error(e.stack);
        });
      }
    )

    router.post(
      "/hotels/delete/:hotelNb",
      (req: Request, res: Response, _: NextFunction) => {
        const hotelNb: string = req.params.hotelNb;
        this.databaseService
          .deleteHotel(hotelNb)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
          });
      }
    );


    router.put(
      "/hotels/update",
      (req: Request, res: Response, _: NextFunction) => {
        const hotel: Hotel = {
          hotelnb: req.body.hotelnb,
          name: req.body.name ? req.body.name : "",
          city: req.body.city ? req.body.city : "",
        };

        this.databaseService
          .updateHotel(hotel)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
          });
      }
    );



    // ======= GUEST ROUTES =======
    router.post(
      "/guests/insert",
      (req: Request, res: Response, _: NextFunction) => {
        const guest: Guest = {
          guestnb: req.body.guestnb,
          nas: req.body.nas,
          name: req.body.name,
          gender: req.body.gender,
          city: req.body.city
        };

        this.databaseService
          .createGuest(guest)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
            res.json(-1);
          });
      }
    );


    router.get(
      "/guests/:hotelNb/:roomNb",
      (req: Request, res: Response, _: NextFunction) => {
        const hotelNb: string = req.params.hotelNb;
        const roomNb: string = req.params.roomNb;

        this.databaseService
        .getGuests(hotelNb, roomNb)
        .then((result: pg.QueryResult) => {
          const guests: Guest[] = result.rows.map((guest: any) => ({
            guestnb: guest.guestnb,
            nas: guest.nas,
            name: guest.name,
            gender: guest.gender,
            city: guest.city,
          }));
          res.json(guests);
        })
        .catch((e: Error) => {
          console.error(e.stack);
          res.json(-1);
        });
      }
    );


    // ======= GENERAL ROUTES =======
    router.get(
      "/tables/:tableName",
      (req: Request, res: Response, next: NextFunction) => {
        this.databaseService
          .getAllFromTable(req.params.tableName)
          .then((result: pg.QueryResult) => {
            res.json(result.rows);
          })
          .catch((e: Error) => {
            console.error(e.stack);
          });
      }
    );

    return router;
  }
}
