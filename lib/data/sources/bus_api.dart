import 'package:bus_tz/data/models/bus_model.dart';
import 'package:dio/dio.dart';

class BusApi {
  final Dio _dio = Dio();

  Future<List<Bus>> getBusList(String date) async {
    try {
      final response = await _dio.get(
          'https://bibiptrip.com/api/avibus/search_trips_cities/?departure_city=%D0%9A%D0%B0%D0%B7%D0%B0%D0%BD%D1%8C&destination_city=%D0%A3%D1%84%D0%B0&date=${date}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        final trips = responseData['trips'] as List;

        final List<Bus> buses = trips.map((json) {
          final busJson = json['Bus'];
          return Bus.fromJson(busJson);
        }).toList();

        return buses;
      } else {
        throw Exception('Failed to fetch bus data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
