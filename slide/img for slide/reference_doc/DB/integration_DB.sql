Create database VerfiyCert;
Go

use VerfiyCert;

Create table [Certificate](
	[cert_id] char(45) not null primary key,--số hiệu vào sổ cấp bằng--
	stu_id int not null unique,
	[order] int,							--Số hiệu--
	gra_year int,							--năm tốt nghiệp--
	graded char(20),						-- xếp loại (giỏi, trung bình, khá,...)--
	edu_level char(20),						--Hệ đào tạo (kỹ sư, cử nhân,...)--
	edu_program char(60),					--Chương trình đào tạo (Kỹ sư hệ thống thông tin, khoa học máy tính,...)--
	edu_type char(45),						-- Hình thức đào tạo (chính quy,...)--
	finish_time date ,						--ngày cấp--
	issuer char(45)							--cơ sở cấp--
);
Go
Create table Study_info(
	stu_id int not null,	-- mã sinh viên --
	class_id int not null,	-- mã lớp --
	subj_id int not null,	--mã học phần--
	subj_name char(60),		--tên học phần--
	credit_subj int,		--số tín học phần--
	semester char(20),		--học kỳ --
	process_scores int,		--điểm quá trình--
	final_scores int,		--điểm cuối kỳ--
	word_scores int,		--điểm bằng chữ--
	
	constraint Point_PK primary key (stu_id,class_id),
	constraint to_student foreign key (stu_id) references [Certificate](stu_id),
);
Go