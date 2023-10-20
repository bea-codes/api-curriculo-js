/*
  Warnings:

  - You are about to drop the `_CurriculoToExperiencia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CurriculoToFormacao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CurriculoToHardSkill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CurriculoToSoftSkil` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[curriculoId]` on the table `Experiencia` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[curriculoId]` on the table `Formacao` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[curriculoId]` on the table `HardSkill` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[curriculoId]` on the table `Lingua` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[curriculoId]` on the table `SoftSkil` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `curriculoId` to the `Experiencia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `curriculoId` to the `Formacao` table without a default value. This is not possible if the table is not empty.
  - Added the required column `curriculoId` to the `HardSkill` table without a default value. This is not possible if the table is not empty.
  - Added the required column `curriculoId` to the `Lingua` table without a default value. This is not possible if the table is not empty.
  - Added the required column `curriculoId` to the `SoftSkil` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_CurriculoToExperiencia" DROP CONSTRAINT "_CurriculoToExperiencia_A_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToExperiencia" DROP CONSTRAINT "_CurriculoToExperiencia_B_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToFormacao" DROP CONSTRAINT "_CurriculoToFormacao_A_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToFormacao" DROP CONSTRAINT "_CurriculoToFormacao_B_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToHardSkill" DROP CONSTRAINT "_CurriculoToHardSkill_A_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToHardSkill" DROP CONSTRAINT "_CurriculoToHardSkill_B_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToSoftSkil" DROP CONSTRAINT "_CurriculoToSoftSkil_A_fkey";

-- DropForeignKey
ALTER TABLE "_CurriculoToSoftSkil" DROP CONSTRAINT "_CurriculoToSoftSkil_B_fkey";

-- AlterTable
ALTER TABLE "Experiencia" ADD COLUMN     "curriculoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Formacao" ADD COLUMN     "curriculoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "HardSkill" ADD COLUMN     "curriculoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Lingua" ADD COLUMN     "curriculoId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "SoftSkil" ADD COLUMN     "curriculoId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_CurriculoToExperiencia";

-- DropTable
DROP TABLE "_CurriculoToFormacao";

-- DropTable
DROP TABLE "_CurriculoToHardSkill";

-- DropTable
DROP TABLE "_CurriculoToSoftSkil";

-- CreateIndex
CREATE UNIQUE INDEX "Experiencia_curriculoId_key" ON "Experiencia"("curriculoId");

-- CreateIndex
CREATE UNIQUE INDEX "Formacao_curriculoId_key" ON "Formacao"("curriculoId");

-- CreateIndex
CREATE UNIQUE INDEX "HardSkill_curriculoId_key" ON "HardSkill"("curriculoId");

-- CreateIndex
CREATE UNIQUE INDEX "Lingua_curriculoId_key" ON "Lingua"("curriculoId");

-- CreateIndex
CREATE UNIQUE INDEX "SoftSkil_curriculoId_key" ON "SoftSkil"("curriculoId");

-- AddForeignKey
ALTER TABLE "Experiencia" ADD CONSTRAINT "Experiencia_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Formacao" ADD CONSTRAINT "Formacao_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HardSkill" ADD CONSTRAINT "HardSkill_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SoftSkil" ADD CONSTRAINT "SoftSkil_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lingua" ADD CONSTRAINT "Lingua_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
