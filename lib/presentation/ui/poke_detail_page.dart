import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class PokeDetailPage extends StatefulWidget {
  final String image;
  final int index;

  PokeDetailPage({@required this.image, @required this.index, Key key})
      : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  Widget _buildDetailPage(BuildContext context) {
    return Hero(
      tag: 'img_poke_${widget.index}',
      child: Image.network(
        widget.image,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildDetailPage(context),
      ),
    );
  }
}
