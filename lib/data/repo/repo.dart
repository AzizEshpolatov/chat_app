import '../models/contact_model.dart';
import '../models/message_model.dart';

List<MessageModel> allMessages = [
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: "Salom",
    messageId: 1,
    isFile: false,
    contactId: 1,
    status: true,
  ),
  MessageModel(
    createdTime: DateTime.monday.toString(),
    messageText: "Xabarni o'qidingizmi?",
    messageId: 2,
    isFile: false,
    contactId: 2,
    status: false,
  ),
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: "File yubordim",
    messageId: 3,
    isFile: true,
    contactId: 3,
    status: true,
  ),
  MessageModel(
    createdTime: DateTime.now().toString(),
    messageText: "File yubordim",
    messageId: 4,
    isFile: true,
    contactId: 4,
    status: false,
  ),
];

List<ContactModel> allContacts = [
  ContactModel(
    contactId: 1,
    contactLasName: "Aziz",
    contactName: "Eshpolatov",
    isOnline: true,
    imageUrl:
        "https://i.pinimg.com/736x/05/0a/1a/050a1aa571b87a8695ffad982969709e.jpg",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 2,
    contactLasName: "Samandar",
    contactName: "Rasulov",
    isOnline: false,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmrd_Wn93BxiyGKoSosKDAvtc7DGCxhv4nlHj68VojbQ&s",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 3,
    contactLasName: "Komil",
    contactName: "Abdullayev",
    isOnline: true,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTsP87RPKNy0M0JxBzseGaPLrPXbZMBY8iY85DaVAiBQ&s",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 4,
    contactLasName: "Akbar",
    contactName: "Eshquvvatov",
    isOnline: false,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPzqpzIE-RRHUeN8ORY489UqoP03YbhK-Mya3N7LiVLQ&s",
    lastOnlineTime: DateTime.now(),
  ),
];
