import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  String body;
  String author;
  Set userLiked = {};

  DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(User user) {
    if (this.userLiked.contains(user.uid)) {
      this.userLiked.remove(user.uid);
    } else {
      this.userLiked.add(user.uid);
    }
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'usersLiked': this.userLiked,
      'body': this.body
    };
  }
}
