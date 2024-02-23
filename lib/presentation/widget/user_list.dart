import 'dart:developer';

import 'package:bus_tz/bloc/bus_bloc.dart';
import 'package:bus_tz/bloc/bus_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusBloc, BusState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is BusLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is BusEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is BusLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BusLoadedState) {
          return ListView.builder(
            itemCount: state.loadedBus.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Text(
                    'ID: ${state.loadedBus[index].id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      "Name : ${state.loadedBus[index].name}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'Model: ${state.loadedBus[index].model}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
