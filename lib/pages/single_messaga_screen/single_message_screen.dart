import 'package:chat_app/data/models/contact_model.dart';
import 'package:chat_app/data/repo/repo.dart';
import 'package:chat_app/utils/app_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_filex/open_filex.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../bloc/message_bloc.dart';
import '../../bloc/message_event.dart';
import '../../cubit/insert_message_cubit.dart';
import '../../data/models/message_model.dart';
import '../../services/file_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_size.dart';

class SingleMessageScreen extends StatefulWidget {
  const SingleMessageScreen({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  State<SingleMessageScreen> createState() => _SingleMessageScreenState();
}

class _SingleMessageScreenState extends State<SingleMessageScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    List<MessageModel> messages = context
        .watch<MessageCubit>()
        .sortMessage(contactId: widget.contactModel.contactId);

    debugPrint('-------------------${messages.length}---------------');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: width,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black, size: 16),
                  ),
                  Text(
                    "${widget.contactModel.contactName} ${widget.contactModel.contactLasName}",
                    style: TextStyle(
                      fontSize: 18.w,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.black),
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.all(5.w),
                      child: SvgPicture.asset(AppImages.m, height: 12.h),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 680.h,
              width: width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.getH(),
                    allMessages[widget.contactModel.contactId - 1].isFile
                        ? Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 250.w,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h, horizontal: 16.w),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.cD84D4D1F.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(12.w),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Description.docx",
                                          style: TextStyle(
                                            fontSize: 15.w,
                                            color: Colors.black,
                                          ),
                                        ),
                                        10.getH(),
                                        Text(
                                          "Description.docx",
                                          style: TextStyle(
                                            fontSize: 15.w,
                                            color: Colors.black,
                                          ),
                                        ),
                                        50.getH(),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: () async {
                                        String filePath =
                                            FileManagerService.isExist(
                                          messages[widget
                                                      .contactModel.contactId]
                                              .messageText,
                                          widget.contactModel.contactName,
                                        );

                                        if (filePath.isNotEmpty) {
                                          await OpenFilex.open(filePath);
                                        } else {
                                          MessageBloc().add(
                                            DownLoadEvent(
                                              messages: context
                                                  .read<MessageBloc>()
                                                  .state
                                                  .messages,
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 250.w,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: AppColors.cD84D4D1F,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.w),
                                            bottomRight: Radius.circular(12.w),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Download",
                                              style: TextStyle(
                                                fontSize: 15.w,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.download,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppImages.more),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 16.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: AppColors.cD84D4D1F,
                                ),
                                child: Text(
                                  allMessages[widget.contactModel.contactId - 1]
                                      .messageText,
                                  style: TextStyle(
                                    fontSize: 15.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppImages.more),
                              ),
                            ],
                          ),
                    16.getH(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...List.generate(
                          messages.length,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(AppImages.more),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 12.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.w),
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2.w,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      messages[index].messageText,
                                      style: TextStyle(
                                        fontSize: 15.w,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppImages.add),
                ),
                SizedBox(
                  height: 36.h,
                  width: 275.w,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.w),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: AppColors.cF7F7FC,
                        ),
                      ),
                      hintText: "Send message",
                      hintStyle: TextStyle(
                        fontSize: 14.w,
                        color: AppColors.cADB5BD,
                      ),
                      fillColor: AppColors.cF7F7FC,
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    MessageModel messageModel = MessageModel(
                      createdTime: DateTime.now().toString(),
                      messageText: controller.text,
                      messageId: widget.contactModel.contactId,
                      isFile: false,
                      contactId: widget.contactModel.contactId,
                      status: true,
                    );
                    context
                        .read<MessageCubit>()
                        .insertMessages(messageModel: messageModel);
                    controller.clear();
                    setState(() {});
                  },
                  icon: SvgPicture.asset(AppImages.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
