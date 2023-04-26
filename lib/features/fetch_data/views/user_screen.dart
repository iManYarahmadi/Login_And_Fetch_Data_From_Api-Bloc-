

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../fetch_data/bloc/app_bloc.dart';
import '../../fetch_data/bloc/app_events.dart';
import '../../fetch_data/bloc/app_states.dart';
import '../../fetch_data/model/usermodel.dart';
import '../../fetch_data/repo/repository.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blocBody(),
    );
  }
  Widget blocBody() {
    return BlocProvider(
        create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              final List<UserModel> userlist = state.users;
              return ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (_, index) {
                    return Padding(padding: const EdgeInsets.all(12),
                    child: Card(
                      child: ListTile(
                        title: Text('${userlist[index].firstName} ${userlist[index].lastName}'),
                        subtitle: Text('${userlist[index].email}'),
                        leading: CircleAvatar(backgroundImage: NetworkImage(userlist[index].avatar.toString())),
                      ),
                    ),
                    );
                  
                  });
            }
            return Container();
          },
        ));
  }
}