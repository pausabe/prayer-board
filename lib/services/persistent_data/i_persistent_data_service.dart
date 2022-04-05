abstract class IPersistentDataService {
  Future<String> getJson(String key);
  Future<void> clearCache();
}