const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const bandSchema = new Schema({
    _id: { type: Schema.Types.ObjectId, auto: true },
    name: { type: String, required: true },
    year_formed: { type: Number, min: 1900, max: new Date().getFullYear(), required: true },
    country: { type: String, required: true },
    popular_song: { type: String, required: true },
    genre: { type: String, required: true },
    youngest_member_age: { type: Number, min: 16, max: 90 }
}, {
    versionKey: false
});

const band = mongoose.model('bands', bandSchema);
module.exports = band;
