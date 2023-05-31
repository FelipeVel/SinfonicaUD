const utilities = require("../config/utilities");

const controller = {};

controller.getCalendarios = async (req, res) => {
  console.log("GET /calendarios - Obteniendo todos los calendarios");
  const query = "SELECT * FROM CALENDARIO";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getCalendario = async (req, res) => {
  console.log("GET /calendarios/:idObra/:idTipoCalen/:conseCalendario - Obteniendo un calendario");
  const { idObra: IDOBRA, idTipoCalen:IDTIPOCALEN, conseCalendario:CONSECALENDARIO } = req.params;
  const query = `SELECT * FROM CALENDARIO WHERE IDOBRA = ${IDOBRA} AND IDTIPOCALEN = ${IDTIPOCALEN} AND CONSECALENDARIO = ${CONSECALENDARIO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.createCalendario = async (req, res) => {
  console.log("POST /calendarios - Creando un calendario");
  const { IDOBRA, IDTIPOCALEN, IDESTADO, FECHAINICIO, FECHAFIN } = req.body;
  const nextIdQuery = "SELECT MAX(CONSECALENDARIO) + 1 AS NEXTID FROM CALENDARIO";
  const nextIdResponse = await utilities.executeQuery(nextIdQuery);
  if (nextIdResponse.error) {
    res.status(500).json(nextIdResponse);
    return;
  }
  const nextId = nextIdResponse.NEXTID;
  const query = `INSERT INTO CALENDARIO (IDOBRA, IDTIPOCALEN, CONSECALENDARIO, IDESTADO, FECHAINICIO, FECHAFIN) VALUES (${IDOBRA}, ${IDTIPOCALEN}, ${nextId}, ${IDESTADO}, TO_DATE('${FECHAINICIO}','YYYY-MM-DD HH24:MI:SS'), TO_DATE('${FECHAFIN}','YYYY-MM-DD HH24:MI:SS'))`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.updateCalendario = async (req, res) => {
  console.log("PUT /calendarios/:idObra/:idTipoCalen/:conseCalendario - Actualizando un calendario");
  const { idObra:IDOBRA, idTipoCalen:IDTIPOCALEN, conseCalendario:CONSECALENDARIO } = req.params;
  const { IDESTADO, FECHAINICIO, FECHAFIN } = req.body;
  const updateString = [];
  if (IDESTADO) {
    updateString.push(`IDESTADO = ${IDESTADO}`);
  }
  if (FECHAINICIO) {
    updateString.push(`FECHAINICIO = '${FECHAINICIO}'`);
  }
  if (FECHAFIN) {
    updateString.push(`FECHAFIN = '${FECHAFIN}'`);
  }
  if (updateString.length === 0) {
    res.status(400).json({ response: "No se ha especificado ningún campo para actualizar" });
    return;
  }
  const query = `UPDATE CALENDARIO SET ${updateString.join(", ")} WHERE IDOBRA = ${IDOBRA} AND IDTIPOCALEN = ${IDTIPOCALEN} AND CONSECALENDARIO = ${CONSECALENDARIO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.deleteCalendario = async (req, res) => {
  console.log("DELETE /calendarios/:idObra/:idTipoCalen/:conseCalendario - Eliminando un calendario");
  const { idObra:IDOBRA, idTipoCalen:IDTIPOCALEN, conseCalendario:CONSECALENDARIO } = req.params;
  const query = `DELETE FROM CALENDARIO WHERE IDOBRA = ${IDOBRA} AND IDTIPOCALEN = ${IDTIPOCALEN} AND CONSECALENDARIO = ${CONSECALENDARIO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

module.exports = controller;
