import '../models/post_model.dart';

class User {
  var profileImageUrl;
  var backgroundImageUrl;
  var name;
  var following;
  var followers;
  var posts;
  var favorites;

  User({
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.name,
    this.following,
    this.followers,
    this.posts,
    this.favorites,
  });
}
