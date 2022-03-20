
const express = require("express");
const res = require("express/lib/response");
const router = express.Router();
const controller = require('../controllers/todo.controller');



router.post('/', async (req, res) => {

  const { name } = req.body

  if (!name) {
    return res.status(400).send('Please provide a name');
  }


  const todo = await controller.Create(name);

  res.json({
    message: "Success!",
    created: todo,
  });

});

router.put('/toggle/:todo_id', async (req, res) => {
  const data = await controller.ToggleComplete(req.params.todo_id);
  res.json({
    message: "Success",
    updated: data
  });
});

router.delete('/:todo_id', async (req, res) => {
  const data = await controller.DeleteTodo(req.params.todo_id)
  res.json({
    message: "Successfully deleted todo"
  })
})

router.get('/', async (req, res) => {
  const data = await controller.RetrieveTodos();

  res.json(data);

})

module.exports = router;