import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final String address;
  final String temperature;
  final String apparentTemperature;

  const WeatherCard({
    super.key,
    required this.city,
    required this.address,
    required this.temperature,
    required this.apparentTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.borderCard, width: 2),
      ),
      child: body(),
    );
  }

  Widget body() {
    return Column(
      children: [firstLine(), const SizedBox(height: 20), secondLine()],
    );
  }

  Widget firstLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [tempIcon(), temp(), cityAddress()],
    );
  }

  Widget secondLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(
          "3.0 nós",
          "SSW",
          const Color(0xFFecfeff),
          LucideIcons.wind,
          const Color(0xFF22bfd9),
        ),
        card(
          "79%",
          "Umidade",
          const Color(0xFFeff6ff),
          LucideIcons.droplets,
          const Color(0xFF4387f6),
        ),
        card(
          "1018",
          "Pressão",
          const Color(0xFFfffbeb),
          LucideIcons.thermometer,
          const Color(0xFFf6ab2b),
        ),
      ],
    );
  }

  Widget tempIcon() {
    return SvgPicture.asset(
      'lib/assets/images/cloud-icon.svg',
      width: 64,
      height: 64,
    );
  }

  Widget temp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$temperature°C",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          "Sensação térmica: $apparentTemperature°C",
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget cityAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          city,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          address,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget card(
    String title,
    String subtitle,
    Color backgroundColor,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      height: 60,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: 20, weight: 20, color: iconColor),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
