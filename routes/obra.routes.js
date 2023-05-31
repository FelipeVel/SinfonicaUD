const express = require('express');
const router = express.Router();
const controller = require('../controllers/obra.controller');

/**
 * @openapi
 * /obras:
 *   get:
 *     tags:
 *       - Obras
 *     summary: Obtener todas las obras
 *     description: Obtener todas las obras
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Obra'
 *       500:
 *         description: Error en el servidor
 */

router.get('/', controller.getObras);

/**
 * @openapi
 * /obras/{id}:
 *   get:
 *     tags:
 *       - Obras
 *     summary: Obtener una obra por su ID
 *     description: Obtener una obra por su ID
 *     parameters:
 *       - in: path
 *         name: id
 *         description: ID de la obra
 *         schema:
 *           type: integer
 *         required: true
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Obra'
 *       500:
 *         description: Error en el servidor
 */

router.get('/:id', controller.getObra);

/**
 * @openapi
 * /obras:
 *   post:
 *     tags:
 *       - Obras
 *     summary: Crear una obra
 *     description: Crear una obra
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Obra'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 */

router.post('/', controller.saveObra);

/**
 * @openapi
 * /obras/{id}:
 *   put:
 *     tags:
 *       - Obras
 *     summary: Actualizar una obra
 *     description: Actualizar una obra
 *     parameters:
 *       - in: path
 *         name: id
 *         description: ID de la obra
 *         schema:
 *           type: integer
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Obra'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 */

router.put('/:id', controller.updateObra);

/**
 * @openapi
 * /obras/{id}:
 *   delete:
 *     tags:
 *       - Obras
 *     summary: Eliminar una obra
 *     description: Eliminar una obra
 *     parameters:
 *       - in: path
 *         name: id
 *         description: ID de la obra
 *         schema:
 *           type: integer
 *         required: true
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 */

router.delete('/:id', controller.deleteObra);

module.exports = router;