import '../../domain/entities/court.dart';

class CourtModel extends Court {
  CourtModel({
    required int id,
    required String name,
    required String location,
    required Jurisdiction jurisdictionState,
  }) : super(
          id: id,
          name: name,
          location: location,
          jurisdictionState: jurisdictionState,
        );

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'غير معروف',
      location: json['location'] ?? 'غير متوفر',
      jurisdictionState: json['jurisdictionState'] != null
          ? Jurisdiction.values[json['jurisdictionState']]
          : Jurisdiction.ordinaryCourts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "location": location,
      "jurisdictionState": jurisdictionState.index,
    };
  }

  static fromCourt(Court court) {}
}
