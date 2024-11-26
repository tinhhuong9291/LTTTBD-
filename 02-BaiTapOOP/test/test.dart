import '../models/dienthoai.dart';
import '../models/hoadon.dart';
import '../models/cuahang.dart';

void testValidationDienThoai() {
  print('--- Kiểm tra validation của lớp DienThoai ---');

  // Trường hợp hợp lệ
  try {
    var dienThoaiHopLe = DienThoai(
      'DT-001',
      'iPhone 14',
      'Apple',
      20000,
      25000,
      10,
      true,
    );
    print('Điện thoại hợp lệ được tạo thành công.');
    dienThoaiHopLe.hienThiThongTin();
  } catch (e) {
    print('Lỗi: $e');
  }

  // Trường hợp mã điện thoại sai định dạng
  try {
    var dienThoaiSaiMa = DienThoai(
      '001', // Sai định dạng "DT-XXX"
      'iPhone 14',
      'Apple',
      20000,
      25000,
      10,
      true,
    );
    print('Lỗi không được phát hiện cho mã điện thoại sai định dạng.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp tên điện thoại rỗng
  try {
    var dienThoaiTenRong = DienThoai(
      'DT-002',
      '', // Tên rỗng
      'Apple',
      20000,
      25000,
      10,
      true,
    );
    print('Lỗi không được phát hiện cho tên điện thoại rỗng.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp hãng sản xuất rỗng
  try {
    var dienThoaiHangRong = DienThoai(
      'DT-003',
      'iPhone 14',
      '', // Hãng sản xuất rỗng
      20000,
      25000,
      10,
      true,
    );
    print('Lỗi không được phát hiện cho hãng sản xuất rỗng.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp giá nhập không hợp lệ
  try {
    var dienThoaiGiaNhapSai = DienThoai(
      'DT-004',
      'iPhone 14',
      'Apple',
      -5000, // Giá nhập âm
      25000,
      10,
      true,
    );
    print('Lỗi không được phát hiện cho giá nhập âm.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp giá bán nhỏ hơn hoặc bằng giá nhập
  try {
    var dienThoaiGiaBanSai = DienThoai(
      'DT-005',
      'iPhone 14',
      'Apple',
      20000,
      20000, // Giá bán không lớn hơn giá nhập
      10,
      true,
    );
    print('Lỗi không được phát hiện cho giá bán không hợp lệ.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp số lượng tồn kho âm
  try {
    var dienThoaiTonKhoSai = DienThoai(
      'DT-006',
      'iPhone 14',
      'Apple',
      20000,
      25000,
      -5, // Số lượng tồn kho âm
      true,
    );
    print('Lỗi không được phát hiện cho số lượng tồn kho âm.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp hợp lệ (kiểm tra lợi nhuận)
  try {
    var dienThoaiTinhLoiNhuan = DienThoai(
      'DT-007',
      'Samsung Galaxy S22',
      'Samsung',
      15000,
      20000,
      5,
      true,
    );
    print('Lợi nhuận dự kiến: ${dienThoaiTinhLoiNhuan.tinhLoiNhuan()}');
  } catch (e) {
    print('Lỗi: $e');
  }
}

void testValidationHoaDon() {
  print('--- Kiểm tra validation của lớp HoaDon ---');

  // Tạo một điện thoại mẫu
  var dienThoai = DienThoai(
    'DT-001',
    'iPhone 14',
    'Apple',
    20000,
    25000,
    10,
    true,
  );

  // Trường hợp hóa đơn hợp lệ
  try {
    var hoaDonHopLe = HoaDon(
      'HD-001',
      DateTime.now(),
      dienThoai,
      5,
      26000,
      'Nguyen Van A',
      '0123456789',
    );
    print('Hóa đơn hợp lệ được tạo thành công.');
    hoaDonHopLe.hienThiThongTin();
  } catch (e) {
    print('Lỗi: $e');
  }

  // Trường hợp mã hóa đơn sai định dạng
  try {
    var hoaDonSaiMa = HoaDon(
      'HD001', // Sai định dạng "HD-XXX"
      DateTime.now(),
      dienThoai,
      2,
      26000,
      'Nguyen Van B',
      '0123456789',
    );
    print('Lỗi không được phát hiện cho mã hóa đơn sai định dạng.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp ngày bán sau ngày hiện tại
  try {
    var hoaDonSaiNgayBan = HoaDon(
      'HD-002',

      DateTime.now().add(Duration(days: 1)), // Ngày bán trong tương lai
      dienThoai,
      2,
      26000,
      'Nguyen Van C',
      '0123456789',
    );
    print('Lỗi không được phát hiện cho ngày bán sau hiện tại.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp số lượng mua lớn hơn tồn kho
  try {
    var hoaDonSaiSoLuong = HoaDon(
      'HD-003',
      DateTime.now(),
      dienThoai,
      15, // Số lượng mua > tồn kho
      26000,
      'Nguyen Van D',
      '0123456789',
    );
    print('Lỗi không được phát hiện cho số lượng mua lớn hơn tồn kho.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp giá bán thực tế không hợp lệ
  try {
    var hoaDonSaiGiaBan = HoaDon(
      'HD-004',
      DateTime.now(),
      dienThoai,
      2,
      -2000, // Giá bán thực tế âm
      'Nguyen Van E',
      '0123456789',
    );
    print('Lỗi không được phát hiện cho giá bán thực tế không hợp lệ.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp thông tin khách hàng không hợp lệ
  try {
    var hoaDonSaiThongTinKhach = HoaDon(
      'HD-005',
      DateTime.now(),
      dienThoai,
      2,
      26000,
      '', // Tên khách hàng rỗng
      'abc12345', // Số điện thoại sai định dạng
    );
    print('Lỗi không được phát hiện cho thông tin khách hàng không hợp lệ.');
  } catch (e) {
    print('Lỗi được phát hiện: $e');
  }

  // Trường hợp hợp lệ (kiểm tra tính toán)
  try {
    var hoaDonTinhToan = HoaDon(
      'HD-006',
      DateTime.now(),
      dienThoai,
      2,
      26000,
      'Nguyen Van F',
      '0987654321',
    );
    print('Tổng tiền hóa đơn: ${hoaDonTinhToan.tinhTongTien()}');
    print('Lợi nhuận thực tế: ${hoaDonTinhToan.tinhLoiNhuanThucTe()}');
  } catch (e) {
    print('Lỗi: $e');
  }
}

void main() {
  var cuaHang =
      CuaHang(tenCuaHang: 'Dien Thoai ABC', diaChi: '123 Nguyen Trai');

  print('-------------------------------------------------');
  print('kiểm tra validation');
  // check validation
  testValidationDienThoai();

  print('-------------------------------------------------');
  print('Tạo mới điện thoại');
  try {
    DienThoai dt = DienThoai(
      'DT-101',
      'iPhone 14',
      'Apple',
      20000,
      25000,
      10,
      true,
    );
    cuaHang.themDienThoai(DienThoai(
      'DT-102',
      'Samsung Galaxy S23',
      'Samsung',
      20000,
      35000,
      30,
      true,
    ));
    cuaHang.themDienThoai(DienThoai(
      'DT-103',
      'Samsung Galaxy S24',
      'Samsung',
      20000,
      35000,
      30,
      true,
    ));
    dt.hienThiThongTin();

    print('Có thể bán: ${dt.coTheBan() ? "Có" : "Không"}');
    print('-------------------------------------------------');
    print('Cập nhật điện thoại');
    // update infomation
    dt.trangThai = false;
    dt.hienThiThongTin();

    print('-------------------------------------------------');
    print('Hoá đơn');

    HoaDon hd = HoaDon(
      'HD-001',
      DateTime.now(),
      dt,
      2,
      26000,
      'Nguyen Van A',
      '0123456789',
    );
    HoaDon hd2 = HoaDon(
      'HD-002',
      DateTime(2024, 11, 15),
      dt,
      3,
      25500,
      'Nguyen Van B',
      '0987654321',
    );
    HoaDon hd3 = HoaDon(
      'HD-003',
      DateTime(2024, 11, 20),
      dt,
      7,
      525500,
      'Nguyen Van C',
      '0987265431',
    );
    cuaHang.taoHoaDon(hd2);
    cuaHang.taoHoaDon(hd3);
    hd.hienThiThongTin();
    print('-------------------------------------------------');
    print('tính tiền và lợi nhuận của hoá đơn');
    print('Tổng tiền: ${hd.tinhTongTien()}');
    print('Lợi nhuận thực tế: ${hd.tinhLoiNhuanThucTe()}');
  } catch (e) {
    print('Lỗi: $e');
  }
  print('-------------------------------------------------');
  print('check valication của hoá đơn');
  testValidationHoaDon();
  print('-------------------------------------------------');
  var doanhThu = cuaHang.tinhTongDoanhThu(
    DateTime(2024, 11, 1),
    DateTime(2024, 11, 20),
  );

  print('Doanh thu từ 01/11/2024 đến 20/11/2024: $doanhThu');

  // Tính lợi nhuận từ 01/11/2024 đến 20/11/2024
  var tongLoiNhuan = cuaHang.tinhTongLoiNhuan(
    DateTime(2024, 11, 1),
    DateTime(2024, 11, 20),
  );

  print('Tổng lợi nhuận từ 01/11/2024 đến 20/11/2024: $tongLoiNhuan');

  var topBanChay = cuaHang.thongKeTopBanChay();

  print('Top sản phẩm bán chạy:');
  for (var item in topBanChay) {
    print('${item.tenDienThoai} - Số lượng bán: ${item.soLuongTonKho}');
  }

  for (var item in topBanChay) {
    print('${item.tenDienThoai} - Số lượng bán: ${item.soLuongTonKho}');

    if (item != null) {
      print('${item.tenDienThoai} - Số lượng bán: ${item.soLuongTonKho}');
    } else {
      print('Sản phẩm không xác định - Số lượng bán: 0');
    }
  }
}
