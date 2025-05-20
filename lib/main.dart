import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(Start());
}

///////////////////
class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CACJX - App@",
      debugShowCheckedModeBanner: false,
      home: base(),
    );
  }
}
//////////////////

class base extends StatefulWidget {
  const base({super.key});

  @override
  State<base> createState() => _baseState();
}
//////////////////

class _baseState extends State<base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APIS By CACJX"),
        backgroundColor: const Color.fromARGB(255, 61, 2, 68),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(104, 2, 51, 94),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Secciones",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 250, 245, 251),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              children: <Widget>[
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.post_add, size: 60),
                    subtitle: Text("Post", textAlign: TextAlign.center),
                    onTap: () {
                      searchPost().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Posts"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(c[index]["title"]);
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.comment, size: 60),
                    subtitle: Text("Comments", textAlign: TextAlign.center),
                    onTap: () {
                      searchComments().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Comments"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(c[index]["name"]),
                                      subtitle: Text(c[index]["body"]),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.album, size: 60),
                    subtitle: Text("Albums", textAlign: TextAlign.center),
                    onTap: () {
                      searchAlbums().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Albums"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(c[index]["title"]);
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.photo, size: 60),
                    subtitle: Text("Photos", textAlign: TextAlign.center),
                    onTap: () {
                      searchPhotos().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Photos"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(c[index]["url"]);
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.all_inclusive, size: 60),
                    subtitle: Text("Todos", textAlign: TextAlign.center),
                    onTap: () {
                      searchTodos().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Todos"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(c[index]["title"]);
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Card(
                  shadowColor: Colors.black12,
                  elevation: 12,
                  child: ListTile(
                    title: Icon(Icons.people_alt_sharp, size: 60),
                    subtitle: Text("Users", textAlign: TextAlign.center),
                    onTap: () {
                      searchUsers().then((c) {
                        //print(c);
                        showModalBottomSheet(
                          context: context,
                          builder: (r) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Users"),
                                backgroundColor: Colors.blueGrey,
                                foregroundColor: Colors.white,
                              ),
                              body: ListView.builder(
                                itemCount: c.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(c[index]["name"]),
                                      subtitle: Text(c[index]["email"]),
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (rr) {
                                            return Scaffold(
                                              appBar: AppBar(
                                                title: Text(c[index]["name"]),
                                                backgroundColor: Colors.amber,
                                              ),
                                              body: ListView(
                                                children: [
                                                  Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        c[index]["username"],
                                                      ),
                                                      subtitle: Text(
                                                        "Username",
                                                      ),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        c[index]["phone"],
                                                      ),
                                                      subtitle: Text(
                                                        "Teléfono",
                                                      ),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        c[index]["website"],
                                                      ),
                                                      subtitle: Text(
                                                        "Sitio Web",
                                                      ),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      title: Text(
                                                        c[index]["company"]["name"],
                                                      ),
                                                      subtitle: Text(
                                                        "Compañía",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*Función asincronica posts */
Future searchPost() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}

/*Función asincronica coments*/
Future searchComments() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load comments');
  }
}

/*Función asincronica albums*/
Future searchAlbums() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load albums');
  }
}

/*Función asincronica photos*/
Future searchPhotos() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photos');
  }
}

/*Función asincronica photos*/
Future searchTodos() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load todos');
  }
}

/*Función asincronica users*/
Future searchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load users');
  }
}
