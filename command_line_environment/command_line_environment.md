## Môi Trường Dòng Lệnh (Command-Line Environment)

### Mục Lục

1. Quản Lý Công Việc (Job Control)
2. Multiplexers Terminal
3. Tệp Dotfiles và Cấu Hình Shell
4. Làm Việc với Máy Tính Từ Xa (Remote Machines)

### 1. Quản Lý Công Việc (Job Control)

#### Tổng Quan

- Dùng lệnh đơn giản: Thường chỉ chạy một lệnh tại một thời điểm, nhận kết quả đầu ra và kết thúc.
- Quản lý công việc: Chạy, tạm dừng, hoặc tiếp tục nhiều công việc trong cùng một phiên làm việc.

#### Các Tín Hiệu (Signals)

- `Ctrl+C` - SIGINT: Dừng quá trình đang chạy.
  - Ví dụ: Dùng lệnh `sleep 20` để tạm dừng 20 giây. Dùng `Ctrl+C` để gửi tín hiệu `SIGINT` và dừng quá trình.
- `Ctrl+\` - SIGQUIT: Buộc thoát khỏi chương trình.
- `SIGHUP`: Gửi khi có sự cố như mất kết nối terminal.
  - Ví dụ: Khi bạn đóng terminal trong khi còn các quá trình đang chạy.
- `SIGSTOP` và `SIGCONT`: Tạm dừng và tiếp tục quá trình.

#### Ví Dụ với Chương Trình Python

- Chương trình Python có thể xử lý tín hiệu `SIGINT` mà không dừng hoàn toàn.
  - Dùng `Ctrl+C` để gửi `SIGINT` nhưng chương trình không dừng.
  - Dùng `Ctrl+\` để gửi `SIGQUIT` và buộc chương trình dừng.

#### Quản Lý Công Việc với `jobs`

- `jobs`: Liệt kê các công việc hiện tại.
  - Ví dụ: Chạy `sleep 1000` và dùng `Ctrl+Z` để tạm dừng, sau đó kiểm tra với `jobs`.
- Chạy nền (Background) và nền trước (Foreground):
  - Chạy nền: Dùng `&` khi chạy lệnh, ví dụ `sleep 1000 &`.
  - Tiếp tục công việc trong nền: `bg %1` (với `%1` là ID công việc).
  - Chuyển công việc về nền trước: `fg %1`.
- `kill`: Gửi tín hiệu dừng hoặc tạm dừng đến các công việc.
  - Ví dụ: `kill -STOP %1` để tạm dừng công việc.

### 2. Multiplexers Terminal

#### Giới Thiệu về Tmux

- Tmux: Công cụ cho phép tạo nhiều không gian làm việc (workspaces) trong một phiên terminal duy nhất.
- Cấu trúc của Tmux:
  - Session: Phiên làm việc độc lập.
  - Window: Các cửa sổ trong mỗi phiên làm việc.
  - Pane: Khung trong mỗi cửa sổ.

#### Các Lệnh Cơ Bản của Tmux

- Tạo phiên Tmux:
  - `tmux` hoặc `tmux new -t session_name`.
- Tách và Đính Lại vào Phiên:
  - `Ctrl+B`, sau đó `D`: Tách khỏi phiên.
  - `tmux attach -t session_name`: Đính lại vào phiên.
- Quản lý Cửa Sổ:
  - `Ctrl+B`, sau đó `C`: Tạo cửa sổ mới.
  - `Ctrl+B`, sau đó `P` hoặc `N`: Chuyển đổi giữa các cửa sổ.
  - `Ctrl+B`, sau đó `&`: Đóng cửa sổ hiện tại.
- Quản lý Khung (Panes):
  - `Ctrl+B`, sau đó `"`: Chia khung ngang.
  - `Ctrl+B`, sau đó `%`: Chia khung dọc.
  - `Ctrl+B`, sau đó mũi tên: Di chuyển giữa các khung.
  - `Ctrl+B`, sau đó `Z`: Phóng to hoặc thu nhỏ khung.

#### Cấu Hình Tmux

- Tùy chỉnh Tmux:
  - Sử dụng tệp `.tmux.conf` để cấu hình Tmux.
  - Có thể thay đổi phím tắt, màu sắc, và cấu trúc khung.

### 3. Tệp Dotfiles và Cấu Hình Shell

#### Alias và Cấu Hình Shell

- Alias:
  - Tạo lệnh tắt cho các lệnh thường dùng.
  - Ví dụ: `alias ll="ls -lah"` để rút ngắn `ls -lah`.
  - Tạo alias trong tệp cấu hình shell (`~/.bashrc`, `~/.zshrc`).
- Biến Môi Trường (Environment Variables):
  - Ví dụ: Thay đổi `PS1` để tùy chỉnh prompt.
  - Thêm các biến vào tệp cấu hình để tự động nạp khi mở shell.

#### Tệp Dotfiles

- Dotfiles:
  - Các tệp cấu hình bắt đầu bằng dấu chấm (`.`) và nằm trong thư mục `~`.
  - Ví dụ: `.bashrc`, `.vimrc`.
- Quản lý Dotfiles:
  - Sử dụng Git để quản lý và đồng bộ trên nhiều máy tính.
  - Dùng liên kết tượng trưng (symlink) để giữ dotfiles trong một thư mục và liên kết chúng với vị trí mặc định.
  - Ví dụ lệnh: `ln -s ~/dotfiles/.bashrc ~/.bashrc`.

#### Tìm và Học Từ Dotfiles của Người Khác

- Tìm trên GitHub để tham khảo dotfiles của người khác.
- Hiểu và thử nghiệm từng cấu hình thay vì sao chép nguyên xi.

### 4. Làm Việc với Máy Tính Từ Xa (Remote Machines)

#### Kết Nối SSH

- SSH: Kết nối đến máy từ xa an toàn.
  - Lệnh cơ bản: `ssh user@host`.
  - Chạy lệnh trực tiếp trên máy từ xa: `ssh user@host "command"`.
- Sử Dụng SSH Keys:
  - Tạo cặp khóa SSH với `ssh-keygen`.
  - Sao chép khóa công khai đến máy từ xa với `ssh-copy-id user@host`.
  - Kết nối mà không cần nhập mật khẩu mỗi lần.
- Cấu Hình SSH:

  - Tạo tệp cấu hình `~/.ssh/config` để đơn giản hóa lệnh SSH.
  - Ví dụ cấu hình:

    ```bash
    Host myserver
        HostName example.com
        User myuser
        IdentityFile ~/.ssh/id_rsa
    ```

  - Kết nối dễ dàng: `ssh myserver`.

#### Sao Chép Tệp qua SSH

- SCP:
  - Sao chép tệp giữa máy cục bộ và máy từ xa.
  - Ví dụ: `scp file.txt user@host:/path/on/server`.
- RSYNC:
  - Đồng bộ hóa tệp và thư mục, hữu ích khi sao chép nhiều tệp.
  - Ví dụ: `rsync -avz local_folder user@host:/path/on/server`.

#### Tmux với Máy Tính Từ Xa

- Tmux trên máy từ xa:
  - Chạy `tmux` trên máy từ xa để duy trì phiên làm việc.
  - Ngay cả khi mất kết nối, các phiên làm việc vẫn tiếp tục chạy.
  - Kết nối lại với `tmux attach`.

### Thực Hành và Hỏi Đáp

- Thực hành: Thử các lệnh và cấu hình trên máy của bạn để làm quen với môi trường dòng lệnh.
- Hỏi đáp: Tham gia giờ tư vấn để giải đáp các thắc mắc.
