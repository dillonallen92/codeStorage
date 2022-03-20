import Expenses from "./components/Expenses";

function App() {

  const expense = [
    { title: 'Car Insurance', amount: 221.50, date: new Date(2021, 2, 28) },
    { title: 'Renters Insurance', amount: 21.50, date: new Date(2021, 1, 21) },
    { title: 'Food', amount: 41.80, date: new Date(2021, 5, 18) },
    { title: 'Movies', amount: 12.99, date: new Date(2021, 4, 12) },
  ];


  return (
    <Expenses expenses={expense} />
  );
}

export default App;
