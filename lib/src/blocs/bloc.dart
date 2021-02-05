import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //add data to the Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //retrieve Streams
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  void submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Posting to API: $validEmail and $validPassword.');
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// final bloc = Bloc(); Single global instance approach
