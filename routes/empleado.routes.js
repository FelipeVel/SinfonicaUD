const express = require("express");
const router = express.Router();
const empleadoController = require('../controllers/empleado.controller');

/**
 * @openapi
 * /empleados:
 *   get:
 *     tags:
 *       - Empleados
 *     summary: Obtener todos los empleados
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Empleado'
 */

router.get('/', empleadoController.getEmpleados);

/**
 * @openapi
 * /empleados/{rolPk}/{codUnidad}/{codEmpleado}:
 *   get:
 *     tags:
 *       - Empleados
 *     summary: Obteniendo un empleado por rolPk, codUnidad y codEmpleado
 *     parameters:
 *       - in: path
 *         name: rolPk
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del rol
 *       - in: path
 *         name: codUnidad
 *         schema:
 *           type: string
 *         required: true
 *         description: Código de la unidad
 *       - in: path
 *         name: codEmpleado
 *         schema:
 *           type: string
 *         required: true
 *         description: Código del empleado
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Empleado'
 */

router.get('/:rolPk/:codUnidad/:codEmpleado', empleadoController.getEmpleado);

/**
 * @openapi
 * /empleados:
 *   post:
 *     tags:
 *       - Empleados
 *     summary: Creando un nuevo empleado
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Empleado'
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

router.post('/', empleadoController.createEmpleado);

/**
 * @openapi
 * /empleados/{rolPk}/{codUnidad}/{codEmpleado}:
 *   put:
 *     tags:
 *       - Empleados
 *     summary: Actualizando un empleado por rolPk, codUnidad y codEmpleado
 *     parameters:
 *       - in: path
 *         name: rolPk
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del rol
 *       - in: path
 *         name: codUnidad
 *         schema:
 *           type: string
 *         required: true
 *         description: Código de la unidad
 *       - in: path
 *         name: codEmpleado
 *         schema:
 *           type: string
 *         required: true
 *         description: Código del empleado
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Empleado'
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Empleado'
 *       400:
 *         description: Bad Request
 *       500:
 *         description: Error interno
 */

router.put('/:rolPk/:codUnidad/:codEmpleado', empleadoController.updateEmpleado);

/**
 * @openapi
 * /empleados/{rolPk}/{codUnidad}/{codEmpleado}:
 *   delete:
 *     tags:
 *       - Empleados
 *     summary: Eliminando un empleado por rolPk, codUnidad y codEmpleado
 *     parameters:
 *       - in: path
 *         name: rolPk
 *         schema:
 *           type: integer
 *         required: true
 *         description: ID del rol
 *       - in: path
 *         name: codUnidad
 *         schema:
 *           type: string
 *         required: true
 *         description: Código de la unidad
 *       - in: path
 *         name: codEmpleado
 *         schema:
 *           type: string
 *         required: true
 *         description: Código del empleado
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Empleado'
 *       400:
 *         description: Bad Request
 *       500:
 *         description: Error interno
 */

router.delete('/:rolPk/:codUnidad/:codEmpleado', empleadoController.deleteEmpleado);

module.exports = router;