class CaseModel {
  String description;
  String name;
  int pointsMax;
  int numberRoute;
  List<Route> route;

  CaseModel({
    this.description,
    this.name,
    this.pointsMax,
    this.numberRoute,
    this.route,
  });

  factory CaseModel.fromMap(Map<String, dynamic> json) => CaseModel(
        description: json["description"],
        name: json["name"],
        pointsMax: json["pointsMax"],
        numberRoute: json["numberRoute"],
        route: List<Route>.from(json["route"].map((x) => Route.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "name": name,
        "pointsMax": pointsMax,
        "numberRoute": numberRoute,
        "route": List<dynamic>.from(route.map((x) => x.toMap())),
      };
}

class Route {
  int numberPossibleEndings;
  int pointsMax;
  String role;
  List<Event> events;

  Route({
    this.numberPossibleEndings,
    this.pointsMax,
    this.role,
    this.events,
  });

  factory Route.fromMap(Map<String, dynamic> json) => Route(
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
  String role;
  String text;
  String type;
  List<Sequence> sequence;

  Event({
    this.role,
    this.text,
    this.type,
    this.sequence,
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
  String prev;
  String next;
  String text;
  int points;

  Sequence({
    this.prev,
    this.next,
    this.text,
    this.points,
  });

  factory Sequence.fromMap(Map<String, dynamic> json) => Sequence(
        prev: json["prev"],
        next: json["next"],
        text: json["text"],
        points: json["points"],
      );

  Map<String, dynamic> toMap() => {
        "prev": prev,
        "next": next,
        "text": text,
        "points": points,
      };
}
