import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

abstract class IRemoteConfigService {
  String getString(String configName);
}

class RemoteConfigService extends GetxController
    implements IRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void onInit() async {
    super.onInit();
    await _init();
  }

  Future<void> _init() async {
    try {
      await _setConfigSettings();
      await _fetchAndActivate();
    } catch (e) {
      print(e);
    }
  }

  /// This function sets configuration settings for remote configuration.
  Future<void> _setConfigSettings() async {
    _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration.zero,
      ),
    );
  }

  /// This function fetches and activates remote configuration data asynchronously.
  Future<void> _fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  /// This function overrides the getString method to return a string value from a remote configuration
  /// based on the provided configName.
  /// 
  /// Args:
  ///   configName (String): The `configName` parameter is a string that represents the name of a
  /// configuration setting or value that you want to retrieve from a remote configuration source. In
  /// the provided code snippet, the `getString` method takes this `configName` as an argument and
  /// retrieves the corresponding value from the `_remoteConfig
  @override
  String getString(String configName) => _remoteConfig.getString(configName);
}
