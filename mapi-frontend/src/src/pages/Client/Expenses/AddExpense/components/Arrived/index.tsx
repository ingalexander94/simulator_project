import styles from "./arrived.module.css";

const Arrived = () => {
  return (
    <>
      <section className={styles.content}>
        <h4>Llegada</h4>
        <hr />
        <form className={styles.form}>
          <div className={styles.form_content}>
            <div className={`${styles.form_list} ${styles.input}`}>
              <label htmlFor="">Fecha de llegada</label>
              <input placeholder="dd/mm/aaaa" type="date" />
            </div>

            <div className={styles.form_list}>
              <label htmlFor="exit">Kilómetros de llegada</label>
              <input placeholder="00" type="text" />
            </div>
            <div className={styles.form_list}>
              <label htmlFor="arrived">Lugar de llegada</label>
              <input placeholder="Escribe el lugar de salida" type="text" />
            </div>
          </div>
        </form>
      </section>
    </>
  );
};

export default Arrived;
