void main() {
// Vi du voi List
  final numbers = <int>[]
    ..add(1)
    ..addAll([2, 3, 4])
    ..remove(2)
    ..sort();
// Vi du voi StringBuffer
  final buffer = StringBuffer()
    ..write('Xin')
    ..write('chao')
    ..writeln('ban');
  print(numbers); // [1, 3, 4]
  print(buffer); // Xin chao ban

  // Vong lap for thong thuong
  for (var i = 1; i <= 5; i++) {
    print(i);
  }
// Vong lap for -in
  var names = ['An', 'Binh', 'Chi', 'Dong'];
  for (var name in names) {
    print(name);
  }
// For voi tap hop
  var moreNumbers = [1, 2, 3];
  moreNumbers.forEach((number) => print(number));
}
