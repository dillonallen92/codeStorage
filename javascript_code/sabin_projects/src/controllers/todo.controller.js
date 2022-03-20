const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function Create(name) {
  const todo = await prisma.todo.create({
    data: {
      name: name
    },

  });

  return todo;
}

async function ToggleComplete(todo_id) {
  // grabs the todo item by using its ID
  const todo = await prisma.todo.findUnique({
    where: {
      id: todo_id
    }
  })

  // reads the complete status and changes based off that
  const completed = await prisma.todo.update({
    data: {
      complete: !todo.complete
    },
    where: {
      id: todo_id
    }
  })

  return completed;
}

async function DeleteTodo(todo_id) {

  const delete_todo = await prisma.todo.delete({
    where: {
      id: todo_id
    }
  });

  return delete_todo;

}

async function RetrieveTodos() {
  const todo_list = await prisma.todo.findMany();
  return todo_list;
}

module.exports = {
  Create,
  ToggleComplete,
  DeleteTodo,
  RetrieveTodos
}