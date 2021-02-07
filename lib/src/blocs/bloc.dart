import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _loginStateController = BehaviorSubject<bool>();

  //add data to the Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(bool) get changeLoginState => _loginStateController.sink.add;

  //retrieve Streams
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get login => _loginStateController.stream;
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  void submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    final loginState = _loginStateController.value;

    print(
        'Posting to API: $validEmail and $validPassword. Keep logged in: $loginState.');
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _loginStateController.close();
  }
}

// final bloc = Bloc(); Single global instance approach
