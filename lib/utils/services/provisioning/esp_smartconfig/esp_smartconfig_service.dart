import 'package:thingsboard_app/utils/services/provisioning/esp_smartconfig/i_esp_smartconfig_service.dart';

/// Stub implementation.
/// ESP SmartConfig is disabled because the package is deprecated
/// and incompatible with modern Flutter SDK.
class EspSmartConfigService implements IEspSmartConfigService {
  const EspSmartConfigService();

  @override
  dynamic create(dynamic config) {
    throw UnsupportedError(
      'ESP SmartConfig is not supported in this build.',
    );
  }

  @override
  Future<void> start(dynamic request) async {
    throw UnsupportedError(
      'ESP SmartConfig is not supported in this build.',
    );
  }

  @override
  Future<void> stop() async {
    // no-op
  }
}
