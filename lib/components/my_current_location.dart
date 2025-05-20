import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  String currentLocation = "Choose your location";

  // Метод для открытия окна поиска городов
  void _openCitySearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CitySearchScreen(
          onCitySelected: (city) {
            setState(() {
              currentLocation = city;
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery now",
            style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
          ),
          GestureDetector(
            onTap: () => _openCitySearch(context),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    currentLocation,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Новый экран для поиска городов
class CitySearchScreen extends StatefulWidget {
  final Function(String) onCitySelected;

  const CitySearchScreen({super.key, required this.onCitySelected});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _cityController = TextEditingController();
  List<String> _cities = [];
  bool _isLoading = false;

  Future<void> _searchCities(String query) async {
    if (query.length < 2) {
      setState(() {
        _cities = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$query&count=5&language=ru'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _cities = (data['results'] as List?)
            ?.map((city) => city['name'].toString())
            .toList() ?? [];
        _isLoading = false;
      });
    } else {
      setState(() {
        _cities = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search city'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Input a city',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _searchCities,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cities[index]),
                    onTap: () {
                      widget.onCitySelected(_cities[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}