import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/models/message_model.dart';
import '../services/file_service.dart';
import 'message_event.dart';
import 'message_state.dart';

class MessageBloc extends Bloc<BookEvent, MessageState> {
  MessageBloc()
      : super(MessageState(
            progress: 0,
            newFileLocation: "",
            messages: MessageModel(
              createdTime: '',
              messageText: '',
              messageId: 1,
              isFile: true,
              contactId: 0,
              status: false,
            ))) {
    on<DownLoadEvent>(_downloadFile);
  }

  Future<void> _downloadFile(DownLoadEvent event, emit) async {
    Dio dio = Dio();

    MessageStatusModel fileStatusModel = await getStatus(event.messages);

    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.messages.messageText,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      await FileManagerService.init();
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;

    try {
      directory = Directory("/storage/emulated/0/Download");
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    } catch (error) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }

  Future<MessageStatusModel> getStatus(MessageModel fileDataModel) async {
    final MessageStatusModel fileStatusModel =
        await Isolate.run<MessageStatusModel>(() async {
      return await FileManagerService.checkFile(fileDataModel);
    });
    return fileStatusModel;
  }
}
