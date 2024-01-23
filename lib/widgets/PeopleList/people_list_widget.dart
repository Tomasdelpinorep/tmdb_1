import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/models/people_list_response/people_list_response/people_list_response.dart';
import 'package:tmdb/widgets/PeopleList/people_list_item.dart';

Future<PeopleListResponse> fetchPeopleList() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=fba6287e1b5585e45727ead4703af755'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PeopleListResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load people list.');
  }
}

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({super.key});

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  late Future<PeopleListResponse> futurePeopleList;

  @override
  void initState() {
    super.initState();
    futurePeopleList = fetchPeopleList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PeopleListResponse>(
      future: futurePeopleList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PeopleListItem(
              peopleList: snapshot.data!.results);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Skeletonizer(
          enabled: true,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text('')
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
