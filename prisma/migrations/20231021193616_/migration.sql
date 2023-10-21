-- DropForeignKey
ALTER TABLE "Curriculo" DROP CONSTRAINT "Curriculo_idDoUsuario_fkey";

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

-- AddForeignKey
ALTER TABLE "Curriculo" ADD CONSTRAINT "Curriculo_idDoUsuario_fkey" FOREIGN KEY ("idDoUsuario") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experiencia" ADD CONSTRAINT "Experiencia_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Formacao" ADD CONSTRAINT "Formacao_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HardSkill" ADD CONSTRAINT "HardSkill_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SoftSkill" ADD CONSTRAINT "SoftSkill_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lingua" ADD CONSTRAINT "Lingua_curriculoId_fkey" FOREIGN KEY ("curriculoId") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;
