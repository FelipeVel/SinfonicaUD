const utilities = require("../config/utilities");
const controller = {};

controller.getParticipacionesbyObra = async (req, res) => {
  console.log(
    "GET /participaciones/:obra - Obteniendo todas las participaciones de una obra"
  );
  const { obra: IDOBRA } = req.params;
  const query = `SELECT IDOBRA, CONSECALENDARIO, CODESTUDIANTE, NOMBRE, APELLIDO, CORREO
  FROM (
    SELECT P.IDOBRA, P.CONSECALENDARIO, E.CODESTUDIANTE, E.NOMBRE, E.APELLIDO, E.CORREO, 
           ROW_NUMBER() OVER(PARTITION BY E.CODESTUDIANTE ORDER BY P.IDOBRA) AS RN
    FROM PARTICIPACIONESTUDIANTE P, ESTUDIANTE E
    WHERE P.CODESTUDIANTE = E.CODESTUDIANTE
      AND P.IDOBRA = ${IDOBRA}
  )
  WHERE RN = 1`;
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
  const lastRowId = await utilities.executeQuery(
    "SELECT MAX(CONSECASIS) AS CONSECASIS FROM PARTICIPACIONESTUDIANTE"
  );
  if (lastRowId.error) {
    res.status(500).json(lastRowId);
    return;
  }
  let { CONSECASIS } = lastRowId;
  idEstudiantes.forEach(async (estudiante) => {
    CONSECASIS++;
    const query = `INSERT INTO PARTICIPACIONESTUDIANTE (CONSECASIS, CODESTUDIANTE, IDOBRA, IDTIPOCALEN, CONSECALENDARIO) VALUES (${CONSECASIS}, '${estudiante}', '${idObra}', '${idTipoCalen}', ${conseCalendario})`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
      res.status(500).json(response);
      return;
    }
  });
  res.json({ message: "Participaciones guardadas" });
};

module.exports = controller;
