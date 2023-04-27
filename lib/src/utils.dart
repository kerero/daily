import 'dart:io' show Platform;

bool isMobile() {
  return Platform.isIOS || Platform.isAndroid || Platform.isFuchsia;
}

bool isDesktop() {
  return !isMobile();
}
