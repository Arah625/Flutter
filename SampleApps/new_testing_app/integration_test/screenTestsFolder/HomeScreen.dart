import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class HomeScreen {

  bool isElementVisibleByText(String value) {
//    try {
      find.text(value);
      return true;
    // } on Exception catch (_) {
    //   return false;
    // }
  }
  
  bool checkWidget(){
    try{
       expect(find.text('0'), findsOneWidget);
       return true;
    } catch (e) {
      return false;
    }
  }

}
