abstract class BusEvent {}

class BusLoadEvent extends BusEvent {}

class BusClearEvent extends BusEvent {}

class BusDaySelectEvent extends BusEvent {
  BusDaySelectEvent(DateTime selectedDate);
}
