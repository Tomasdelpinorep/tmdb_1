import 'package:flutter/material.dart';
import 'package:tmdb/models/people_list_response/people_list_response/result.dart';

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({super.key, this.peopleList});
  final List<Person>? peopleList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: peopleList!.length,
      itemBuilder: (context, index) {
        return Card(
          surfaceTintColor: Colors.white,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(8),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${peopleList![index].profilePath}',
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    peopleList![index].name.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}



//  'https://image.tmdb.org/t/p/w500${movieList![index].posterPath}'
// Text(movieList![index].originalTitle.toString())