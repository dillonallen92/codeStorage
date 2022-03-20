const express = require('express')

const app = express()

app.use(express.json());
const routes = require("./src/routes");
app.use(routes);

app.get('/', (req, res) => {
  res.json({ message: 'test' })
});

app.listen(3000, () => {
  console.log("Listening on port 3000")
})