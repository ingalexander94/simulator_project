import DatesTrayectori from "./components/DatesTrayectori";
import styles from "./addregister.module.css";
import Exit from "./components/Exit";
import Arrived from "./components/Arrived";
import ExpensesOperating from "./components/ExpensesOperating";
const AddExpense = () => {
  return (
    <>
      <div className={styles.module_addRegister}>
        <div className={styles.content_right}>
          <DatesTrayectori />
          <Exit />
          <Arrived />
        </div>
        <div>
          <ExpensesOperating />
        </div>
      </div>
    </>
  );
};

export default AddExpense;
