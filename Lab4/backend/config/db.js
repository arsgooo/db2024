const mongoose = require('mongoose');

const mongoDB_Url = process.env.mongoDB_Url;

mongoose.connect(mongoDB_Url);
mongoose.connection.on('connected', () => {
    console.log('Successfully connected!');
});
mongoose.connection.on('error', (err) => {
    console.log(err);
});