drop database DBdevForge;

create database DBdevForge;

use DBdevForge;

create table tbFuncionarios(
    id_Func int primary key auto_increment,
    nome_Func varchar(255) not null,
    email_Func varchar(255) not null,
    senha varchar(15) not null,
    cargo varchar(50) not null,
    data_contratacao date not null
);

create table tbContatos(
    id_Cont int primary key auto_increment,
    telefone char(9) unique not null,
    endereco varchar(255) not null,
    instagram varchar(255) not null,
    email varchar(255) not null,
    id_Func int not null,
    foreign key (id_Func) references tbFuncionarios(id_Func)
);


create table tbOrcamentos(
    id_Orc int primary key auto_increment,
    nome_Orc varchar(255) not null,
    email_Orc varchar(255) not null,
    nome_empresa varchar(255) not null,
    cargo_empresa varchar(100) not null,
    qtd_funcionarios enum('1-10', '11-50', '51-200', '201-500', '501-1000', '1000+') not null,
    responsavel_mkt varchar(50) not null,
    descricao_necessidade varchar(500) not null,
    data_solicitacao timestamp default current_timestamp,
    id_Cont int not null,
    foreign key (id_Cont) references tbContatos(id_Cont)
);

desc tbContatos;
desc tbFuncionarios;
desc tbOrcamentos;

INSERT INTO tbFuncionarios (nome_Func, email_Func, senha, cargo, data_contratacao)
VALUES 
('Alice Santos', 'alice.santos@example.com', 'password123', 'Gerente', '2020-01-15'),
('Bruno Lima', 'bruno.lima@example.com', 'password456', 'Desenvolvedor', '2019-07-23'),
('Carla Pereira', 'carla.pereira@example.com', 'password789', 'Analista', '2021-03-05');

INSERT INTO tbContatos (telefone, endereco, instagram, email, id_Func)
VALUES 
('123456789', 'Rua das Flores, 123', 'instagram.com/alice', 'alice.santos@example.com', 1),
('987654321', 'Avenida Central, 456', 'instagram.com/bruno', 'bruno.lima@example.com', 2),
('456123789', 'Praça da Sé, 789', 'instagram.com/carla', 'carla.pereira@example.com', 3);

INSERT INTO tbOrcamentos (nome_Orc, email_Orc, nome_empresa, cargo_empresa, qtd_funcionarios, responsavel_mkt, descricao_necessidade, id_Cont)
VALUES 
('Empresa A', 'contact@empresaA.com', 'Empresa A', 'CEO', '11-50', 'Alice Santos', 'Necessidade de um novo sistema ERP', 1),
('Empresa B', 'contact@empresaB.com', 'Empresa B', 'CTO', '51-200', 'Bruno Lima', 'Implementação de soluções de TI', 2),
('Empresa C', 'contact@empresaC.com', 'Empresa C', 'CFO', '1-10', 'Carla Pereira', 'Consultoria financeira', 3);


select * from tbContatos;
select * from tbFuncionarios;
select * from tbOrcamentos;