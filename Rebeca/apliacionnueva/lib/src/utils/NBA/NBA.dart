import 'package:flutter/material.dart';
import '../../services/ServiceNBA.dart';
import 'NBADataAPI.dart';

class PaginaNBA extends StatelessWidget {
  const PaginaNBA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tmDataBaseAPI = NBADataAPI();
    final apiKey = '1ca988eb2266d46e1937b57cc2410d31';
    final movieService = NbaServices(tmDataBaseAPI, apiKey);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API NBA",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Teams'),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: movieService.listTeams(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print('Error en FutureBuilder: ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final nbas = snapshot.data;
              print('Tamaño de nbas: ${nbas?.length}');
              print('Datos de snapshot: ${snapshot.data}');
              if (nbas != null && nbas.isNotEmpty) {
                return ListView.builder(
                  itemCount: nbas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final nba = nbas[index];
                    return ListTile(
                      title: Text(nba['name']),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No se encontraron teams'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
