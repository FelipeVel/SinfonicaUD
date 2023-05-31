const express = require("express");
const router = express.Router();
const estudianteController = require("../controllers/estudiante.controller");

/**
 * @openapi
 * /estudiantes:
 *   get:
 *     tags:
 *       - Estudiantes
 *     summary: Obtener todos los estudiantes
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Estudiante'
 */

router.get("/", estudianteController.getEstudiantes);

/**
 * @openapi
 * /estudiantes/instrumento/{idInstrumento}:
 *   get:
 *     tags:
 *       - Estudiantes
 *     summary: Obtener todos los estudiantes por instrumento
 *     parameters:
 *       - in: path
 *         name: idInstrumento
 *         schema:
 *           type: string
 *         required: true
 *         description: Instrumento del estudiante
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Estudiante'
 */

router.get(
  "/instrumento/:idInstrumento",
  estudianteController.getEstudiantesbyInstrumento
);

/**
 * @openapi
 * /estudiantes/{codEstudiante}:
 *   get:
 *     tags:
 *       - Estudiantes
 *     summary: Obteniendo un estudiante por codEstudiante
 *     parameters:
 *       - in: path
 *         name: codEstudiante
 *         schema:
 *           type: integer
 *         required: true
 *         description: Código del estudiante
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Estudiante'
 */

router.get("/:codEstudiante", estudianteController.getEstudiante);

/**
 * @openapi
 * /estudiantes:
 *   post:
 *     tags:
 *       - Estudiantes
 *     summary: Crear un estudiante
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Estudiante'
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

router.post("/", estudianteController.createEstudiante);

/**
 * @openapi
 * /estudiantes/{codEstudiante}:
 *   put:
 *     tags:
 *       - Estudiantes
 *     summary: Actualizar un estudiante por codEstudiante
 *     parameters:
 *       - in: path
 *         name: codEstudiante
 *         schema:
 *           type: integer
 *         required: true
 *         description: Código del estudiante
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Estudiante'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Estudiante'
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       409:
 *         description: Conflict
 *       500:
 *         description: Internal Server Error
 */

router.put("/:codEstudiante", estudianteController.updateEstudiante);

/**
 * @openapi
 * /estudiantes/{codEstudiante}:
 *   delete:
 *     tags:
 *       - Estudiantes
 *     summary: Eliminar un estudiante por codEstudiante
 *     parameters:
 *       - in: path
 *         name: codEstudiante
 *         schema:
 *           type: integer
 *         required: true
 *         description: Código del estudiante
 *     responses:
 *       200:
 *         description: OK
 *       400:
 *         description: Bad Request
 *       404:
 *         description: Not Found
 *       409:
 *         description: Conflict
 *       500:
 *         description: Internal Server Error
 */

router.delete("/:codEstudiante", estudianteController.deleteEstudiante);

module.exports = router;
