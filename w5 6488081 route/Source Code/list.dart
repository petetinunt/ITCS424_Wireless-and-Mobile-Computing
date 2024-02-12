import 'package:flutter/material.dart';
import 'package:project/pages/home/home.dart';
import 'package:project/pages/proflie/proflie.dart';
import 'package:project/pages/favorite/favorite.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All   Bouquet    Vase    Flowers",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFFB1B1B1),
          ),
        ),
      ), 
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: "Asters",
            description:
                "Asters symbolize love, wisdom, faith, and color. It conveys deep emotional love and affection for someone.",
            image: "asters.png",
          ),
          ProductBox(
            name: "Bluebell",
            description:
                "Bluebell is a symbol of humility, constancy, gratitude and everlasting love.",
            image: "bluebell.png",
          ),
          ProductBox(
            name: "Pink carnation",
            description:
                "Pink carnation flower meanings include gratitude and the concept of never forgetting someone.",
            image: "pink.png",
          ),
          ProductBox(
            name: "Daisy",
            description:
                "Daisy flower can be purity, innocence, new beginnings, joy and cheerfulness.",
            image: "daisy.png",
          ),
          ProductBox(
            name: "Pink geraniums",
            description:
                "Pink geraniums hint at a gentle affection and a growing love that is yet to be announced.",
            image: "pink_g.png",
          ),
          ProductBox(
            name: "Lily",
            description:
                "Lily flower is a symbol of love, innocence, purity, fertility, and rebirth.",
            image: "lily.png",
          ),
          ProductBox(
            name: "Pink tulips",
            description:
                "Pink tulips are known for meaning affection, caring, good wishes, and love.",
            image: "pink_t.png",
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the first route when tapped.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstRoute()),
              );
            },
            child: const Text('Add More Name Flowers'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xffC33355),
        unselectedItemColor: const Color(0xffF9DDE3),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Home(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Favorite(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => MyApp(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Aproflie(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        break;
    }
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Another Name Flowers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image above the "Add Name Flowers" text
            Image.asset(
              'assets/images/flower/adorable.png', // Replace with your image asset path
              width: 300,
              height: 300,
            ),
            SizedBox(height: 10),
            Text(
              'Add Name Flowers',
              style: TextStyle(fontSize: 30),
            ),
            // Text field for user input
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter Name Flowers'),
            ),
            SizedBox(height: 20),
            // Elevated button to submit the data to the second page
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                // Pass entered data to the second page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondPage(data: _textFieldController.text),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  // Declare the data variable to receive the data
  final String data;

  // Constructor to receive the data
  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sumbit Complete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sumbit Complete',
              style: TextStyle(fontSize: 50),
            ),
            // Display the received data
            Text(
              'Name Flowers: $data',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                // Pass entered data to the second page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



class ProductBox extends StatelessWidget {
  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      width: 315,
      height: 94,
      child: Card(
        color: Color(0xFFF4E7EA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/images/flower/" + image,
              width: 78,
              height: 78,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFFC33355),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFC33355),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
