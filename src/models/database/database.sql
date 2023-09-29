-- Tabela DADOS_EMPRESA
CREATE TABLE DADOS_EMPRESA (
    ID INT PRIMARY KEY NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    CNPJ INT NOT NULL UNIQUE,
    EMAIL VARCHAR(100) NOT NULL,
    ENDERECO VARCHAR(100)
);

-- Tabela CONTRATAR_FUNCIONARIO
CREATE TABLE CONTRATAR_FUNCIONARIO (
    MATRICULA INT PRIMARY KEY NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL,
    FUNCAO VARCHAR(30) NOT NULL,
    SALARIO FLOAT NOT NULL
);


create table logsfuncionarios(
	matricula int not null,
    usuario varchar(100) not null,
    senha varchar(40) not null,
    foreign key(matricula) references contratar_funcionario(matricula)
);

insert into contratar_funcionario(matricula, nome, telefone, funcao, salario) values (1, 'Lucas', '12345', 'Garçom', '1000');
insert into logsfuncionarios(matricula, usuario, senha) values(1, 'Lucas', '123');

-- Tabela CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS
CREATE TABLE CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS (
    NUMERO_UNIFORME INT PRIMARY KEY NOT NULL,
    MATRICULA INT NOT NULL,
    HORAS_TRABALHADA INT NOT NULL,
    FOREIGN KEY (MATRICULA) REFERENCES CONTRATAR_FUNCIONARIO(MATRICULA)
);

-- Tabela FORMATURA
CREATE TABLE FORMATURA (
    ID INT PRIMARY KEY NOT NULL,
    FACULDADE INT,
    CURSO INT,
    REPRESENTANTE VARCHAR(255),
    FORM_PAGAMENTO INT,
    TOTAL FLOAT NOT NULL,
    TIPO_FORMATURA VARCHAR(10) NOT NULL CHECK (TIPO_FORMATURA IN ('aberta', 'fechada')),
    LIMIT_PESSOAS INT,
    FOREIGN KEY (FACULDADE) REFERENCES FACULDADE(ID),
    FOREIGN KEY (CURSO) REFERENCES CURSO(ID),
    FOREIGN KEY (FORM_PAGAMENTO) REFERENCES FORM_PAGMENTO(ID),
    CHECK ((TIPO_FORMATURA = 'aberta' AND LIMIT_PESSOAS IS NULL) OR (TIPO_FORMATURA = 'fechada' AND LIMIT_PESSOAS IS NOT NULL))
);


-- Tabela EVENTOS_FORMATURA
CREATE TABLE EVENTOS_FORMATURA (
    ID INT PRIMARY KEY NOT NULL,
    ID_FORMATURA INT NOT NULL,
    ID_EVENTO INT NOT NULL,
    DESCRICAO VARCHAR(70) NOT NULL,
    LOCAL VARCHAR(130) NOT NULL,
    DURACAO VARCHAR(30) NOT NULL,
    DATA DATE NOT NULL,
    STATUS INT NOT NULL,
    NOVA_DATA VARCHAR(10) NOT NULL,
    FOREIGN KEY (ID_FORMATURA) REFERENCES FORMATURA(ID),
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS(ID)
);

-- Tabela FACULDADE
CREATE TABLE FACULDADE (
    ID INT PRIMARY KEY NOT NULL,
    NOME VARCHAR(100) NOT NULL
);

-- Tabela EVENTO
CREATE TABLE EVENTO (
    ID INT PRIMARY KEY NOT NULL,
    EVENTO VARCHAR(80) NOT NULL
);

-- Tabela STATUS
CREATE TABLE STATUS (
    ID INT PRIMARY KEY NOT NULL,
    STATUS VARCHAR(20) NOT NULL
);

-- Tabela CURSO
CREATE TABLE CURSO (
    ID INT PRIMARY KEY NOT NULL,
    CURSO VARCHAR(50) NOT NULL
);

INSERT INTO CURSO(ID, CURSO) VALUES (1, 'cc'); 

-- Tabela FORM_PAGMENTO
CREATE TABLE FORM_PAGMENTO (
    ID INT PRIMARY KEY NOT NULL,
    FORMA VARCHAR(20) NOT NULL
);

-- Tabela CADASTRAR_BUFFETS
CREATE TABLE CADASTRAR_BUFFETS (
    ID INT PRIMARY KEY NOT NULL,
    NOME VARCHAR(70) NOT NULL,
    CNPJ INT NOT NULL UNIQUE,
    ENDERECO VARCHAR(100) NOT NULL,
    TEMPO_DE_PARCERIA VARCHAR(20) NOT NULL,
    TIPO_DE_BUFFETS VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL
);

-- Tabela CARDAPIOS
CREATE TABLE CARDAPIOS (
    ID INT PRIMARY KEY NOT NULL,
    NOME VARCHAR(70) NOT NULL,
    CATEGORIA VARCHAR(30) NOT NULL,
    DESCRICAO VARCHAR(50) NOT NULL,
    PRECO FLOAT NOT NULL,
    TIPO VARCHAR(30) NOT NULL,
    BUFFET INT NOT NULL,
    FOREIGN KEY (BUFFET) REFERENCES CADASTRAR_BUFFETS(ID)
);

-- INSERTS 

-- Inserir dados na tabela DADOS_EMPRESA
INSERT INTO DADOS_EMPRESA (ID, NOME, CNPJ, EMAIL, ENDERECO)
VALUES (1, 'EVENTOS', 15005599000123, 'eventosofc@gmail.com', 'RUA 987');

-- Inserir dados na tabela CONTRATAR_FUNCIONARIO
INSERT INTO CONTRATAR_FUNCIONARIO (MATRICULA, NOME, TELEFONE, FUNCAO, SALARIO)
VALUES (1, 'LUCAS OLIVEIRA CAMPOS', '11950735140', 'GARÇOM', 5000);

INSERT INTO CONTRATAR_FUNCIONARIO (MATRICULA, NOME, TELEFONE, FUNCAO, SALARIO)
VALUES (2, 'LUCAS OLIVEIRA', '11950735149', 'GARÇOM', 2000);

-- Inserir dados na tabela CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS
INSERT INTO CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS (NUMERO_UNIFORME, MATRICULA, HORAS_TRABALHADA)
VALUES (1, 1, 8);

INSERT INTO CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS (NUMERO_UNIFORME, MATRICULA, HORAS_TRABALHADA)
VALUES (2, 2, 8);

-- Inserir dados na tabela FACULDADE
INSERT INTO FACULDADE (ID, NOME)
VALUES (1, 'UNINOVE');

INSERT INTO FACULDADE (ID, NOME)
VALUES (5, 'UNICEM');

-- Inserir dados na tabela EVENTO
INSERT INTO EVENTO (ID, EVENTO)
VALUES (2, 'FORMATURA');

INSERT INTO EVENTO (ID, EVENTO)
VALUES (5, 'VIAGEM');

-- Inserir dados na tabela STATUS
INSERT INTO STATUS (ID, STATUS)
VALUES (1, 'CONFIRMADO');

INSERT INTO STATUS (ID, STATUS)
VALUES (5, 'CONFIRMADO');

-- Inserir dados na tabela CURSO
INSERT INTO CURSO (ID, CURSO)
VALUES (1, 'CC');

INSERT INTO CURSO (ID, CURSO)
VALUES (5, 'SI');
-- Inserir dados na tabela FORM_PAGMENTO
INSERT INTO FORM_PAGMENTO (ID, FORMA)
VALUES (2, 'PIX');

INSERT INTO FORM_PAGMENTO (ID, FORMA)
VALUES (5, 'BOLETO');

-- Inserir dados na tabela CADASTRAR_BUFFETS
INSERT INTO CADASTRAR_BUFFETS (ID, NOME, CNPJ, ENDERECO, TEMPO_DE_PARCERIA, TIPO_DE_BUFFETS, EMAIL)
VALUES (1, 'BUFFET UNINOVE', 42396639000188, 'RUA ABC', '12 MESES', 'PARCEIRO', 'buffetuninove@gmail.com');

-- Inserir dados na tabela CARDAPIOS
INSERT INTO CARDAPIOS (ID, NOME, CATEGORIA, DESCRICAO, PRECO, TIPO, BUFFET)
VALUES (1, 'NOME DO PRATO/APERITIVO', 'ENTRADA/PRINCIPAL/SOBREMESA', 'DESCRICAO DETALHADA', 20, 'PRATO/APERITIVO', 1);

-- Inserir dados na tabela EVENTOS_FORMATURA
INSERT INTO EVENTOS_FORMATURA (ID, ID_FORMATURA, ID_EVENTO, DESCRICAO, LOCAL, DURACAO, DATA, STATUS, NOVA_DATA)
VALUES (1, 1, 2, 'Descrição do Evento', 'RUA XX', '10 HRS', TO_DATE('21/10/2023', 'DD/MM/YYYY'), 1, '21/10/2023');

INSERT INTO EVENTOS_FORMATURA (ID, ID_FORMATURA, ID_EVENTO, DESCRICAO, LOCAL, DURACAO, DATA, STATUS, NOVA_DATA)
VALUES (5, 5, 5, 'Viagem até Minas gerais', 'RUA ABC', '1 Mês', TO_DATE('30/11/2023', 'DD/MM/YYYY'), 1, '30/1/2023');

-- Inserir dados na tabela FORMATURA
INSERT INTO FORMATURA (ID, FACULDADE, CURSO, REPRESENTANTE, FORM_PAGAMENTO, TOTAL, TIPO_FORMATURA)
VALUES (1, 1, 1, 'LUCAS', 2, 10000, 'aberta');

INSERT INTO FORMATURA (ID, FACULDADE, CURSO, REPRESENTANTE, FORM_PAGAMENTO, TOTAL, TIPO_FORMATURA, LIMIT_PESSOAS)
VALUES (5, 5, 5, 'LUCAS', 2, 10000, 'fechada', 300);

-- SELECT

-- Tabela DADOS_EMPRESA
SELECT * FROM DADOS_EMPRESA;

-- Tabela CONTRATAR_FUNCIONARIO
SELECT * FROM CONTRATAR_FUNCIONARIO;

-- Tabela CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS
SELECT * FROM CALENDARIO_DE_FUNCAO_DE_FUNCIONARIOS;

-- Tabela FORMATURA
SELECT * FROM FORMATURA;

-- Tabela EVENTOS_FORMATURA
SELECT * FROM EVENTOS_FORMATURA;

-- Tabela FACULDADE
SELECT * FROM FACULDADE;

-- Tabela EVENTO
SELECT * FROM EVENTO;

-- Tabela STATUS
SELECT * FROM STATUS;

-- Tabela CURSO
SELECT * FROM CURSO;

-- Tabela FORM_PAGMENTO
SELECT * FROM FORM_PAGMENTO;

-- Tabela CADASTRAR_BUFFETS
SELECT * FROM CADASTRAR_BUFFETS;

-- Tabela CARDAPIOS
SELECT * FROM CARDAPIOS;