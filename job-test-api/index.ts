import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import { dbCom } from './src/shared/db.util'; 
import { UsersRoute } from './src/routes/users';

const app = express();
const PORT = 3001;

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());

app.use('/api/users', UsersRoute);

app.get('/api', (req, res) => {
  res.send('Hello, World!');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
