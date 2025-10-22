// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get loginEnterButton => 'Entrar';

  @override
  String get loginPasswordButton => 'Olvidé mi contraseña';

  @override
  String get loginUser => 'Usuario';

  @override
  String get loginPassword => 'Contraseña';

  @override
  String get darkTheme => 'Tema oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get clients => 'Clientes';

  @override
  String get logout => 'Salir';

  @override
  String get portuguese => 'Portugués';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get resetPasswordInfo =>
      'Recupere su contraseña proporcionando su nombre de usuario o correo electrónico para recibir las instrucciones';

  @override
  String get usernameOrEmail => 'Usuario o correo electrónico';

  @override
  String get pleaseEnterUsernameOrEmail =>
      'Por favor, ingrese su usuario o correo electrónico.';

  @override
  String get recoveryEmailSent => 'Correo de recuperación enviado.';

  @override
  String get confirm => 'Confirmar';
}
