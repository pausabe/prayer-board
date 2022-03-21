class StartService{

  // TODO: maybe a Controller? Service = outer world

  // Singleton Pattern
  static final StartService _instance =
  StartService._privateConstructor();
  factory StartService() => _instance;
  StartService._privateConstructor();

  void actionsAfterAppStart(){
  }
}