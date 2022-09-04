class EventModel {
  String? id;
  DateTime? date;
  DateTime? sTime;
  DateTime? eTime;
  double? nmOfPeople;
  String? name;
  String? location;
  String? type;

  EventModel(
      {required this.id,
      required this.date,
      required this.sTime,
      required this.eTime,
      required this.nmOfPeople,
      this.location,
      this.name,
      this.type});

  static EventModel fromJson(Map<String, dynamic> json) => EventModel(
        id: json['id'],
        date: json['date'],
        sTime: json['sTime'],
        eTime: json['eTime'],
        nmOfPeople: json['nmOfPeople'],
        name: json['name'],
        location: json['location'],
        type: json['type'],
      );
}
