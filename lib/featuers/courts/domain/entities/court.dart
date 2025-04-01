enum Jurisdiction {
  ordinaryCourts, // المحاكم العادية
  familyCourts, // محاكم الأسرة
  economicCourts, // المحاكم الاقتصادية
  administrativeCourts, // المحاكم الإدارية
  militaryCourts, // المحاكم العسكرية
  constitutionalCourt, // المحكمة الدستورية العليا
}

class Court {
  final int id;
  final String name;
  final String location;
  final Jurisdiction jurisdictionState;

  Court({
    required this.id,
    required this.name,
    required this.location,
    required this.jurisdictionState,
  });
}
