create table tbl_board(
	bno int auto_increment primary key,
    title varchar(200) NOT NULL,
	content varchar(2000) NOT NULL,
	writer varchar(50) NOT NULL,
	regdate datetime DEFAULT CURRENT_TIMESTAMP,
	updatedate datetime DEFAULT CURRENT_TIMESTAMP
    );

create table tbl_reply(
	rno int auto_increment primary key,
    bno int not null references tbl_board(bno),
    reply varchar(1000) not null,
    replyer varchar(50) not null,
    replyDate datetime default current_timestamp,
    updateDate datetime default current_timestamp
    );
    
 alter table tbl_board add(replycnt int default 0);
    create table tbl_attach(
		uuid varchar(100) not null primary key,
        uploadPath varchar(200) not null,
        fileType char(1) default 'I',
        bno int references tbl_board(bno)
    );
    
    
create table users(username varchar(50) not null primary key,
    password varchar(50) not null,
    enabled char default '1');
    create table authorities(
    username varchar(50) not null,
    authority varchar(50)not null,
    constraint fk_authorities_users foreign key(username) references users(username));
    create unique index ix_auth_username on authorities(username, authority);
    
     create table tbl_member(
    userid varchar(50) not null primary key,
    userpw varchar(100) not null,
    username varchar(100) not null,
    regdate datetime default current_timestamp,
    updatedate datetime default current_timestamp,
    enabled char default '1');
    create table tbl_member_auth(
		userid varchar(50) not null,
        auth varchar(50) not null,
        constraint fk_member_auth foreign key(userid) references tbl_member(userid)
    );
    create table persistent_logins(
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null);
