import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _nameController = TextEditingController();
  String? _sexe;
  bool? _football = false;
  bool? _music = false;
  bool? _mangas = false;
  final formKey = new GlobalKey<FormState>();
  String _name = "John Doe";
  bool _loading = false;
  bool _displayInfo = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title de la page"),
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mes Notifications')));
              },
              icon: Icon(Icons.add_alert),
              tooltip: 'Mes notifications',
            ),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Faire Une recherche')));
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Center(
                  child: Text(
                    _name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Messages"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Inscription"),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), label: "Information"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Paramètres")
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Float action button pressed")));
          },
          tooltip: "Increment",
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                    child: Text(
                  "Information de l'utilisateur",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.pink),
                )),
                const SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Image.asset(
                    "images/empty.png",
                    scale: 5,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: "Quel est votre nom",
                              labelText: "Nom & Prénom *"),
                          validator: (String? value) {
                            return (value == null || value == "")
                                ? "Ce champ est obligatoire"
                                : null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: null,
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: "Définir votre mot de passe",
                              labelText: "Mot de Passe *"),
                          validator: (String? value) {
                            return (value == null || value == "")
                                ? "Ce champ est obligatoire"
                                : null;
                          },
                        ),
                        DropdownButtonFormField(
                          items: <String>["Masculin", "Féminin", "Autre"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          validator: (str) =>
                              str == null ? "Ce champ est obligatoire" : null,
                          onChanged: (String? v) async {
                            setState(() {
                              _sexe = v;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              icon: Icon(Icons.transgender),
                              hintText: "Quel est votre sexe",
                              labelText: "Sexe *"),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quels sont vos passe temps ?",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: _football,
                                      checkColor: Colors.white,
                                      onChanged: (bool? b) {
                                        setState(() {
                                          _football = b;
                                        });
                                      }),
                                  Text(
                                    "Football",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: _music,
                                      checkColor: Colors.white,
                                      onChanged: (bool? b) {
                                        setState(() {
                                          _music = b;
                                        });
                                      }),
                                  Text(
                                    "Musique",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: _mangas,
                                      checkColor: Colors.white,
                                      onChanged: (bool? b) {
                                        setState(() {
                                          _mangas = b;
                                        });
                                      }),
                                  Text(
                                    "Mangas",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _displayDialog(context);
                          }
                        },
                        child: Text('valider')
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    _loading ? CircularProgressIndicator(
                      color: Colors.pink,
                    ) : SizedBox(),
                  ],
                ),
                SizedBox(height: 10.0,),
                _displayInfo ? Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title:  RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Je m'appelle ",
                                style: TextStyle(color: Colors.black)
                              ),
                              TextSpan(
                                text: _name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                )
                              )
                            ]
                          ),
                        ),
                        subtitle: Text("Voici Mes passions"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: (){},
                              child: const Text("AJOUTER")
                          ),
                          const SizedBox(width: 8,),
                          TextButton(onPressed: (){}, child: Text("")),
                          const SizedBox(width: 8,)
                        ],
                      )
                    ],

                  ),
                ) : const SizedBox()
              ],
            ),
          ),
        ));
  }

  void _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Alert Dialog"),
            content: Text('Etes-vous sûr de vouloir soumettre le formulaire ?'),
            actions: [
              TextButton(
                  onPressed: ()=>Navigator.pop(context, "cancel"),
                  child: const Text('Cancel')
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context, "ok");
                    setState(() {
                      _loading=true;
                    });
                    Future.delayed(const Duration(seconds: 5), (){
                      setState(() {
                        _loading=false;
                        _name=_nameController.text;
                        _displayInfo=true;
                      });
                    });

                  },
                  child: const Text("ok")
              )
            ],
          );
        }
    );
  }
}
