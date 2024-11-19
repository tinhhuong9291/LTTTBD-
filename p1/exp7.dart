void main() {
// Khong dung cascade
  var list = [1, 2];
  list.add(3);
  list.add(4);
  list.remove(2);
  print(list);
// Dung cascade
  var list2 = [1, 2]
    ..add(3)
    ..add(4)
    ..remove(2);
  print(list2);
}
