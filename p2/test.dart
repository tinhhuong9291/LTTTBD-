import 'main.dart';
import 'danhsachsv.dart';

void main() {
  SinhVien sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  sv.hienThiDanhSachSV(); // Ho ten: Nguyen Van A, Tuoi: 20, Ma SV: SV001, Diem TB: 8.5
  print('Ket qua: ${sv.xepLoaiSv()}');
  sv.hoten = 'Nguyen Van B';
  sv.tuoi = 21;
  sv.masv = 'SV002';
  sv.diemtb = 7.5;
  print(
      '========================================================================');
  sv.hienThiDanhSachSV();
  print('Ket qua: ${sv.xepLoaiSv()}'); //xep loai sinh vien
  sv.hoten = '';
  print(
      '========================================================================');
  sv.hienThiDanhSachSV();
  print('Ket qua: ${sv.xepLoaiSv()}');

  var lop = LopHoc('Lop 21DTHF1', []);
  lop.themSinhVien(SinhVien('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(SinhVien('Nguyen Van B', 20, 'SV002', 7.5));
  lop.themSinhVien(SinhVien('Nguyen Van C', 20, 'SV003', 6.5));
  lop.themSinhVien(SinhVien('Nguyen Van D', 20, 'SV004', 8));
  lop.themSinhVien(SinhVien('Nguyen Van F', 20, 'SV005', 9.5));
  lop.hienThiDanhSachByList();
}
