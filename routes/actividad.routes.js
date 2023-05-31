const express = require("express");
const router = express.Router();
const actividadController = require("../controllers/actividad.controller");

/**
 * @openapi
 * /actividades:
 *   get:
 *     tags:
 *       - Actividades
 *     summary: Obtener todas las actividades
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                $ref: '#/components/schemas/Actividad'
 */
router.get("/", actividadController.getActividades);

/**
 * @openapi
 * /actividades/{idPeriodo}/{codActividad}:
 *   get:
 *     tags:
 *       - Actividades
 *     summary: Obteniendo una actividad por idPeriodo y codActividad
 *     parameters:
 *       - in: path
 *         name: idPeriodo
 *         schema:
 *           type: integer
 *           required: true
 *           description: ID del periodo
 *       - in: path
 *         name: codActividad
 *         schema:
 *           type: string
 *           required: true
 *           description: Código de la actividad
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Actividad'
 */
router.get("/:idPeriodo/:codActividad", actividadController.getActividad);

/**
 * @openapi
 * /actividades/mes/{mes}:
 *   get:
 *     tags:
 *       - Actividades
 *     summary: Obteniendo una actividad por mes
 *     parameters:
 *       - in: path
 *         name: mes
 *         schema:
 *           type: string
 *           required: true
 *           description: Mes de la actividad
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                $ref: '#/components/schemas/Actividad'
 */
router.get("/mes/:mes", actividadController.getActividadesbyMes);

/**
 * @openapi
 * /actividades:
 *   post:
 *     tags:
 *       - Actividades
 *     summary: Crear una actividad
 *     description: Crear una actividad
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actividad'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Actividad'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       500:
 *         description: Internal Server Error
 */
router.post("/", actividadController.createActividad);

/**
 * @openapi
 * /actividades/{idPeriodo}/{codActividad}:
 *   put:
 *     tags:
 *       - Actividades
 *     summary: Actualizar una actividad
 *     description: Actualizar una actividad
 *     parameters:
 *       - in: path
 *         name: idPeriodo
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del periodo
 *       - in: path
 *         name: codActividad
 *         schema:
 *           type: string
 *         required: true
 *         description: Código de la actividad
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actividad'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Actividad'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       500:
 *         description: Internal Server Error
 */
router.put("/:idPeriodo/:codActividad", actividadController.updateActividad);

/**
 * @openapi
 * /actividades/{idPeriodo}/{codActividad}:
 *   delete:
 *     tags:
 *       - Actividades
 *     summary: Eliminar una actividad
 *     description: Eliminar una actividad
 *     parameters:
 *       - in: path
 *         name: idPeriodo
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del periodo
 *       - in: path
 *         name: codActividad
 *         schema:
 *           type: string
 *         required: true
 *         description: Código de la actividad
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Actividad'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       500:
 *         description: Internal Server Error
 */
router.delete("/:idPeriodo/:codActividad", actividadController.deleteActividad);

module.exports = router;
