import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/views/builder_option_page/builder_option_page.dart';

import '../views/home_page/home_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String builderOptionPage = 'builder_option_page';
  static String iconPath = 'lib/assets/icons/';
  static List<Map<String, dynamic>> allOptions = [
    {
      'icon': "${iconPath}contact_detail-removebg-preview (1).png",
      'title': "Contact Info",
      'route': "contact_info_page",
    },
    {
      'icon': "${iconPath}user.png",
      'title': "Personal Details",
      'route': "personal_details_page",
    },
    {
      'icon': "${iconPath}graduation-cap.png",
      'title': "Education",
      'route': "education_info_page",
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => const HomePage(),
    builderOptionPage: (context) => const BuilderOptionPage(),
  };
}
