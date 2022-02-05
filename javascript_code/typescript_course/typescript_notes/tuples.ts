// these are slightly different from arrays

// tuples can be used to organize properties of a record

// example, you want to organize the properties of a soda
// color : brown, sugar: 40, carbonated: true

// tuples have fixed order of elements, easier to group and identify
// tuples can be hard to read, for example

const carSpecs : [number, number] = [400, 3354];

// modeling this would be easier with an object, on average
const CarStats = {
  horsepower : 400,
  weight : 3354
};

