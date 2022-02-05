const add = (a: number, b: number): number => {
  return a+b;
};

const subtract = (a: number, b: number): number => {
  return a - b; // if no return statement, itll believe it returns void 
};

// we will always use return annotations because it is better programming


// anonymous functions
function divide (a: number, b: number) : number {
  return a/b;
};

const multiply =  function (a: number, b: number) : number {
  return a*b;
};

// logger
const logger = (message : string ): void => {
  console.log(message);
  // void functions can return null or undefined
};

const throwError = (message : string): never => {
  throw new Error(message);
};

// never is used for a function we never expect to complete or finish

const forecast = {
  date: new Date(),
  weather: 'sunny'
};

const logWeather = ({date, weather}: {date: Date, weather: string}) : void => {
  console.log(date);
  console.log(weather);
};

logWeather(forecast);
