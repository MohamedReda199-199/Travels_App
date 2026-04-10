import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/trip.dart' show Trip, TripCategory;
import '../widgets/network_image.dart';
import '../widgets/booking_bottom_sheet.dart';
import 'trip_details_screen.dart';

class AllTripsScreen extends StatelessWidget {
  const AllTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final trips = <Trip>[
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
        name: 'الأهرامات',
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('كل الرحلات'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trips.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final trip = trips[index];
                return _TripCard(trip: trip);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  const _TripCard({required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => TripDetailsScreen(trip: trip)),
        );
      },
      borderRadius: BorderRadius.circular(18),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: AppNetworkImage(url: trip.imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            trip.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryOrange.withValues(
                              alpha: 0.12,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${trip.availableSeats} مقعد',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: colorScheme.onSurface.withValues(alpha: 0.65),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          trip.date,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.75,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.timelapse_rounded,
                          size: 18,
                          color: colorScheme.onSurface.withValues(alpha: 0.65),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${trip.durationDays} أيام',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.75,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      trip.price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => BookingBottomSheet(trip: trip),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'احجز الآن',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
