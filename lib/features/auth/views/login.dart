import 'package:fetchdatafromapi/features/fetch_data/bloc/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_page.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../fetch_data/bloc/app_bloc.dart';
import '../../fetch_data/bloc/app_states.dart';
import '../../fetch_data/model/usermodel.dart';
import '../../fetch_data/repo/repository.dart';
import '../../fetch_data/views/user_screen.dart';
import '../bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

//eve.holt@reqres.in
//cityslick
class _LoginState extends State<Login> {
  final TextEditingController email =
      TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController password = TextEditingController(text: '12345');
  AuthBloc? _authBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
      _authBloc!.add(LoginEvent(email: email.text, password: password.text));
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Screen"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextFormField(
                textEditingController: email,
                obscure: false,
                validator: (value) =>
                    value!.isEmpty ? 'enter your email ' : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextFormField(
                textEditingController: password,
                obscure: true,
                validator: (value) =>
                    value!.isEmpty ? 'enter your password' : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is AuthLoading) {
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (state is AuthSuccessful) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserScreen();
                  }));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Welcome")));
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Error")));
                }
              },
              child: CustomButton(
                  onPressed: () {
                    validateAndSave();
                  },
                  text: "login"),
            )
          ],
        ),
      ),
    );
  }
}
