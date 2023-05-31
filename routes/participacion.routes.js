const express = require('express');
const router = express.Router();
const participacionController = require('../controllers/participacion.controller');

/**
 * @openapi
 * /participaciones/{obra}:
 *   get:
 *     tags:
 *       - Participaciones
 *     summary: Obtener todas las participaciones de una obra
 *     parameters:
 *       - in: path
 *         name: obra
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID de la obra
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
 * /participaciones/lista/{obra}:
 *   get:
 *     tags:
 *       - Participaciones
 *     summary: Obtener la lista de participaciones de una obra
 *     parameters:
 *       - in: path
 *         name: obra
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID de la obra
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/ListaParticipacion'
 */

router.get('/lista/:obra', participacionController.getListaParticipacionbyObra);

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