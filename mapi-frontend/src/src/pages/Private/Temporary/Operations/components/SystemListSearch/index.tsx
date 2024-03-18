import { ChangeEvent, useRef, useState, MouseEvent, useContext } from "react";
import { debounce } from "lodash";
import SystemTablet from "../SystemTablet";
import AddOperationModal from "../AddOperationModal";
import plusIcon from "src/assets/icons/plus-icon.svg";
import errorIcon from "src/assets/icons/error.svg";
import searchIcon from "src/assets/icons/search.svg";
import filterBlackIcon from "src/assets/icons/filter-black.svg";
import styles from "./systemlis.module.css";
import { TemporaryContext } from "src/context";
import DownloadExcel from "src/components/DownloadToExcel";
import { useAxios } from "src/hooks";
import { OperationService } from "src/services";

const SistemListSearch = () => {
  const [code, setCode] = useState<string>("");
  const [modalVisible, setModalVisible] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);
  const { callEndpoint } = useAxios();

  const { setSearch } = useContext(TemporaryContext);

  const debouncedValidate = useRef(
    debounce(async (code_search: string) => {
      setSearch(code_search);
    }, 1000)
  );

  const { setOrderBy, temporaryState } = useContext(TemporaryContext);

  const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
    let searchValue = e.target.value;
    setCode(searchValue);
    debouncedValidate.current(searchValue);
  };

  const handleReset = (e: MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    if (code.length) {
      setSearch("");
      setCode("");
    }
  };

  const showModal = () => {
    setModalVisible(true);
  };

  const handleChangeOrderBy = (event: ChangeEvent<HTMLSelectElement>) => {
    setOrderBy(event.target.value);
  };

  return (
    <section className={styles.list_system}>
      <div className={styles.system_actions}>
        <div className={styles.input_search}>
          <p>Matriz de operaciones</p>
        </div>
        <div className={styles.list_actions}>
          <div className={styles.input_order}>
            <img src={filterBlackIcon} alt="Filter icon" />
            <select
              name="orderBy"
              onChange={handleChangeOrderBy}
              id="orderBy"
              value={temporaryState.orderBy}
            >
              <option value="ASC">Ascendente</option>
              <option value="DESC">Descendente</option>
            </select>
          </div>
          <button className="btn_black" onClick={showModal}>
            <img src={plusIcon} alt="Plus icon" /> Agregar operación
          </button>
          <DownloadExcel
            title_sheet="Operaciones"
            table_headers={[
              "ID",
              "Descripción de operación",
              "Duración (Minutos)",
              "Duración (Horas)",
              "Kilometros",
              "Horas",
              "Valor total",
              "Nombre del tipo de mantenimiento",
              "Código del técnico",
              "Sistema",
              "Código de operación",
              "Modelos",
            ]}
            service={async () => {
              const response = await callEndpoint(
                OperationService.getAllOperations()
              );
              if (response) {
                return response!.data.data.operations;
              }
            }}
          />
          <input
            ref={inputRef}
            type="text"
            value={code}
            onChange={handleChange}
            placeholder="Buscar operación por código"
          />
          <button
            onClick={handleReset}
            className={`${styles.search_icon} ${
              code.length ? styles.active : ""
            }`}
          >
            <img src={code.length ? errorIcon : searchIcon} alt="Error icon" />
          </button>
        </div>
      </div>

      {modalVisible && (
        <AddOperationModal
          title={"Agregar"}
          closeModal={() => setModalVisible(false)}
        />
      )}
      <SystemTablet />
    </section>
  );
};

export default SistemListSearch;
