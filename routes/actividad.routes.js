const express = require('express');
const router = express.Router();
const actividadController = require('../controllers/actividad.controller');

router.get('/', actividadController.getActividades);
router.get('/:idPeriodo/:codActividad', actividadController.getActividad);
router.get('/mes/:mes', actividadController.getActividadesbyMes);
router.post('/', actividadController.createActividad);
router.put('/:idPeriodo/:codActividad', actividadController.updateActividad);
router.delete('/:idPeriodo/:codActividad', actividadController.deleteActividad);

module.exports = router;