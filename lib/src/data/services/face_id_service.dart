import "package:local_auth/local_auth.dart";

class FaceIDService {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      bool canCheck = await _auth.canCheckBiometrics;
      if (!canCheck) {
        return false;
      }

      List<BiometricType> availableBiometrics = await _auth
          .getAvailableBiometrics();

      if (!availableBiometrics.contains(BiometricType.face)) {
        return false;
      }

      return await _auth.authenticate(
        localizedReason: "Use Face ID para entrar no app",

        options: const AuthenticationOptions(
          sensitiveTransaction: true,
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: false,
        ),
      );
    } catch (e) {
      return false;
    }
  }
}
