// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccountSignIn": MessageLookupByLibrary.simpleMessage(
            "Already have an account? Sign In"),
        "dontHaveAnAccountCreateOne": MessageLookupByLibrary.simpleMessage(
            "Don\'t have an account? Create one"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailOrPasswordIsIncorrect": MessageLookupByLibrary.simpleMessage(
            "Email or password is incorrect"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter Email"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter Password"),
        "enterYourEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "enterYourNameAndSurname":
            MessageLookupByLibrary.simpleMessage("Enter your name and surname"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Enter your Password"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorFetchingNewsData":
            MessageLookupByLibrary.simpleMessage("Error fetching News data."),
        "errorFetchingProfileData": MessageLookupByLibrary.simpleMessage(
            "Error fetching profile data."),
        "initialState": MessageLookupByLibrary.simpleMessage("Initial state"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "news": MessageLookupByLibrary.simpleMessage("News"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "qr": MessageLookupByLibrary.simpleMessage("QR"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "stories": MessageLookupByLibrary.simpleMessage("Stories")
      };
}
