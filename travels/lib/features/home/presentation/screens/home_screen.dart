import 'package:flutter/material.dart';

import '../../domain/entities/trip.dart';
import '../../../../core/theme/app_colors.dart';
import 'trip_details_screen.dart';
import '../widgets/banner_card.dart';
import '../widgets/section_header.dart';
import '../widgets/top_header.dart';
import '../widgets/trip_card_with_booking.dart';
import 'all_trips_screen.dart';
import 'about_us_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allTrips = <Trip>[
      const Trip(
        name: 'الغردقة',
        date: '12 - 15 مايو',
        price: '2500 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=1200&q=80',
        durationDays: 4,
        itinerary: [
          'اليوم 1: وصول + استلام الفندق + وقت حر على البحر',
          'اليوم 2: رحلة بحرية + سنوركلينج + غداء',
          'اليوم 3: سفاري + حفلة بدوية',
          'اليوم 4: إفطار + خروج + عودة',
        ],
        availableSeats: 12,
        basePrice: 2500,
        category: TripCategory.beach,
      ),
      const Trip(
        name: 'شرم الشيخ',
        date: '20 - 23 مايو',
        price: '3200 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=1200&q=60',
        durationDays: 4,
        itinerary: [
          'اليوم 1: وصول + استلام الفندق + ممشى خليج نعمة',
          'اليوم 2: رحلة محمية رأس محمد',
          'اليوم 3: جولة تسوق + وقت حر + عشاء',
          'اليوم 4: خروج + عودة',
        ],
        availableSeats: 8,
        basePrice: 3200,
        category: TripCategory.beach,
      ),
      const Trip(
        name: 'الإسكندرية',
        date: '02 - 04 يونيو',
        price: '1800 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1555421689-d68471e189f2?auto=format&fit=crop&w=1200&q=60',
        durationDays: 3,
        itinerary: [
          'اليوم 1: الوصول + القلعة + الكورنيش',
          'اليوم 2: مكتبة الإسكندرية + حدائق المنتزه',
          'اليوم 3: سوق + خروج + عودة',
        ],
        availableSeats: 15,
        basePrice: 1800,
        category: TripCategory.beach,
      ),
      const Trip(
        name: 'الأهرامات ',
        date: '05 - 06 يونيو',
        price: '1500 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?auto=format&fit=crop&w=1200&q=80',
        durationDays: 2,
        itinerary: [
          'اليوم 1: أهرامات الجيزة + أبو الهول + متحف السفينة',
          'اليوم 2: مجمع الأهرامات + صور تذكارية + خروج',
        ],
        availableSeats: 20,
        basePrice: 1500,
        category: TripCategory.landmark,
      ),
      const Trip(
        name: 'طنطا والدلتا',
        date: '10 - 11 يونيو',
        price: '1200 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
        durationDays: 2,
        itinerary: [
          'اليوم 1: زيارة مسجد أحمد البدوي + سوق طنطا',
          'اليوم 2: جولة في حقول الدلتا + قرية سياحية + عودة',
        ],
        availableSeats: 18,
        basePrice: 1200,
        category: TripCategory.landmark,
      ),
      const Trip(
        name: 'دهب',
        date: '15 - 18 يونيو',
        price: '2800 جنيه',
        imageUrl:
            'https://images.unsplash.com/photo-1589197331516-4d84b72ebde3?auto=format&fit=crop&w=1200&q=80',
        durationDays: 4,
        itinerary: [
          'اليوم 1: وصول + استلام الفندق + وقت حر',
          'اليوم 2: جبل موسى + دير سانت كاترين',
          'اليوم 3: رحلة سفاري + غروب الشمس',
          'اليوم 4: إفطار + خروج + عودة',
        ],
        availableSeats: 10,
        basePrice: 2800,
        category: TripCategory.beach,
      ),
    ];

    final landmarkTrips = allTrips
        .where((t) => t.category == TripCategory.landmark)
        .toList();
    final beachTrips = allTrips
        .where((t) => t.category == TripCategory.beach)
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopHeader(),
              const SizedBox(height: 14),
              const BannerCard(),
              const SizedBox(height: 18),
              SectionHeader(
                title: 'معالم بحرية',
                actionText: 'عرض الكل',
                onActionPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AllTripsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: beachTrips.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final trip = beachTrips[index];

                    void openDetails() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TripDetailsScreen(trip: trip),
                        ),
                      );
                    }

                    return TripCardWithBooking(trip: trip, onTap: openDetails);
                  },
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'معالم سياحية',
                actionText: 'عرض الكل',
                onActionPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AllTripsScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: landmarkTrips.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final trip = landmarkTrips[index];

                    void openDetails() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TripDetailsScreen(trip: trip),
                        ),
                      );
                    }

                    return TripCardWithBooking(trip: trip, onTap: openDetails);
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor: AppColors.primaryOrange.withAlpha(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'About Us',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
