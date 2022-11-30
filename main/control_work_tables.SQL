create table if not exists filials
(
	filial_number integer not null,
	city varchar(40) not null,
	constraint filials_pk
		primary key (filial_number)
);

create table if not exists person
(
	document_number varchar(25) not null,
	address_of_living varchar(255),
	fio varchar(255),
	constraint person_pk
		primary key (document_number)
);

create unique index if not exists person_document_number_uindex
	on person (document_number);

create table if not exists statuses
(
	id integer not null,
	title varchar(255),
	constraint statuses_pk
		primary key (id)
);

create table if not exists entries
(
	document_number varchar(25),
	status_id integer,
	date_of_start date,
	loan integer,
	filial_number integer,
	id serial,
	constraint entries_pk
		primary key (id),
	constraint entries_filials_filial_number_fk
		foreign key (filial_number) references filials,
	constraint entries_person_document_number_fk
		foreign key (document_number) references person,
	constraint entries_statuses_id_fk
		foreign key (status_id) references statuses
);

create table if not exists date_of_end_and_procents
(
	date_of_end date,
	document_number varchar(25) not null,
	procents integer,
	constraint date_of_end_and_procents_pk
		primary key (document_number)
);

