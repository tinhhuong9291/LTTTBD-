/**
 * Bài tập: 
 * 1.viết chương trình chuyển đổi 1 số nguyên (n>=1) được nhập từ bàn phím thành số nhị phân
 * 2.viết chương trình tính tổng các ước số của 1 số nguyên được nhập từ bàn phím (n>=1)
 */
import 'dart:io';

void main() {
  num n = 0;
  do {
    print('Nhập hệ số n:');
    stdout.write('Nhập hệ số n (n >=1 ):');
    String? input = stdin.readLineSync();
    if (input != null) {
      n = double.tryParse(input) ??
          0; // null trả về giá trị bằng 0 nếu k gắn giá trị vừa nhập
    }
    if (n < 1) {
      print('Hệ số n phải lớn hơn 1.Vui lòng nhập lại');
    }
  } while (n == 0);
  String binary = '';
  num temp = n;

  while (temp > 0) {
    binary = (temp % 2).toString() + binary;
    temp ~/= 2; // chia lấy phần nguyên
  }
  print('Số $n ở hệ nhị phân là: $binary');
}
