class Student {
  //String? stNum 에서 ? 의 역할은 null값을 허용 하는 의미이다.
  String stNum;
  String stName;

  /// Student 클래스를 사용하여 객체를 만들때 stNum, stName 값은
  /// 반드시 전달해야한다 : required
  Student({required this.stNum, required this.stName});
}
