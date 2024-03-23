create database ClothingStore1
go
use ClothingStore1
go

create table Category(
	CategoryID int identity(1,1) primary key not null,
	CategoryName nvarchar(MAX)
)

--insert category
insert into Category values(N'Điện thoại')
insert into Category values(N'Laptop')

create table NSX(
	IDnsx int identity(1,1) primary key not null,
	TenNSX nvarchar(max)
)

--insert NSX
insert into NSX values(N'Samsung')
insert into NSX values(N'Oppo')
insert into NSX values(N'Iphone')

create table Customer(
	IDCus int identity(1,1) primary key not null,
	EmailCus nvarchar(max),
	Password nvarchar(max),
	CustomerName nvarchar(max)
)

create table admin(
	IDAd int identity(1,1) primary key not null,
	EmailAd nvarchar(max),
	PasswordAd nvarchar(max),
	AdminName nvarchar(max)
);

create table DonHang(
	IDOrder int identity(1,1) primary key not null,
	IDCus int,
	DateOrder date,
	Address nvarchar(max),
	Status int
	constraint FK_IDCus foreign key (IDCus) references Customer(IDCus) 
);

create table Product(
	ProductID int identity(1,1) primary key not null,
	CategoryID int,
	IDnsx int,
	quantity int,
	ProductName nvarchar(max),
	DecriptionPro nvarchar(max),
	price decimal(18, 0),
	ImagePro nvarchar(MAX)
	constraint FK_CategoryID foreign key (CategoryID) references Category(CategoryID), 
	constraint FK_NSX foreign key (IDnsx) references NSX(IDnsx) 
)

--insert Product
insert into Product values(1, 1, 100, N'Samsung galaxy A05', N'Samsung Galaxy A05 với mục tiêu đem lại sự sang trọng
và hợp thời trong một thiết kế vuông vức hoàn hảo. Được làm từ chất liệu nhựa, chiếc điện thoại Android này mang lại
cảm giác cầm nắm nhẹ nhàng đồng thời tiết kiệm được chi phí sản xuất giúp giá thành bán ra dễ dàng tiếp cận.', 3090000, N'Samsung A05.png')
insert into Product values(1, 1, 100, N'Samsung Galaxy S23 Ultra 5G 256GB', N'Samsung Galaxy S23 Ultra 5G 256GB là chiếc smartphone cao cấp
nhất của nhà Samsung, sở hữu cấu hình không tưởng với con chip khủng được Qualcomm tối ưu riêng cho dòng Galaxy và camera lên đến 200 MP,
xứng danh là chiếc flagship Android được mong đợi nhất trong năm 2023.', 31990000, N'samsung-galaxy-s23.jpg')
insert into Product values(1, 1, 100, N'Samsung Galaxy Z Flip4 5G 128GB', N'Samsung Galaxy Z Flip4 128GB đã chính thức ra mắt thị trường
công nghệ, đánh dấu sự trở lại của Samsung trên con đường định hướng người dùng về sự tiện lợi trên những chiếc điện thoại gập. Với độ
bền được gia tăng cùng kiểu thiết kế đẹp mắt giúp Flip4 trở thành một trong những tâm điểm sáng giá cho nửa cuối năm 2022.', 12990000,
N'samsung-galaxy-flip4.jpg')
insert into Product values(1, 3, 100, N'iPhone 15 Pro Max 512GB', N'iPhone 15 Pro Max 512GB là sự kết hợp hoàn hảo giữa dung lượng lưu trữ
lớn, hiệu suất mạnh mẽ và màn hình xuất sắc. Điều này khiến giá iPhone 15 Pro Max cũng cao nhất trong series iPhone mới năm 2023.',
40290000, N'iphone-15-pro-max-black.jpg')
insert into Product values(1, 3, 100, N'iPhone 14 Pro Max 128GB', N'iPhone 14 Pro Max một siêu phẩm trong giới smartphone được nhà Táo tung
ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới,
hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.', 27090000, N'iphone-14-pro-max-tim.jpg')

create table OrderDetails(
	ID int identity(1,1) primary key not null,
	ProductID int,
	IDOrder int,
	quantity int,
	UnitPrice decimal(18, 0),
	constraint FK_ProductID foreign key (ProductID) references Product(ProductID),
	constraint FK_IDOrder foreign key (IDOrder) references DonHang(IDOrder) 
)

