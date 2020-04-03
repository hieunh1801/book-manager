# Quản lý mượn trả sách

## Technology
- Angular 
- Spring Boot
- SQL Server

## Member
- Nguyen Huu Hieu
- Nguyen Xuan Son

## Chức năng

- 1. Quản lý sách
    - Quản lý thông tin sách(thêm, sửa, xóa, tìm kiếm)
        - Mã sách
        - Tên sách
        - Ngày nhập sách vào clb(tính ngày đầu tiên thêm sách vào clb sách)
        - Thể loại sách (tách thành bảng danh mục) (văn học, nghệ thuật, tiểu thuyết, kĩ năng)
        - Tác giả (lưu một trường text để tiện tra cứu)
        - Tổng số cuốn sách
        - Số sách còn lại trong kho

- 2. Quản lý mượn trả
    - Màn hình tìm kiếm: tìm kiếm theo trạng thái( sắp tới hạn trả sách)
    - Mượn sách: 
        - 1 người mượn tối đa 2 quyển trong 1 lần mượn
        - Ngày mượn: ngày hiện tại
        - Ngày trả: 20 ngày tính từ ngày mượn
        - Điều kiện mượn sách:
            - Có thông tin trong thông tin bạn đọc
            - Không có quyển sách nào trễ hạn trả
            - Còn sách trong kho
        - Gia hạn: 7 ngày
    - Trả sách:
        - Không có gì

- 3. Quản lý thông tin bạn đọc
    - quản lý người mượn
        - Mã bạn đọc
        - Tên bạn đọc
        - Ảnh đại diện
        - Số điện thoại
        - Email
        - Đơn vị 

- 4. Quản lý user
    - User:
        - tên người dùng
        - mã người dùng (cập nhật theo id)
        - tên đăng nhập
        - mật khẩu

- 5. Thống kê
    - Thống kê theo thời gian(tuần, tháng, quý, năm):
        - Hướng về người mượn: 
            + thông tin người mượn sách
            + mượn bao nhiêu quyển
            + trả bao nhiêu quyển 
            + còn bao nhiêu quyển trễ hạn trả
        - Hướng về sách: 
            + mã sách, 
            + tên sách, 
            + trong kho còn bao nhiêu quyển sách, 
            + đã cho mượn bao nhiêu quyển, 
            + tổng số quyển sách?
        - Hướng về số lượt mượn sách: 
            + trong tháng có bao nhiêu lượt mượn sách
            + trong tháng có bao nhiêu lượt trả
- enity:
    - DTO: input từ form nhập
    - BO: là map với các bảng trong database
    - BEAN: là map để lấy dữ liệu trả về để form hiển thị



## Chức năng gom cụm lại
- Quản lý sách: Hiếu
    - Quản lý sách
        + Thêm, sửa, xóa, tìm kiếm sách
        + Import sách từ file Exel
    - Quản lý các đầu mục sách
        + Thêm, sửa, xóa, tìm kiếm các đầu mục sách
        + Import các category từ file Exel

- Quản lý user: Hiếu
    - Quản lý user
        + Thêm, sửa, xóa, tìm kiếm user
        + Inport user từ file Exel
    - Quản lý thông tin các member
        + Thêm sửa xóa, tìm kiếm các member
        + Import member từ file Exel

- Quản lý mượn trả sách: Sơn
    - Quản lý mượn trả sách
        + Quản lý mượn sách
        + Quản lý trả sách
        + Thống kê trạng thái của các đầu sách
    - Cấu hình các tham số (điều kiện mượn trả sách)

- Cấu hình người dùng: Sơn
    - Cho phép người dùng tự chỉnh sửa profile của mình