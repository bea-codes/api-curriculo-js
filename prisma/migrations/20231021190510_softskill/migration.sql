/*
  Warnings:

  - You are about to drop the `SoftSkil` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "SoftSkil" DROP CONSTRAINT "SoftSkil_curriculoId_fkey";

-- DropTable
DROP TABLE "SoftSkil";

-- CreateTable
CREATE TABLE "SoftSkill" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "curriculoId" INTEGER NOT NULL,

    CONSTRAINT "SoftSkill_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SoftSkill_curriculoId_key" ON "SoftSkill"("curriculoId");

-- AddForeignKey
ALTER TABLE "SoftSkill" ADD CONSTRAINT "SoftSkill_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
