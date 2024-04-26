class MessageStatusModel {
  final bool isExist;
  final String newFileLocation;

  MessageStatusModel({
    required this.newFileLocation,
    required this.isExist,
  });

  MessageStatusModel copyWith({bool? isExist, String? newFileLocation}) =>
      MessageStatusModel(
        newFileLocation: newFileLocation ?? this.newFileLocation,
        isExist: isExist ?? this.isExist,
      );
}