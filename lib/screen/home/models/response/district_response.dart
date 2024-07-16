class DistrictResponse {
  List<Places>? places;
  num? status;

  DistrictResponse({this.places, this.status});

  DistrictResponse.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Places {
  int? id;
  String? name;
  String? center;

  Places({this.id, this.name, this.center});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    center = json['center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['center'] = this.center;
    return data;
  }
}
