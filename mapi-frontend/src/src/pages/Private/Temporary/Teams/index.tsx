import ListComponents from "./components/ListComponents";
import SystemList from "./components/SystemList";
import TeamFilter from "./components/TeamFilter";
import styles from "../temporary.module.css";

const Operations = () => {
  return (
    <>
      <TeamFilter />
      <div className={styles.operations_wrapper}>
        <ListComponents />
        <SystemList />
      </div>
    </>
  );
};

export default Operations;
