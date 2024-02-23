class BusModel {
  Map<String, Trip> trips;

  BusModel({
    required this.trips,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> tripsJson = json['trips'];
    final Map<String, Trip> trips =
        tripsJson.map((key, value) => MapEntry(key, Trip.fromJson(value)));
    return BusModel(trips: trips);
  }
}

class Trip {
  String id;
  String routeId;
  String scheduleTripId;
  String routeName;
  String routeNum;
  String carrier;
  Bus bus;
  String driver1;
  String driver2;
  String frequency;
  String waybillNum;
  String status;
  String statusPrint;
  dynamic statusReason;
  dynamic statusComment;
  DateTime? statusDate;

  DateTime departureTime;
  DateTime? arrivalToDepartureTime;

  DateTime arrivalTime;
  String distance;
  int duration;
  bool transitSeats;
  int freeSeatsAmount;
  String passengerFareCost;
  List<dynamic> fares;
  int platform;
  bool onSale;
  List<dynamic> route;
  bool additional;
  List<dynamic> additionalTripTime;
  bool? transitTrip;
  String? saleStatus;
  bool acbpdp;
  dynamic factTripReturnTime;
  String currency;
  String principalTaxId;

  String passengerFareCostAvibus;

  Trip({
    required this.id,
    required this.routeId,
    required this.scheduleTripId,
    required this.routeName,
    required this.routeNum,
    required this.carrier,
    required this.bus,
    required this.driver1,
    required this.driver2,
    required this.frequency,
    required this.waybillNum,
    required this.status,
    required this.statusPrint,
    required this.statusReason,
    required this.statusComment,
    required this.statusDate,
    required this.departureTime,
    required this.arrivalToDepartureTime,
    required this.arrivalTime,
    required this.distance,
    required this.duration,
    required this.transitSeats,
    required this.freeSeatsAmount,
    required this.passengerFareCost,
    required this.fares,
    required this.platform,
    required this.onSale,
    required this.route,
    required this.additional,
    required this.additionalTripTime,
    required this.transitTrip,
    required this.saleStatus,
    required this.acbpdp,
    required this.factTripReturnTime,
    required this.currency,
    required this.principalTaxId,
    required this.passengerFareCostAvibus,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      routeId: json['routeId'],
      scheduleTripId: json['scheduleTripId'],
      routeName: json['routeName'],
      routeNum: json['routeNum'],
      carrier: json['carrier'],
      bus: Bus.fromJson(json['bus']),
      driver1: json['driver1'],
      driver2: json['driver2'],
      frequency: json['frequency'],
      waybillNum: json['waybillNum'],
      status: json['status'],
      statusPrint: json['statusPrint'],
      statusReason: json['statusReason'],
      statusComment: json['statusComment'],
      statusDate: json['statusDate'] != null
          ? DateTime.parse(json['statusDate'])
          : null,
      departureTime: DateTime.parse(json['departureTime']),
      arrivalToDepartureTime: json['arrivalToDepartureTime'] != null
          ? DateTime.parse(json['arrivalToDepartureTime'])
          : null,
      arrivalTime: DateTime.parse(json['arrivalTime']),
      distance: json['distance'],
      duration: json['duration'],
      transitSeats: json['transitSeats'],
      freeSeatsAmount: json['freeSeatsAmount'],
      passengerFareCost: json['passengerFareCost'],
      fares: json['fares'],
      platform: json['platform'],
      onSale: json['onSale'],
      route: json['route'],
      additional: json['additional'],
      additionalTripTime: json['additionalTripTime'],
      transitTrip: json['transitTrip'],
      saleStatus: json['saleStatus'],
      acbpdp: json['acbpdp'],
      factTripReturnTime: json['factTripReturnTime'],
      currency: json['currency'],
      principalTaxId: json['principalTaxId'],
      passengerFareCostAvibus: json['passengerFareCostAvibus'],
    );
  }
}

class Bus {
  String? id;
  String? model;
  String? licencePlate;
  String? name;
  String? seatsClass;
  int? seatCapacity;

  Bus({
    this.id,
    this.model,
    this.licencePlate,
    this.name,
    this.seatsClass,
    this.seatCapacity,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['Id'] as String?,
      model: json['Model'] as String?,
      licencePlate: json['LicencePlate'] as String?,
      name: json['Name'] as String?,
      seatsClass: json['SeatsClass'] as String?,
      seatCapacity: json['SeatCapacity'] as int?,
    );
  }
}
