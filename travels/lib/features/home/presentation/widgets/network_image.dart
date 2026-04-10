import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      color: Colors.black.withValues(alpha: 0.04),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_outlined,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.35),
      ),
    );

    // Check if it's a placeholder request for specific cities
    if (url == 'placeholder_tanta') {
      return _buildCityPlaceholder('طنطا والدلتا', Icons.mosque);
    }
    if (url == 'placeholder_dahab') {
      return _buildCityPlaceholder('دهب', Icons.terrain);
    }
    if (url == 'placeholder_luxor') {
      return _buildCityPlaceholder('الأقصر', Icons.account_balance);
    }
    if (url == 'placeholder_aswan') {
      return _buildCityPlaceholder('أسوان', Icons.water);
    }
    if (url == 'placeholder') {
      return _buildCityPlaceholder('رحلة', Icons.travel_explore);
    }

    // Check if it's an asset image (starts with assets/)
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => placeholder,
      );
    }

    // Otherwise use network image
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder;
      },
      errorBuilder: (context, error, stackTrace) => placeholder,
    );
  }

  Widget _buildCityPlaceholder(String cityName, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryOrange.withAlpha(180),
            AppColors.primaryOrangeDark.withAlpha(220),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.white.withAlpha(200)),
          const SizedBox(height: 8),
          Text(
            cityName,
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
