class Event {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final int acceptedCount;
  final int declinedCount;
  final int maybeCount;

  Event({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    this.acceptedCount = 0,
    this.declinedCount = 0,
    this.maybeCount = 0,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      acceptedCount: json['acceptedCount'] ?? 0,
      declinedCount: json['declinedCount'] ?? 0,
      maybeCount: json['maybeCount'] ?? 0,
    );
  }
}