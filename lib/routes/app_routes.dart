import 'package:flutter/material.dart';
import 'package:resume_builder_appliaction/views/builder_option_page/all_options/technical_skills_page/technical_skills_page.dart';
import 'package:resume_builder_appliaction/views/builder_option_page/builder_option_page.dart';
import 'package:resume_builder_appliaction/views/splash_screen/splash_screen.dart';

import '../views/builder_option_page/all_options/contact_info/contact_info.dart';
import '../views/builder_option_page/all_options/personal_details_page/personal_details_page.dart';
import '../views/home_page/home_page.dart';

class AppRoutes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
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
    {
      'icon': "${iconPath}declaration.png",
      'title': "Technical Skills",
      'route': "technical_skills_page",
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    builderOptionPage: (context) => const BuilderOptionPage(),
    allOptions[0]['route']: (context) => const ContactInfo(),
    allOptions[1]['route']: (context) => const PersonalDetailsPage(),
    allOptions[3]['route']:(context)=>const TechnicalSkillsPage(),
  };
}
