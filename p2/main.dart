// Lop sinh vien
class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  // constructor
  SinhVien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  //getter
  String get hoten => _hoTen;
  int get tuoi => _tuoi;
  String get masv => _maSV;
  double get diemtb => _diemTB;

  //setter
  set hoten(String hoten) {
    _hoTen = (hoten.isNotEmpty) ? hoten : _hoTen;
  }

  set tuoi(int tuoi) {
    _tuoi = (tuoi > 0) ? tuoi : _tuoi;
  }

  set masv(String masv) {
    _maSV = (masv.isNotEmpty) ? masv : _maSV;
    _maSV = (masv.length == 10) ? masv : _maSV;
  }

  set diemtb(double diemtb) {
    _diemTB = (diemtb >= 0 && diemtb <= 10) ? diemtb : _diemTB;
  }

  //method
  void hienThiDanhSachSV() {
    print('Ho ten: $_hoTen,\nTuoi: $_tuoi,\nMa SV: $_maSV,\nDiem TB: $_diemTB');
  }

  //method ranking student by diemTB
  String xepLoaiSv() {
    if (_diemTB >= 8.5) {
      return 'Gioi';
    }
    if (_diemTB >= 7) {
      return 'Kha';
    }
    if (_diemTB >= 5) {
      return 'Trung Binh';
    }
    return 'Yeu';
  }
}
