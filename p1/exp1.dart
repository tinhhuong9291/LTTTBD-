void main() {
  print("Hello World");
  // khai bao bien
  var ten = "Nguyen Thanh Tien";
  int tuoi = 20;

  // Su dung null safety
  String? tenNullable;
  tenNullable = null;

  // Su dung bien late
  late String moTa;
  moTa = 'Lap trinh Dart';

  // Su dung final va const
  final String quocGia = 'Vietnam';
  const int nam = 2024;

  //In ra gia tri bien
  print('Ten: $ten');
  print('Tuoi: $tuoi');
  print('TenNullable: $tenNullable');
  print('MoTa: $moTa');
  print('QuocGia: $quocGia');
  print('Nam: $nam');
}
