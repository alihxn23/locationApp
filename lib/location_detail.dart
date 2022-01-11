import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDetail extends StatelessWidget {
  late final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(location.name, style: Styles.navbarTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        ));
  }
}

List<Widget> _renderBody(BuildContext context, Location location) {
  var res = <Widget>[];

  res.add(_bannerImage(location.url, 190));
  res.addAll(_renderFacts(context, location));

  return res;
}

Widget _bannerImage(String url, double height) {
  return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth));
}

List<Widget> _renderFacts(BuildContext context, Location location) {
  var res = <Widget>[];

  location.facts.forEach((fact) {
    res.add(_sectionTitle(fact.title));
    res.add(_sectionText(fact.text));
  });

  return res;
}

Widget _sectionTitle(String text) {
  return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 15.0),
      child: Text(text,
          textAlign: TextAlign.left,
          style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ))));
}

Widget _sectionText(String text) {
  return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      child: Text(text, style: Styles.textDefault));
}

Widget _section(String title, Color color) {
  return Container(
    decoration: BoxDecoration(color: color),
    child: Text(title),
  );
}
