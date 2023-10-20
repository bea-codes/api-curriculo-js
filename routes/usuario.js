import { Router } from "express";
import prisma from "../prisma/prisma.js";

const router = Router();

/* 
Criar CRUD para essa entidade

CREATE 
READ -> all, específico | DONE
UPDATE
DELETE

*/

router.post("/", async (req, res) => {
  try {
    const { nome, email, senha, curriculo } = req.body;
    const curriculoData = curriculo ? curriculo : {};
    // console.log(`isThereCurriculo?: ${curriculoData}`);
    // console.log(nome, email, senha, curriculo);
    const user = await prisma.usuario.create({
      data: {
        nome,
        email,
        senha,
        curriculo: curriculoData,
      },
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({
      message: "Internal server error",
    });
  }
});

router.get("/", async (req, res) => {
  try {
    const users = prisma.usuario.findMany();
    res.json(users);
  } catch (error) {
    res.status(404).json({
      message: "Resource not found",
    });
  }
});

router.get("/:userID", async (req, res) => {
  const { id } = req.params;
  try {
    const user = prisma.usuario.findUnique({
      where: {
        id: Number(id),
      },
    });
    res.json(user);
  } catch (error) {
    res.status(404).json({
      message: "Resource not found",
    });
  }
});

export default router;
