const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;


const dataSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    type: {
        type: String,
        required: true,
    },
});

const DataModel = db.model('data', dataSchema);

module.exports = DataModel;

