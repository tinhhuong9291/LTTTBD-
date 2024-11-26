import 'dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  //contructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);
  //getter & setter
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw ArgumentError('Mã hóa đơn không hợp lệ (định dạng: HD-XXX).');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không được sau ngày hiện tại.');
    }
    _ngayBan = value;
  }

  DienThoai get dienThoai => _dienThoai;

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoai.soLuongTonKho) {
      throw ArgumentError(
          'Số lượng mua phải lớn hơn 0 và không vượt quá số lượng tồn kho.');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0.');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên khách hàng không được để trống.');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (value.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)) {
      throw ArgumentError(
          'Số điện thoại khách không hợp lệ (định dạng: 10 chữ số).');
    }
    _soDienThoaiKhach = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: ${_ngayBan.toLocal()}');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
  }
}
