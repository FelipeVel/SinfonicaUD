const utilities = require("../config/utilities");
const controller = {};

controller.getActividades = async (req, res) => {
  console.log("GET /actividades - Obteniendo todas las actividades");
  const query = "SELECT * FROM LISTAACTIVIDADUD";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getActividad = async (req, res) => {
  console.log(
    "GET /actividades/:idPeriodo/:codActividad - Obteniendo una actividad"
  );
  const { idPeriodo: IDPERIODO, codActividad: CODACTIVIDAD } = req.params;
  const query = `SELECT * FROM LISTAACTIVIDADUD WHERE IDPERIODO = ${IDPERIODO} AND CODACTIVIDAD = ${CODACTIVIDAD}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getActividadesbyMes = async (req, res) => {
  console.log("GET /actividades/mes/:mes - Obteniendo actividades por mes");
  const { mes: MES } = req.params;
  const query = `SELECT A.*, O.IDOBRA, O.TITULO OBRA FROM LISTAACTIVIDADUD A, LABORPERSONALOBRA L, PERSONALOBRA P, OBRA O WHERE MONTH(P.FECHAINICIO) = ${MES} AND P.IDPERSONALOBRA = L.CONSCELABOR AND P.IDOBRA = O.IDOBRA AND L.CODACTIVIDAD = A.CODACTIVIDAD`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.createActividad = async (req, res) => {
  console.log("POST /actividades - Creando una actividad");
  const { IDPERIODO, CODACTIVIDAD, DESCACTIVIDAD, VALORHORA, MAXHORAS } =
    req.body;
  const query = `INSERT INTO LISTAACTIVIDADUD (IDPERIODO, CODACTIVIDAD, DESCACTIVIDAD, VALORHORA, MAXHORAS) VALUES (${IDPERIODO}, ${CODACTIVIDAD}, '${DESCACTIVIDAD}', ${VALORHORA}, ${MAXHORAS})`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.updateActividad = async (req, res) => {
  console.log(
    "PUT /actividades/:idPeriodo/:codActividad - Actualizando una actividad"
  );
  const { idPeriodo: IDPERIODO, codActividad: CODACTIVIDAD } = req.params;
  const { DESCACTIVIDAD, VALORHORA, MAXHORAS } = req.body;
  const updateString = [];
  if (DESCACTIVIDAD) {
    updateString.push(`DESCACTIVIDAD = '${DESCACTIVIDAD}'`);
  }
  if (VALORHORA) {
    updateString.push(`VALORHORA = ${VALORHORA}`);
  }
  if (MAXHORAS) {
    updateString.push(`MAXHORAS = ${MAXHORAS}`);
  }
  if (updateString.length === 0) {
    res
      .status(400)
      .json({ response: "No se ha especificado ningún campo para actualizar" });
    return;
  }
  const query = `UPDATE LISTAACTIVIDADUD SET ${updateString.join(
    ", "
  )} WHERE IDPERIODO = ${IDPERIODO} AND CODACTIVIDAD = ${CODACTIVIDAD}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.deleteActividad = async (req, res) => {
  console.log(
    "DELETE /actividades/:idPeriodo/:codActividad - Eliminando una actividad"
  );
  const { idPeriodo: IDPERIODO, codActividad: CODACTIVIDAD } = req.params;
  const query = `DELETE FROM LISTAACTIVIDADUD WHERE IDPERIODO = ${IDPERIODO} AND CODACTIVIDAD = ${CODACTIVIDAD}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

module.exports = controller;
