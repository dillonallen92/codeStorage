// company import file
import faker from '@faker-js/faker';
import { Mappable } from './CustomMap';

export class Company implements Mappable{
  company_name : string;
  catchphrase : string;
  location: {
    lat: number;
    lng: number;
  }

  color: string;

  constructor(){
    this.company_name = faker.company.companyName();
    this.catchphrase = faker.company.catchPhrase();
    this.location = {
      lat : parseFloat(faker.address.latitude()),
      lng : parseFloat(faker.address.longitude())
    };
    this.color = 'pink';
  }

  marker_content() : string {
    // note that you can add html content into the return statement, like below
    return `
      <div> 
        <h3> Company Name: ${this.company_name} </h3>
        <p> Catchphrase: ${this.catchphrase} <p>
      </div>
    `;
  }


};