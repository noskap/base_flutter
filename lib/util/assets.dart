import 'package:flutter/foundation.dart';

String path(str) => (!kDebugMode && kIsWeb) ? 'assets/$str' : str;
