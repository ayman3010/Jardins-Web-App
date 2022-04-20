import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";
import { Variete } from "../../../common/tables/Variete";

@injectable()
export class DatabaseService {

  // TODO: A MODIFIER POUR VOTRE BD
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "Jardins",
    password: "postegre",
    port: 5432,
    host: "127.0.0.1",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);

  // Varietes 

  public async createVariete(variete: Variete): Promise<pg.QueryResult> {
    const client = await this.pool.connect();

    if (!variete.nomvariete || !variete.anneemisemarche || !variete.descriptionsemis || !variete.plantation || !variete.entretien || !variete.recolte || !variete.typesol || !variete.estbiologique)
      throw new Error("Invalid create hotel values");

    const values: any[] = [variete.nomvariete, variete.anneemisemarche, variete.descriptionsemis, variete.plantation, variete.entretien, variete.recolte, variete.periodemiseplace, variete.perioderecolte, variete.commentaire, variete.typesol, variete.estbiologique];
    const queryText: string = `INSERT INTO JARDINDB.Variete VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);`;

    const res = await client.query(queryText, values);
    client.release()
    return res;
  }

  public async filtrerVarietebyRang(jardinId: string, coordonnees: string, numero: number): Promise<pg.QueryResult> {

    const client = await this.pool.connect();
    const searchTerms: string[] = [];
    if (jardinId.length > 0) searchTerms.push(`jardinId = '${jardinId}'`);
    if (coordonnees.length > 0) searchTerms.push(`coordonnees = ${coordonnees}`);
    if (numero) searchTerms.push(`numero = ${numero}`);
    let queryText = "SELECT nomvariete FROM JARDINDB.rangvariete";
    if (searchTerms.length > 0) queryText += " WHERE " + searchTerms.join(" AND ");
    queryText += ";";
    const res = await client.query(queryText);
    client.release()
    return res;
  }

  public async getVariete(nomVariete: string): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    let queryText = "SELECT * FROM JARDINDB.Variete";
    queryText += " WHERE "+  `nomVariete = '${nomVariete.substring(1)}'` + ";";

    const res = await client.query(queryText);
    client.release();

    return res;
  }

  public async filterVarietes(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    let queryText = "SELECT * FROM JARDINDB.Variete";
    queryText += ";";

    const res = await client.query(queryText);
    client.release()

    return res;
  }

  public async deleteVariete(nomVariete: string): Promise<pg.QueryResult> {
    if(nomVariete.length === 0) throw new Error("Invalid delete query");

    const client = await this.pool.connect();

    const query = `DELETE FROM JARDINDB.Variete WHERE nomVariete = '${nomVariete}'`
    const res = await client.query(query);
    client.release();
    return res;
  }


  // Jardins 

  public async filterJardins(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    let queryText = "SELECT * FROM JARDINDB.Jardin";
    queryText += ";";

    const res = await client.query(queryText);
    client.release()

    return res;
  }

  // Rangs
  
  public async filtrerRangs(jardinId: string, coordonnees: string): Promise<pg.QueryResult> {

    const client = await this.pool.connect();
    const searchTerms: string[] = [];
    if (jardinId.length > 0) searchTerms.push(`jardinId = '${jardinId}'`);
    if (coordonnees.length > 0) searchTerms.push(`coordonnees = ${coordonnees}`);
    let queryText = "SELECT * FROM JARDINDB.rang";
    if (searchTerms.length > 0) queryText += " WHERE " + searchTerms.join(" AND ");
    queryText += ";";
    const res = await client.query(queryText);
    client.release()
    return res;
  }

  // Parcelles

  public async filtrerParcelles(jardinid: string): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    let queryText = "SELECT * FROM JARDINDB.parcelle";
    queryText += " WHERE "+  `jardinid = '${jardinid}'` + ";";

    const res = await client.query(queryText);
    client.release()
    return res;
  }
}
