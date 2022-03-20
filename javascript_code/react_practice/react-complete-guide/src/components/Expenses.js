import ExpenseItem from "./ExpenseItem";
import Card from "./Card";
import './Expenses.css';


function Expenses(props) {
  const expenses = props.expenses;
  return (
    <Card className="expenses">
      {expenses.map(element => <ExpenseItem title={element.title} amount={element.amount} date={element.date} />)}
    </Card>
  );
}

export default Expenses;