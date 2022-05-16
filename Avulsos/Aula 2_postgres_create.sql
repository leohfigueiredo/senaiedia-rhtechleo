CREATE TABLE "public.Empresa 1" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "Empresa 1_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Departamento" (
	"id" serial NOT NULL,
	"nome" BINARY NOT NULL,
	CONSTRAINT "Departamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Colaborador" (
	"id" serial NOT NULL,
	"id_empresa" varchar(255) NOT NULL,
	"salario" BINARY NOT NULL,
	"nome" varchar(255) NOT NULL,
	"idade" BINARY NOT NULL,
	"cargo" BINARY NOT NULL,
	"formacao" BINARY NOT NULL,
	"tempo_experiencia" BINARY NOT NULL,
	"cursos" BINARY NOT NULL,
	"faltas" BINARY NOT NULL,
	"hora_extra" BINARY NOT NULL,
	"advertencias" BINARY NOT NULL,
	"entrega_resultados" BINARY NOT NULL,
	"projetos" BINARY NOT NULL,
	"score_colaborador" BINARY NOT NULL,
	CONSTRAINT "Colaborador_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Nota Fiscal" (
	"id" serial NOT NULL,
	"id_empresa1" varchar(255) NOT NULL,
	"id_empresa2" varchar(255) NOT NULL,
	CONSTRAINT "Nota Fiscal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.departamento_empresa" (
	"id_departamento" BINARY NOT NULL,
	"id_empresa" BINARY(255) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.item_nota_fiscal" (
	"id" serial NOT NULL,
	"id_nf" BINARY NOT NULL,
	"produto" BINARY NOT NULL,
	"quantidade" BINARY NOT NULL,
	"valor" BINARY NOT NULL,
	"desconto" BINARY NOT NULL,
	"total" BINARY NOT NULL,
	"forma_pgto" BINARY NOT NULL,
	CONSTRAINT "item_nota_fiscal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.folha_de_pagamento" (
	"id" serial NOT NULL,
	"id_colaborador" BINARY NOT NULL,
	"data" DATE NOT NULL,
	"descontos" BINARY NOT NULL,
	"hora_extra" BINARY NOT NULL,
	"valor" BINARY NOT NULL,
	CONSTRAINT "folha_de_pagamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.projetos" (
	"id" serial NOT NULL,
	"nivel" DECIMAL NOT NULL,
	CONSTRAINT "projetos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cargo" (
	"id" serial NOT NULL,
	"mult_hora_extra" DECIMAL NOT NULL,
	CONSTRAINT "cargo_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pontuacao_cursos" (
	"id" serial NOT NULL,
	"pontos" DECIMAL NOT NULL,
	CONSTRAINT "pontuacao_cursos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.folha_ponto" (
	"id" serial NOT NULL,
	"faltas" DECIMAL NOT NULL,
	"hora_extra" DECIMAL NOT NULL,
	CONSTRAINT "folha_ponto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Colaborador" ADD CONSTRAINT "Colaborador_fk0" FOREIGN KEY ("id_empresa") REFERENCES "Departamento"("id");

ALTER TABLE "Nota Fiscal" ADD CONSTRAINT "Nota Fiscal_fk0" FOREIGN KEY ("id_empresa1") REFERENCES "Empresa 1"("id");
ALTER TABLE "Nota Fiscal" ADD CONSTRAINT "Nota Fiscal_fk1" FOREIGN KEY ("id_empresa2") REFERENCES "departamento_empresa"("id_departamento");

ALTER TABLE "departamento_empresa" ADD CONSTRAINT "departamento_empresa_fk0" FOREIGN KEY ("id_departamento") REFERENCES "Departamento"("id");
ALTER TABLE "departamento_empresa" ADD CONSTRAINT "departamento_empresa_fk1" FOREIGN KEY ("id_empresa") REFERENCES "Empresa 1"("id");

ALTER TABLE "item_nota_fiscal" ADD CONSTRAINT "item_nota_fiscal_fk0" FOREIGN KEY ("id_nf") REFERENCES "Nota Fiscal"("id");

ALTER TABLE "folha_de_pagamento" ADD CONSTRAINT "folha_de_pagamento_fk0" FOREIGN KEY ("id_colaborador") REFERENCES "Colaborador"("id");

ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("nivel") REFERENCES "Colaborador"("projetos");

ALTER TABLE "cargo" ADD CONSTRAINT "cargo_fk0" FOREIGN KEY ("mult_hora_extra") REFERENCES "Colaborador"("cargo");

ALTER TABLE "pontuacao_cursos" ADD CONSTRAINT "pontuacao_cursos_fk0" FOREIGN KEY ("pontos") REFERENCES "Colaborador"("cursos");

ALTER TABLE "folha_ponto" ADD CONSTRAINT "folha_ponto_fk0" FOREIGN KEY ("faltas") REFERENCES "Colaborador"("faltas");
ALTER TABLE "folha_ponto" ADD CONSTRAINT "folha_ponto_fk1" FOREIGN KEY ("hora_extra") REFERENCES "Colaborador"("hora_extra");












