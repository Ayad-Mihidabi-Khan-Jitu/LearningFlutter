import '../models/user_model.dart';

class Post {
  var imageUrl;
  var author;
  var title;
  var location;
  var likes;
  var comments;

  Post({
    this.imageUrl,
    this.author,
    this.title,
    this.location,
    this.likes,
    this.comments,
  });
}
