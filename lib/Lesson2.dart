/*
LESSON 2: Dart cơ bản:
+ Class, hàm khởi tạo, getter setter
+ Khai báo danh sách

1.
- public => viết bình thường
- private => thêm "_" ở đầu (underScore in Dart)
- KDL dynamic: tổng hợp mọi KDL
- biến không gán giá trị, thêm ? hoặc late: (phải check null hoặc thêm !)
- const = final: không thể thêm sửa xóa
- Ép kiểu - as
- Dart có thể truyền cả một hàm/phương thức function
- Có thể lồng các hàm trong nhau

2.
- name parameter: tùy chọn có thể truyền hay không những tham số trong { },
nhưng nếu có 'required' thì vẫn bắt buộc phải có tham số truyền vào
=> Mục đích: để khi gọi đến cú pháp, phải có TÊN BIẾN truyền vào
- optional parameter: như name parameter nhưng khi gọi đến thì không HIỆN TÊN BIẾN

3. Khai báo danh sách:
- Danh sách có thể 1 KDL hoặc dynamic: nhiều KDL đều được
- List: là một danh sách có thứ tự
- Set: là một danh sách riêng biệt các phần tử không có thứ tự, không giống nhau
- Maps: là một danh sách theo dạng key-value
*/

void main() {
  var student = StudentModel("Quang", 20, "Flutter15", true);

  //--------KHAI BÁO DANH SÁCH
  var name = <String>[];
  name.addAll(["Quang", "Anh", "Hoang"]);
  name.add(2.toString());
  var ages = [12, 15, 17, 19]; //dynamic
  var ages2 = const [12, 15, 17, 19]; //const = final => list chỉ đọc
  ages.add(25);
  ages.removeAt(2);
  ages[1]; //lấy ra phần tử vị trí 1, ~ ages.elementAt
  var address = [...name, ...ages, "hanoi", "haiphong"];
  //lấy các phần tử từ danh sách name, ages
  // int key = ages.firstWhere((checkMoreThan15) => false);
  print('List: $name $ages $address');
  // print(key.toString());

  bool checkMoreThan15(int a) {
    if (a > 15) return true;
    return false;
  }

  //--------SET
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  halogens.add("clore");
  halogens.add("fluorine"); //không thể add vì trong danh sách đã có rồi
  print('Set: $halogens');

  //--------MAPS
  var gifts = <String, String>{
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = <int, String>{
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  nobleGases[60] = 'bronze'; //add mới
  nobleGases.remove(2);
  print('Maps: $nobleGases');

  //--------NAME PARAMETER
  enableFlags("VietNam", bold: false, prefix: "require");
  say("abc", "def", "iphone");

  //--------TRUYỀN MỘT FUNCTION
  funTruyenHam(funBiTruyen);
}

//name parameter
enableFlags(String country, {bold = true, hidden = false, required prefix}) {
  print("$prefix $bold $hidden");
}

//optional parameter
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//truyền hàm
void funTruyenHam(Function function) {
  print("Hàm được truyền là: ");
}

void funBiTruyen() {
  // do something here
}

// -----Class Model-----
class StudentModel {
  String? name; //public
  int? _age; // private
  late String _classRoom;
  var _isPublic;
  static const String KEY_NAME =
      "KEY_NAME"; //biến static có thể gọi thông qua class

  StudentModel(this.name, this._age, this._classRoom,
      this._isPublic); //Phương thức khởi tạo

  @override
  String toString() {
    return 'StudentModel{name: $name, age: $_age, classRoom: $_classRoom, isPublic: $_isPublic}';
  }

  //GETTER SETTER
  int get age => _age!;

  set age(int value) {
    _age = value;
  }

  String get classRoom => _classRoom;

  set classRoom(String value) {
    _classRoom = value;
  }

  get isPublic => _isPublic;

  set isPublic(value) {
    _isPublic = value;
  }
}
