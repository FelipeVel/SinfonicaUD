const utilities = require("../config/utilities");

const controller = {};

controller.getObras = async (req, res) => {
  console.log("GET /obras - Obteniendo todas las obras");
  const query = "SELECT * FROM OBRA";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getObra = async (req, res) => {
  console.log("GET /obras/:id - Obteniendo obra por id");
  const { id: IDOBRA } = req.params;
  const query = `SELECT * FROM OBRA WHERE IDOBRA = ${IDOBRA}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.saveObra = async (req, res) => {
  console.log("POST /obras - Guardando obra");
  const { nombre, descripcion, idTipoObra, idTipoCalen } = req.body;
  const lastRowId = await utilities.executeQuery(
    "SELECT MAX(IDOBRA) AS IDOBRA FROM OBRA"
  );
  if (lastRowId.error) {
    res.status(500).json(lastRowId);
    return;
  }
  let { IDOBRA } = lastRowId;
  IDOBRA++;
  const query = `INSERT INTO OBRA (IDOBRA, NOMBRE, DESCRIPCION, IDTIPOOBRA, IDTIPOCALEN) VALUES (${IDOBRA}, '${nombre}', '${descripcion}', '${idTipoObra}', '${idTipoCalen}')`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Obra guardada" });
};

controller.updateObra = async (req, res) => {
  console.log("PUT /obras/:id - Actualizando obra");
  const { id: IDOBRA } = req.params;
  const { nombre, descripcion, idTipoObra, idTipoCalen } = req.body;
  const query = `UPDATE OBRA SET NOMBRE = '${nombre}', DESCRIPCION = '${descripcion}', IDTIPOOBRA = '${idTipoObra}', IDTIPOCALEN = '${idTipoCalen}' WHERE IDOBRA = ${IDOBRA}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Obra actualizada" });
};

controller.deleteObra = async (req, res) => {
  console.log("DELETE /obras/:id - Borrando obra");
  const { id: IDOBRA } = req.params;
  const query = `DELETE FROM OBRA WHERE IDOBRA = ${IDOBRA}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Obra eliminada" });
};

module.exports = controller;