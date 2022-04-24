import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prayerboard/services/persistent_data/persistent_data_service.dart';
import 'package:prayerboard/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'user_service_test.mocks.dart';

@GenerateMocks([PersistentDataService])
void main(){
  late MockPersistentDataService _mockPersistentDataService;
  late UserService _userService;
  setUp(() {
    _mockPersistentDataService = MockPersistentDataService();
    _userService = UserService(persistentDataService: _mockPersistentDataService);
  });

  group('User Service', () {
    test("Get prayers from string to List of two prayers", () async {
      when(_mockPersistentDataService.getValue(any))
          .thenAnswer((_) async => '[{"description":"prayer1"},{"description":"prayer2"}]');
      var prayers = await _userService.getPrayers();
      expect(prayers.length, 2);
    });

    test("Get prayers when empty string", () async {
      when(_mockPersistentDataService.getValue(any))
          .thenAnswer((_) async => '');
      var prayers = await _userService.getPrayers();
      expect(prayers.length, 0);
    });

    test("Get prayers when wrong string", () async {
      when(_mockPersistentDataService.getValue(any))
          .thenAnswer((_) async => 'wrong json');
      var prayers = await _userService.getPrayers();
      expect(prayers.length, 0);
    });
  });
}