//Select items from the list
/*
 List<BathEvent> _itemsWithCategory(bool isEnded) {
   return kAllBathEvents.where((BathEvent event) => event.isEnded == isEnded).toList();
 }

 final List<BathEvent> _upcomingEvents = _itemsWithCategory(false);
 final List<BathEvent> _pastEvents = _itemsWithCategory(true);

*/


// Save Scroll position
/*
  //Tab class
  final GlobalKey<ScrollableState<Scrollable>> key = new GlobalKey<ScrollableState<Scrollable>>();

  _Tab _selectedTab;
  List<double> _scrollOffset  = new List<double>.filled(_tabs.length, 0.0);

  @override
   void initState() {
     super.initState();
     _selectedTab = _tabs[0];
    }


    return new TabBarSelection<_Tab>(
      values: _tabs,
      onChanged: null, (_Tab value) {
        setState(() {
          _selectedTab = value;
          _selectedTab.key.currentState.scrollTo(_scrollOffset[_tabs.indexOf(_selectedTab)]);
        });
      },

      return new Block(
        scrollableKey: tab.key,
        onScroll: (double value) { _scrollOffset[_tabs.indexOf(tab)] = value; },
        children: new List<Widget>.generate(1, (int i) {
            return new Container(
              padding: const EdgeInsets.all(2.0),
              height: 200.0,
              child: new Card(
                child: new Center(
                  child: new Text('Put STATS here')
                )
              )
            );
          })
        );
 */


// Past/Upcoming events sort and list preparing
/*
final List<Widget> _events = <Widget>[];
bool currentIsEnded;

final ThemeData themeData = Theme.of(context);
final TextStyle headerStyle = themeData.textTheme.body2.copyWith(color: themeData.primaryColor);

  for(BathEvent bathEvent in kAllBathEvents){
    if (bathEvent.isEnded != currentIsEnded ){
      if (currentIsEnded != null)
        _events.add(new Divider());
      _events.add(
        new Container(
          height: 48.0,
          padding: const EdgeInsets.only(left: 16.0),
          child: new Align(
            alignment: FractionalOffset.centerLeft,
            child: new Text( bathEvent.isEnded ? 'Past' : 'Upcoming' , style: headerStyle)
          )
        )
      );
      currentIsEnded = bathEvent.isEnded;
    }
    _events.add(bathEvent);
  }
 */
