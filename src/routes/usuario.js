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
    const { nome, email, senha, curriculo } = req.body;
    const curriculoData = curriculo ? curriculo : {};
    const user = await prisma.usuario.create({
      data: {
        nome,
        email,
        senha,
        curriculo: {
          create: curriculoData,
        },
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
router.put("/:userId/curriculo", async (req, res) => {
  const { userId } = req.params;
  const { curriculo } = req.body;

  try {
    const updatedUser = await prisma.curriculo.update({
      where: { idDoUsuario: Number(userId) },
      data: { 
        curriculo
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

export default router;
