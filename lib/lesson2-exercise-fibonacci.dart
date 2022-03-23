void main() {
  var a = 0;
  print("Day 10 so dau tien fibonacci: ");
  for (var i = 0; i < 10; i++) {
    print(fibonacci(i));
    a = a + fibonacci(i);
  }
  print("Tong 10 so fibo = $a");
}

int fibonacci(int n) {
  if (n < 0) {
    return -1;
  } else if (n == 0 || n == 1) {
    return n;
  } else {
    var result = fibonacci(n - 1) + fibonacci(n - 2);

    return result;
  }
}
