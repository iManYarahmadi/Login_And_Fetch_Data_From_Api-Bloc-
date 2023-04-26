import 'package:fetchdatafromapi/features/auth/bloc/auth_bloc.dart';
import 'package:fetchdatafromapi/features/auth/views/login.dart';
import 'package:fetchdatafromapi/features/fetch_data/bloc/app_bloc.dart';
import 'package:fetchdatafromapi/features/fetch_data/bloc/app_events.dart';
import 'package:fetchdatafromapi/features/fetch_data/bloc/app_states.dart';
import 'package:fetchdatafromapi/features/fetch_data/model/usermodel.dart';
import 'package:fetchdatafromapi/features/fetch_data/repo/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/repository/repo_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        
        ),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthRepo()))
      ],
      child: MaterialApp(
        home: Login(),
      ),
    );
  }
    

}
