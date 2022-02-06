// interfaces are a custom type that we can define

// define an interface (basically a blueprint)
interface Reportable {
  summary(): string; // must contain a summary function now
}

 // the object here can have MORE properties than the interface, but MUST have the basic stuff the 
 // interface requires, for being used in the function below 
const oldCivic = {
  name: 'civic',
  year: new Date(),
  broken: true,

  // this is the only thing needed for the interface
  summary() : string {
    return `Name is ${this.name}`;
  }

};

const drink = {
  color: 'brown',
  carbonated: true,
  sugar: 40,
  summary() : string {
    return `My drink has ${this.sugar} grams of sugar`; 
  }
}

const printSummary = (item : Reportable) : void => {
  console.log(item.summary());
};


// with the refactor we did to printSummary and Interfaces, we can now have multple
// objects of radically different types be passed through the same function because
// they have the same summary() function required from the interface and the printSummary function
printSummary(oldCivic);
printSummary(drink);

// General Plan with Interfaces (esp. for reusable code)
// 1. create functions that are typed with interfaces, as much as possible
// 2. Objects/classes can decide to implement a given interface to work with a function

