import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang({
    required String tenCuaHang,
    required String diaChi,
  })  : _tenCuaHang = tenCuaHang,
        _diaChi = diaChi;

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print('Thêm điện thoại thành công: ${dienThoai.tenDienThoai}');
  }

  void capNhatDienThoai(String maDienThoai, DienThoai updatedDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai
          ..tenDienThoai = updatedDienThoai.tenDienThoai
          ..hangSanXuat = updatedDienThoai.hangSanXuat
          ..giaNhap = updatedDienThoai.giaNhap
          ..giaBan = updatedDienThoai.giaBan
          ..soLuongTonKho = updatedDienThoai.soLuongTonKho
          ..trangThai = updatedDienThoai.trangThai;
        print('Cập nhật điện thoại thành công: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.trangThai = false;
        print('Điện thoại đã ngừng kinh doanh: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhSachDienThoai.where((dienThoai) {
      return (ma != null && dienThoai.maDienThoai.contains(ma)) ||
          (ten != null &&
              dienThoai.tenDienThoai
                  .toLowerCase()
                  .contains(ten.toLowerCase())) ||
          (hang != null &&
              dienThoai.hangSanXuat.toLowerCase().contains(hang.toLowerCase()));
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua > hoaDon.dienThoai.soLuongTonKho) {
      print('Không đủ hàng trong kho để tạo hóa đơn.');
      return;
    }

    hoaDon.dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
    _danhSachHoaDon.add(hoaDon);
    print('Hóa đơn được tạo thành công: ${hoaDon.maHoaDon}');
  }

  List<HoaDon> timKiemHoaDon({String? ma, DateTime? ngay, String? tenKhach}) {
    return _danhSachHoaDon.where((hoaDon) {
      return (ma != null && hoaDon.maHoaDon.contains(ma)) ||
          (ngay != null && hoaDon.ngayBan == ngay) ||
          (tenKhach != null &&
              hoaDon.tenKhachHang
                  .toLowerCase()
                  .contains(tenKhach.toLowerCase()));
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTin();
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hoaDon) => tong + hoaDon.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hoaDon) => tong + hoaDon.tinhLoiNhuanThucTe());
  }

  List<DienThoai> thongKeTopBanChay() {
    var mapSoLuongBan = <DienThoai, int>{};

    for (var hoaDon in _danhSachHoaDon) {
      mapSoLuongBan[hoaDon.dienThoai] =
          (mapSoLuongBan[hoaDon.dienThoai] ?? 0) + hoaDon.soLuongMua;
    }

    var sortedList = mapSoLuongBan.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedList.map((entry) => entry.key).toList();
  }

  void thongKeTonKho() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          'Tên điện thoại: ${dienThoai.tenDienThoai}, Tồn kho: ${dienThoai.soLuongTonKho}');
    }
  }
}
