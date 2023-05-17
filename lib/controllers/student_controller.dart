import 'package:get/get.dart';
import 'package:goethestudent/models/student_booked.dart';

class StudentController extends GetxController {
  var teacherName = "".obs;
  var userName = "John".obs;
  var email = "john@gmail.com".obs;
  var uid = "uid".obs;
  var method = "".obs;
  var rating = 0.0.obs;
  var classList = [].obs;
  var amount = 0.obs;

  @override
  void onInit() {
    teacherName = "".obs;
    userName = "John".obs;
    email = "john@gmail.com".obs;
    uid = "uid".obs;
    method = "".obs;
    rating = 0.0.obs;
    classList = [].obs;
    amount = 0.obs;
    super.onInit();
  }
}
