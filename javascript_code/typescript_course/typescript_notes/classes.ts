// classes are blueprints to create an object with fields and methods to represent a thing

// they will work with methods (functions) and fields

class Vehicle {
  
  // random methods
  drive() : void {
    console.log('chugga chugga');
  }
}

const vehicle = new Vehicle();

// now we have access to the methods inside of Vehicle
vehicle.drive();