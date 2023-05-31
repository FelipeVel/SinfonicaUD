const express = require("express");
const router = express.Router();
const empleadoController = require('../controllers/empleado.controller');

router.get('/', empleadoController.getEmpleados);
router.get('/:rolPk/:codUnidad/:codEmpleado', empleadoController.getEmpleado);
router.post('/', empleadoController.createEmpleado);
router.put('/:id', empleadoController.updateEmpleado);
router.delete('/:id', empleadoController.deleteEmpleado);

module.exports = router;