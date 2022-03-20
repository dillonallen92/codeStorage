const express = require("express")

const router = express.Router();

//register the route
router.use("/todo", require('./todo.routes'))

module.exports = router;