// classes are blueprints to create an object with fields and methods to represent a thing

// they will work with methods (functions) and fields

// Vehicle is the super class
class Vehicle {
  // properties with actual values
  // color : string;

  // // constructor
  // constructor(color : string)
  // {
  //   this.color = color;
  // }

  // constructor with color defined inside
  constructor(public color: string)
  {
  }

  // random methods
  public drive() : void {
    console.log('chugga chugga');
  }

  protected honk() : void {
    console.log("Beep beep");
  }
}

const vehicle = new Vehicle('orange');
console.log(vehicle.color);

// create a second class, for inheritence (using extends)
// since this extends, car is a child class
class Car extends Vehicle{

  constructor(public wheels: number, color: string)
  {
    super(color); // refernence to the constructor in the parent, must pass in color
  }

  // we can override methods now, by using the same name with implementation
  drive() : void {
    console.log("Now I am driving a car (chugga chugga part 2)");
  }
  
  // although drive is now private, this public function can access because its in the same class
  public startDrivingProcess() : void {
    this.drive();
    this.honk(); // if private, we cannot call this... protected works though
  }

}

const car = new Car(4,'red');

// car.startDrivingProcess();
// car.honk();