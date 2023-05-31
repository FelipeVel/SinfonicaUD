const express = require("express");
const router = express.Router();
const estudianteController = require('../controllers/estudiante.controller');

router.get('/', estudianteController.getEstudiantes);
router.get('/instrumento/:INSTRUMENTO', estudianteController.getEstudiantesbyInstrumento);
router.get('/:codEstudiante', estudianteController.getEstudiante);
router.post('/', estudianteController.createEstudiante);
router.put('/:codEstudiante', estudianteController.updateEstudiante);
router.delete('/:codEstudiante', estudianteController.deleteEstudiante);

module.exports = router;