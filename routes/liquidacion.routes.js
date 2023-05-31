const express = require('express');
const router = express.Router();
const liquidacionController = require('../controllers/liquidacion.controller');

router.get('/viaticos/:periodo', liquidacionController.getLiquidacionesViaticos);
router.get('/electivas/', liquidacionController.getLiquidacionesElectivas);

module.exports = router;