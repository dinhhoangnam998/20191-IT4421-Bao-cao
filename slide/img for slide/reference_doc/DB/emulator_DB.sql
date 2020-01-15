Create database QLSV;
Go

use QLSV;
-- bảng dữ liệu sinh viên--

create table Student(
	stu_id int not null primary key,--msv--
	[name] char(45),		--ten--
	gender char(3),			--gioi tinh--
	start_year int,			--năm nhập học--
	class char(45),			--lớp--
	edu_level char(45),		--bậc đào tạo (đại trà,...)--
	[session] char(10),		--khoá--
	edu_program char(60),	--chương trình đào tạo ( CT Nhóm ngành CNTT-TT 2-2016, ...)
	email char(45),			--email--
	mng_institue char(60),	--viện quản lý--
	[status] char (20)		--tình trạng học tập--
);
Go
--Hoc phần--
create table [Subject](
	subj_id int not null primary key,
	[name] char(60),
	credit_subj int,	--Số tín học phần--
	credit_pay int		--Số tín học phí
);
Go
--Điểm theo từng môn học của sinh viên--
Create table Scores(
	stu_id int not null,	-- mã sinh viên --
	class_id int not null,	-- mã lớp --
	subj_id int not null,	--mã học phần--
	semester char(20),		--học kỳ --
	process_scores int,		--điểm quá trình--
	final_scores int,		--điểm cuối kỳ--
	word_scores int,			--điểm bằng chữ--

	constraint Point_PK primary key (stu_id,class_id),
	constraint to_student foreign key (stu_id) references Student(stu_id),
	constraint to_term foreign key (subj_id) references [Subject](subj_id)
);
Go

--Tốt nghiệp (dành cho sinh viên đã hoàn thành chương trình đào tạo)--
Create table Graduate(
	[cert_id] char(45) not null primary key,--số hiệu vào sổ cấp bằng--
	stu_id int not null,
	[order] int,							--Số hiệu--
	gra_year int,							--năm tốt nghiệp--
	graded char(20),						-- xếp loại (giỏi, trung bình, khá,...)--
	edu_level char(20),						--Hệ đào tạo (kỹ sư, cử nhân,...)--
	edu_program char(60),					--Chương trình đào tạo (Kỹ sư hệ thống thông tin, khoa học máy tính,...)--
	edu_type char(45),						-- Hình thức đào tạo (chính quy,...)--
	finish_time date ,						--ngày cấp--

	constraint of_student foreign key (stu_id) references Student(stu_id)
);
Go
