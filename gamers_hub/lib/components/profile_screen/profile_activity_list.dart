import 'package:flutter/material.dart';

class ProfileActivityList extends StatefulWidget {
  ProfileActivityList({Key? key}) : super(key: key);

  @override
  _ProfileActivityListState createState() => _ProfileActivityListState();
}

class _ProfileActivityListState extends State<ProfileActivityList> {
  final ScrollController _controller = ScrollController();
  bool _isLoading = false;
  List<String> _dummy = List.generate(5, (index) => 'Item $index');
  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  Future _fetchData() async {
    await new Future.delayed(new Duration(seconds: 2));
    int lastIndex = _dummy.length;

    setState(() {
      _dummy
          .addAll(List.generate(2, (index) => "New Item ${lastIndex + index}"));
      _isLoading = false;
    });
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      _fetchData();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemCount: _isLoading ? _dummy.length + 1 : _dummy.length,
      itemBuilder: (context, index) {
        if (_dummy.length == index)
          return Center(child: CircularProgressIndicator());
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 100,
          color: Colors.grey.withOpacity(0.4),
        );
      },
    );
  }
}
