class SingletonData {
  static final SingletonData _singleton = SingletonData._internal();
  Map<String, double> votePairs = {};
  List<String> restaurantNames = [];
  String appName = 'Food Consensus';
  int secondsBrainstorm = 45;
  int secondsVoting = 45;
  bool usingBrainstormTimer = true;
  bool usingVotingTimer = true;
  int restaurantAddLimit = 5;

  factory SingletonData() {
    return _singleton;
  }

  Map<String, double> getVotePairs() {
    return votePairs;
  }

  List<String> getRestaurantNames() {
    return restaurantNames;
  }

  void setMaxSeconds(int seconds) {}

  void syncRestaurantNamesToPairs() {
    for (String name in restaurantNames) {
      votePairs[name] = 0;
    }
  }

  SingletonData._internal();
}
