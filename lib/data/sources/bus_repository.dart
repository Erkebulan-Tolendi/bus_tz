import 'package:bus_tz/data/models/bus_model.dart';
import 'package:bus_tz/data/sources/bus_api.dart';

class BusRepository {
  final BusApi _busProvider = BusApi();
  Future<List<Bus>> getAllBus(String date) => _busProvider.getBusList(date);
}
