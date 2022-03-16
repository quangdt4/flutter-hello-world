void main() {
  var a = 0;
  print("Day 10 so dau tien fibonacci: ");
  for (var i = 0; i < 10; i++) {
    print(fibonacci(i));
    a = a + fibonacci(i);
  }
  print("Tong 10 so fibo = $a" );
}

int fibonacci(int a) {
  var b = 0;
  var c = 1;
  var d = 1;
  if (a < 0) {
    return -1;
  } else if (a == 0 || a == 1) {
    return a;
  } else {
    for (var i = 2; i < a; i++) {
      b = c;
      c = d;
      d = b + c;
    }
  }
  return d;
}
