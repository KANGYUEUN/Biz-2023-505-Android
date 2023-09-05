class User {
  late final String username;
  late final String password;
  final String nickname;
  final String email;
  final String tel;

  // 중괄호 안에선 순서 상관없다
  User({
    required this.username,
    required this.password,
    required this.email,
    required this.nickname,
    required this.tel,
  });
}
