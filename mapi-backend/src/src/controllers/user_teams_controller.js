const path = require("path");
const { response, request } = require("express");
const CustomError = require("../config/errors");
const UserTeamModel = require("../database/models/user_team_model");
const { getFile, uploadFile } = require("../config/s3");
const EngineModel = require("../database/models/clients/engine.model");
const TransmissionModel = require("../database/models/clients/transmission.model");
const BridgeModel = require("../database/models/clients/bridge.model");
const UserTeamPhotoModel = require("../database/models/clients/mp_team_photo.model");
const envs = require("../config/environments");

class UserTeamsController {
  static limit = 12;

  static #handleError = (error, res = response) => {
    if (error instanceof CustomError) {
      return res
        .status(error.statusCode)
        .json({ status: false, data: null, error: error.message });
    }
    console.error(error);
    return res
      .status(500)
      .json({ status: false, data: null, error: "Internal Server Error" });
  };

  static getMyTeams = async (req = request, res = response) => {
    try {
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const teams = await userTeamModel.getMyTeams();
      return res.status(200).json({
        status: true,
        data: teams,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getTeams = async (req = request, res = response) => {
    try {
      let { id } = req.params;
      id = parseInt(id);
      let brands = [];
      let models = [];
      let years = [];
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const teams = await userTeamModel.getTeams();
      if (id) {
        const saveData = await userTeamModel.getTeamByIdUserTeam(id);
        if (saveData) {
          brands = await userTeamModel.getBrandsByTeam(saveData.ut_team);
          if (brands && brands.length) {
            brands = Object.values(
              brands.reduce((acc, curr) => {
                if (!acc[curr.id_brand]) {
                  acc[curr.id_brand] = {
                    id_brand: curr.id_brand,
                    brand_code: curr.brand_code,
                    brand_name: curr.brand_name,
                    brand_models: [],
                  };
                }
                acc[curr.id_brand].brand_models.push({
                  id_model: curr.id_model,
                  model_code: curr.model_code,
                  model_name: curr.model_name,
                  model_init_year: curr.model_init_year,
                  model_final_year: curr.model_final_year,
                  model_engine: curr.model_engine,
                  model_transmission: curr.model_transmission,
                  model_application: curr.model_application,
                  model_suspension: curr.model_suspension,
                  model_rear_bridge: curr.model_rear_bridge,
                  model_brand: curr.model_brand,
                });
                return acc;
              }, {})
            );

            models = brands.find(
              ({ id_brand }) => id_brand === saveData.ut_brand
            ).brand_models;

            if (models.length) {
              const model = models.find(
                ({ id_model }) => id_model === saveData.ut_model
              );
              if (model) {
                const { model_init_year, model_final_year } = model;
                const numbers = Array.from(
                  Array(model_final_year - model_init_year + 1).keys(),
                  (i) => i + model_init_year
                );
                years = numbers;
              }
            }
          }
        }
      }
      return res.status(200).json({
        status: true,
        data: { teams, brands, models, years },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getBrandsByTeam = async (req = request, res = response) => {
    try {
      const dbConnection = req.clientConnection;
      const { id_team } = req.params;
      const userTeamModel = new UserTeamModel(dbConnection);
      let brands = await userTeamModel.getBrandsByTeam(id_team);
      if (brands && brands.length) {
        brands = Object.values(
          brands.reduce((acc, curr) => {
            if (!acc[curr.id_brand]) {
              acc[curr.id_brand] = {
                id_brand: curr.id_brand,
                brand_code: curr.brand_code,
                brand_name: curr.brand_name,
                brand_models: [],
              };
            }
            acc[curr.id_brand].brand_models.push({
              id_model: curr.id_model,
              model_code: curr.model_code,
              model_name: curr.model_name,
              model_init_year: curr.model_init_year,
              model_final_year: curr.model_final_year,
              model_engine: curr.model_engine,
              model_transmission: curr.model_transmission,
              model_application: curr.model_application,
              model_suspension: curr.model_suspension,
              model_rear_bridge: curr.model_rear_bridge,
              model_brand: curr.model_brand,
            });
            return acc;
          }, {})
        );
      }
      return res.status(200).json({
        status: true,
        data: brands,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getListTeams = async (req = request, res = response) => {
    try {
      const search = req.query.search;
      const page = parseInt(req.query.page) || 1;
      let totalPages = 1;
      let equipments = [];
      const team = req.query.team;
      if (team) {
        const offset = (page - 1) * this.limit;
        const dbConnection = req.clientConnection;
        const userTeamModel = new UserTeamModel(dbConnection);
        if (search) {
          equipments = await userTeamModel.searchByCarPlate(search, team);
        } else {
          equipments = await userTeamModel.listTeams(this.limit, offset, team);
          const { total } = await userTeamModel.getTotalListUserTeam();
          totalPages = Math.ceil(total / this.limit);
        }
      }
      return res.status(200).json({
        status: true,
        data: { totalPages, equipments },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getDetailUserTeam = async (req = request, res = response) => {
    try {
      const { id } = req.params;
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const equipment = await userTeamModel.getDetailsUserTeam(id);
      if (!equipment) throw CustomError.badRequest("El equipo no existe");
      let photo = await getFile(envs.DEFAULT_AVATAR);
      if (
        equipment.personal_photo &&
        !equipment.personal_photo.includes("default")
      ) {
        photo = await getFile(equipment.personal_photo);
      }
      equipment.personal_photo = photo;
      const photos = await userTeamModel.getPhotos(id);
      return res.status(200).json({
        status: true,
        data: { ...equipment, photos },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getSaveData = async (req = request, res = response) => {
    try {
      let { id } = req.params;
      id = parseInt(id);
      const dbConnection = req.clientConnection;
      let engine = {
        id_engine: 0,
        engine_brand: null,
        engine_model: null,
        engine_cylinder_capacity: null,
        engine_serial: null,
        engine_power: null,
        engine_torque: null,
        engine_rpm_power: null,
        engine_governed_speed: null,
        engine_ecm_name: null,
        engine_ecm_code: null,
        engine_part_ecm: null,
        engine_serial_ecm: null,
        engine_cpl: null,
      };

      let transmission = {
        id_transmission: 0,
        transmission_brand: null,
        transmission_model: null,
        transmission_oil_cooler: null,
        transmission_serial: null,
      };

      let bridge = {
        id_bridge: 0,
        bridge_front_brand: null,
        bridge_front_model: null,
        bridge_serial: null,
        bridge_front_suspension: null,
        bridge_rear_suspension: null,
        bridge_rear_brand: null,
        bridge_rear_model: null,
        bridge_intermediate_differential: null,
        bridge_rear_differential: null,
      };

      if (!id) {
        return res.status(200).json({
          status: true,
          data: {
            id_user_team: 0,
            ut_team: 0,
            ut_brand: 0,
            ut_model: 0,
            ut_year: 0,
            ut_measure: null,
            ut_driver: null,
            ut_application: "",
            ut_car_plate: "",
            ut_vin: "",
            ut_date_purchased: null,
            ut_state: null,
            ut_wheels_number: null,
            ut_front_tires_number: null,
            ut_rear_tires_number: null,
            engine,
            transmission,
            bridge,
            photos: [],
            files: [],
          },
          error: null,
        });
      }
      const userTeamModel = new UserTeamModel(dbConnection);
      const equipment = await userTeamModel.getSaveData(id);
      if (!equipment) throw CustomError.badRequest("El equipo no existe");
      if (equipment.ut_engine) {
        const engineModel = new EngineModel(dbConnection);
        engine = await engineModel.getEngineById(equipment.ut_engine);
      }
      if (equipment.ut_transmission) {
        const transmissionModel = new TransmissionModel(dbConnection);
        transmission = await transmissionModel.getTransmissionById(
          equipment.ut_transmission
        );
      }
      if (equipment.ut_bridge) {
        const bridgeModel = new BridgeModel(dbConnection);
        bridge = await bridgeModel.getBridgeById(equipment.ut_bridge);
      }
      return res.status(200).json({
        status: true,
        data: {
          ...equipment,
          engine,
          transmission,
          bridge,
          photos: [],
          files: [],
        },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getDownloadData = async (req = request, res = response) => {
    try {
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const equipments = await userTeamModel.getData();
      return res.status(200).json({
        status: true,
        data: equipments,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getListPlate = async (req = request, res = response) => {
    try {
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const listP = await userTeamModel.listPlate();
      return res.status(200).json({
        status: true,
        data: listP,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static getListDriver = async (req = request, res = response) => {
    try {
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const listD = await userTeamModel.listDriver();
      return res.status(200).json({
        status: true,
        data: listD,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };

  static save = async (req = request, res = response) => {
    try {
      const data = req.body;
      data.transmission = JSON.parse(data.transmission);
      data.bridge = JSON.parse(data.bridge);
      data.engine = JSON.parse(data.engine);
      const dbConnection = req.clientConnection;
      const userTeamModel = new UserTeamModel(dbConnection);
      const engineModel = new EngineModel(dbConnection);
      const transmissionModel = new TransmissionModel(dbConnection);
      const bridgeModel = new BridgeModel(dbConnection);
      const userTeamPhotoModel = new UserTeamPhotoModel(dbConnection);
      let ut_engine,
        ut_transmission,
        ut_bridge = null;

      if (!data.id_user_team) {
        const exist = await userTeamModel.findByCarPlate(data.ut_car_plate);
        if (exist)
          throw CustomError.badRequest(
            "La placa ya se encuentra registrada en el sitema"
          );
        if (data.engine) {
          ut_engine = await engineModel.create(data.engine);
          data.engine.id_engine = ut_engine;
        }
        if (data.transmission) {
          ut_transmission = await transmissionModel.create(data.transmission);
          data.transmission.id_transmission = ut_transmission;
        }
        if (data.bridge) {
          ut_bridge = await bridgeModel.create(data.bridge);
          data.bridge.id_bridge = ut_bridge;
        }
        const id_user_team = await userTeamModel.create(data);
        data.id_user_team = id_user_team;
      } else {
        if (data.engine) {
          await engineModel.update(data.engine);
        }
        if (data.transmission) {
          await transmissionModel.update(data.transmission);
        }
        if (data.bridge) {
          await bridgeModel.update(data.bridge);
        }
        await userTeamModel.update(data);
      }
      let files = req.files;
      if (files) {
        const [photos] = files;
        if (photos)
          for (const { file } of photos[0]) {
            const uniqueSuffix =
              Date.now() + "_" + Math.round(Math.random() * 1e9);
            const extension = path.extname(file.name);
            const filename = `${req.subdomain}/equipment/${data.id_user_team}/equipment_${uniqueSuffix}${extension}`;
            await uploadFile(filename, file.mimetype, file.data);
            await userTeamPhotoModel.create(data.id_user_team, filename);
          }
      }
      return res.status(201).json({
        status: true,
        data,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    } finally {
      if (req.clientConnection) {
        await req.clientConnection.destroy();
      }
    }
  };
}

module.exports = UserTeamsController;
