# Hướng dẫn

Bộ công cụ này giúp bạn sao lưu toàn bộ "linh hồn" của hệ điều hành Ubuntu (phím tắt, giao diện, ứng dụng, cấu hình hệ thống) và tự động tạo ra file cài đặt để tái thiết lập trên máy mới chỉ với 1 cú click.

---

### Clone repository
Cài đặt bộ công cụ về máy:

```
sudo apt update && sudo apt install git -y
git clone https://github.com/tpc-pascal/GRUB2-PANA-CFXZ6-Ubuntu.git
cd GRUB2-PANA-CFXZ6-Ubuntu
```

---

### Sao lưu cấu hình (Backup)
Thực hiện lệnh này trên phân vùng Ubuntu hiện tại của bạn trước khi xóa hoặc khi muốn cập nhật cấu hình mới lên GitHub.

Mở Terminal tại thư mục chứa Repo.

Cấp quyền thực thi và chạy file script:

```
chmod +x backup.sh
sed -i 's/\r$//' backup.sh
./backup.sh
```

Sau khi chạy xong, script sẽ tự động quét hệ thống và tạo ra các file: packages.txt, ppa_list.txt, snaps.txt, thư mục configs/ và đặc biệt là file install.sh cá nhân hóa.

---

### Khôi phục cấu hình (Install)
Thực hiện lệnh này sau khi bạn đã cài mới Ubuntu và muốn máy chạy "y chang" như cấu hình trên repo.

Cấp quyền thực thi và chạy file script:

```
chmod +x install.sh
sed -i 's/\r$//' install.sh
./install.sh
```

Script sẽ tự động: Thêm lại các PPA, cài lại toàn bộ App, khôi phục phím tắt, cấu hình và đồng bộ giờ hệ thống.
