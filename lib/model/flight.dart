class Flight {
  String? flightNo;
  String? name;
  String? from;
  String? to;
  String? time;

  Flight({this.flightNo, this.name, this.from, this.to, this.time});

  Flight.fromJson(Map<String, dynamic> json) {
    flightNo = json['flightNo'];
    name = json['name'];
    from = json['from'];
    to = json['to'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flightNo'] = flightNo;
    data['name'] = name;
    data['from'] = from;
    data['to'] = to;
    data['time'] = time;
    return data;
  }
}
