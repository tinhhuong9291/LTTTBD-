import '../models/nhanvien.dart';
import '../models/nhanviensale.dart';

void main() {
  NhanVien nv = NhanVien('NV001', 'Nguyen Van A', 8500000);
  print('\nNhân viên thông thường: ');
  nv.hienThiDanhSachNV();

  NhanVienSale nvsale =
      NhanVienSale('NV002', 'Nguyen Van B', 5000000, 100000000, 0.5);
  print('\nNhân Viên sales');
  nvsale.hienThiThongTin();
}
