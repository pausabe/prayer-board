abstract class IPersistentDataService {
  Future<String> getValue(String key);
  Future<void> clearCache();
}