import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

num getAdjustedPixelRatio(context) {
  if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows) {
    return MediaQuery.of(context).devicePixelRatio * 3;
  } else {
    return MediaQuery.of(context).devicePixelRatio;
  }
}
