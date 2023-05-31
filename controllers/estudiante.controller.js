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

controller.createEstudiante = async (req, res) => {
  console.log("POST /estudiantes - Creando un estudiante");
  const { estudiante } = req.body;
  const query = `INSERT INTO ESTUDIANTE VALUES ('${estudiante.codEstudiante}', '${estudiante.nombre}', '${estudiante.apellido}', '${estudiante.cedula}', '${estudiante.telefono}', '${estudiante.correo}', '${estudiante.direccion}', '${estudiante.fechaNacimiento}', '${estudiante.genero}', '${estudiante.tipoEstudiante}', '${estudiante.estado}', '${estudiante.idInstrumento}')`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({
    message: "Estudiante creado exitosamente",
    content: estudiante,
  });
};

controller.updateEstudiante = async (req, res) => {
  console.log("PUT /estudiantes/:codEstudiante - Actualizando un estudiante");
  const { codEstudiante: CODESTUDIANTE } = req.params;
  const { estudiante } = req.body;
  const query = `UPDATE ESTUDIANTE SET NOMBRE = '${estudiante.nombre}', APELLIDO = '${estudiante.apellido}', CEDULA = '${estudiante.cedula}', TELEFONO = '${estudiante.telefono}', CORREO = '${estudiante.correo}', DIRECCION = '${estudiante.direccion}', FECHANACIMIENTO = '${estudiante.fechaNacimiento}', GENERO = '${estudiante.genero}', TIPOESTUDIANTE = '${estudiante.tipoEstudiante}', ESTADO = '${estudiante.estado}', IDINSTRUMENTO = '${estudiante.idInstrumento}' WHERE CODESTUDIANTE = '${CODESTUDIANTE}'`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({
    message: "Estudiante actualizado exitosamente",
    content: estudiante,
  });
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
  res.json({ 
    message: "Estudiante eliminado exitosamente",
    content: CODESTUDIANTE,
  });
};

module.exports = controller;