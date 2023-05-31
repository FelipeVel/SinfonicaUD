const utilities = require("../config/utilities");
const controller = {};

controller.getLiquidacionesViaticos = async (req, res) => {
  console.log(
    "GET /liquidaciones/viaticos - Obteniendo todas las liquidaciones de viaticos"
  );
  const { periodo: IDPERIODO } = req.params;
  const query = `SELECT P.IDPERIODO, E.NOMBRE, E.APELLIDO, E.CEDULA, E.CODUNIDAD, U.NOMUNIDAD, L.NOHORAS 
                FROM PERIODO P, OBRA O, PERSONALOBRA PO, LABORPERSONALOBRA LPO, UNIDAD U, EMPLEADO E 
                WHERE P.IDPERIODO = ${IDPERIODO} 
                    AND P.IDPERIODO = O.IDPERIODO 
                    AND O.IDOBRA = PO.IDOBRA 
                    AND PO.IDPERSONALOBRA = LPO.IDPERSONALOBRA 
                    AND PO.CODEMPLEADO = E.CODEMPLEADO 
                    AND E.CODUNIDAD = U.CODUNIDAD`;
  const response = await utilities.executeQuery(query);
  if (response.error) {
    res.status(500).json(response);
    return;
  }
  res.json(response);
};

controller.getLiquidacionesElectivas = async (req, res) => {
    console.log("GET /liquidaciones/electivas - Obteniendo lista de estudiantes con horas asistidas");
    const query = `SELECT CODESTUDIANTE, COUNT(CONSECASIS) HORASASISTIDAS FROM PARTICIPACIONESTUDIANTE GROUP BY CODESTUDIANTE`;
    const response = await utilities.executeQuery(query);
    if (response.error) {
        res.status(500).json(response);
        return;
        }
    res.json(response);
};

module.exports = controller;