import 'hello_08_collection.dart';

void main(List<String> args) {
  var nams = ["홍길동", "이몽룡", "성춘향"];

  for (var i = 0; i < nams.length; i++) {
    print(nams[i]);
  }

  for (var name in nams) {
    print(name);
  }
  names.forEach((name) {
    print(name);
  });

  var result = names.map((name) {
    return "이름 : $name";
  });
  print(result);

  result = names.map((name) => "이름 : $name");
  print(result);
}
