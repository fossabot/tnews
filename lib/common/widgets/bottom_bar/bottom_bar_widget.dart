part of petisland.home_page.widget.bottom_bar;

class BottomBarWidget extends TStatefulWidget {
  final BottomItemBuilder iconBulder;
  final List<Widget> children;
  final int intIndex;

  const BottomBarWidget(
      {@required this.iconBulder, @required this.children, this.intIndex = 0, Key key})
      : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends TState<BottomBarWidget> with SingleTickerProviderStateMixin {
  BottomItemBuilder get iconBulder => widget.iconBulder;
  List<Widget> get children => widget.children;

  @protected
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: widget.intIndex,
      vsync: this,
      length: children.length,
    )..addListener(() {
        Logger.debug("Ahihi tab ${tabController.index}");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: TShadows.defaultShadow),
        child: BottomAppBar(
          child: BottomBarSelector(
            controller: tabController,
            builder: iconBulder,
          ),
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: tabController,
        children: children,
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
