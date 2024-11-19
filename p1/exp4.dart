void main() {
// Gan gia tri co ban
  var a = 2;
  print('a = $a '); // 2
// Gan neu null
  int? b;
  b ??= 5; // Gan 5 vi b dang null
  print('b = $b '); // 5
  b ??= 10; // Khong gan vi b khong null
  print('b = $b '); // Van la 5
}
