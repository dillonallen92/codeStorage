// instructions to all classes on how to be the proper argument to be
// marked on the map
interface Mappable {
  location : {
    lat: number,
    lng: number
  };
}

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

  add_marker(mappable : Mappable) : void {
    const marker= new google.maps.Marker({
      map: this.google_map,
      position:{
        lat: mappable.location.lat,
        lng: mappable.location.lng
      }
    });

    // add event listener here
    marker.addListener('click', () =>{
      const info_window = new google.maps.InfoWindow({
        content: 'Hello there!'
      });

      info_window.open(this.google_map, marker);
    });
  }
}