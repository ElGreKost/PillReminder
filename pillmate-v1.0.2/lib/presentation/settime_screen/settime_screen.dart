import 'package:pillmate/presentation/homescreen_page/homescreen_page.dart';
import 'package:pillmate/presentation/iphone_11_pro_max_twentysix_page/iphone_11_pro_max_twentysix_page.dart';
import 'package:pillmate/widgets/app_bar/custom_app_bar.dart';
import 'package:pillmate/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:pillmate/widgets/app_bar/appbar_title.dart';
import 'package:pillmate/widgets/app_bar/appbar_trailing_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:pillmate/widgets/custom_elevated_button.dart';
import 'package:pillmate/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pillmate/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SettimeScreen extends StatelessWidget {
  SettimeScreen({Key? key}) : super(key: key);

  List<DateTime?> selectedDatesFromCalendar1 = [];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 29.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        SizedBox(
                            height: 36.adaptSize,
                            width: 36.adaptSize,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  alignment: Alignment.center,
                                  onTap: () {
                                    onTapImgArrowDown(context);
                                  }),
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  alignment: Alignment.center)
                            ])),
                        Container(
                            height: 29.v,
                            width: 96.h,
                            margin: EdgeInsets.only(
                                left: 110.h, top: 4.v, bottom: 2.v),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("Set Time",
                                      style: theme.textTheme.headlineSmall)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("Set Time",
                                      style: theme.textTheme.headlineSmall))
                            ]))
                      ])),
                  SizedBox(height: 63.v),
                  _buildCalendar(context),
                  Spacer(),
                  SizedBox(height: 78.v),
                  CustomElevatedButton(width: 129.h, text: "Done")
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 58.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgMegaphone,
            margin: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 13.v),
            onTap: () {
              onTapMegaphone(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Rinvoq, 15 mg"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(27.h, 18.v, 27.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return SizedBox(
        height: 269.v,
        width: 313.h,
        child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                firstDayOfWeek: 0),
            value: selectedDatesFromCalendar1,
            onValueChanged: (dates) {}));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homescreenPage;
      case BottomBarEnum.Guide:
        return "/";
      case BottomBarEnum.Medications:
        return AppRoutes.iphone11ProMaxTwentysixPage;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homescreenPage:
        return HomescreenPage();
      case AppRoutes.iphone11ProMaxTwentysixPage:
        return Iphone11ProMaxTwentysixPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapMegaphone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }

  /// Navigates to the iphone11ProMaxSixteenScreen when the action is triggered.
  onTapImgArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iphone11ProMaxSixteenScreen);
  }
}
