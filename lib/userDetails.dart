// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetails({this.displayName, this.email, this.photoURL});

  UserDetails.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = new Map<String, dynamic>();
    mapData['displayName'] = this.displayName;
    mapData['email'] = this.email;
    mapData['photoURL'] = this.photoURL;
    return mapData;
  }
}
