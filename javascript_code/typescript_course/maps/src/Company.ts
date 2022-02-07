// company import file
import faker from '@faker-js/faker';

export class Company{
  company_name : string;
  catchphrase : string;
  location: {
    lat: number;
    lng: number;
  }

  constructor(){
    this.company_name = faker.company.companyName();
    this.catchphrase = faker.company.catchPhrase();
    this.location = {
      lat : parseFloat(faker.address.latitude()),
      lng : parseFloat(faker.address.longitude())
    };
  }

};