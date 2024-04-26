import 'package:equatable/equatable.dart';
import '../data/models/message_model.dart';

class MessageState extends Equatable {
  const MessageState({
    required this.progress,
    required this.messages,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;
  final MessageModel messages;

  MessageState copyWith({
    double? progress,
    String? newFileLocation,
    MessageModel? messages,
  }) {
    return MessageState(
      progress: progress ?? this.progress,
      newFileLocation: newFileLocation ?? this.newFileLocation,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [
        progress,
        newFileLocation,
        messages,
      ];
}
