# flutter 의 Provider

- flutter는 `state`기반의 view 모델 패턴을 따라서 작성되는 프로젝트이다.
- state 변수 값이 변화가 생기면 화면이 다시 `reRenderging` 되는 큰 구조를 가진 프로젝트를 말한다.

## flutter 의 state

- state 변수를 선언한 클래스 에서는 자유롭게 값을 읽고 쓰고 변화 시킬수 있다.
- state 변수는 부모 위젯에서 자손 위젯으로 전달 할 수 있다.
- state 변수는 형제 위젯 간에는 전달이 불가능 하다.
- state 변수를 형제간에 공유 하려면, 부모 위젯으로 끌어올린후 부모위젯에서 자손 위젯으로 전달 해야만 읽기가 가능하다.
- 만약, 부모 위젯에서 전달한 state변수를 자손 위젯에서 변화 시키려면 `state 를 변화 시킬수 있는 함수를 전달` 하여 실행해야 한다.

- flutter 에서도 state(매개변수, 전달값)이 부모에서 자손으로 또 그 자손으로 전달될때 Props Drilling 현상이 발생할 수 있다.
- `Props Drilling` 현상을 줄이기 위해 flutter 에서는 `provider` 를 사용한다.

## flutter 의 상태 관리 도구

- Getx : BuilderContext 관리가 다소 불편한 도구이나 flutter에서 많이 사용.
- Bloc(비지니스 로직 컨트롤러) : 비동기 환경에 최적화된 도구, 학습곡선이 다소 높다. Getx의 단점을 보완.
- Mobx : 리엑트에도 같은 도구가 있고 react 개발자들이 사용
- provider : Getx 다음으로 사용자가 많고, 학습하기 유리함. 잘못사용하면 변수 관리하는 과정에서 메모리 누수가 발생.

## flutter 의 MVVM 패턴

- 일반적인 프로젝트에서는 내부에서 사용되는 변수, 화면에 표시하고자 하는 변수 들을 개발자가 일일이 모두 챙기는 코드를 다수 작성 해야 한다.
- MVVN 패턴에서는 State 를 잘 활용하고, Notify 를 잘 활용하여 State 의 변화를 자동으로 화면에 반영하는 방법이다.

## View Model

- Dto 클래스와 화면에 rendering 을 수행하는 코드가 잘 융합된 형태
