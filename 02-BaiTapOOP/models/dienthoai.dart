class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //contructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

  //getter
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isNotEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(value)) {
      throw ArgumentError('Mã điện thoại không hợp lệ (định dạng: DT-XXX).');
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên điện thoại không được để trống.');
    }
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Hãng sản xuất không được để trống.');
    }
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá nhập phải lớn hơn 0.');
    }
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= _giaNhap) {
      throw ArgumentError('Giá bán phải lớn hơn giá nhập.');
    }
    _giaBan = value;
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int value) {
    if (value < 0) {
      throw ArgumentError('Số lượng tồn kho không được nhỏ hơn 0.');
    }
    _soLuongTonKho = value;
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
    print('Lợi nhuận dự kiến: ${tinhLoiNhuan()}');
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}
