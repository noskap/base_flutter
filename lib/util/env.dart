import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'test')
  static const String test = _Env.test;
  @EnviedField(varName: 'supportEmail')
  static const String supportEmail = _Env.supportEmail;
}
