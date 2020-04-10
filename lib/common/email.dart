import 'package:flutter/foundation.dart';
import 'package:flutter_kirthan/exceptions/validation_exception.dart';

//value objects are immutable
@immutable
class Email {
  Email(this.email) {
    if (!email.contains('@')) {
      //Validation at the time of construction
      throw ValidationException('Your email must contain "@"');
    }
  }
  final String  email;
}