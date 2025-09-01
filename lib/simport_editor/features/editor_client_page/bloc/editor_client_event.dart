import "package:json_app/main.dart";

sealed class EditorClientEvent {
  static void setupCustomVariables() {
    registry.setValue(
      "userAvatarUrl",
      "https://avatars.githubusercontent.com/u/81923101?v=4",
    );
    registry.setValue("userName", "Felipe Hoffmeister");

    registry.setValue("email", "felipe@gmail.com");

    registry.setValue(
      "clientLogo",
      "https://appix.cs.simport.com.br/gallery/86/image-download",
    );
    registry.setValue("since", "Usuário desde: Jan 1, 2016");
    registry.setValue("subtitle", "ADMINISTRADOR - APPIX");

    registry.setValue("clientName", "clientName");
    registry.setValue("clientSubtitle", "clientSubtitle");
    registry.setValue("url", "url");
    registry.setValue("client", "client");
  }
}
