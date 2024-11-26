class NhanVien {
  String _maNV;
  String _hoTen;
  double _luongCoBan;

// constructor
  NhanVien(this._maNV, this._hoTen, this._luongCoBan);

//Getter
  String get maNV => _maNV;
  String get hoten => _hoTen;
  double get luongCoBan => _luongCoBan;

  //setter
  set hoten(String hoten) {
    _hoTen = (hoten.isNotEmpty) ? hoten : _hoTen;
  }

  set maNV(String maNV) {
    _maNV = (maNV.isNotEmpty) ? maNV : maNV;
    _maNV = (maNV.length == 10) ? maNV : maNV;
  }

  set luongCoBan(double luongCoBan) {
    _luongCoBan = (luongCoBan >= 0) ? luongCoBan : luongCoBan;
  }

  double tinhLuong() {
    return _luongCoBan;
  }

  //method
  void hienThiDanhSachNV() {
    print(
        'Ma Nhan Vien: $_maNV,\nHo ten: $_hoTen,\nLuong co ban: $_luongCoBan,\nTong Luong: ${tinhLuong()}');
  }
}
