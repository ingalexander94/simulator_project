import CopyToClipboardButton from "./components/CopyButtons";
import styles from "./datestrayectori.module.css";

const DatesTrayectori = () => {
  return (
    <>
      <section className={styles.content}>
        <h4>Datos y trayectoria</h4>
        <hr />
        <form className={styles.form}>
          <div className={styles.form_content}>
            <div className={styles.form_list}>
              <label htmlFor="">Placa del equipo</label>
              <select className={styles.select}>
                <option value={0}>Selecciona una placa</option>
              </select>
            </div>

            <div className={styles.form_list}>
              <label htmlFor="">Conductor</label>
              <select className={styles.select}>
                <option value={0}>Selecciona un Conductor</option>
              </select>
            </div>

            <div className={styles.form_list}>
              <label htmlFor="total">Número de contacto</label>
              <CopyToClipboardButton />
            </div>
            <div className={styles.form_list}>
              <label htmlFor="total">Nombre de la empresa</label>
              <input
                placeholder="Escribe el nombre de la empresa"
                type="text"
              />
            </div>
            <div className={styles.form_list}>
              <label htmlFor="total">Nombre del encargado</label>
              <input placeholder="Nombre del encargado" type="text" />
            </div>
            <div className={styles.form_list}>
              <label htmlFor="total">Anticipo de la empresa</label>
              <input
                placeholder="$0"
                type="text"
                className={`${styles.input} ${styles.text_right}`}
              />
            </div>
          </div>
        </form>
      </section>
    </>
  );
};

export default DatesTrayectori;
