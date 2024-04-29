const express = require('express');

const router = express.Router();

router.use('/band', require('../controllers/band.controller'));

module.exports = router;