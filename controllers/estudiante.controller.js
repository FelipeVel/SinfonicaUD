const utilities = require("../config/utilities");
const controller = {};

controller.getEstudiantes = async (req, res) => {
  console.log("GET /estudiantes - Obteniendo todos los estudiantes");
  const query = "SELECT * FROM ESTUDIANTE";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getEstudiante = async (req, res) => {
  console.log("GET /estudiantes/:codEstudiante - Obteniendo un estudiante");
  const { codEstudiante: CODESTUDIANTE } = req.params;
  const query = `SELECT * FROM ESTUDIANTE WHERE CODESTUDIANTE = '${CODESTUDIANTE}'`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getEstudiantesbyInstrumento = async (req, res) => {
  console.log(
    "GET /estudiantes/instrumento/:idInstrumento - Obteniendo todos los estudiantes de un instrumento"
  );
  const { idInstrumento: INSTRUMENTO } = req.params;
  const query = `SELECT E.*, C.CALIFICACION FROM ESTUDIANTE E, CONVOCATORIAESTUDIANTE C, INSTRUMENTO I WHERE I.IDINSTRUMENTO = '${INSTRUMENTO}' AND I.IDINSTRUMENTO = C.IDINSTRUMENTO AND C.CODESTUDIANTE = E.CODESTUDIANTE ORDER BY C.CALIFICACION DESC`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.createEstudiante = async (req, res) => {
  console.log("POST /estudiantes - Creando un estudiante");
  const { CODESTUDIANTE, CODUNIDAD, NOMBRE, APELLIDO, FECHAINSCRIPCION, FECHANACIMIENTO, CORREO } = req.body;
  const query = `INSERT INTO ESTUDIANTE VALUES ('${CODESTUDIANTE}', '${CODUNIDAD}', '${NOMBRE}', '${APELLIDO}', TO_DATE('${FECHAINSCRIPCION}','YYYY-MM-DD HH24:MI:SS'), TO_DATE('${FECHANACIMIENTO}','YYYY-MM-DD HH24:MI:SS'), '${CORREO}')`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.updateEstudiante = async (req, res) => {
  console.log("PUT /estudiantes/:codEstudiante - Actualizando un estudiante");
  const { codEstudiante: CODESTUDIANTE } = req.params;
  const { CODUNIDAD, NOMBRE, APELLIDO, FECHAINSCRIPCION, FECHANACIMIENTO, CORREO } = req.body;
  const updateString = [];
  if (CODUNIDAD) updateString.push(`CODUNIDAD = '${CODUNIDAD}'`);
  if (NOMBRE) updateString.push(`NOMBRE = '${NOMBRE}'`);
  if (APELLIDO) updateString.push(`APELLIDO = '${APELLIDO}'`);
  if (FECHAINSCRIPCION) updateString.push(`FECHAINSCRIPCION = TO_DATE('${FECHAINSCRIPCION}','YYYY-MM-DD HH24:MI:SS')`);
  if (FECHANACIMIENTO) updateString.push(`FECHANACIMIENTO = TO_DATE('${FECHANACIMIENTO}','YYYY-MM-DD HH24:MI:SS')`);
  if (CORREO) updateString.push(`CORREO = '${CORREO}'`);
  const query = `UPDATE ESTUDIANTE SET ${updateString.join(", ")} WHERE CODESTUDIANTE = '${CODESTUDIANTE}'`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.deleteEstudiante = async (req, res) => {
  console.log("DELETE /estudiantes/:codEstudiante - Eliminando un estudiante");
  const { codEstudiante: CODESTUDIANTE } = req.params;
  const query = `DELETE FROM ESTUDIANTE WHERE CODESTUDIANTE = '${CODESTUDIANTE}'`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

module.exports = controller;