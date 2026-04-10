import 'package:flutter/material.dart';

import 'network_image.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    const bannerUrl =
        'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?auto=format&fit=crop&w=1200&q=80';

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: SizedBox(
        height: 190,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const AppNetworkImage(url: bannerUrl),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.08),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 14, 14, 16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Text(
                    'استمتع بأجمل الرحلات العائلية داخل مصر',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
