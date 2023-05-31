const express = require('express');
const router = express.Router();
const calendarioController = require('../controllers/calendario.controller');

/**
 * @openapi
 * /calendarios:
 *   get:
 *     tags:
 *       - Calendarios
 *     summary: Obtener todos los calendarios
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Calendario'
 */

router.get('/', calendarioController.getCalendarios);

/**
 * @openapi
 * /calendarios/{idObra}/{idTipoCalen}/{conseCalendario}:
 *   get:
 *     tags:
 *       - Calendarios
 *     summary: Obteniendo un calendario por idObra, idTipoCalen y conseCalendario
 *     parameters:
 *       - in: path
 *         name: idObra
 *         schema:
 *           type: string
 *         required: true
 *         description: ID de la obra
 *       - in: path
 *         name: idTipoCalen
 *         schema:
 *           type: string
 *         required: true
 *         description: ID del tipo de calendario
 *       - in: path
 *         name: conseCalendario
 *         schema:
 *           type: integer
 *         required: true
 *         description: Conse del calendario
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Calendario'
 */

router.get('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.getCalendario);

/**
 * @openapi
 * /calendarios:
 *   post:
 *     tags:
 *       - Calendarios
 *     summary: Crear un calendario
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Calendario'
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
router.post('/', calendarioController.createCalendario);

/**
 * @openapi
 * /calendarios/{idObra}/{idTipoCalen}/{conseCalendario}:
 *   put:
 *     tags:
 *       - Calendarios
 *     summary: Actualizar un calendario por idObra, idTipoCalen y conseCalendario
 *     parameters:
 *       - in: path
 *         name: idObra
 *         schema:
 *           type: string
 *         required: true
 *         description: ID de la obra
 *       - in: path
 *         name: idTipoCalen
 *         schema:
 *           type: string
 *         required: true
 *         description: ID del tipo de calendario
 *       - in: path
 *         name: conseCalendario
 *         schema:
 *           type: integer
 *         required: true
 *         description: Conse del calendario
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Calendario'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Calendario'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       500:
 *         description: Internal Server Error
 */
router.put('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.updateCalendario);
router.delete('/:idObra/:idTipoCalen/:conseCalendario', calendarioController.deleteCalendario);

module.exports = router;