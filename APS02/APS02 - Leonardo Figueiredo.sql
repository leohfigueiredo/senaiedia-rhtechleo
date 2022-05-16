CREATE TABLE "public.Empresa" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	CONSTRAINT "Empresa_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Departamento" (
	"id" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	"id_empresa" integer NOT NULL,
	CONSTRAINT "Departamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Colaborador" (
	"id" serial NOT NULL,
	"id_colaborador" BINARY NOT NULL,
	"projetos" DECIMAL NOT NULL,
	"nome" varchar(255) NOT NULL,
	"salario" DECIMAL NOT NULL,
	"idade" DECIMAL NOT NULL,
	"cargo" varchar(255) NOT NULL,
	"formacao" varchar(255) NOT NULL,
	"tempo_experiencia" DECIMAL NOT NULL,
	"cursos" varchar(255) NOT NULL,
	"entrega_resutados" DECIMAL NOT NULL,
	"score_colaborador" DECIMAL NOT NULL,
	"id_departamento" BINARY NOT NULL,
	CONSTRAINT "Colaborador_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.nota_fiscal" (
	"id" serial NOT NULL,
	"id_empresa" BINARY NOT NULL,
	"data" DATE NOT NULL,
	"desconto" DECIMAL NOT NULL,
	"forma_pgto" varchar(255) NOT NULL,
	"total" DECIMAL NOT NULL,
	CONSTRAINT "nota_fiscal_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.item_nota" (
	"id" serial NOT NULL,
	"id_nota" BINARY NOT NULL,
	"produto" varchar(255) NOT NULL,
	"quantidade" DECIMAL NOT NULL,
	"valor" DECIMAL NOT NULL,
	CONSTRAINT "item_nota_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.folha_pgto" (
	"id" serial NOT NULL,
	"id_colaborador" BINARY NOT NULL,
	"data" DATE NOT NULL,
	"hora_extra" DECIMAL NOT NULL,
	"descontos" DECIMAL NOT NULL,
	"atestados" DECIMAL NOT NULL,
	"faltas" DECIMAL NOT NULL,
	"valor" DECIMAL NOT NULL,
	CONSTRAINT "folha_pgto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.dpto_empresa" (
	"id" serial NOT NULL,
	"id_departamento" BINARY NOT NULL,
	"id_empresa" BINARY NOT NULL,
	CONSTRAINT "dpto_empresa_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cargo" (
	"id" BINARY NOT NULL,
	"id_departamento" BINARY NOT NULL,
	"nome" varchar(255) NOT NULL,
	CONSTRAINT "cargo_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Departamento" ADD CONSTRAINT "Departamento_fk0" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id");

ALTER TABLE "Colaborador" ADD CONSTRAINT "Colaborador_fk0" FOREIGN KEY ("id_colaborador") REFERENCES "Departamento"("id");
ALTER TABLE "Colaborador" ADD CONSTRAINT "Colaborador_fk1" FOREIGN KEY ("id_departamento") REFERENCES "Departamento"("id");

ALTER TABLE "nota_fiscal" ADD CONSTRAINT "nota_fiscal_fk0" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id");

ALTER TABLE "item_nota" ADD CONSTRAINT "item_nota_fk0" FOREIGN KEY ("id_nota") REFERENCES "nota_fiscal"("id");

ALTER TABLE "folha_pgto" ADD CONSTRAINT "folha_pgto_fk0" FOREIGN KEY ("id_colaborador") REFERENCES "Colaborador"("id");

ALTER TABLE "dpto_empresa" ADD CONSTRAINT "dpto_empresa_fk0" FOREIGN KEY ("id_departamento") REFERENCES "Departamento"("id");
ALTER TABLE "dpto_empresa" ADD CONSTRAINT "dpto_empresa_fk1" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id");

ALTER TABLE "cargo" ADD CONSTRAINT "cargo_fk0" FOREIGN KEY ("id_departamento") REFERENCES "Departamento"("id");









