import express from "express";
import cors from "cors";
import "dotenv/config";
import bodyParser from "body-parser";

import prisma from "./prisma/prisma.js";
import routes from "./routes/index.js";

const app = express();
const port = process.env.PORT || 8000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.use("/usuario", routes.usuario);

app.get("/", (req, res) => {
  res.send("Hello World");
});

app.listen(port, () => {
  console.log(`Servidor iniciado em http://localhost:${port}`);
});
