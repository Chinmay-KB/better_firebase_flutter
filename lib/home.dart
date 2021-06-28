import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_easyaccess/firebase_service.dart';
import 'package:firebase_easyaccess/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    FirestoreService service = FirestoreService();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {});
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              // future: service.getDataTheUsualWay('Chinmay Kabi'),
              future: service.getDataTheBetterWay('ENYMl6A76UTENuQ9fnOi'),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                return snapshot.connectionState != ConnectionState.done
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Data handled using my method'),
                            Text(
                                'Name is ${snapshot.data!.people.friends[0].name}'),
                            Text(snapshot
                                .data!.people.friends[0].achievements[0].data),
                            Text(snapshot
                                .data!.people.friends[0].achievements[0].type),
                            ElevatedButton(
                              onPressed: () async {
                                await service.updateDataTheBetterWay(
                                    'ENYMl6A76UTENuQ9fnOi',
                                    Random().nextInt(1000).toString());
                                setState(() {});
                              },
                              child: Icon(Icons.refresh),
                            )
                          ],
                        ),
                      );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              // future: service.getDataTheUsualWay('Chinmay Kabi'),
              future: service.getDataTheUsualWay('ENYMl6A76UTENuQ9fnOi'),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                return snapshot.connectionState != ConnectionState.done
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                                'Data handled as how all other tutorials say '),
                            Text(
                                'Name is ${snapshot.data!['people']['friends'][0]['name']}'),
                            Text(snapshot.data!['people']['friends'][0]
                                ['achievements'][0]['data']),
                            Text(snapshot.data!['people']['friends'][0]
                                ['achievements'][0]['type']),
                            ElevatedButton(
                              onPressed: () async {
                                await service.updateDataTheUsualWay(
                                    'ENYMl6A76UTENuQ9fnOi',
                                    Random().nextInt(1000).toString());
                                setState(() {});
                              },
                              child: Icon(Icons.refresh),
                            )
                            // Text('Name is ${snapshot.data!.name}'),
                            // Text(
                            //     snapshot.data!.people.friends[0].achievements[0].data)
                          ],
                        ),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
