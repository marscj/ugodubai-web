class Environments {
  static const String PROD = 'prod';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.LOCAL;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'http://127.0.0.1:8808/api/v1/',
    },
    {
      'env': Environments.DEV,
      'url': 'http://141.193.158.154:8601/api/',
    },
    {
      'env': Environments.PROD,
      'url': 'https://api.globalstudioses.com/api/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
