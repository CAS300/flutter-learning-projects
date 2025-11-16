import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));
String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location location;
  Current current;

  WeatherModel({required this.location, required this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current": current.toJson(),
  };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: (json["lat"] as num).toDouble(),
    lon: (json["lon"] as num).toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  double windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  int humidity;
  double cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: (json["temp_c"] as num).toDouble(),
    tempF: (json["temp_f"] as num).toDouble(),
    isDay: json["is_day"],
    condition: Condition.fromJson(json["condition"]),
    windMph: (json["wind_mph"] as num).toDouble(),
    windKph: (json["wind_kph"] as num).toDouble(),
    windDegree: (json["wind_degree"] as num).toDouble(),
    windDir: json["wind_dir"],
    pressureMb: (json["pressure_mb"] as num).toDouble(),
    pressureIn: (json["pressure_in"] as num).toDouble(),
    precipMm: (json["precip_mm"] as num).toDouble(),
    precipIn: (json["precip_in"] as num).toDouble(),
    humidity: json["humidity"],
    cloud: (json["cloud"] as num).toDouble(),
    feelslikeC: (json["feelslike_c"] as num).toDouble(),
    feelslikeF: (json["feelslike_f"] as num).toDouble(),
    windchillC: (json["windchill_c"] as num).toDouble(),
    windchillF: (json["windchill_f"] as num).toDouble(),
    heatindexC: (json["heatindex_c"] as num).toDouble(),
    heatindexF: (json["heatindex_f"] as num).toDouble(),
    dewpointC: (json["dewpoint_c"] as num).toDouble(),
    dewpointF: (json["dewpoint_f"] as num).toDouble(),
    visKm: (json["vis_km"] as num).toDouble(),
    visMiles: (json["vis_miles"] as num).toDouble(),
    uv: (json["uv"] as num).toDouble(),
    gustMph: (json["gust_mph"] as num).toDouble(),
    gustKph: (json["gust_kph"] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "dewpoint_f": dewpointF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
  };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}
