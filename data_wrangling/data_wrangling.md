### Giới Thiệu Về Data Wrangling

Data Wrangling là gì?

- Quá trình chuyển đổi dữ liệu từ một định dạng này sang định dạng khác.
- Ứng dụng: Từ file văn bản, log file thành biểu đồ, thống kê hoặc định dạng khác.

Tầm quan trọng:

- Phổ biến trong các thao tác xử lý dữ liệu, đặc biệt là khi kết hợp nhiều chương trình.
- Công cụ như pipe (`|`) giúp kết hợp các chương trình với nhau để thực hiện Data Wrangling.

### Nguồn Dữ Liệu

- Cần có dữ liệu ban đầu để thực hiện Data Wrangling.
- Ví dụ: Log file từ hệ thống Linux với công cụ `journalctl`.
- Log chứa nhiều dữ liệu, cần lọc ra thông tin cần thiết.

### Công Cụ Grep & SSH

Lệnh `grep`:

- Dùng để lọc các dòng chứa từ khóa "SSH" từ log file.
- Ví dụ: `journalctl | grep SSH`
- Mục đích: Tìm các lần truy cập SSH vào máy chủ.

SSH (Secure Shell):

- Phương pháp truy cập máy tính từ xa qua dòng lệnh.
- Ví dụ: Lọc các kết nối SSH không thành công bằng `grep "invalid user"`.

### Dùng Stream Editor (sed) Để Thay Thế Dữ Liệu

`sed`: Công cụ mạnh mẽ để thay đổi dòng dữ liệu theo cách tùy chỉnh.

- Thực hiện thay thế nội dung trong dòng log bằng cách loại bỏ các phần không cần thiết.
- Ví dụ: `sed 's/disconnected from//g'` loại bỏ chuỗi "disconnected from".

### Biểu Thức Chính Quy (Regular Expressions)

Regular Expressions (RegEx):

- Cách mạnh mẽ để tìm kiếm và thay thế chuỗi dựa trên các mẫu.
- Ví dụ: `.disconnected from` có thể tìm bất kỳ chuỗi nào trước "disconnected from" và loại bỏ nó.

Ký tự đặc biệt trong RegEx:

- `.` đại diện cho bất kỳ ký tự nào.
- `*` đại diện cho 0 hoặc nhiều ký tự.
- `[abc]` đại diện cho ký tự a, b hoặc c.
- `^` đại diện cho bắt đầu dòng, `$` đại diện cho kết thúc dòng.

### Công Cụ Khác Trong Data Wrangling

Sort: Sắp xếp các dòng dữ liệu.
Unique: Lọc các dòng trùng lặp và đếm tần suất.

- Ví dụ: `sort | uniq -c` để đếm số lần xuất hiện của mỗi dòng.

Awk: Công cụ xử lý dòng và cột.

- Ví dụ: `awk '{print $2}'` chỉ in ra cột thứ 2 từ đầu vào.

### Tính Toán & Số Liệu Với BC

BC: Máy tính dòng lệnh cho các phép tính số học.

- Ví dụ: Tính tổng số lần đăng nhập với `echo '1+2' | bc`.

Kết hợp các công cụ khác như `sort`, `uniq` để thống kê.

### Xargs & Các Công Cụ Hỗ Trợ

Xargs: Chuyển đổi đầu ra từ một lệnh thành tham số cho một lệnh khác.

- Ví dụ: `echo "file1 file2" | xargs rm` để xóa các file.

FFmpeg: Công cụ xử lý video và ảnh.

- Ví dụ: Lấy khung hình đầu tiên từ webcam với `ffmpeg`.

### Tóm Tắt

- Data Wrangling giúp xử lý và chuyển đổi dữ liệu từ định dạng này sang định dạng khác.
- Các công cụ như `grep`, `sed`, `awk`, `sort` và `uniq` là những công cụ mạnh mẽ hỗ trợ quá trình này.
- Regular expressions là phần quan trọng trong việc tìm kiếm và thay thế dữ liệu.
- Kết hợp nhiều công cụ có thể giúp bạn xử lý những tệp dữ liệu lớn một cách hiệu quả.

### Code example
