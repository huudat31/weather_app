class FamousCities {
  final String name;
  final double lat;
  final double lon;
  const FamousCities(
      {required this.name, required this.lat, required this.lon});
}

List<FamousCities> famousCities = [
  FamousCities(name: 'New York', lat: 40.7128, lon: -74.0060),
  FamousCities(name: 'London', lat: 51.5074, lon: -0.1278),
  FamousCities(name: 'Paris', lat: 48.8566, lon: 2.3522),
  FamousCities(name: 'Tokyo', lat: 35.6895, lon: 139.6917),
  FamousCities(name: 'Rome', lat: 41.9028, lon: 12.4964),
  FamousCities(
      name: 'Sydney',
      lat: -33.8688,
      lon: 151.2099), // Add more famous cities here
];
