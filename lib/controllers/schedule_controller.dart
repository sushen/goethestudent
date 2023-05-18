import 'package:get/get.dart';
import 'package:goethestudent/models/teacher_schedule.dart';

class ScheduleController extends GetxController {
  var selectedList = <TeacherSchedle>[].obs;
  var isSlected = false.obs;
  var checkBox = false.obs;

  bool selectItem(String no) {
    for (var item in selectedList) {
      if (item.char.toLowerCase() == no.toLowerCase()) {
        isSlected(true);
        break;
      }
    }
    if (isSlected(true)) {
      return true;
    } else {
      return false;
    }
    print(selectedList.length);
    print(isSlected.value);
  }
}
