import 'package:flutter/material.dart';

class MySecondScreen extends StatelessWidget {
  const MySecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fiche Verte',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: const MySecondPage());
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  int _activeStepIndex = 0; //pour gérer le formulaire
  int idProf = 001; //à remplacer par un getValue(id_prof)
  int idEmp = 001; //à remplacer par un getValue(id_employeur)

//Toute cette partie permet une construction simplifiée du formulaire

  //infos principales
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController telPro = TextEditingController();
  TextEditingController mail = TextEditingController();
  //infos supplémentaires
  TextEditingController dateNaiss = TextEditingController(); //à changer !------
  TextEditingController lieuNaiss = TextEditingController();
  TextEditingController rue = TextEditingController();
  TextEditingController batiment = TextEditingController();
  TextEditingController ville = TextEditingController();
  TextEditingController cp = TextEditingController();
  TextEditingController telPerso = TextEditingController();
  TextEditingController telFixe = TextEditingController();
  //infos prof
  TextEditingController typeProf = TextEditingController(); // à changer !------
  TextEditingController annees = TextEditingController(); // à changer !--------
  TextEditingController matieres = TextEditingController();
  TextEditingController nomLicence = TextEditingController();
  //infos employeur
  TextEditingController nomEmp = TextEditingController();
  TextEditingController mailEmp = TextEditingController();
  TextEditingController rueEmp = TextEditingController();
  TextEditingController batimentEmp = TextEditingController();
  TextEditingController villeEmp = TextEditingController();
  TextEditingController cpEmp = TextEditingController();

  List<Widget> creeInfosPerso() {
    final List<Map<String, dynamic>> _infosPerso = [
      {'label': 'Prénom', 'contrl': prenom},
      {'label': 'Nom', 'contrl': nom},
      {'label': 'N°téléphonique professionnel', 'contrl': telPro},
      {'label': 'Email', 'contrl': mail}
    ];

    List<Widget> all = [];
    for (var i in _infosPerso) {
      all.addAll(creationChampSaisie(i));
    }
    return all;
  }

  List<Widget> creeInfosSupp() {
    final List<Map<String, dynamic>> _infosSupp = [
      {'label': 'Lieu de naissance', 'contrl': lieuNaiss},
      {'label': 'N°rue', 'contrl': rue},
      {'label': 'Batiment', 'contrl': batiment},
      {'label': 'Ville', 'contrl': ville},
      {'label': 'Code postal', 'contrl': cp},
      {'label': 'N°téléphonique personnel', 'contrl': telPerso},
      {'label': 'N°téléphonique fixe', 'contrl': telFixe}
    ];

    List<Widget> all = [];
    for (var i in _infosSupp) {
      all.addAll(creationChampSaisie(i));
    }
    return all;
  }

  List<Widget> creeInfosProf() {
    final List<Map<String, dynamic>> _infosProf = [
      {'label': 'Nom de la licence enseignée', 'contrl': nomLicence},
      {'label': 'Liste des matières enseignées', 'contrl': matieres}
    ];

    List<Widget> all = [];
    for (var i in _infosProf) {
      all.addAll(creationChampSaisie(i));
    }
    return all;
  }

  List<Widget> creeInfosEmployeur() {
    final List<Map<String, dynamic>> _infosEmployeur = [
      {'label': 'Nom employeur', 'contrl': nomEmp},
      {'label': 'Mail employeur', 'contrl': mailEmp},
      {'label': 'N°rue employeur', 'contrl': rueEmp},
      {'label': 'Batiment employeur', 'contrl': batimentEmp},
      {'label': 'Ville employeur', 'contrl': villeEmp},
      {'label': 'Code postal employeur', 'contrl': cpEmp}
    ];

    List<Widget> all = [];
    for (var i in _infosEmployeur) {
      all.addAll(creationChampSaisie(i));
    }
    return all;
  }

  List<Widget> creationChampSaisie(Map<String, dynamic> info) {
    return [
      TextField(
          controller: info["contrl"],
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: info["label"])),
      const SizedBox(height: 8)
    ];
  }

//Cette partie gère la connection à la base de données

//Cette fonction permet de personnaliser l'affichage du résultat pour la partie Vérification

  List<Widget> affichageEmployeur() {
    if (nomEmp.text.isNotEmpty) {
      return [
        const Text('Employeur', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Nom emp: ${nomEmp.text}'),
        if (mailEmp.text.isNotEmpty) Text('Mail emp: ${mailEmp.text}'),
        if (rueEmp.text.isNotEmpty) Text('N°rue emp: ${rueEmp.text}'),
        if (batimentEmp.text.isNotEmpty)
          Text('Batiment emp: ${batimentEmp.text}'),
        if (villeEmp.text.isNotEmpty) Text('Ville emp: ${villeEmp.text}'),
        if (cpEmp.text.isNotEmpty) Text('CP emp: ${cpEmp.text}')
      ];
    } else
      return [];
  }

//Cette fonction construit le formulaire

  List<Step> stepList() => [
        //partie sur les infos principales
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Informations personnelles',
                style: TextStyle(fontFamily: 'Bebas', letterSpacing: 2)),
            content: Container(child: Column(children: creeInfosPerso()))),
        //partie sur les infos complémentaires
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Informations complémentaires',
                style: TextStyle(fontFamily: 'Bebas', letterSpacing: 2)),
            content: Container(
                child: Column(children: [
              TextField(
                  //à changer !-------------------------------------------------
                  controller: dateNaiss,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date de naissance')),
              const SizedBox(
                height: 8,
              ),
              Column(children: creeInfosSupp())
            ]))),
        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Informations professionnelles',
                style: TextStyle(fontFamily: 'Bebas', letterSpacing: 2)),
            content: Container(
                child: Column(children: [
              TextField(
                  //à changer !-------------------------------------------------
                  controller: typeProf,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        'Type d\'enseignant : Titulaire, Vacataire, ATER, Moniteur',
                  )),
              const SizedBox(height: 8),
              TextField(
                  //à changer !-------------------------------------------------
                  controller: annees,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        'Liste des classes enseignées : 1ère/2ème année, année spéciale, licence',
                  )),
              const SizedBox(height: 8),
              Column(children: creeInfosProf())
            ]))),
        Step(
            state:
                _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Informations sur l\'employeur (optionnel)',
                style: TextStyle(fontFamily: 'Bebas', letterSpacing: 2)),
            content: Container(
              child: Column(children: creeInfosEmployeur()),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 4,
            title: const Text('Confirmer la saisie',
                style: TextStyle(fontFamily: 'Bebas', letterSpacing: 2)),
            content: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Personnelles',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Prénom: ${prenom.text}'),
                        Text('Nom: ${nom.text}'),
                        Text('N°Pro: ${telPro.text}'),
                        Text('Email: ${mail.text}')
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Complémentaires',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            'Date naissance: ${dateNaiss.text}'), //à changer !-
                        if (lieuNaiss.text.isNotEmpty)
                          Text('Lieu naissance: ${lieuNaiss.text}'),
                        Text('N°rue: ${rue.text}'),
                        if (batiment.text.isNotEmpty)
                          Text('Batiment: ${batiment.text}'),
                        Text('Ville: ${ville.text}'),
                        Text('CP: ${cp.text}'),
                        if (telPerso.text.isNotEmpty)
                          Text('N°Perso: ${telPerso.text}'),
                        if (telFixe.text.isNotEmpty)
                          Text('N°fixe: ${telFixe.text}')
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Professionnelles',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            'Type: ${typeProf.text}'), //à changer !------------
                        Text(
                            'Classes: ${annees.text}'), //à changer !-----------
                        Text('Licence: ${nomLicence.text}'),
                        Text('Matières: ${matieres.text}')
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: affichageEmployeur())
                ])))
      ];

//Main

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Fiche Informations Professeur',
              style: TextStyle(fontFamily: 'Bebas', letterSpacing: 1)),
          centerTitle: true,
          backgroundColor: Colors.lightGreen),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print(
                'Submited'); //à changer----------------------------------------
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        controlsBuilder: (context, {onStepContinue, onStepCancel}) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(
            child: Row(
              children: [
                if (_activeStepIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onStepCancel,
                      child: const Text('Précédent'),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onStepContinue,
                    child: (isLastStep)
                        ? const Text('Valider')
                        : const Text('Suivant'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
