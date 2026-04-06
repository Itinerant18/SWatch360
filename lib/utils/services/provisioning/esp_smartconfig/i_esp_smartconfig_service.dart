/// NOTE:
/// ESP SmartConfig is disabled because the `esp_smartconfig` package
/// is deprecated and incompatible with modern Flutter.
///
/// This interface is kept only to satisfy the application architecture.

enum SmartConfig { espTouch, espTouchV2 }

abstract interface class IEspSmartConfigService {
  /// Creates a provisioning handler (unsupported in this build)
  dynamic create(SmartConfig config);

  /// Starts provisioning (unsupported in this build)
  Future<void> start(dynamic request);

  /// Stops provisioning
  Future<void> stop();
}
