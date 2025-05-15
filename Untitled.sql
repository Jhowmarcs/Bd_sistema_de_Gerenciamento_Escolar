CREATE TABLE "alunos" (
  "id_aluno" INT PRIMARY KEY,
  "numero_matricula" VARCHAR(20) UNIQUE,
  "nome_completo" VARCHAR(255),
  "data_nascimento" DATE,
  "endereco" VARCHAR(255),
  "nome_responsavel" VARCHAR(255),
  "telefone_responsavel" VARCHAR(20),
  "email_responsavel" VARCHAR(100),
  "informacoes_adicionais" TEXT
);

CREATE TABLE "professores" (
  "id_professor" INT PRIMARY KEY,
  "nome_completo" VARCHAR(255),
  "especialidade" VARCHAR(100),
  "email" VARCHAR(100),
  "telefone" VARCHAR(20)
);

CREATE TABLE "disciplinas" (
  "id_disciplina" INT PRIMARY KEY,
  "codigo_disciplina" VARCHAR(20) UNIQUE,
  "nome_disciplina" VARCHAR(100),
  "carga_horaria" INT
);

CREATE TABLE "turmas" (
  "id_turma" INT PRIMARY KEY,
  "nome_turma" VARCHAR(50),
  "ano_letivo" VARCHAR(10),
  "id_professor" INT,
  "horario" VARCHAR(100)
);

CREATE TABLE "turmas_disciplinas" (
  "id_turma" INT,
  "id_disciplina" INT,
  PRIMARY KEY ("id_turma", "id_disciplina")
);

CREATE TABLE "matriculas" (
  "id_matricula" INT PRIMARY KEY,
  "id_aluno" INT,
  "id_turma" INT,
  "data_matricula" DATE
);

CREATE TABLE "notas" (
  "id_nota" INT PRIMARY KEY,
  "id_aluno" INT,
  "id_disciplina" INT,
  "nota" DECIMAL(5,2),
  "data_avaliacao" DATE
);

CREATE TABLE "frequencia" (
  "id_frequencia" INT PRIMARY KEY,
  "id_aluno" INT,
  "id_disciplina" INT,
  "data_aula" DATE,
  "presente" BOOLEAN
);

CREATE TABLE "pagamento" (
  "id_pagamento" INT PRIMARY KEY,
  "id_aluno" INT,
  "data_pagamento" DATE,
  "valor_pago" DECIMAL(10,2),
  "forma_pagamento" VARCHAR(50),
  "referencia" VARCHAR(100),
  "status" VARCHAR(20)
);

CREATE TABLE "usuario" (
  "id_usuario" INT PRIMARY KEY,
  "login" VARCHAR(50) UNIQUE,
  "senha" VARCHAR(255),
  "nivel_acesso" VARCHAR(20),
  "id_professor" INT
);

ALTER TABLE "turmas" ADD FOREIGN KEY ("id_professor") REFERENCES "professores" ("id_professor");

ALTER TABLE "turmas_disciplinas" ADD FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id_turma");

ALTER TABLE "turmas_disciplinas" ADD FOREIGN KEY ("id_disciplina") REFERENCES "disciplinas" ("id_disciplina");

ALTER TABLE "matriculas" ADD FOREIGN KEY ("id_aluno") REFERENCES "alunos" ("id_aluno");

ALTER TABLE "matriculas" ADD FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id_turma");

ALTER TABLE "notas" ADD FOREIGN KEY ("id_aluno") REFERENCES "alunos" ("id_aluno");

ALTER TABLE "notas" ADD FOREIGN KEY ("id_disciplina") REFERENCES "disciplinas" ("id_disciplina");

ALTER TABLE "frequencia" ADD FOREIGN KEY ("id_aluno") REFERENCES "alunos" ("id_aluno");

ALTER TABLE "frequencia" ADD FOREIGN KEY ("id_disciplina") REFERENCES "disciplinas" ("id_disciplina");

ALTER TABLE "pagamento" ADD FOREIGN KEY ("id_aluno") REFERENCES "alunos" ("id_aluno");

ALTER TABLE "usuario" ADD FOREIGN KEY ("id_professor") REFERENCES "professores" ("id_professor");
