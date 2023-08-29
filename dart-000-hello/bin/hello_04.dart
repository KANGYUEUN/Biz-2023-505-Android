void main(List<String> args) {
  final numA = 30;
  final numB = 40;
  addNums(numA, numB);

  final sum = sumNums(numA, numB);
  print(sum);

  /// < dart : final, const 선언문 >
  /// final 선언문은 java, 일반적인 프로그래밍 언어의fianl 적인 성질을 갖는 변수 선언문이다.
  /// 한번 값을 할당(set) 하면 다시 값을 변경할 수 없다.
  ///
  /// const 선언문은 final 과 유사하고 '함수의 return 값'을 받을 수 없다.
  /// 코드가 실행 되기 전에 확정적인 값을 저장하는 용도이다.
  /// C/C++ 언어의 #define 명령문과 같은 성질이다.
  ///
  /// '매직 리터럴' : ""로 묶인 문자열, 직접 사용한 숫자값
  /// 매직 리터럴은 실제 코드가 작동되는 과정에서 오류를 일으킬 수 있다.
  /// 이를 final 변수에 저장하여 오류를 방지할 수 있다.
  ///
  /// Dart 에서는 매직 리터럴 값을 저장하는 변수를 const 사용한다.
  ///
  /// const : 코드가 실행 되기 전에 값이 확정적인 경우에 사용 (함수의 리턴값은 받을 수 없다.)
  // const int sumC = sumNums(30, 40);

  const int sumS = 30 + 40;
  print(sumS);
}

void addNums(int num1, int num2) {
  print('${num1 + num2}');
}

int sumNums(int num1, int num2) {
  return num1 + num2;
}
