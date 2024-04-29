const express = require('express'),
    httpStatusCodes = require('http-status-codes'),
    router = express.Router();

const band = require('../models/band.model');

router.get('/', async (request, response) => {
    try {
        const docs = await band.find();
        response.send(docs);
    } catch (err) {
        response.status(httpStatusCodes.StatusCodes.INTERNAL_SERVER_ERROR).send(err);
    }
});

router.get('/:id', async (request, response) => {
    try {
        const id = request.params.id;
        const docs = await band.findById(id);
        if (!docs) {
            response.status(httpStatusCodes.StatusCodes.NOT_FOUND).send({ message: `Document with ID ${id} not found!` });
        } else {
            response.send(docs);
        }
    } catch (err) {
        response.status(httpStatusCodes.StatusCodes.INTERNAL_SERVER_ERROR).send(err);
    }
});

router.post('/', async (request, response) => {
    try {
        const obj = request.body;
        const doc = await band.create(obj);
        response.status(httpStatusCodes.StatusCodes.CREATED).send(doc);
    } catch (err) {
        response.status(httpStatusCodes.StatusCodes.INTERNAL_SERVER_ERROR).send(err);
    }
});

router.put('/:id', async (request, response) => {
    try {
        let id = request.params.id;
        const obj = request.body;

        const existingBand = await band.findById(id);
        if (!existingBand) {
            return response.status(httpStatusCodes.StatusCodes.NOT_FOUND).send({ message: `Document with ID ${id} not found!` });
        }

        const updatedBand = await band.findByIdAndUpdate(id, {
            name: obj.name, 
            year_formed: obj.year_formed, 
            country: obj.country,
            popular_song: obj.popular_song,
            genre: obj.genre,
            youngest_member_age: obj.youngest_member_age
        }, { new: true });

        response.status(httpStatusCodes.StatusCodes.OK).send(updatedBand);
    } catch (err) {
        response.status(httpStatusCodes.StatusCodes.INTERNAL_SERVER_ERROR).send(err);
    }
});

router.delete('/:id', async (request, response) => {
    try {
        let id = request.params.id;

        const existingBand = await band.findById(id);
        if (!existingBand) {
            return response.status(httpStatusCodes.StatusCodes.NOT_FOUND).send({ message: `Document with ID ${id} not found!` });
        }

        await band.findByIdAndDelete(id);

        response.status(httpStatusCodes.StatusCodes.OK).send({ message: `Document with ID ${id} successfully deleted!` });
    } catch(err) {
        response.status(httpStatusCodes.StatusCodes.INTERNAL_SERVER_ERROR).send(err);
    }
});

module.exports = router;