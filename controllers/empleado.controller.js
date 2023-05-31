const utilities = require("../config/utilities");

const controller = {};

controller.getEmpleados = async (req, res) => {
  console.log("GET /empleados - Obteniendo todos los empleados");
  const query = "SELECT * FROM EMPLEADO";
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getEmpleado = async (req, res) => {
  console.log(
    "GET /empleados/:rolPk/:codUnidad/:codEmpleado - Obteniendo un empleado"
  );
  const {
    rolPk: ROL_PK,
    codUnidad: CODUNIDAD,
    codEmpleado: CODEMPLEADO,
  } = req.params;
  const query = `SELECT * FROM EMPLEADO WHERE ROL_PK = ${ROL_PK} AND CODUNIDAD = '${CODUNIDAD}' AND CODEMPLEADO = '${CODEMPLEADO}'`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.createEmpleado = async (req, res) => {
    console.log("POST /empleados - Creando un empleado");
    const {
        ROL_PK,
        CODUNIDAD,
        CODEMPLEADO,
        NOMBRE,
        APELLIDO,
        CEDULA,
        CELULAR,
        CORREO
    } = req.body;
    const query = `INSERT INTO EMPLEADO (ROL_PK, CODUNIDAD, CODEMPLEADO, NOMBRE, APELLIDO, CEDULA, CELULAR, CORREO) VALUES (${ROL_PK}, '${CODUNIDAD}', '${CODEMPLEADO}', '${NOMBRE}', '${APELLIDO}', '${CEDULA}', '${CELULAR}', '${CORREO}')`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
        res.status(500).json(response);
        return;
    }
    res.json(response);
};

controller.updateEmpleado = async (req, res) => {
    console.log("PUT /empleados/:rolPk/:codUnidad/:codEmpleado - Actualizando un empleado");
    const {
        rolPk: ROL_PK,
        codUnidad: CODUNIDAD,
        codEmpleado: CODEMPLEADO
    } = req.params;
    const {
        NOMBRE,
        APELLIDO,
        CEDULA,
        CELULAR,
        CORREO
    } = req.body;
    const updateString = [];
    if (NOMBRE) {
        updateString.push(`NOMBRE = '${NOMBRE}'`);
    }
    if (APELLIDO) {
        updateString.push(`APELLIDO = '${APELLIDO}'`);
    }
    if (CEDULA) {
        updateString.push(`CEDULA = '${CEDULA}'`);
    }
    if (CELULAR) {
        updateString.push(`CELULAR = '${CELULAR}'`);
    }
    if (CORREO) {
        updateString.push(`CORREO = '${CORREO}'`);
    }
    if (updateString.length === 0) {
        res.status(400).json({ response: "No se ha especificado ningún campo para actualizar" });
        return;
    }
    const query = `UPDATE EMPLEADO SET ${updateString.join(", ")} WHERE ROL_PK = ${ROL_PK} AND CODUNIDAD = '${CODUNIDAD}' AND CODEMPLEADO = '${CODEMPLEADO}'`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
        res.status(500).json(response);
        return;
    }
    res.json(response);
}

controller.deleteEmpleado = async (req, res) => {
    console.log("DELETE /empleados/:rolPk/:codUnidad/:codEmpleado - Eliminando un empleado");
    const {
        rolPk: ROL_PK,
        codUnidad: CODUNIDAD,
        codEmpleado: CODEMPLEADO
    } = req.params;
    const query = `DELETE FROM EMPLEADO WHERE ROL_PK = ${ROL_PK} AND CODUNIDAD = ${CODUNIDAD} AND CODEMPLEADO = ${CODEMPLEADO}`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
        res.status(500).json(response);
        return;
    }
    res.json(response);
}

module.exports = controller;