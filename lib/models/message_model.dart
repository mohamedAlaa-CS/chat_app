class MessageModel {
  static const String collectionName = 'message';
  static const String createAt = 'createdAt';
  String? message;
  String? image;
  DateTime createdAt = DateTime.now();
  final String email;
  MessageModel({required this.email, this.message, this.image});

  MessageModel.fromFirestore(Map<String, dynamic> json)
      : this(
            message: json['message'],
            email: json['email'],
            image: json['image']);

  Map<String, dynamic> tofirestore() {
    return {
      'message': message,
      'createdAt': createdAt,
      'email': email,
      'image': image
    };
  }
}
