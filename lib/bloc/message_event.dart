import 'package:chat_app/data/models/message_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class DownLoadEvent extends BookEvent {
  const DownLoadEvent({required this.messages});

  final MessageModel messages;

  @override
  List<Object?> get props => [messages];
}
