-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Endereco" (
    "id" SERIAL NOT NULL,
    "idDoUsuario" INTEGER NOT NULL,
    "CEP" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "logradouro" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Curriculo" (
    "id" SERIAL NOT NULL,
    "idDoUsuario" INTEGER NOT NULL,

    CONSTRAINT "Curriculo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experiencia" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "inicio" TIMESTAMP(3) NOT NULL,
    "fim" TIMESTAMP(3) NOT NULL,
    "empresa" TEXT NOT NULL,

    CONSTRAINT "Experiencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Formacao" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "inicio" TIMESTAMP(3) NOT NULL,
    "fim" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Formacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HardSkill" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,

    CONSTRAINT "HardSkill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SoftSkil" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,

    CONSTRAINT "SoftSkil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Lingua" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "fluencia" TEXT NOT NULL,

    CONSTRAINT "Lingua_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CurriculoToExperiencia" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CurriculoToFormacao" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CurriculoToHardSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CurriculoToSoftSkil" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_idDoUsuario_key" ON "Endereco"("idDoUsuario");

-- CreateIndex
CREATE UNIQUE INDEX "Curriculo_idDoUsuario_key" ON "Curriculo"("idDoUsuario");

-- CreateIndex
CREATE UNIQUE INDEX "_CurriculoToExperiencia_AB_unique" ON "_CurriculoToExperiencia"("A", "B");

-- CreateIndex
CREATE INDEX "_CurriculoToExperiencia_B_index" ON "_CurriculoToExperiencia"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CurriculoToFormacao_AB_unique" ON "_CurriculoToFormacao"("A", "B");

-- CreateIndex
CREATE INDEX "_CurriculoToFormacao_B_index" ON "_CurriculoToFormacao"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CurriculoToHardSkill_AB_unique" ON "_CurriculoToHardSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_CurriculoToHardSkill_B_index" ON "_CurriculoToHardSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CurriculoToSoftSkil_AB_unique" ON "_CurriculoToSoftSkil"("A", "B");

-- CreateIndex
CREATE INDEX "_CurriculoToSoftSkil_B_index" ON "_CurriculoToSoftSkil"("B");

-- AddForeignKey
ALTER TABLE "Endereco" ADD CONSTRAINT "Endereco_idDoUsuario_fkey" FOREIGN KEY ("idDoUsuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Curriculo" ADD CONSTRAINT "Curriculo_idDoUsuario_fkey" FOREIGN KEY ("idDoUsuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToExperiencia" ADD CONSTRAINT "_CurriculoToExperiencia_A_fkey" FOREIGN KEY ("A") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToExperiencia" ADD CONSTRAINT "_CurriculoToExperiencia_B_fkey" FOREIGN KEY ("B") REFERENCES "Experiencia"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToFormacao" ADD CONSTRAINT "_CurriculoToFormacao_A_fkey" FOREIGN KEY ("A") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToFormacao" ADD CONSTRAINT "_CurriculoToFormacao_B_fkey" FOREIGN KEY ("B") REFERENCES "Formacao"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToHardSkill" ADD CONSTRAINT "_CurriculoToHardSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToHardSkill" ADD CONSTRAINT "_CurriculoToHardSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "HardSkill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToSoftSkil" ADD CONSTRAINT "_CurriculoToSoftSkil_A_fkey" FOREIGN KEY ("A") REFERENCES "Curriculo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CurriculoToSoftSkil" ADD CONSTRAINT "_CurriculoToSoftSkil_B_fkey" FOREIGN KEY ("B") REFERENCES "SoftSkil"("id") ON DELETE CASCADE ON UPDATE CASCADE;
