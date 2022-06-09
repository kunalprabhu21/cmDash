class RadioModel {
  String? _id;
  String? _name;





  RadioModel.fromJson(Map<String, dynamic> json) {

    _id = json['id'];
    _name = json['name'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;



    return data;
  }

  String? get getName => _name;

  String? get getId => _id;

  set name(String? value) {
    _name = value;
  }

  set id(String? value) {
    _id = value;
  }
}
