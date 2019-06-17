create table tests(
    id int auto_increment primary key not null,
    title varchar(200) unique not null
);

create table questions(
    id int auto_increment primary key not null,
    text varchar(400) not null,
    tid int not null,
    foreign key (tid) references tests(id) on delete cascade
);

-- bit change to boolean in mysql
create table answers(
    id int auto_increment primary key not null,
    text varchar(100) not null,
    qid int not null,
    foreign key (qid) references questions(id) on delete cascade,
    correct boolean not null default False
);

create table users(
    id int auto_increment primary key not null,
    name varchar(20) not null unique
);

create table answer_history(
    id int auto_increment primary key not null,
    uid int not null,
    foreign key (uid) references users(id) on delete cascade, 
    aid int not null,
    foreign key (aid) references answers(id) on delete cascade, 
    date datetime not null default CURRENT_TIMESTAMP
);

create table score_history(
    id int auto_increment primary key not null,
    uid int not null,
    foreign key (uid) references users(id) on delete cascade, 
    tid int not null,
    foreign key (tid) references tests(id) on delete cascade, 
    score int not null,
    date datetime not null default CURRENT_TIMESTAMP
);