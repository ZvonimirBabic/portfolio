import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': <String, String>{
          'helloWorld': 'Hello world!',
          'appName': "Zvonimir Babić's portfolio app",
          'darkTheme': 'Dark mode',
          'lightTheme': 'Light mode',
          'theme': 'Theme',
          'fontSize': 'Font size',
          'socials': 'Find me on:',
          'education': 'My education:',
          'experience': 'My experience:',
          'interactive': 'Interactive examples:',
          'about_me':
              "Developer with a passion for mobile technologies. I enjoy doing what I know and learning what I don't. Looking forward to make ideas and design come to life in the palm of your hand.",
          'about_me2': 'Based in Europe, Croatia.',
          'quote1': 'We all make choices, but in the end, our choices make us',
          'quote1Author': '- Andrew Ryan',
          'quote2': 'Nec dei nec reges at homines soli',
          'takeALookResume': 'Take a look at my ',
          'ongoing': 'Ongoing',
        },
        'de_DE': <String, String>{
          'helloWorld': 'Hallo Welt!',
          'appName': "Zvonimir Babić's portfolio app",
        },
      };
}
