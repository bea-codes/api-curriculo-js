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
    const user = await prisma.usuario.create()
  } catch (error) {
    
  }
 })

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

router.get("/:userID", async (req, res ) => {
  try {
    const { id } = req.params;
    const user = prisma.usuario.findUnique({
      where: {
        id: Number(id),
      },
    });
  } catch (error) {
    res.status(404).json({
      message: "Resource not found",
    });
  }
});

export default router;
