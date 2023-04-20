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
from SINHVIEN where HoDem like N'Dư' or Ten like N'N%';


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
where month(NgaySinh) between 3 and 8 and year(NgaySinh) = 1992;

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


