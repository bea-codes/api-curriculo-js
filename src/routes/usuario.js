import { Router } from "express";
import prisma from "../../prisma/prisma.js";
import { Prisma } from "@prisma/client";

const router = Router();

/* 
Criar CRUD para essa entidade

CREATE  -> DONE
READ    -> all, específico | DONE
UPDATE  -> 
DELETE  -> DONE

*/

router.post("/", async (req, res) => {
  try {
    const { nome, email, senha } = req.body;
    const user = await prisma.usuario.create({
      data: {
        nome,
        email,
        senha,
      },
    });
    res.json(user);
  } catch (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      if (error.code == "P2002") {
        console.error("Um novo usuário não pode ser criado com este email");
        console.error(error.message);
        res.status(400).json({
          message: "Não foi possível criar um novo usuário",
        });
      }
    }
  }
});

router.post("/:userId/cv", async (req, res) => {
  try {
    const { userId } = req.params;
    const { experiencias, formacao } = req.body;
    const curriculo = await prisma.curriculo.create({
      data: {
        idDoUsuario: Number(userId),
        experiencias,
        formacao,
      },
    });

    res.status(200).json(curriculo);
  } catch (error) {
    console.error(error);
    res.status(400).json({
      message: "Não foi possível criar o CV",
      error: error.message,
    });
  }
});

router.get("/", async (req, res) => {
  try {
    const users = await prisma.usuario.findMany({
      include: { curriculo: true },
    });
    console.log(users);
    res.json(users);
  } catch (error) {
    res.status(404).json({
      message: "Resource not found",
    });
  }
});

//work on the findUniqueorThrow error handling
router.get("/:userId", async (req, res) => {
  const { userId } = req.params;
  try {
    const user = await prisma.usuario.findUniqueOrThrow({
      where: {
        id: Number(userId),
      },
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

// UPDATE - working...
router.put("/:userId/cv", async (req, res) => {
  const { userId } = req.params;
  const { curriculo } = req.body;

  try {
    const updatedUser = await prisma.curriculo.update({
      where: { idDoUsuario: Number(userId) },
      data: {
        curriculo,
      },
    });
    res.status(200).json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(404).json({
      message: "User not found or CV update failed",
      error: error.message,
    });
  }
});

router.delete("/:userId", async (req, res) => {
  const { userId } = req.params;
  try {
    const deletdUser = await prisma.usuario.delete({
      where: {
        id: Number(userId),
      },
    });
    res.json(deletdUser);
  } catch (error) {
    res.status(500).json({
      message: "Error on deletion",
      error,
    });
  }
});

router.delete("/:userId/cv", async (req, res) => {
  const { userId } = req.params;
  try {
    const curriculo = await prisma.curriculo.delete({
      where: { idDoUsuario: Number(userId) },
    });
    res.status(200).json(curriculo);
  } catch (error) {
    console.error(error);
    res.status(404).json({
      message: "Não foi possível excluir o curriculo",
      error: error.message,
    });
  }
});

export default router;
