import 'package:bus_tz/bloc/bus_bloc.dart';
import 'package:bus_tz/bloc/bus_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusBloc busBloc = context.read<BusBloc>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            busBloc.add(BusLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Refresh'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            busBloc.add(BusClearEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Clear'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            _showDatePicker(context, busBloc);
          },
          child: const Text('Select Date'),
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context, BusBloc busBloc) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      busBloc.add(BusDaySelectEvent(selectedDate));
      print('Selected date: $selectedDate');
    }
  }
}
