// classes are blueprints to create an object with fields and methods to represent a thing

// they will work with methods (functions) and fields

// Vehicle is the super class
class Vehicle {
  
  // random methods
  public drive() : void {
    console.log('chugga chugga');
  }

  public honk() : void {
    console.log("Beep beep");
  }
}

// create a second class, for inheritence (using extends)
// since this extends, car is a child class
class Car extends Vehicle{

  // we can override methods now, by using the same name with implementation
  drive() : void {
    console.log("Now I am driving a car (chugga chugga part 2)");
  }
  
  // although drive is now private, this public function can access because its in the same class
  public startDrivingProcess() : void {
    this.drive();
  }

}

const car = new Car();

car.startDrivingProcess();
car.honk();