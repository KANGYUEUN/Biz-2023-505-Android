import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];

  // Random() 함수
  // 1 ~ 100  까지 범위의 난수를 만들어 20 개의 배열을 생성했다.
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }

  // 배열에 저장된 요소들 중에 소수를 구하여 출력하시오
  for (int i = 2; i < 20; i++) {
    var prime = Random().nextInt(100) + 1;
    if (prime % i == 0) {
      print("소수 : $prime");
    } else {
      print("소수가아님");
    }
  }

  // 배열에 저장된 요소들 중에 소수를 구하여 출력하시오
  for (var i = 0; i < nums.length; i++) {
    var index = 2;
    for (index = 2; index < nums[i]; index++) {
      if (nums[i] % index == 0) break;
    }
    // index 와 nums[i] 관계
    if (index < nums[i]) {
      print("${nums[i]}는 소수가 아님");
    } else {
      print("${nums[i]}는 소수");
    }
  }
  for (int i = 0; i < nums.length; i++) {
    int result = prime(nums[i]);
    if (result > 0) {
      print("${nums[i]} 는 소수 ");
    } else {
      print("${nums[i]} 는 소수가 아님 ");
    }
  }
}

// 함수 따로 만들어서 하기
int prime(int nums) {
  for (int i = 2; i < nums; i++) {
    if (nums % i == 0) return 0;
  }
  return nums;
}
