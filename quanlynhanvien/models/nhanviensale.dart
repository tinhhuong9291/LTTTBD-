import 'nhanvien.dart';

class NhanVienSale extends NhanVien {
  double _doanhso;
  double _hoahong;

  NhanVienSale(String maNV, String hoten, double luongCoBan, this._doanhso,
      this._hoahong)
      : super(maNV, hoten, luongCoBan);

  // getter
  double get doanhso => _doanhso;
  double get hoahong => _hoahong;

  //setter
  set doanhso(double doanhso) {
    _doanhso = (doanhso >= 0) ? doanhso : _doanhso;
  }

  set hoahong(double hoahong) {
    _hoahong = (hoahong >= 0 && hoahong <= 1) ? hoahong : _hoahong;
  }

  @override
  double tinhLuong() {
    return luongCoBan + (doanhso * hoahong);
  }

  @override
  void hienThiThongTin() {
    super.hienThiDanhSachNV();
    print('\nDoanh số: $_doanhso');
    print('\nHoa hồng: $_hoahong');
  }
}
