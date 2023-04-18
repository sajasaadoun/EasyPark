import 'package:easypark/widgets/camera_widget.dart';
// import 'package:fluttercamera/camera.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
}
