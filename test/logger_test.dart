import 'package:flutter_test/flutter_test.dart';
import 'package:prayerboard/services/persistent_data/persistent_data_service.dart';
import 'package:mockito/annotations.dart';
import 'package:prayerboard/utils/pb_logger.dart';

@GenerateMocks([PersistentDataService])
void main(){
  group('PB Logger', () {
    test("Log normal text", () {
      PBLogger().log("Log Message", placeCode: "Test Place");
      expect(1, 1);
    });

    test("Log exception", () {
      try{
        throw Exception("Manual Exception");
      }
      catch(ex){
        PBLogger().logException(ex, placeCode: "Test Place");
      }
      expect(1, 1);
    });
  });
}