class Flight {
  String departureCity;
  String arrivalCity;
  String flightNumber;
  String departureTime;
  String arrivalTime;

  Flight({
    required this.departureCity,
    required this.arrivalCity,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
  });

  void update({
    String? departureCity,
    String? arrivalCity,
    String? flightNumber,
    String? departureTime,
    String? arrivalTime,
  }) {
    if (departureCity != null) this.departureCity = departureCity;
    if (arrivalCity != null) this.arrivalCity = arrivalCity;
    if (flightNumber != null) this.flightNumber = flightNumber;
    if (departureTime != null) this.departureTime = departureTime;
    if (arrivalTime != null) this.arrivalTime = arrivalTime;
  }
}
