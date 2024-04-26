import 'package:chat_app/pages/all_message_screen/widgets/acount_item.dart';
import 'package:chat_app/pages/all_message_screen/widgets/item.dart';
import 'package:chat_app/pages/single_messaga_screen/single_message_screen.dart';
import 'package:chat_app/utils/app_colors.dart';
import 'package:chat_app/utils/app_img.dart';
import 'package:chat_app/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/repo/repo.dart';

class AllMessageScreen extends StatelessWidget {
  const AllMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: width,
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 16.w),
              child: Row(
                children: [
                  Text(
                    "Conversations",
                    style: TextStyle(
                      fontSize: 18.w,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.message),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {},
                        child: Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.w),
                            border: Border.all(
                              width: 2.h,
                              color: AppColors.cADB5BD,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppImages.add),
                          ),
                        ),
                      ),
                      5.getH(),
                      Text(
                        "Your Story",
                        style: TextStyle(
                          color: AppColors.c0F1828,
                          fontSize: 10.w,
                        ),
                      ),
                    ],
                  ),
                  16.getW(),
                  ...List.generate(
                    allContacts.length,
                    (index) => ContactItem(
                      title: allContacts[index].contactName,
                      imgPath: allContacts[index].imageUrl,
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.getH(),
          Container(
            height: 0.2,
            width: width,
            color: Colors.grey,
          ),
          16.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36.h,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.w),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: AppColors.cF7F7FC,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: SvgPicture.asset(AppImages.search),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 14.w,
                        color: AppColors.cADB5BD,
                      ),
                      fillColor: AppColors.cF7F7FC,
                      filled: true,
                    ),
                  ),
                ),
                16.getH(),
                SizedBox(
                  height: 500.h,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          allContacts.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SingleMessageScreen(
                                      contactModel: allContacts[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: AccountItem(
                              contactModel: allContacts[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.h,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.persons,
                    height: 24.w,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Conversations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.w,
                      ),
                    ),
                    5.getH(),
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppImages.menu,
                    width: 21.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
