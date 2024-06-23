import 'package:flutter/material.dart';

enum TabItem {home, workout, progress}

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.workout: "Workout Tracker",
  TabItem.progress: "Progress Tracker",
};
void main(){
  runApp( const MyApp());
}


class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      type: BottomNavigationBarType.fixed,

      items: [
        _buildItem(TabItem.home),
        _buildItem(TabItem.workout),
        _buildItem(TabItem.progress),
      ],

      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),

    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem){
    
    return BottomNavigationBarItem(
      icon: Icon(Icons.home),
    );

  }

}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Widget _buildBody(){
  return Container(

    alignment: Alignment.center,
    child: FloatingActionButton(
      child: Text('PUSH'),
      onPressed: _push,
    ),

  );
}

void _push() {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
    )
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );

    //Used as root of application, configure themes / routes
    /*return MaterialApp(

      //home property, scaffold is a screen
      home: Scaffold(
        body: _buildBody(),
        //move around a widget
        
        

        appBar: AppBar(

          


          backgroundColor: Colors.blue,
          title: const Text('Rizzy bear'),
        ),

      /*body: Container(
          
          margin: const EdgeInsets.all(100),
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,

          /*Extra customization options
          decoration: const BoxDecoration(

          ),*/

          child: const Text('Floating'),
        ),*/
        /*bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.line_weight),
                  label: 'Workouts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.masks),
                  label: 'Other',
                ),

              ],
        )*/
         
        
      ),
      
    );*/
  
  }
}
