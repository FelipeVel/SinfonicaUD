const express = require("express");
const router = express.Router();
const controller = require("../controllers/instrumento.controller");

/**
 * @openapi
 * /instrumentos:
 *   get:
 *     tags:
 *       - Instrumentos
 *     summary: Obtener todos los instrumentos
 *     description: Obtener todos los instrumentos
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Instrumento'
 *       500:
 *         description: Error en el servidor
 */

router.get("/", controller.getInstrumentos);

/**
 * @openapi
 * /instrumentos/{id}:
 *   get:
 *     tags:
 *       - Instrumentos
 *     summary: Obtener un instrumento por su id
 *     description: Obtener un instrumento por su id
 *     parameters:
 *       - name: id
 *         description: ID del instrumento
 *         in: path
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Instrumento'
 *       500:
 *         description: Error en el servidor
 *       404:
 *         description: No se encontró el instrumento
 */

router.get("/:id", controller.getInstrumento);

/**
 * @openapi
 * /instrumentos:
 *   post:
 *     tags:
 *       - Instrumentos
 *     summary: Crear un instrumento
 *     description: Crear un instrumento
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Instrumento'
 *     responses:
 *       200:
 *         description: Instrumento creado
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 */

router.post("/", controller.createInstrumento);

/**
 * @openapi
 * /instrumentos/{id}:
 *   put:
 *     tags:
 *       - Instrumentos
 *     summary: Actualizar un instrumento
 *     description: Actualizar un instrumento
 *     parameters:
 *       - name: id
 *         description: id del instrumento
 *         in: path
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Instrumento'
 *     responses:
 *       200:
 *         description: Instrumento actualizado
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 *       404:
 *         description: No se encontró el instrumento
 */

router.put("/:id", controller.updateInstrumento);

/**
 * @openapi
 * /instrumentos/{id}:
 *   delete:
 *     tags:
 *       - Instrumentos
 *     summary: Eliminar un instrumento
 *     description: Eliminar un instrumento
 *     parameters:
 *       - name: id
 *         description: id del instrumento
 *         in: path
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Instrumento eliminado
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/OkInsert'
 *       500:
 *         description: Error en el servidor
 */

router.delete("/:id", controller.deleteInstrumento);

module.exports = router;
