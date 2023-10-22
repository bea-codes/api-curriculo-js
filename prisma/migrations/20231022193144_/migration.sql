/*
  Warnings:

  - The `experiencias` column on the `Curriculo` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `formacao` column on the `Curriculo` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Curriculo" DROP COLUMN "experiencias",
ADD COLUMN     "experiencias" TEXT[],
DROP COLUMN "formacao",
ADD COLUMN     "formacao" TEXT[];
