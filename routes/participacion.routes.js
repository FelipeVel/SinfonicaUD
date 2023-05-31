const express = require('express');
const router = express.Router();
const participacionController = require('../controllers/participacion.controller');

/**
 * @openapi
 * /participaciones:
 *   get:
 *     tags:
 *       - Participaciones
 *     summary: Obtener todas las participaciones
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/ParticipacionObra'
 */

router.get('/:obra', participacionController.getParticipacionesbyObra);

/**
 * @openapi
 * /participaciones:
 *   post:
 *     tags:
 *       - Participaciones
 *     summary: Reportar participación
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ListaParticipacion'
 *     responses:
 *       201:
 *         description: Created
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       409:
 *         description: Conflict
 *       500:
 *         description: Internal Server Error
 */


router.post('/', participacionController.saveListaParticipacion);

module.exports = router;