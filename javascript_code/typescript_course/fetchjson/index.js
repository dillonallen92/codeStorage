"use strict";
exports.__esModule = true;
// goal of this application is just to showcase stuff
var axios_1 = require("axios");
var url = 'https://jsonplaceholder.typicode.com/todos/1';
axios_1["default"].get(url).then(function (response) {
    console.log(response.data);
});
