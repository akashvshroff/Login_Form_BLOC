import 'dart:async';

class Bloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //add data to the Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //retrieve Streams
  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;
}
