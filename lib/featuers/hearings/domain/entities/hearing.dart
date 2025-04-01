enum HearingsState {
  postponed, // مؤجلة
  canceled, // ملغاة
  certain, // مؤكدة
}

class Hearing {
  final DateTime date;
  final String sessionLocation;
  final String notes;
  final String userId;
  final int caseId;
  final int courtsId;
  final String? lawyerId;
  final HearingsState? state;

  Hearing({
    required this.date,
    required this.sessionLocation,
    required this.notes,
    required this.userId,
    required this.caseId,
    required this.courtsId,
    this.lawyerId,
    this.state,
  });
}
