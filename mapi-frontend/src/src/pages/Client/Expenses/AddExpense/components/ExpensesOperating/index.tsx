import styles from "./expensesoperating.module.css";
import plus from "src/assets/icons/AddCompany.svg";

const ExpensesOperating = () => {
  return (
    <>
      <section className={styles.content}>
        <div className={styles.header}>
          <h4>Gastos de operación</h4>
          <button>
            <img src={plus} alt="icon" /> Agregar gasto
          </button>
        </div>
        <hr />
        <div className={styles.expenses_header}>
          <div>Concepto</div>
          <div>Valor</div>
        </div>
        <form className={styles.form}>
          <div className={styles.form_content}>
            <div className={styles.form_list}>
              <select className={styles.select}>
                <option value={0}>Selecciona un concepto</option>
              </select>
            </div>
            <div className={styles.form_list}>
              <input placeholder="$0" type="number" min={1} />
            </div>
          </div>
        </form>
      </section>
    </>
  );
};

export default ExpensesOperating;
