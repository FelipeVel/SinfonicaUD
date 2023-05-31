const utilities = require("../config/utilities");
const controller = {};

controller.getParticipacionesbyObra = async (req, res) => {
  console.log(
    "GET /participaciones/:obra - Obteniendo todas las participaciones de una obra"
  );
  const { obra: OBRA } = req.params;
  const query = `SELECT * FROM PARTICIPACIONESTUDIANTE WHERE IDOBRA = ${OBRA}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getListaParticipacionbyObra = async (req, res) => {
  console.log(
    "GET /participaciones/lista/:obra - Obteniendo la lista de participaciones de una obra"
  );
  const { obra: OBRA } = req.params;
  const query = `SELECT E.CODESTUDIANTE, E.NOMBRE, E.APELLIDO FROM ESTUDIANTE E, CONVOCATORIAESTUDIANTE C, OBRA O WHERE E.CODESTUDIANTE = C.CODESTUDIANTE AND C.IDOBRA = O.IDOBRA AND O.IDOBRA = ${OBRA}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.saveListaParticipacion = async (req, res) => {
  console.log("POST /participaciones - Guardando la lista de participaciones");
  const { idEstudiantes, idObra, idTipoCalen, conseCalendario } = req.body;
  if (idEstudiantes.length === 0) {
    res.status(400).json({ error: "No se han enviado participaciones" });
    return;
  }
  idEstudiantes.forEach(async (estudiante) => {
    const query = `INSERT INTO PARTICIPACIONESTUDIANTE (CODESTUDIANTE, IDOBRA, IDTIPOCALEN, CONSECALENDARIO) VALUES (${estudiante}, ${idObra}, ${idTipoCalen}, ${conseCalendario})`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
      res.status(500).json(response);
      return;
    }
  });
};

module.exports = controller;
