class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class AlmatiLocation extends AppLatLong {
  const AlmatiLocation({
    super.lat = 43.238949,
    super.long = 76.889709,
  });
}