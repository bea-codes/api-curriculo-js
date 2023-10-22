/*
  Warnings:

  - You are about to drop the `Experiencia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Formacao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `HardSkill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Lingua` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SoftSkill` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Experiencia" DROP CONSTRAINT "Experiencia_curriculoId_fkey";

-- DropForeignKey
ALTER TABLE "Formacao" DROP CONSTRAINT "Formacao_curriculoId_fkey";

-- DropForeignKey
ALTER TABLE "HardSkill" DROP CONSTRAINT "HardSkill_curriculoId_fkey";

-- DropForeignKey
ALTER TABLE "Lingua" DROP CONSTRAINT "Lingua_curriculoId_fkey";

-- DropForeignKey
ALTER TABLE "SoftSkill" DROP CONSTRAINT "SoftSkill_curriculoId_fkey";

-- AlterTable
ALTER TABLE "Curriculo" ADD COLUMN     "experiencias" TEXT,
ADD COLUMN     "formacao" TEXT;

-- DropTable
DROP TABLE "Experiencia";

-- DropTable
DROP TABLE "Formacao";

-- DropTable
DROP TABLE "HardSkill";

-- DropTable
DROP TABLE "Lingua";

-- DropTable
DROP TABLE "SoftSkill";
