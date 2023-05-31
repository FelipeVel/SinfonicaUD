const express = require('express');
const router = express.Router();
const liquidacionController = require('../controllers/liquidacion.controller');

/**
 * @openapi
 * /liquidaciones/{periodo}:
 *   get:
 *     tags:
 *       - Liquidaciones
 *     summary: Obtener todas las liquidaciones por periodo
 *     parameters:
 *       - in: path
 *         name: periodo
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del periodo
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/LiquidacionViaticos'
 */

router.get('/viaticos/:periodo', liquidacionController.getLiquidacionesViaticos);

/**
 * @openapi
 * /liquidaciones/{periodo}:
 *   get:
 *     tags:
 *       - Liquidaciones
 *     summary: Obtener todas las liquidaciones por periodo
 *     parameters:
 *       - in: path
 *         name: periodo
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del periodo
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/LiquidacionElectivas'
 */
router.get('/electivas/', liquidacionController.getLiquidacionesElectivas);

module.exports = router;