import 'dart:io' show Platform;
import 'package:flutter/material.dart';

bool isMobile() {
  return Platform.isIOS || Platform.isAndroid || Platform.isFuchsia;
}

bool isDesktop() {
  return !isMobile();
}

class StreamBuilderTimeout<T> extends StatelessWidget {
  late final Stream<T> stream;
  final Duration timeout;
  final Widget Function(T data)? onData;
  final Widget Function()? onInitialWait;
  final Widget Function(Object? error)? onError;
  static const defaultWidget = SizedBox.shrink();

  StreamBuilderTimeout(
      {super.key,
      required Stream<T> stream,
      required this.timeout,
      this.onData,
      this.onError,
      this.onInitialWait}) {
    this.stream = stream.asBroadcastStream();
  }
  @override
  Widget build(context) {
    // Handle first load
    return FutureBuilder<T>(
      future: stream.first.timeout(timeout),
      builder: (context, snapshotFuture) {
        if (snapshotFuture.hasError) _handleError(snapshotFuture.error);
        if (snapshotFuture.hasData) {
          // Handle Stream after first load
          return StreamBuilder<T>(
            stream: stream,
            initialData: snapshotFuture.data,
            builder: (context, snapshotStream) {
              if (snapshotStream.hasError) {
                return _handleError(snapshotStream.error)!;
              }
              if (snapshotStream.hasData) {
                return onData?.call(snapshotStream.data as T) ?? defaultWidget;
              }
              return onInitialWait?.call() ?? defaultWidget;
            },
          );
        }
        return onInitialWait?.call() ?? defaultWidget;
      },
    );
  }

  Widget? _handleError(Object? error) {
    if (onError == null) {
      throw Exception(error);
    }
    return onError!(error);
  }
}
