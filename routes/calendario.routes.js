const express = require('express');
const router = express.Router();
const calendarioController = require('../controllers/calendario.controller');

router.get('/', calendarioController.getCalendarios);
router.get('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.getCalendario);
router.post('/', calendarioController.createCalendario);
router.put('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.updateCalendario);
router.delete('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.deleteCalendario);

module.exports = router;