import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context); //scoped approach

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc), //field required for scoped approach
          passwordField(bloc),
          loginCheckbox(bloc),
          SizedBox(
            height: 10.0,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField([Bloc bloc]) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              hintText: 'you@example.com',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField([Bloc bloc]) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget loginCheckbox(bloc) {
    return StreamBuilder(
      stream: bloc.login,
      builder: (context, snapshot) {
        return CheckboxListTile(
          title: Text("Keep me logged in."),
          value: snapshot.data != null ? snapshot.data : false,
          onChanged: bloc.changeLoginState,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          color: Colors.blue,
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
