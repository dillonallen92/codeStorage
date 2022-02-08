// The point of this class file is to abstract and protect the Google Map call

export class CustomMap {
  private google_map: google.maps.Map;

  constructor() {
    this.google_map = new google.maps.Map(document.getElementById('map'),{
      zoom: 1,
      center: {
        lat: 0,
        lng: 0
      }
    });
  }
}