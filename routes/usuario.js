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
    const users = await prisma.usuario.findMany();
    console.log(users);
    res.json(users);
  } catch (error) {
    res.status(404).json({
      message: "Resource not found",
    });
  }
});

// Por algum motivo preciso usar usuario.findFirst() aqui ao invés de findUnique... Pesquisar na documentação depois.
router.get("/:userId", async (req, res) => {
  const { userId } = req.params;
  try {
    const user = await prisma.usuario.findUnique({
      where: {
        id: Number(userId)
      }
    });
    res.json(user);
  } catch (error) {
    console.log(error);
    res.status(404).json({
      message: "Resource not found",
      error,
    });
  }
});

export default router;
