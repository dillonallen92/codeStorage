const carMakers = ['ford', 'toyota', 'chevy'];

const dates = [new Date(), new Date()];

const carsByMake = [
  ['f150'],
  ['corolla'],
  ['camero']
];

// why do we care about array types?

// help with inference when extracting values
const car = carMakers[0];
const myCar = carMakers.pop();

// prevent incompatible values
carMakers.map((car:string) : string =>{
  return car.toUpperCase();
});

// flexible types
const importantDates : ( Date | string)[] = [ new Date(), '2030-10-10'];
