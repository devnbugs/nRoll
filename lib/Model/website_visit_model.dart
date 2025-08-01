class WebsiteVisitModel {
  WebsiteVisitModel({
    num? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  WebsiteVisitModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Data>? _data;

  num? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    num? id,
    String? title,
    String? type,
    String? url,
    num? price,
    num? rewardPoint,
    num? duration,
    num? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _type = type;
    _url = url;
    _price = price;
    _rewardPoint = rewardPoint;
    _duration = duration;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _type = json['type'];
    _url = json['url'];
    _price = json['price'];
    _rewardPoint = json['reward_point'];
    _duration = json['duration'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _type;
  String? _url;
  num? _price;
  num? _rewardPoint;
  num? _duration;
  num? _status;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get title => _title;
  String? get type => _type;
  String? get url => _url;
  num? get price => _price;
  num? get rewardPoint => _rewardPoint;
  num? get duration => _duration;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['type'] = _type;
    map['url'] = _url;
    map['price'] = _price;
    map['reward_point'] = _rewardPoint;
    map['duration'] = _duration;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
