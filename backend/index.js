const app = require("./app");
const db = require("./config/db");

const port = 3000;
const User = require("./models/user.model");

app.get('/users', async (req, res) => {
    try {
      const users = await User.find();
      res.json({ users });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
    });

app.listen(port,()=>{
    console.log(`Server Listening on Port http://localhost:${port}`);
})