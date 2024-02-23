import 'package:bus_tz/bloc/bus_bloc.dart';
import 'package:bus_tz/bloc/bus_event.dart';
import 'package:bus_tz/data/sources/bus_api.dart';
import 'package:bus_tz/data/sources/bus_repository.dart';
import 'package:bus_tz/presentation/widget/action_buttons.dart';
import 'package:bus_tz/presentation/widget/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final BusApi _busApi = BusApi();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BusRepository(),
      child: BlocProvider(
        create: (context) =>
            BusBloc(busRepository: context.read<BusRepository>())
              ..add(BusLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User List'),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
