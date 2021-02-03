import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //add data to the Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //retrieve Streams
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
