class SimpleSidebarController {
  // private setter for _isExpanded
  bool _isExpanded = false;

  // public getter for _isExpanded
  bool get isExpanded => _isExpanded;

  // open the simplesidebar
  Function? open;

  // close the simplesidebar
  Function? close;

  // toggle the simplesidebar
  Function? toggle;

  // SimpleSidebarController constructor
  SimpleSidebarController() {
    open = () {
      _isExpanded = true;
    };

    close = () {
      _isExpanded = false;
    };

    toggle = () {
      _isExpanded = !isExpanded;
    };
  }
}
