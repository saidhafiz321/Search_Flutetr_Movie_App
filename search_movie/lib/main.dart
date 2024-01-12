import 'package:flutter/material.dart';
import 'package:search_movie/model/mode_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchMovie(),
    );
  }
}

class SearchMovie extends StatefulWidget {
  const SearchMovie({super.key});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  // i'm now goig to creat a dummy list of movie
  // you can build your own list, i used the IMDB data so you can use the same source

  static List<MovieModel> main_movie_list = [
    MovieModel("Zootopia The Disney", 2010, 9.0,
        "https://id.pinterest.com/pin/640848222003505202/"),
    MovieModel("Bee Movie", 2015, 8.0,
        "https://id.pinterest.com/pin/1055599905980269/"),
    MovieModel("Ralph Break the Internet", 2018, 8.9,
        "https://id.pinterest.com/pin/16325617394441310/"),
    MovieModel("Monsters INC", 2020, 9.2,
        "https://id.pinterest.com/pin/25051341668556376/"),
    MovieModel("Finding Nemo", 2020, 9.0,
        "https://id.pinterest.com/pin/1055599905951110/"),
    MovieModel("Cars the Movie", 2020, 9.9,
        "https://id.pinterest.com/pin/487514728382959178/"),
    MovieModel("Madagascar", 2017, 8.5,
        "https://id.pinterest.com/pin/698409854744588150/"),
    MovieModel("Rio 2 the Movie", 2021, 9.0,
        "https://id.pinterest.com/pin/3870349672703844/"),
    MovieModel("Tom and Jerry", 2015, 8.0,
        "https://id.pinterest.com/pin/639863059585681845/"),
    MovieModel("Toy Story the Movie", 2020, 9.0,
        "https://id.pinterest.com/pin/617837642684730818/"),
    MovieModel("Ratatouille the Movie", 2021, 9.1,
        "https://id.pinterest.com/pin/116952921547310164/"),
    MovieModel("Doraemon the Movie", 2020, 9.2,
        "https://id.pinterest.com/pin/614389574160832551/"),
    MovieModel("The Incridibles", 2022, 9.0,
        "https://id.pinterest.com/pin/328059154112378212/"),
    MovieModel("Inside Out", 2019, 8.9,
        "https://id.pinterest.com/pin/3307399717850682/"),
    MovieModel("Megaminde 3d", 2022, 8.5,
        "https://id.pinterest.com/pin/81557443223021266/"),
    MovieModel("LA Patrolla", 2023, 8.1,
        "https://id.pinterest.com/pin/1095993259387390582/")
  ];

  // creating the list that we're going to display and filter
  List<MovieModel> display_list = List.from(main_movie_list);

  void updatelist(String value) {
    // this is the fuction that will filter our list
    // we will be back to the list after a while
    // Now lets write our search function
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xff1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search For a Movie",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updatelist(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              // NOw lets create a function  to display a text in  case we dont get result
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                      "Now Result Found",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ))
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${display_list[index].movie_release_year}',
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${display_list[index].rating}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(
                            display_list[index].movie_poster_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
