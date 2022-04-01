import 'second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projaaaaj',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gestion administrative'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Contrôleurs pour les champs de saisie
  final TextEditingController _ctrlLogin = TextEditingController();
  final TextEditingController _ctrlMotDePasse = TextEditingController();

  final TextEditingController _controller = TextEditingController();

  // Identifiant pour le formulaire
  final _formKey = GlobalKey<FormState>();

  bool _souvenir = false;

  void onChangeSouvenir(bool? checked) {
    setState(() {
      _souvenir = checked!;
    });
  }

  // Clic sur le bouton =>
  // Validation du formulaire, puis :
  // Si ok : appel second écran
  // Sinon : messages d'erreurs renvoyés par le validator
  void changerPage() async {
    String? newPass = await Navigator.push(
        context, MaterialPageRoute(builder: (contexxt) => MySecondScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sur smartphone, pour éviter que le clavier fasse reonter l'interface
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Gestion Administrative',
              style: TextStyle(fontFamily: 'Bebas', letterSpacing: 1)),
          centerTitle: true,
          backgroundColor: Colors.lightGreen),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 0)),
          TextField(
            onChanged: (_recherche) {
              print(_recherche);
              //fonction recherche
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Rechercher',
            ),
          ),
          TextButton(
              onPressed: changerPage,
              child: Text("Changer de page",
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      letterSpacing: 1,
                      color: Colors.lightGreen)))
        ],
      )),
    );
  }
}
