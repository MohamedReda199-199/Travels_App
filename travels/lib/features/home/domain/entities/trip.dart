enum TripCategory { landmark, beach }

class Trip {
  final String name;
  final String date;
  final String price;
  final String imageUrl;
  final int durationDays;
  final List<String> itinerary;
  final int availableSeats;
  final int basePrice;
  final TripCategory category;

  const Trip({
    required this.name,
    required this.date,
    required this.price,
    required this.imageUrl,
    required this.durationDays,
    required this.itinerary,
    required this.availableSeats,
    required this.basePrice,
    required this.category,
  });
}
