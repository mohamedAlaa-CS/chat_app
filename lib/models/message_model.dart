class MessageModel {
  static const String collectionName = 'message';
  static const String createAt = 'createdAt';
  String? message;
  DateTime createdAt = DateTime.now();
  MessageModel({this.message});

  MessageModel.fromFirestore(Map<String, dynamic> json)
      : this(
          message: json['message'],
        );

  Map<String, dynamic> tofirestore() {
    return {
      'message': message,
      'createdAt': createdAt,
    };
  }
}
