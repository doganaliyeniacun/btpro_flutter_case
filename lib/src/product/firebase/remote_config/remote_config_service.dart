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
    await _setConfigSettings();
    await _fetchAndActivate();
  }

  Future<void> _setConfigSettings() async {
    _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: Duration.zero,
      ),
    );
  }

  Future<void> _fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  @override
  String getString(String configName) => _remoteConfig.getString(configName);
}
