// goal of this application is just to showcase stuff
import axios from 'axios';

const url = 'https://jsonplaceholder.typicode.com/todos/1';

interface Todo 
{
  id: number;
  title: string;
  completed: boolean;
}

axios.get(url).then(response => {
  // we wish we had something can could tell us the properties
  // of the response.data object, so we could pull the proper
  // properties.
  //const todo = response.data;

  //const ID = todo.id;
  //const title = todo.title;
  //const finished = todo.completed;

  // now using our new type of data
  const todo = response.data as Todo;

  // now the interface helps us determine the type
  // and the properties to recover with the dot operator
  // this data interface helps keep code more formal and 
  // structured.

  const id = todo.id;
  const title = todo.title;
  const completed = todo.completed;
  logTodo(id, title, completed);
});


// define new function to do the console logging
const logTodo = (id: number, title: string, completed:boolean) => {

  console.log(`
    The TODO with id: ${id}
    Has a title of: ${title}
    is it completed? ${completed}
  `);
};