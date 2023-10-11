create table pessoa (
	id_pessoa serial primary key,
	nome varchar(100) not null, 
	cpf int,
	endereco varchar(150)
);

insert into pessoa (nome, cpf, endereco)
values
('Paulo', 1111111111,'Rua A1, n1, bairro x'),
('Maria Júlia', 222222222, 'Rua A2, n2, bairro y');

select * from pessoa;

create table empresa (
	id_empresa serial primary key,
	nome varchar(100) not null, 
	cpf int,
	endereco varchar(150)
);

insert into empresa (nome_empresa, endereco)
values
('AWS', 'Rua X1, n1, bairro x1'),
('PROZ', 'Rua X2, n2, bairro X2');

select * from empresa;

create table pessoa_contato(
	id_contato serial primary key, 
	email varchar(100),
	telefone int,
	celular int, 
	fk_id_pessoa int,
	foreign key (fk_id_pessoa) 
		references pessoa (id_pessoa)	
)

insert into pessoa_contato (email, telefone, celular, fk_id_pessoa)
values
('mariajulia@gmail.com',42545, 45901,2)

select * from pessoa_contato;

select * from pessoa p 
join 
pessoa_contato pc on 
p.id_pessoa = pc.fk_id_pessoa

create table empresa_contato(
	id_contato serial primary key, 
	email varchar(100),
	telefone int,
	celular int, 
	fk_id_empresa int,
	foreign key (fk_id_empresa) 
		references empresa (id_empresa)	
)

insert into empresa_contato (email, telefone, celular, fk_id_empresa)
values
('AWS@aws.com',1101, 1102,1),
('PROZ@proz.com',1202, 1203,2)

select * from empresa_contato

select * from empresa e 
join 
empresa_contato ec on 
e.id_empresa = ec.fk_id_empresa

create table freela (
	id_freela serial primary key,
	descricao text not null,
	data_cadastro date,
	fk_id_pessoa int,
	foreign key (fk_id_pessoa) 
		references pessoa (id_pessoa)	
)

insert into freela (descricao, data_cadastro, fk_id_pessoa)
values 
('Fazer contato com clientes através do Whatsapp e telefone para recuperação de vendas', '2023-10-11',1)

insert into freela (descricao, data_cadastro, fk_id_pessoa)
values 
('Desenvolver páginas web', '2023-10-11',2)

select p.nome, pc.telefone, f.descricao
from pessoa p
join pessoa_contato pc 
on p.id_pessoa = pc.fk_id_pessoa
join freela f
on f.fk_id_pessoa = p.id_pessoa

create table vaga (
	id_vaga serial primary key,
	descricao text not null,
	data_cadastro date,
	fk_id_empresa int,
	foreign key (fk_id_empresa) 
		references empresa (id_empresa)	
)


insert into vaga (descricao, data_cadastro, fk_id_empresa)
values 
('Cadastro de produtos', '2023-10-11',1),
('Suporte técnico de informática via telefone e whatsapp', '2023-10-11',2);

select * from vaga;

select e.nome_empresa, ec.telefone, v.descricao
from empresa e
join empresa_contato ec 
on e.id_empresa = ec.fk_id_empresa
join vaga v
on v.fk_id_empresa = e.id_empresa
