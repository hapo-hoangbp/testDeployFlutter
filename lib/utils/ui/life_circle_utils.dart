import 'package:flutter/material.dart';

class LifeCircleUtils {
  static void afterBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      callback();
    });
  }
}
