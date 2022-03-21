void main() {
  var number = 42;
  var name = "Quang";
  print(printName(name));
  print(printName2(null));
  printInt(number);
}

void printInt(int? aNumber) {
  if (aNumber != null) {
    print('The number is ${aNumber + 18}');
  } else {
    return;
  }
}

String printName(String aName) {
  return "Name is $aName";
}

String printName2(String? aName) => aName ?? "Guest";



