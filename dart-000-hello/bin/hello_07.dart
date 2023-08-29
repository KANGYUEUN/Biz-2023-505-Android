String stdFunc(String nation) {
  return nation.toUpperCase();
}

String arrowFunc(String nation) => nation.toUpperCase();

int stdSum(int num1, int num2) {
  int sum = num1 + num2;
  return sum;
}

// ? : null 값을 전달 할 수 있다
// name 값이 null 이 아니면 대문자로 return 해라
String? arrowstrFunc(String? name) => name?.toUpperCase() ?? null;
String? stdNullFunc(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return null;
}

// name 변수의 값이 null 이면 NOT FOUND 라는 문자열을 return 해라
String arrowNotNullFunc(String? name) => name?.toUpperCase() ?? "NOT FOUND";
