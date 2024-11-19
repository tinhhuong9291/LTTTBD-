void main() {
// Toan tu dieu kien (?:)
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);

// Toan tu null (??)
  String? name;
  var displayName = name ?? 'Khach';
  print(displayName);

  // gan gia tri ==
  print(visibility == (true ? 'public' : 'private'));
}
