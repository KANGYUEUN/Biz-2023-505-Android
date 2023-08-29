void main(List<String> args) {
  // Single line 문자열
  String str1 = "Korea";
  String str2 = 'Korea';

  /// Multi Line 문자열
  /// 입력한 모양(Enter, tab, 빈칸) 값 그대로 출력된다.
  String str3 = """

    우리는 민족 중흥의 역사적 사명을 띄고 이 땅에 태어 났다.
    조상의 빌난 얼을 오늘에 되살려 교육의 지표로 삼는다.
  """;

  print(str3);

  // dart 에는 long 형도 없음
  int num1;
  // float 대신 double 사용
  double num2;
  num1 = 30;
  num2 = 40.0;
  print("$num1, $num2");

  /// dart 에서는 특별한 경우가 아니면 숫자형 변수는 num 키워드를 권장한다
  num num3 = 30;
  bool bYes = true;

  print("$num3, $bYes");
}
