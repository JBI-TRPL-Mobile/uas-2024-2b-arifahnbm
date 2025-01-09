class Message {
  final int id;
  final String message;
  final int userId;

  Message({required this.id, required this.message, required this.userId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      message: json['message'],
      userId: json['userId'],
    );
  }
}