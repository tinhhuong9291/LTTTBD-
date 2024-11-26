import 'main.dart';

class LopHoc {
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop, this._danhSachSV);

  //getter
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //setter
  set tenLop(String tenLop) {
    _tenLop = (tenLop.isNotEmpty) ? _tenLop : tenLop;
  }

  // Them sinh vien
  void themSinhVien(SinhVien sv) {
    _danhSachSV.add(sv);
  }

  void hienThiDanhSachByList() {
    print('\n\n---------------------------------------');
    print('Danh sach sinh vien trong lop: ${_tenLop}');
    for (var sv in _danhSachSV) {
      print('\nThong tin sinh vien:\n');
      sv.hienThiDanhSachSV();
      print('\nXep Loai: ${sv.xepLoaiSv()}');
      print('\n\n---------------------------------------');
    }
  }
}
