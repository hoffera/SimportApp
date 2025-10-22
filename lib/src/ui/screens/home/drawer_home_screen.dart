import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:go_router/go_router.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/theme_store.dart";
import "package:json_app/src/data/store/user_store.dart";
import "package:json_app/src/ui/widgets/custom_typography/custom_typography.dart";
import "package:json_app/src/utils/enum/enum.dart";

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).cardColor,
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            _buildUserProfile(context),
            const SizedBox(height: 30),
            _buildThemeSwitcher(context),
            const SizedBox(height: 30),
            _buildLanguageSwitcher(context),
            const SizedBox(height: 30),
            _buildLogoutButton(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    final userStore = getIt<UserStore>();
    final currentUser = userStore.currentUser;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white.withAlpha(51),
            child: ClipOval(
              child: Image.network(
                currentUser?.photoId != null
                    ? "https://appix.cs.simport.com.br/file/${currentUser?.photoId}/image"
                    : "",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator(color: Colors.white);
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Nome do usuário
          CustomTypography(
            text: currentUser?.name ?? "",
            variant: TypoVariant.h5,
            color: Colors.white,
            weight: FontWeight.bold,
          ),

          const SizedBox(height: 8),
          CustomTypography(
            text: currentUser?.username ?? "",
            variant: TypoVariant.h6,
            color: Colors.white,
            weight: FontWeight.normal,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSwitcher(BuildContext context) {
    return ListTile(
      leading: HeroIcon(
        HeroIcons.sun,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: CustomTypography(
        text: "Tema",
        variant: TypoVariant.h5,
        weight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      trailing: Observer(
        builder: (_) {
          final themeStore = getIt<ThemeStore>();
          return Switch(
            value: themeStore.isDarkMode,
            onChanged: (value) {
              themeStore.setDarkMode(value);
            },
          );
        },
      ),
    );
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    List<DropdownMenuItem<Locale>> localeItems = [
      DropdownMenuItem(
        value: Locale("pt"),
        child: CustomTypography(
          text: "Português",
          variant: TypoVariant.h6,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      DropdownMenuItem(
        value: Locale("en"),
        child: CustomTypography(
          text: "English",
          variant: TypoVariant.h6,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      DropdownMenuItem(
        value: Locale("es"),
        child: CustomTypography(
          text: "Espanhol",
          variant: TypoVariant.h6,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ];

    return Observer(
      builder: (_) => ListTile(
        leading: const HeroIcon(HeroIcons.language),
        title: CustomTypography(
          text: "Idioma",
          variant: TypoVariant.h5,
          weight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),

        trailing: DropdownButton<Locale>(
          value: getIt<LanguageStore>().currentLocale,
          items: localeItems,
          onChanged: (Locale? newLocale) {
            if (newLocale == null) {
              return;
            }
            getIt<LanguageStore>().setLocale(newLocale);
          },
          underline: Container(),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () async {
          final authNotifier = getIt<AuthNotifier>();
          await authNotifier.logout();
          getIt<UserStore>().logout();
          await Future.delayed(const Duration(milliseconds: 100));

          if (context.mounted) {
            context.go("/login-page");
          }
        },
        icon: const HeroIcon(HeroIcons.arrowRightOnRectangle),
        label: const Text("Sair"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          foregroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
