import 'package:bus_tz/data/models/bus_model.dart';

abstract class BusState {}

class BusEmptyState extends BusState {}

class BusLoadingState extends BusState {}

class BusLoadedState extends BusState {
  List<Bus> loadedBus;
  BusLoadedState({
    required this.loadedBus,
  });
}

class BusDaySelectEvent extends BusState {
  String date;
  BusDaySelectEvent({
    required this.date,
  });
}

class UserErrorState extends BusState {}
