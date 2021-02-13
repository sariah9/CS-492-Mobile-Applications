import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            _headerInfo(),
            _intro(),
            _titleInfo('Skills'),
            SizedBox(height: 10.0),
            _skillsInfo('HTML/CSS', 0.9),
            SizedBox(height: 5.0),
            _skillsInfo('Python', 0.6),
            SizedBox(height: 5.0),
            _skillsInfo('C++', 0.85),
            SizedBox(height: 5.0),
            _skillsInfo('Flutter', 0.25),
            SizedBox(height: 20.0),
            _titleInfo('Experience'),
            SizedBox(height: 10.0),
            _workInfo(
              jobTitle: 'AWS Support Technician',
              company: 'Amazon',
              datesWorked: '2019 - 2020',
              location: 'Seattle, WA',
              description: 'Customer facing technical support of databases'
            ),
            _workInfo(
              jobTitle: 'Trapeze Artist',
              company: 'Ringling Bros. Flying Circus',
              datesWorked: '2017 - 2019',
              location: 'Everett, WA',
              description: 'Created magic for all ages with an oddball cast'
            ),
            _workInfo(
              jobTitle: 'Dog Walker',
              company: 'DogGone Full-Service Salon',
              datesWorked: '2014 - 2017',
              location: 'Everett, WA',
              description: 'Energized pets with a worthy workout'
            ),
            _workInfo(
              jobTitle: 'Bakery Chef',
              company: 'Cafe Ibis',
              datesWorked: '2012 - 2014',
              location: 'Provo, UT',
              description: 'Managed donut production; Cashier experience; Customer service'
            ),
            _workInfo(
              jobTitle: 'Tambourine Player',
              company: 'Nixies Unite Band',
              datesWorked: '2010 - 2012',
              location: 'Piqua, OH',
              description: 'Played on tour with the band; Memorized music and performed to live audiences'
            ),
            SizedBox(height: 20.0),
            _titleInfo('Education'),
            SizedBox(height: 10.0),
            _workInfo(
              jobTitle: 'Oregon State University',
              company: 'Computer Science Post-Baccalaureate',
              datesWorked: '2019 - present',
              location: 'Corallis, OR',
              description: 'GPA: 3.8'
            ),
            _workInfo(
              jobTitle: 'Edison State Community College',
              company: 'Fine Arts Associate',
              datesWorked: '2008 - 2010',
              location: 'Piqua, OH',
              description: 'GPA: 3.8'
            ),
            SizedBox(height: 20.0),
          ],
        )
      )
    );
  }

  Row _headerInfo() {
    return Row(children: <Widget>[
      SizedBox(width: 20.0),
      Container(
        width: 80.0,
        child: Image.asset('images/cat.png'),
      ),
      SizedBox(width: 20.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sariah Bunnell',
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 18.0, 
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Full Stack Developer'),
          Text('(555) 555-5555'),
          Text('bunnells@oregonstate.edu'),
          Text('Seattle, WA'),
       ],
      ),
    ],);
  }

  Container _intro() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200
      ),
      child: Text('Student with 3+ years of experience developing web applications and 2+ months creating mobile applications'
      ),
    );
  }

  Padding _titleInfo(final String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        name.toUpperCase(), 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row _skillsInfo(final String skillName, final double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
          flex: 2,
          child: Text(
            skillName.toUpperCase(),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }

  ListTile _workInfo({
    final String jobTitle, 
    final String company, 
    final String datesWorked, 
    final String location, 
    final String description
    }) {
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(jobTitle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$company ($datesWorked)'),
            Text(location),
            Text(description),
          ],
        ),
      );
  }
}
