
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidytest/app/modules/home/components/item/item_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

 // final homeController = Modular.get<HomeController>();
  //Counter counter = Counter();

  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setText,
        ),
        actions: <Widget>[
          Observer(
              builder: (_){
                return IconButton(
                    icon: Icon(Icons.add),
                    onPressed: controller.text.isEmpty ? null : controller.save,
                );
              }
          )
        ],
      ),
      body: Observer(
          builder: (_) {
            return ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (_, index){
                  return ItemWidget(index: index,);
                }
            );

            /*if(homeController.pokemons.error != null){
              return Center(
                child: RaisedButton(
                child: Text('Tente Novamente'),
                  onPressed: (){
                    homeController.fetchPokemons();
                  },
                ),
              );
            }

            if(homeController.pokemons.value == null){
              return Center(
                  child: CircularProgressIndicator(),
              );
            }

            var list = homeController.pokemons.value;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(list[index].name),
                );
              },
            );

          }
      ),*/

            /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
                builder: (_) =>  Text(
                  '${homeController.count}',
                  style: Theme.of(context).textTheme.headline4,
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeController.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
          }
      )
    );
  }
}


/*

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return
  }
}
*/