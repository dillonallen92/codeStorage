// types
// different properties and functions that a value has
// types of types
// 1. string
// 2. number
// 3. boolean
// 4. Date
// (we created a Todo datatype with the interface)

// snippets of code
// type of date
const today = new Date();

// type annotations

// here we are saying apples is always going
// to be a number
let apples:number = 4;

// let keyword allows to mutate instead of const
let speed:string = 'fast';

let hasName:boolean = true;
let nothingmuch:null = null;

// we can also use this for objects

// built in objects
let now: Date = new Date();

// --- object literal annotations ---

//array 

// string[] DOES NOT create an array but
// just announce this data type IS GOING TO BE
// an array
let colors: string[] = ['red', 'white', 'blue'];
let myNums: number[] = [1,2,3,4,5];
let truths: boolean[] = [true, false, true];

// classes

class Car 
{

}

let car: Car = new Car();

// object literal

let point: {x: number; y: number} = {
  x : 10,
  y : 20
};

// functions 
// (i: number) => void is the annotation...
const logNumber: (i: number) => void = (i: number) => {
  console.log(i);
};

// when to use annotations
// 1. when you have a function that returns the any type

//const json = '{"x":10,"y":20}';
//
//const coordinates = JSON.parse(json);
//console.log(coordinates);

// so what is any, anyway?
// JSON.parse returns "any", because it doesn't know what we are getting out of this function
// we know we input a string, ideally JSON string, but it cannot predict what we get back.
// It can be a boolean, number, function, object, etc.

// ideally you are going to want to avoid variables of type any, because typescript does not
// know what properties are related to such a variable.

// How to fix the any type...
// const coordinates: {x : number; y: number; } = JSON.parse(json);
// we add annotations on the 'any' variable, manually.

// 2. when we declare a variable on one line, and initialize it later
let words = ['red', 'white', 'blue'];
let FoundWord: boolean; // without this, it shows as type any
// we could also have initialized it as false
// let foundWord = false;, this would have shown as boolean from the start

for (let i = 0; i < words.length; i++)
{
  if( words[i] == 'green')
  {
    FoundWord = true;
  }
}

// 3. Variable whose type cannot be inferred correctly
let numbers = [-10, -1, 12];
let numbersAboveZero : boolean | number = false; // you can annotate to have two possible types... WTF

for (let i = 0; i < numbers.length; i++)
{
  if (numbers[i] > 0)
    numbersAboveZero = numbers[i];
}


