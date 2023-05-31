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
  const query = `SELECT E.*, C.CALIFICACION FROM ESTUDIANTE E, CONVOCATORIAESTUDIANTE C, INSTRUMENTO I WHERE I.INSTRUMENTO = '${INSTRUMENTO}' AND I.IDINSTRUMENTO = C.IDINSTRUMENTO AND C.CODESTUDIANTE = E.CODESTUDIANTE ORDER BY C.CALIFICACION DESC`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};
