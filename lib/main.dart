import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: TeslaSample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}



class TeslaSample extends StatefulWidget {
  @override
  createState() => _TeslaSampleState();
}

class _TeslaSampleState extends State<TeslaSample> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: Color(0xFF30353B),
        intensity: 0.2,
        accentColor: Color(0xFF0F95E6),
        lightSource: LightSource.topLeft,
        depth: 0,
      ),
      child: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(child: _PageContent()),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0x353A40).withOpacity(1).withAlpha(1),
        Color(0xFF16171B).withOpacity(1),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      //color: Color(0xFF16171B),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTopBar(context),
          Expanded(flex: 2, child: _buildTitle(context)),
          Expanded(flex: 5, child: _buildCenterContent(context)),
          _buildBottomAction(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Neumorphic(
              drawSurfaceAboveChild: false,
              padding: EdgeInsets.all(2),
              boxShape: NeumorphicBoxShape.circle(),
              style: NeumorphicStyle(
                color: Color(0xFF1C1F22),
                depth: 10,
                intensity: 0.35,
                shape: NeumorphicShape.concave,
                oppositeShadowLightSource: false,
              ),
              child: Container(
                margin: const EdgeInsets.all(0.5),
                child: NeumorphicButton(
                    onClick: () {},
                    boxShape: NeumorphicBoxShape.circle(),
                    style: NeumorphicStyle(
                      color: Color(0xFF1C1F22),
                      depth: 0.1,
                      shape: NeumorphicShape.convex,
                      intensity: 0.8,
                      oppositeShadowLightSource: false,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Image.asset(
                        "assets/images/Group387.png",
                        height: 12,
                      ),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Tesla",
          style: TextStyle(
            fontFamily: "Lato",
            color: Colors.white30,
          ),
        ),
        Text(
          "Cybertruck",
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "297",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              "km",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        Positioned(
          top: -310,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 35),
            child: Image.asset(
              "assets/images/teslawithlight.png",
              height: 820,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: Column(
        children: <Widget>[
          Text(
            "A/C is turned on",
            style: TextStyle(
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NeumorphicButton(
            drawSurfaceAboveChild: false,
            onClick: () {},
            padding: EdgeInsets.all(4),
            boxShape: NeumorphicBoxShape.circle(),
            style: NeumorphicStyle(
              depth: 10,
              color: NeumorphicTheme.accentColor(context),
              shape: NeumorphicShape.flat,
            ),
            child: Neumorphic(
              boxShape: NeumorphicBoxShape.circle(),
              style: NeumorphicStyle(
                surfaceIntensity: 0.7,
                depth: 0,
                shape: NeumorphicShape.concave,
                color: NeumorphicTheme.accentColor(context),
              ),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Icon(
                  Icons.lock,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tap to open the car",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

