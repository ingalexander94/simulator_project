import { createContext } from "react";
import { Brand, Equipment, EquipmentState, Model } from "src/interfaces";

export type EquipmentContextProps = {
  equipmentState: EquipmentState;
  setSearch: (search: string) => void;
  setEquipments: (equipment: Equipment[]) => void;
  setTotalPages: (totalPages: number) => void;
  setTeam: (id_team: number) => void;
};

export const EquipmentContext = createContext<EquipmentContextProps>(
  {} as EquipmentContextProps
);
