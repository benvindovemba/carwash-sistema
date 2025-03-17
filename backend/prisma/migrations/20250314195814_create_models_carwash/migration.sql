-- CreateEnum
CREATE TYPE "Perfil" AS ENUM ('Admin', 'Funcionario', 'Gerente');

-- CreateEnum
CREATE TYPE "Selecionar" AS ENUM ('Rampa 1', 'Rampa 2', 'Rampa 3', 'Rampa 4', 'Vendas Loja');

-- CreateEnum
CREATE TYPE "Naturalidade" AS ENUM ('Caxito', 'Benguela', 'Cuíto', 'Cabinda', 'Menongue', 'Ndalatando', 'Sumbe', 'Ondijiva', 'Huambo', 'Lubango', 'Luanda', 'Dundo', 'Saurimo', 'Malanje', 'Luena', 'Moçâmedes', 'Uíge', 'Mbanza Congo');

-- CreateEnum
CREATE TYPE "Provincia" AS ENUM ('Bengo', 'Benguela', 'Bié', 'Cabinda', 'Cuando Cubango', 'Cuanza Norte', 'Cuanza Sul', 'Cunene', 'Huambo', 'Huila', 'Luanda', 'Lunda Norte', 'Lunda Sul', 'Malanje', 'Moxico', 'Namibe', 'Uíge', 'Zaire');

-- CreateEnum
CREATE TYPE "Sexo" AS ENUM ('Masculino', 'Feminino');

-- CreateEnum
CREATE TYPE "EstadoCivil" AS ENUM ('Casado', 'Divorciado', 'Solteiro', 'Viúvo');

-- CreateEnum
CREATE TYPE "Estado" AS ENUM ('Presente', 'Faltou');

-- CreateEnum
CREATE TYPE "Classificacao" AS ENUM ('Assíduo', 'Não assíduo');

-- CreateEnum
CREATE TYPE "Periodo" AS ENUM ('Diário', 'Semanal', 'Mensal', 'Trimestral', 'Semestral', 'Anual');

-- CreateTable
CREATE TABLE "usuarios" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "perfil" "Perfil" NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcionario_id" TEXT NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categorias" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),

    CONSTRAINT "categorias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "funcoes" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),

    CONSTRAINT "funcoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seccoes" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),

    CONSTRAINT "seccoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "produtos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "descricao" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "categoria_id" TEXT NOT NULL,
    "seccao_id" TEXT NOT NULL,

    CONSTRAINT "produtos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pedidos" (
    "id" TEXT NOT NULL,
    "selecionar" "Selecionar" NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "draft" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcionario_id" TEXT NOT NULL,
    "seccao_id" TEXT NOT NULL,

    CONSTRAINT "pedidos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "items" (
    "id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "pedido_id" TEXT NOT NULL,
    "produto_id" TEXT NOT NULL,

    CONSTRAINT "items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "funcionarios" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "apelido" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nif" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "dataNascimento" TIMESTAMP(3) NOT NULL,
    "dataContratacao" TIMESTAMP(3) NOT NULL,
    "dataDemissao" TIMESTAMP(3),
    "morada" TEXT NOT NULL,
    "natural" "Naturalidade" NOT NULL DEFAULT 'Luanda',
    "provincia" "Provincia" NOT NULL DEFAULT 'Luanda',
    "sexo" "Sexo" NOT NULL DEFAULT 'Masculino',
    "estadoCivil" "EstadoCivil" NOT NULL DEFAULT 'Solteiro',
    "salarioBase" DOUBLE PRECISION NOT NULL,
    "foto" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcao_id" TEXT NOT NULL,
    "seccao_id" TEXT NOT NULL,

    CONSTRAINT "funcionarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payrolls" (
    "id" TEXT NOT NULL,
    "mes" INTEGER NOT NULL,
    "ano" INTEGER NOT NULL,
    "salarioBase" DOUBLE PRECISION NOT NULL,
    "descontos" DOUBLE PRECISION NOT NULL,
    "valorLiquido" DOUBLE PRECISION NOT NULL,
    "bonusAssiduidade" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "asseduidade_id" TEXT NOT NULL,
    "funcionario_id" TEXT NOT NULL,

    CONSTRAINT "payrolls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "presencas" (
    "id" TEXT NOT NULL,
    "estado" "Estado" NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "justificativo" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcionario_id" TEXT NOT NULL,

    CONSTRAINT "presencas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ausencias" (
    "id" TEXT NOT NULL,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFim" TIMESTAMP(3) NOT NULL,
    "estado" "Estado",
    "justificativo" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcionario_id" TEXT NOT NULL,

    CONSTRAINT "ausencias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assiduidades" (
    "id" TEXT NOT NULL,
    "dia" INTEGER,
    "mes" INTEGER NOT NULL,
    "ano" INTEGER NOT NULL,
    "totalPresencas" INTEGER NOT NULL,
    "totalFaltas" INTEGER NOT NULL,
    "faltasJustificadas" INTEGER NOT NULL,
    "faltasNaoJustificadas" INTEGER NOT NULL,
    "classificacao" "Classificacao" NOT NULL,
    "bonusAssiduidade" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "funcionario_id" TEXT NOT NULL,

    CONSTRAINT "assiduidades_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "relatoriosvendas" (
    "id" TEXT NOT NULL,
    "periodo" "Periodo" NOT NULL,
    "vendaTotal" TEXT NOT NULL,
    "lucroTotal" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),

    CONSTRAINT "relatoriosvendas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocks" (
    "id" TEXT NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "pontoAbastecimento" INTEGER NOT NULL,
    "data_entrada" TIMESTAMP(3) NOT NULL,
    "data_saida" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "produto_id" TEXT NOT NULL,

    CONSTRAINT "stocks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FuncionarioToRelatorioVendas" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_FuncionarioToRelatorioVendas_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "categorias_nome_key" ON "categorias"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "funcoes_nome_key" ON "funcoes"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "seccoes_nome_key" ON "seccoes"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "produtos_nome_key" ON "produtos"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "funcionarios_email_key" ON "funcionarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "funcionarios_nif_key" ON "funcionarios"("nif");

-- CreateIndex
CREATE UNIQUE INDEX "assiduidades_funcionario_id_mes_ano_key" ON "assiduidades"("funcionario_id", "mes", "ano");

-- CreateIndex
CREATE INDEX "_FuncionarioToRelatorioVendas_B_index" ON "_FuncionarioToRelatorioVendas"("B");

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_categoria_id_fkey" FOREIGN KEY ("categoria_id") REFERENCES "categorias"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_seccao_id_fkey" FOREIGN KEY ("seccao_id") REFERENCES "seccoes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pedidos" ADD CONSTRAINT "pedidos_seccao_id_fkey" FOREIGN KEY ("seccao_id") REFERENCES "seccoes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pedidos" ADD CONSTRAINT "pedidos_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "pedidos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "funcionarios" ADD CONSTRAINT "funcionarios_funcao_id_fkey" FOREIGN KEY ("funcao_id") REFERENCES "funcoes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "funcionarios" ADD CONSTRAINT "funcionarios_seccao_id_fkey" FOREIGN KEY ("seccao_id") REFERENCES "seccoes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payrolls" ADD CONSTRAINT "payrolls_asseduidade_id_fkey" FOREIGN KEY ("asseduidade_id") REFERENCES "assiduidades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payrolls" ADD CONSTRAINT "payrolls_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presencas" ADD CONSTRAINT "presencas_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ausencias" ADD CONSTRAINT "ausencias_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assiduidades" ADD CONSTRAINT "assiduidades_funcionario_id_fkey" FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_produto_id_fkey" FOREIGN KEY ("produto_id") REFERENCES "produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FuncionarioToRelatorioVendas" ADD CONSTRAINT "_FuncionarioToRelatorioVendas_A_fkey" FOREIGN KEY ("A") REFERENCES "funcionarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FuncionarioToRelatorioVendas" ADD CONSTRAINT "_FuncionarioToRelatorioVendas_B_fkey" FOREIGN KEY ("B") REFERENCES "relatoriosvendas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
