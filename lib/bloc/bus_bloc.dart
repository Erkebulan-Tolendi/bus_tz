import 'package:bus_tz/bloc/bus_event.dart';
import 'package:bus_tz/bloc/bus_state.dart';
import 'package:bus_tz/data/models/bus_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/sources/bus_repository.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final BusRepository busRepository;
  BusBloc({required this.busRepository}) : super(BusEmptyState()) {
    on<BusLoadEvent>(
      (event, emit) async {
        emit(BusLoadingState());

        try {
          final List<Bus> loadedBusList =
              await busRepository.getAllBus("2024-02-23");
          emit(BusLoadedState(loadedBus: loadedBusList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<BusClearEvent>(
      (event, emit) async {
        emit(BusEmptyState());
      },
    );
  }
}
