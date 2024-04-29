const express = require('express'); //importing express package
cors = require('cors');
const apiRoutes = require('./backend/routes/api.routes');

// Setup environment settings
require('dotenv').config();
// Database setting 
require('./backend/config/db')

const app = express();
app.use(cors());

app.use(express.json());
app.use('/api', apiRoutes);

const port = process.env.PORT;
app.listen(port, () =>{
    console.log(`Server is running at http://localhost:${port}`);
});