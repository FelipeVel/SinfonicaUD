const utilities = require("../config/utilities");
const controller = {};

controller.getInstrumentos = async (req, res) => {
  console.log("GET /instrumentos - Obteniendo todos los instrumentos");
  const query = "SELECT * FROM INSTRUMENTO";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getInstrumento = async (req, res) => {
  console.log("GET /instrumentos/:id - Obteniendo un instrumento por su ID");
  const { id: IDINSTRUMENTO } = req.params;
  const query = `SELECT * FROM INSTRUMENTO WHERE IDINSTRUMENTO = ${IDINSTRUMENTO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.createInstrumento = async (req, res) => {
  console.log("POST /instrumentos - Guardando un instrumento");
  const { nombre, descripcion } = req.body;
  const query = `INSERT INTO INSTRUMENTO (NOMBRE, DESCRIPCION) VALUES ('${nombre}', '${descripcion}')`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Instrumento guardado" });
};

controller.updateInstrumento = async (req, res) => {
  console.log("PUT /instrumentos/:id - Actualizando un instrumento");
  const { id: IDINSTRUMENTO } = req.params;
  const { nombre, descripcion } = req.body;
  const query = `UPDATE INSTRUMENTO SET NOMBRE = '${nombre}', DESCRIPCION = '${descripcion}' WHERE IDINSTRUMENTO = ${IDINSTRUMENTO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Instrumento actualizado" });
};

controller.deleteInstrumento = async (req, res) => {
  console.log("DELETE /instrumentos/:id - Borrando un instrumento");
  const { id: IDINSTRUMENTO } = req.params;
  const query = `DELETE FROM INSTRUMENTO WHERE IDINSTRUMENTO = ${IDINSTRUMENTO}`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json({ message: "Instrumento borrado" });
};

module.exports = controller;
