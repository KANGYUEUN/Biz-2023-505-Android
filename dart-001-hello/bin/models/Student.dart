// ignore_for_file: file_names
/// data class(Dto, VO) 클래스 작성하기
class Student {
  int stNum = 0; // null 을 저장 X
  String? stName;
  String? stDept;
  int? stGrade;

  ///  < data class 의 기본생성자 함수 >
  /// 아래와 같은 코드를 작성하여 매개변수로 받은 데이터를
  /// 내부 변수(this.*)에 setting 하는 코드를 작성한다.
  // Student({stNum, stName, stDept, stGrade}) {
  //   this.stNum = stNum;
  //   this.stName = stName;
  //   this.stDept = stDept;
  //   this.stGrade = stGrade;
  // }

  /// 현재 버전의 dart 에서는 아래와 같은 코드로 작성한다.
  // 본디 위의 코드로 짜는것이 원칙이나 아래와 같이 할수 있다.
  // null 값이 허용이 안되는 stNum 은 = 0 으로 값을 셋팅 해주어야한다.
  Student({this.stNum = 0, this.stName, this.stDept, this.stGrade});

  // setter, getter method
  set setStNum(int num) => stNum = num;
  int get getStNum => stNum;

  @override
  String toString() {
    String str = "이름 : $stName,"
        "학번 : $stNum,"
        "학과: $stDept,"
        "학년: $stGrade";
    return str;
  }
}
