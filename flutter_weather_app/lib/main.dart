import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sehirler = [
    "İstanbul",
    "Ankara",
    "Eskisehir",
    "İzmir",
    "Erzurum",
    "Adana",
    "Kars",
    "Antalya"
  ];

  String? secilenSehir;
  Future<WeatherModel>? weatherFuture;

  void selectedCity(String? sehir) {
    final secilecekSehir = sehir ?? sehirler[0];
    setState(() {
      secilenSehir = secilecekSehir;
      weatherFuture = getWeather(secilecekSehir);
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCity(null); // null gönderirsen 0. index seçilecek
  }


  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.weatherapi.com/v1",
      queryParameters: {"key": "c5f937595ed74ffa82690426251611", "lang": "tr"},
    ),
  );

  Future<WeatherModel> getWeather(String secilenSehir) async {
    try {
      final response = await dio.get(
        "/current.json",
        queryParameters: {"q": secilenSehir},
      );

      var model = WeatherModel.fromJson(response.data);
      debugPrint(model.current.tempC.toString());
      return model;
    } catch (e) {
      debugPrint("Hata: $e");
      throw Exception("Weather fetch failed");
    }
  }

  Widget _buildWeatherCard(WeatherModel weatherModel) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              weatherModel.location.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              "${weatherModel.current.tempC.round()}°",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Text(weatherModel.current.condition.text),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.water_drop_outlined),
                    SizedBox(height: 4),
                    Text(weatherModel.current.humidity.round().toString()),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.air_outlined),
                    SizedBox(height: 4),
                    Text(weatherModel.current.windMph.round().toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Hava Durumu')),
      body: Column(
        children: [
          if (weatherFuture != null)
            FutureBuilder(
              future: weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData) {
                  return _buildWeatherCard(snapshot.data!);
                }
                return SizedBox();
              },
            ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final isSelected=secilenSehir==sehirler[index];
                return GestureDetector(
                  onTap: () => selectedCity(sehirler[index]),
                  child: Card(
                    color: isSelected ? Theme.of(context).colorScheme.primaryContainer:null,
                    child: Center(child: Text(sehirler[index]))),
                );
              },
              itemCount: sehirler.length,
            ),
          ),
        ],
      ),
    );
  }
}
