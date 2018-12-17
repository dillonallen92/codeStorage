function b()
{
    var myVar;
    console.log("In b: " + myVar);
}
   
function a()
{
    var myVar = 2;
    console.log("In a: "+ myVar);
    b();
    return myVar;
}

var myVar = 1;
console.log("Global set: " + myVar);
a();
console.log("After it all: " + myVar);

console.log("Test of return");
myVar = a();
console.log("Return test: " + myVar);