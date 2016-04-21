
    create table application (
        application_id int4 not null,
        applicationStatus varchar(255),
        cin varchar(255),
        date timestamp,
        email varchar(255),
        firstname varchar(255),
        gpa varchar(255),
        gre varchar(255),
        lastname varchar(255),
        term varchar(255),
        toefl varchar(255),
        transcript varchar(255),
        department_department_id int4,
        program_program_id int4,
        user_user_id int4,
        primary key (application_id)
    );

    create table applicationadditionalfields (
        field_id int4 not null,
        field_name varchar(255),
        field_status varchar(255),
        field_type varchar(255),
        application_application_id int4,
        department_department_id int4,
        primary key (field_id)
    );

    create table applicationstatus (
        status_id int4 not null,
        comment varchar(255),
        status varchar(255),
        time timestamp,
        application_application_id int4,
        primary key (status_id)
    );

    create table degree (
        degree_id int4 not null,
        degree varchar(255),
        major varchar(255),
        time_period varchar(255),
        university varchar(255),
        application_application_id int4,
        primary key (degree_id)
    );

    create table departments (
        department_id int4 not null,
        department varchar(255),
        primary key (department_id)
    );

    create table programs (
        program_id int4 not null,
        program varchar(255),
        department_department_id int4,
        primary key (program_id)
    );

    create table users (
        user_id int4 not null,
        citizenship varchar(255),
        dob varchar(255),
        email varchar(255),
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        password varchar(255),
        phoneNumber varchar(255),
        typeOfUser varchar(255),
        primary key (user_id)
    );

    alter table application 
        add constraint FK_he9u2ot26dnhsr9hpkcppubdg 
        foreign key (department_department_id) 
        references departments;

    alter table application 
        add constraint FK_spxqwed00hxdh65xanthn05l7 
        foreign key (program_program_id) 
        references programs;

    alter table application 
        add constraint FK_njy4y3b5b0scc1nj8hk8jdepa 
        foreign key (user_user_id) 
        references users;

    alter table applicationadditionalfields 
        add constraint FK_m64xnts4f8ad4jvi41fb1yxt7 
        foreign key (application_application_id) 
        references application;

    alter table applicationadditionalfields 
        add constraint FK_hqtdrdgxhc7l28wotw1skb3c7 
        foreign key (department_department_id) 
        references departments;

    alter table applicationstatus 
        add constraint FK_blbxsb8hve4rcyglts08i3vlb 
        foreign key (application_application_id) 
        references application;

    alter table degree 
        add constraint FK_9sg5w9fwnfsvrlogk6au89637 
        foreign key (application_application_id) 
        references application;

    alter table programs 
        add constraint FK_9oac0l8t3j02ck4s7ah0o4676 
        foreign key (department_department_id) 
        references departments;

    create sequence hibernate_sequence minvalue 100;


insert into departments values(1,'Accounting');

insert into departments values(2,'Computer Science');

insert into users values(1,'','','admin@localhost.localdomain','Prasanth','','Reddy','abcd','','admin');

insert into users values(2,'','','staff1@localhost.localdomain','Rishi','','Keshav','abcd','','staff');

insert into users values(3,'','','staff2@localhost.localdomain','Anand','','Suresh','abcd','','staff');

insert into users values(4,'Indian','1/1/1990','student1@localhost.localdomain','Satish','Male','Kumar','abcd','0987654321','student');

insert into users values(5,'African','3/3/1989','student2@localhost.localdomain','Suraj','Male','T','abcd','6463829464','student');

insert into programs values(1,'MS',1);

insert into programs values(2,'MS',2);

insert into application values(1,'New','123456789',CURRENT_DATE,'student1@localhost.localdomain','Satish','4.0','333','Kumar','Fall 2016','109','',1,1,4);

insert into application values(2,'New','374953620',CURRENT_DATE,'student2@localhost.localdomain','Suraj','4.0','300','T','Fall 2016','100','',2,2,5);

insert into degree values(1,'BE','Accounting','3years','VTU',1);

insert into degree values(2,'BE','Computer Science','4years','VTU',2);

insert into applicationadditionalfields values(1,'GMAT','required','300',1,1);

insert into applicationadditionalfields values(2,'GRE','required','290',1,2);

insert into applicationstatus values(1,'','New',CURRENT_DATE,1);

insert into applicationstatus values(2,'','New',CURRENT_DATE,2);