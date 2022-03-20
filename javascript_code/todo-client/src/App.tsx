
import { toEditorSettings } from 'typescript';
import './App.css';

type Todo = {
  id: String,
  name: String,
  completed: Boolean
};

function App() {

  const todos: Todo[] = [{
    id: "1001",
    name: "todo 1",
    completed: false
  },
  {
    id: "1002",
    name: "todo 2",
    completed: false
  }];


  return (
    <div className="App">
      {/* create an inline component for todos> */}
      <div className="todo-container">
        <h2>My Todo List</h2>
        <ul>
          {
            todos.map((todo, idx) => (
              <li key={idx} className="todo">
                {todo.name}
                <div className="spacer" />
                <input type="checkbox" />
                <button>X</button>
              </li>
            )
            )
          }
        </ul>
      </div>
    </div>
  );
}

export default App;
