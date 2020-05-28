import 'package:cloud_firestore/cloud_firestore.dart';

class CaseModel {
  String id;
  String description;
  String name;
  String numberPossibleEndings;
  int pointsMax;
  int numberRoute;
  RouteModel route;

  CaseModel({
    this.id,
    this.description,
    this.name,
    this.pointsMax,
    this.numberRoute,
    this.route,
    this.numberPossibleEndings,
  });

  factory CaseModel.fromMap(Map<String, dynamic> json) => CaseModel(
        description: json["description"],
        name: json["name"],
        pointsMax: json["pointsMax"],
        numberRoute: json["numberRoute"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "name": name,
        "pointsMax": pointsMax,
        "numberRoute": numberRoute,
      };
}

class RouteModel {
  String id;
  int numberPossibleEndings;
  int pointsMax;
  String role;
  String idFirstEvent;
  List<Event> events;

  RouteModel({
    this.numberPossibleEndings,
    this.pointsMax,
    this.role,
    this.events,
    this.idFirstEvent,
    this.id,
  });

  factory RouteModel.fromMap(Map<String, dynamic> json) => RouteModel(
        numberPossibleEndings: json["numberPossibleEndings"],
        pointsMax: json["pointsMax"],
        role: json["role"],
        events: List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "numberPossibleEndings": numberPossibleEndings,
        "pointsMax": pointsMax,
        "role": role,
        "events": List<dynamic>.from(events.map((x) => x.toMap())),
      };
}

class Event {
  String id;
  String role;
  String text;
  String type;
  int numberEnding;
  List<Sequence> sequence;

  Event({
    this.id,
    this.role,
    this.text,
    this.type,
    this.sequence,
    this.numberEnding,
  });

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        role: json["role"],
        text: json["text"],
        type: json["type"],
        sequence: List<Sequence>.from(
            json["sequence"].map((x) => Sequence.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "text": text,
        "type": type,
        "sequence": List<dynamic>.from(sequence.map((x) => x.toMap())),
      };
}

class Sequence {
  DocumentReference prev;
  DocumentReference next;
  String text;
  int points;

  Sequence({
    this.prev,
    this.next,
    this.text,
    this.points,
  });

  Sequence.fromMap(Map<String, dynamic> data)
      : prev = data["prev"],
        next = data["next"],
        text = data["text"],
        points = data["points"];

  Map<String, dynamic> toMap() => {
        "prev": prev,
        "next": next,
        "text": text,
        "points": points,
      };
}
