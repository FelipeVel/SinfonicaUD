const oracledb = require("oracledb");
oracledb.autoCommit = true;
const utilities = {};

utilities.doRelease = (connection) => {
  connection.release(function (err) {
    if (err) {
      console.error(err.message);
    }
  });
};

utilities.connectionProperties = {
  user: process.env.DBUSER,
  password: process.env.DBPASSWORD,
  connectString: process.env.DBCONNECTIONSTRING,
};

utilities.executeQuery = async (query) => {
  console.log("--------------------------------------------------");
  console.log("Conectando a la base de datos");
  let connection;
  try {
    connection = await oracledb.getConnection(utilities.connectionProperties);
    console.log("Conectado a la base de datos");
    console.log("Ejecutando query: ", query);
    const result = await connection.execute(
      query,
      {},
      { outFormat: oracledb.OUT_FORMAT_OBJECT }
    );
    console.log("Resultados obtenidos de la BD: ", result);
    console.log("Desconectando de la base de datos");
    await utilities.doRelease(connection);
    console.log("--------------------------------------------------\n");
    return result.rows ? 
      result.rows.length !== 1 ? 
        result.rows 
        : result.rows[0] 
    : {...result, response: "OK"};
  } catch (err) {
    console.error("Error ejecutando el query: ", err.message);
    console.log("--------------------------------------------------\n");
    if (connection) {
      await utilities.doRelease(connection);
    }
    return {
      response: "Error ejecutando el query",
      error: err.message,
    };
  }
};

module.exports = utilities;
