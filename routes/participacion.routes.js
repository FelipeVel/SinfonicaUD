const express = require('express');
const router = express.Router();
const participacionController = require('../controllers/participacion.controller');

router.get('/:obra', participacionController.getParticipacionesbyObra);
router.post('/', participacionController.saveListaParticipacion);

module.exports = router;