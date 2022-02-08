// The point of this class file is to abstract and protect the Google Map call
import { User } from "./User";
import { Company } from "./Company";

export class CustomMap {
  private google_map: google.maps.Map;

  constructor(divID: string) {
    this.google_map = new google.maps.Map(document.getElementById(divID),{
      zoom: 1,
      center: {
        lat: 0,
        lng: 0
      }
    });
  }

  // take in a user as an argument and add to map
  add_user_marker(user : User) {
    new google.maps.Marker({
      map: this.google_map,
      position:{
        lat: user.location.lat,
        lng: user.location.lng
      }
    });
  }

  add_company_marker(company : Company) {
    new google.maps.Marker({
      map: this.google_map,
      position: {
        lat: company.location.lat,
        lng: company.location.lng
      }
    })
  }
}