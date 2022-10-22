--Modelo Físico

create table PAIS (
	codigo serial not null unique primary key,
	nome varchar(20) not null
);

create table ESTADO (
	codigo serial not null unique primary key,
	nome varchar(20) not null,
	fk_PAIS_codigo serial not null references PAIS(codigo)
);

create table CIDADE (
	codigo serial not null unique,
	nome varchar(20) not null,
	fk_ESTADO_codigo serial not null references ESTADO(codigo)
);

create table BAIRRO (
	codigo serial not null unique,
	nome varchar(20) not null,
	fk_CiDADE_codigo serial not null references CIDADE(codigo)
);

create table LOGRADOURO (
	codigo serial not null unique,
	tipo_logradouro varchar(20) not null,
	nome varchar(20) not null,
	fk_BAIRRO_codigo serial not null references BAIRRO(codigo)
);

create table ENDERECO (
codigo serial not null unique primary key,
fk_PAIS_codigo serial not null references PAIS(codigo),
fk_ESTADO_codigo serial not null references ESTADO(codigo),
fk_CIDADE_codigo serial not null references CIDADE(codigo),
fk_BAIRRO_codigo serial not null references BAIRRO(codigo),
fk_LOGRADOURO_codigo serial not null references LOGRADOURO(codigo),
numero integer not null
);

create table IMOVEL (
	codigo serial not null unique primary key,
	construtora varchar(25),
	arquiteto varchar(40),
	descricao varchar(200),
	codigo_dono serial,
	fk_endereco_codigo serial not null references ENDERECO(codigo)
);

create table CLIENTE (
	codigo serial not null unique primary key,
	nome varchar(100) not null,
	cpf char(14) not null unique,
	data_nascimento date,
	email varchar(50) not null,
	senha varchar(20) not null,
	fk_ENDERECO_codigo integer not null references ENDERECO(codigo)
);

create table CORRETOR (
	codigo serial not null unique primary key,
	nome varchar(100) not null,
	cpf char(14) not null unique,
	salario int
);

create table VENDA_COMPRA (
	codigo serial not null unique primary key,
	data_hora timestamp not null unique,
	valor float,
	fk_CORRETOR_codigo serial not null references CORRETOR(codigo),
	fk_CLIENTE_codigo serial not null references CLIENTE(codigo),
	fk_IMOVEL_codigo serial not null references IMOVEL(codigo)
);

--Inserts

insert into PAIS (nome) values
('Brasil'),
('Estados Unidos');

insert into ESTADO (nome, fk_PAIS_codigo) values
('Espírito Santo', 1),
('Califórnia', 2);

insert into CIDADE (nome, fk_ESTADO_codigo) values
('Vitória', 1),
('Serra', 1),
('Los Angeles', 2);

insert into BAIRRO (nome, fk_CIDADE_codigo) values
('Jardim da Penha', 1),
('Manguinhos', 2),
('Echo Park', 3);

insert into LOGRADOURO (nome, tipo_logrado,fk_CIDADE_codigo) values
('avenida', 'Ugo Viola', 1),
('Rua', 'Alberto Romeno', 2),
('Rua', 'Stone Park', 3);

insert into ENDERECO (fk_PAIS_codigo, fk_ESTADO_codigo, fk_CIDADE_codigo, fk_BAIRRO_codigo, fk_LOGRADOURO_codigo, numero) values
(1, 1, 1, 1, 1, 1889),
(1, 1, 2, 2, 2, 0076),
(2, 2, 3, 3, 3, 6739);

insert into CLIENTE (nome, cpf, data_nascimento, email, senha, fk_endereco_codigo)
('João Vitor Oliveira Scheidegger', '234.543.123-00', '01/02/1976', 'joao.oliveira@gmail.com', '1234', 1),
('Heitor Garrands Kruen', '312.765.345-56', '12/04/1988', 'heitor.kruen@gmail.com', 'senha', 2),
('Heliana Pereira Gois', '789.365.234-98', '04/05/1999', 'heliana.pereira12@hotmail.com', 'jasnf2389b243nui2b37', 3);

insert into CORRETOR (nome, cpf, salario) values
('Karine Uon Jerads', '645.456.234-02', 6659.0),
('Karine Doist Nero', '534.654.534-87', 7045.0);

insert into IMOVEL (construtora, arquiteto, descricao, codigo_dono, fk_ENDERECO_codigo) values
('Joao Construtora', 'João Vitor Oliveira', '3 quartos, 2 banheiros, cozinha, sala de estar junto com a de jantar, lavanderia, sapataria, área de serviço e despensa', 1, 1),
('Kr Construtora', 'Karine Trein', '645.235.765-78', '1 quartos, 3 banheiros, cozinha, sala de estar junto com a de jantar, lavanderia, sapataria, área de serviço, despensa e sala de cinema', 2, 2),
('Jh Construtora', 'Jhon Heins Gu', '745.876.123-35', '3 quartos, 2 banheiros, cozinha, sala de estar junto com a de jantar, lavanderia, sapataria, área de serviço, despensa, sala de cinema e sala de jogos', 3, 3);

insert into VENDA_COMPRA (data_hora, valor,fk_CORRETOR_codigo, fk_CLIENTE_codigo, fk_IMOVEL_codigo)
('01/01/2022 12:54:00', 100000.0, 1, 1, 1),
('02/02/2022 34:59:28', 350000.0, 1, 2, 2),
('03/03/2022 45:32:07', 200000.0, 2, 3, 3),
('04/04/2022 44:23:12', 155000.0, 2, 3, 3);