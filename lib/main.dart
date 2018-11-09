import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp6());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Welcome to Flutter',
      home:  RandomWords(),
      theme: ThemeData(primaryColor: Colors.white)
    );
  }

}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RandomWordsState();

}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = new TextStyle(fontSize:18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title:  Center(child: Text('Welcome to Flutter',style:TextStyle(fontSize:16))),
          actions: <Widget>[IconButton(icon:Icon(Icons.list),onPressed: _pushSaved)],
        ),
        body:   _buildSuggestions()
    );
  }

  Widget _buildSuggestions(){
      return new ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context,i){
            if(i.isOdd){
                return new Divider();
            }
            final index = i~/2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
        },
      );
  }

  Widget _buildRow(WordPair wordPair){
    final alreadySaved = _saved.contains(wordPair);
      return new ListTile(
        title:  Text(
          wordPair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved?Icons.favorite:Icons.favorite_border,
          color: alreadySaved?Colors.red:null,
        ),
        onTap: (){
          setState(() {
            if(alreadySaved){
              _saved.remove(wordPair);
            }else{
              _saved.add(wordPair);
            }
          });
        },
      );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map((wordPair){
              return ListTile(
                title: Text(wordPair.asPascalCase,
                style: _biggerFont,
                ),
              );
            });
            final divided = ListTile.divideTiles(
                context: context,
                tiles: tiles,
            ).toList();
            return Scaffold(
              appBar: AppBar(title:Text('Saved Suggestions')),
              body: ListView(children: divided),
            );
        }
      )
    );
  }

}

class MyApp1 extends StatelessWidget{

  Column buildbuttonColumn(BuildContext context,IconData data,String label){
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(data,color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context){
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(32),
        child: new Row(
            children:[
              new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(padding: const EdgeInsets.only(bottom: 8),
                        child: new Text('text',
                            style:new TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      new Text('text2', style: new TextStyle(color: Colors.grey[500])
                      )
                    ],
                  )
              ),
              new Icon(Icons.star, color: Colors.red[500]),
              new Text('41')
            ]
        )
    );
    Widget buttonSection = new Container(
      child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [buildbuttonColumn(context,Icons.call, 'call'),
          buildbuttonColumn(context,Icons.near_me, 'route'),
          buildbuttonColumn(context,Icons.share, 'share')
        ],
      )
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Text("Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",softWrap: true),
    );
    return new MaterialApp(
      title: 'Fultter demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        body: new ListView(
          children: [
            new Image.asset('assets/yoona.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );

  }
  
}
class MyApp2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Text('Hello World',
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: 40.0, color: Colors.black87)),
      ),
    );
  }

}
class MyApp3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
        appBar: new AppBar(
          title:new Center(child: new Text('title main')),
        ),
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  new Expanded(
                      flex:1,
                      child: new Center(child: new Text('content main'))),
                  new Expanded(
                      flex: 2,
                      child: new Image.asset('assets/yoona.jpg',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100)),
                  new Expanded(
                      flex: 1,
                      child: new Image.asset('assets/yoona.jpg',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 150))
                ]
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Icon(Icons.star,color: Colors.green[500]),
                  new Icon(Icons.star,color: Colors.green[500]),
                  new Icon(Icons.star,color: Colors.green[500]),
                  new Icon(Icons.star,color: Colors.black),
                  new Icon(Icons.star,color: Colors.black)
                ],
              )
            ]
        )
      )
    );
  }
}
class MyApp4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var ratings = new Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                new Icon(Icons.star,color: Colors.green[500]),
                new Icon(Icons.star,color: Colors.green[500]),
                new Icon(Icons.star,color: Colors.green[500]),
                new Icon(Icons.star,color: Colors.black),
                new Icon(Icons.star,color: Colors.black)
              ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20
            ),
          )
        ],
      ),
    );
    var dfescTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );
    var iconList = DefaultTextStyle.merge(
        child:new Container(
          padding: new EdgeInsets.all(20),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: [
                  new Icon(Icons.kitchen,color:Colors.green),
                  new Text('prep'),
                  new Text('25min')
                ],
              ),
              new Column(
                  children: [
                    new Icon(Icons.kitchen,color:Colors.green),
                    new Text('prep'),
                    new Text('25min')
                  ]),
              new Column(
                children: [
                  new Icon(Icons.kitchen,color:Colors.green),
                  new Text('prep'),
                  new Text('25min')
                ],
              )
            ],
          ),
        )
    );
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ratings,
            iconList
          ],
        ),
      ),
    );
  }



}
class Title extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TitleState();
  }

}
class _TitleState extends State<Title>{

  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text('标题'));
  }

}
class MyApp5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.white),
      title: 'title',
      home: new Scaffold(
        appBar: new AppBar(title:new Title()),
        body: buildGrid(),
      ),
    );
  }

  List<Container> _buildTileList(int count){
    return new List<Container>.generate(
        count,
          (int index)=>
            new Container(child:new Image.asset('assets/yoona.jpg'))
    );
  }

  Widget buildGrid(){
    return new GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildTileList(10),
    );
  }


}

class MyApp6 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Title(),
        ),
        body: buildCard(),
      ),
    );
  }

  Widget buildStack(){
    var stack = new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('assets/yoona.jpg'),
          radius: 100,
        ),
        new Container(
          color: Colors.black45,
          child: new Text('Mia B',
          style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
      ],
    );
    return stack;
  }

  Widget buildCard(){
    var card = new SizedBox(
      child: new Card(
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.con'),
              leading: new Icon(Icons.near_me,color: Colors.blue),
              trailing: new Icon(Icons.near_me,color: Colors.blue),
            )
          ],
        ),
      ),
    );
    return card;
  }

}