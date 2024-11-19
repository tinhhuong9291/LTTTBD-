// Bài tập giải phương trình bậc 2

import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;
  do {
    print('Nhập hệ số a:');
    stdout.write('Nhập hệ số a (a khác 0):');
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ??
          0; // null trả về giá trị bằng 0 nếu k gắn giá trị vừa nhập
    }
    if (a == 0) {
      print('Hệ số a phải khác 0.Vui lòng nhập lại');
    }
  } while (a == 0);
  // nhap b
  stdout.write('Nhập hệ số b):');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ??
        0; // null trả về giá trị bằng 0 nếu k gắn giá trị vừa nhập
  }

  // nhap c
  stdout.write('Nhập hệ số c:');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ??
        0; // null trả về giá trị bằng 0 nếu k gắn giá trị vừa nhập
  }

  // Hiển thị phương trình
  print('\n Phương trình: ${a}x^2+${b}x+c=0');
  // Tính delta
  double delta = b * b - 4 * a * c;

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    print('Phương trình vô nghiệm.');
  }
}
