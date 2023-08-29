import 'package:dart_hello/module_01.dart';

void main(List<String> args) {
  var num1 = 30;
  var num2 = 40;
  var korea = "대한민국";
  var nums = [1, 3, 5, 6, 2, 5, 7, 34, 565];

  print(nation(korea));
  var result = addNums(num1, num2);
  print("결과 : $result");

  result = sumNums(nums);
  print("결과 : $result");
}
