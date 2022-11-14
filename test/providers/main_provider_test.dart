import 'package:flutter_test/flutter_test.dart';
import 'package:sahakari/providers/main_provider.dart';

void main() {
  group('MainScreen', () {
    late MainScreenProvider mainScreen;
    //Setup (Arrange)
    setUp(() {
      // WidgetsFlutterBinding.ensureInitialized();
      mainScreen = MainScreenProvider();
    });
    test('Index and Title should change as parameter provided.', () {
      //Run (Act)
      mainScreen.updateTabSelection(1, "Home");
      //Assert
      expect(mainScreen.selectedIndex, 1);
      expect(mainScreen.title, "Home");
    });
    test("Index and Title must be 0 and 'Dashboard'", () {
      //Assert
      expect(mainScreen.selectedIndex, 0);
      expect(mainScreen.title, "Dashboard");
    });
    //Dispose
    tearDown(() {
      mainScreen.dispose();
    });
  });
}
