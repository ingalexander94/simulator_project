class UserTeamPhotoModel {
  constructor(db) {
    this._db = db;
  }

  create = async (tp_user_team, tp_photo) => {
    try {
      const [id_team_photo] = await this._db
        .insert(
          {
            tp_user_team: tp_user_team,
            tp_photo,
          },
          ["id_team_photo"]
        )
        .into("mp_team_photo");
      return id_team_photo;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = UserTeamPhotoModel;
