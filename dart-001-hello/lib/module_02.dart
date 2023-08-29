// 변수를 보낼때 순서를 지켜야 함 ( 위치기반 함수 )
String sayHello(String? name, int? age, String? nation) =>
    "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이다.";

// 보낼때 순서를 바꾸어도 상관이 없다.
String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "안녕 $name 야, 당신의 나이는 $age 이고, 고향은 $nation 이다.";


// 순서 상관 없음 ( 이름기반 함수 )
/// < Span name = "홍길동", age = 33, nation = "대한민국" />
/// const Span = ({name, age, nation }) => { return <></>}