class MessageModel {
  static const String collectionName = 'message';
  static const String createAt = 'createdAt';
  String? message;
  DateTime createdAt = DateTime.now();
  final String email;
  MessageModel({required this.email, this.message});

  MessageModel.fromFirestore(Map<String, dynamic> json)
      : this(
          message: json['message'],
          email: json['email']
          
        );

  Map<String, dynamic> tofirestore() {
    return {
      'message': message,
      'createdAt': createdAt,
      'email' : email
    };
  }
}
