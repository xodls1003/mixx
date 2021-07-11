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