// this is the script that will be for the user object
// this file is named with a capital letter because this
// is the class file

// import the faker module (the course uses the deleted repo, so now it is in @faker-js/faker)
import faker from '@faker-js/faker';
import { Mappable } from './CustomMap';

export class User implements Mappable{
  // two properties
  name: string;
  location: {
    lat: number;
    lng: number;
  };

  color: string;


  constructor() {
    this.name = faker.name.firstName();
    this.location = {
      lat: parseFloat(faker.address.latitude()),
      lng: parseFloat(faker.address.longitude())
    };
    this.color = 'red';
  }

  marker_content() : string {
    return `Name: ${this.name}`;
  }

}