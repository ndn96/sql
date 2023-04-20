-- 1. Tạo truy vấn hiển thị nhwunxg sinh viên họ Lê,bao gồm nhữn thông tin: Mã sinh viên,họ đệm,tên,ngày sinh,giới tính.
select MaSinhVien as N'Mã Sinh Viên',HoDem as N'Họ Đệm',Ten as N'Tên',NgaySinh as N'Ngày Sinh', 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN where HoDem like N'%Lê%';

-- 2.
select MaSinhVien as N'Mã Sinh Viên',HoDem as N'Họ Đệm',Ten as N'Tên',NgaySinh as N'Ngày Sinh', 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN where HoDem like N'%Thị%';

-- 3.
select MaSinhVien as N'Mã Sinh Viên',(HoDem + ' ' +Ten) as N'Họ và Tên',NgaySinh as N'Ngày Sinh', 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN where HoDem like N'Dư%' or Ten like N'N%';


select * from SINHVIEN;
-- 4.
select MaSinhVien as N'Mã Sinh Viên',(HoDem + ' ' +Ten) as N'Họ và Tên',NgaySinh as N'Ngày Sinh', 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN where NoiSinh like N'%Huế%';

-- 5.
select MaSinhVien as N'Mã Sinh Viên',(HoDem + ' ' +Ten) as N'Họ và Tên',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh', 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN
-- Cach 1
-- where month(NgaySinh) between 3 and 8 and year(NgaySinh) = 1992;
-- Cach 2

-- where NgaySinh between '1992-03-01' and '1992-08-31';
-- Cach 3
-- where NgaySinh like '1992-0[3-8]-%'




-- 6.
select MaSinhVien as N'Mã Sinh Viên',(HoDem + ' ' +Ten) as N'Họ và Tên',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh',MaLop, 
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SINHVIEN where GioiTinh = 0 or month(NgaySinh) between 5 and 11;

select * from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop;

select MaSinhVien as N'Mã Sinh Viên',Lop.MaLop as N'Mã lớp',Lop.TenLop as N'Tên lớp',(HoDem + ' ' +Ten) as N'Họ và Tên',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh',
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop
where GioiTinh = 0
or month(NgaySinh) between 5 and 11;

-- 7.
select MaSinhVien as N'Mã Sinh Viên',
Lop.MaLop as N'Mã lớp',
Lop.TenLop as N'Tên lớp',
(HoDem + ' ' +Ten) as N'Họ và Tên',
LEFT(HoDem, CHARINDEX(' ', HoDem + ' ') -1) as N'Họ',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh',
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop
--where 'Ho' like N'Võ';
where LEFT(HoDem, CHARINDEX(' ', HoDem + ' ') -1) not in (N'Lê',N'Trần',N'Võ',N'Nguyễn');


--8

select MaSinhVien as N'Mã Sinh Viên',
Lop.MaLop as N'Mã lớp',
Lop.TenLop as N'Tên lớp',
(HoDem + ' ' +Ten) as N'Họ và Tên',
LEFT(HoDem, CHARINDEX(' ', HoDem + ' ') -1) as N'Họ',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh',
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop
--where 'Ho' like N'Võ';
where LEFT(HoDem, CHARINDEX(' ', HoDem + ' ') -1) like N'Lê' and Ten in (N'Nga',N'Lý');

--9

select MaSinhVien as N'Mã Sinh Viên',
Lop.MaLop as N'Mã lớp',
Lop.TenLop as N'Tên lớp',
(HoDem + ' ' +Ten) as N'Họ và Tên',
LEFT(HoDem, CHARINDEX(' ', HoDem + ' ') -1) as N'Họ',NgaySinh as N'Ngày Sinh',NoiSinh as N'Nơi Sinh',
case
	when GioiTinh = 1 then N'Nam'
	when GioiTinh = 0 then N'Nữ'
end as N'Giới Tính'
from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop
where NoiSinh = '';

--10. Tạo truy vấn hiển thị tổng số sinh viên theo từng lớp(Lưu ý,những Lớp chưa có sinh viên cũng được hiển thị)

select
Lop.TenLop as N'Tên lớp',
count(*) as N'Tổng Số SV'
from SinhVien right join Lop on SinhVien.MaLop = Lop.MaLop
group by Lop.TenLop
having count(MaSinhVien) >= 0
--11
select L.MaLop, TenLop
from SINHVIEN as S right join LOP as L
on S.MaLop = L.MaLop
group by L.MaLop, TenLop
having count(MaSinhVien) = 0

--12
select top 5 NoiSinh,
count(*) as 'Tổng Số'
from SinhVien
--where NoiSinh like N'%Huế%'
group by NoiSinh
--having NoiSinh like N'%Huế%';
ORDER BY N'Tổng Số' DESC;


select top 10 NoiSinh,
case
	when NoiSinh like N'%Huế%' then N'Thừa Thiên Huế'
	else NoiSinh
end as N'Nơi Sinh',
count(*) as 'Tổng Số'
from SINHVIEN
group by NoiSinh
having NoiSinh like N'%Huế%'
ORDER BY N'Tổng Số' DESC;

select *
from SinhVien
where
NoiSinh like N'%Huế%'

select top 5 NoiSinh,
count(*) as 'Tổng Số'
from SINHVIEN
group by NoiSinh
ORDER BY N'Tổng Số' DESC;

--13

select S.MaSinhVien,HoDem, Ten,DiemMon1
from SinhVien as S inner join DIEMTS as D
on S.MaSinhVien = D.MaSinhVien
where DiemMon1 = (select max(DiemMon1) from DIEMTS)
--ORDER BY N'Tổng Số' DESC;

select avg(DiemMon1), avg(DiemMon2), avg(DiemMon3)
from DIEMTS;

--13

select top 5 S.MaSinhVien,HoDem, Ten,(DiemMon1+DiemMon2+DiemMon3)/3 as 'DTB',
GioiTinh,
case
	when GioiTinh = 0 then N'Nữ'
	when GioiTinh = 1 then N'Nam'
end as N'Giới Tính'
from SinhVien as S inner join DIEMTS as D
on S.MaSinhVien = D.MaSinhVien
ORDER BY N'DTB' DESC, GioiTinh ASC;


--where DiemMon1 = (select max(DiemMon1) from DIEMTS)