import 'package:flutter/material.dart';
import 'package:realstate/Model/User.dart';
import 'package:realstate/Repository/AgentService.dart';
import 'package:realstate/Utility/realestate_preferences.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/company_constant.dart';

import '../../TestFile.dart';
import '../../routing_constants.dart';

class AgentList extends StatefulWidget {
  @override
  _AgentListState createState() => _AgentListState();
}

class _AgentListState extends State<AgentList> {
  var dts;
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool sortType = false;
  String _username;
  AgentService _agentService;
  List<User> mainusers;

  _AgentListState() {
    _agentService = new AgentService();
    _getUsername().then((val) =>
        setState(() {
          _username = val;
        }));

    _agentService.getAllAgents().then((value) {
      setState(){
        mainusers = value;
      }

    });

  }

  Future<String> _getUsername() async {
    return await RealEstatePreferences.getUserName();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dts ??= DTS(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchContent = TextEditingController();
    var screenSize = MediaQuery.of(context);

    return Scaffold(
        body: Center(
            child: Container(
                height: screenSize.size.height * 0.9,
                width: screenSize.size.width * 0.8,
                color: backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AdminNavigationBar(username: _username),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                        child: SizedBox(
                          height: 80,
                          child: Text(
                            'Agent ',
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child:

                        PaginatedDataTable(

                          header: Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            height: 100,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: () {
                                                dts.searchData(_searchContent.text.toString());
                                              })
                                      ),
                                      controller: _searchContent,
                                      onChanged: (value) {
                                        dts.searchData(value);
                                      },

                                    )),
                                SizedBox(
                                  width: screenSize.size.width * .2,
                                ),
                                RaisedButton.icon(
                                    onPressed: () {
                                      Navigator.pushNamed(context, AddAgentPage);

                                    },
                                    icon: Icon(Icons.add),
                                    label: Text("ADD AGENT"))
                              ],
                            ),
                          ),
                          columns: _headers(),
                          source: dts,
                          onRowsPerPageChanged: (r) {
                            setState(() {
                              _rowPerPage = r;
                            });
                          },
                        ),


                        // FutureBuilder(
                        //   future: _agentService.getAllAgents(),
                        //   builder: (context, snapshot) {
                        //     switch (snapshot.connectionState) {
                        //       case ConnectionState.none:
                        //         return new CircularProgressIndicator();
                        //       case ConnectionState.done:
                        //           return PaginatedDataTable(
                        //
                        //             header: Container(
                        //               margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        //               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        //               height: 100,
                        //               color: Colors.white,
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Expanded(
                        //                       child: TextField(
                        //                         decoration: InputDecoration(
                        //                             suffixIcon: IconButton(
                        //                                 icon: Icon(Icons.search),
                        //                                 onPressed: () {
                        //                                   dts.searchData(_searchContent.text.toString());
                        //                                 })
                        //                         ),
                        //                         controller: _searchContent,
                        //                         onChanged: (value) {
                        //                           dts.searchData(value);
                        //                         },
                        //
                        //                       )),
                        //                   SizedBox(
                        //                     width: screenSize.size.width * .2,
                        //                   ),
                        //                   RaisedButton.icon(
                        //                       onPressed: () {
                        //                         Navigator.pushNamed(context, AddAgentPage);
                        //
                        //                       },
                        //                       icon: Icon(Icons.add),
                        //                       label: Text("ADD AGENT"))
                        //                 ],
                        //               ),
                        //             ),
                        //             columns: _headers(),
                        //             source: dts,
                        //             onRowsPerPageChanged: (r) {
                        //               setState(() {
                        //                 _rowPerPage = r;
                        //               });
                        //             },
                        //           );
                        //       default:
                        //         return new CircularProgressIndicator();
                        //
                        //     }
                        //   },
                        // ),




                      )
                    ],
                  ),
                )
            )
        )
    );
  }


  List<DataColumn> _headers() {
    return <DataColumn>[
      DataColumn(
        label: Text('ID'),
        numeric: true,
        onSort: (colIndex, asc) {
          // _sort<num>((d) => d.id, colIndex, asc);
        },
      ),
      DataColumn(
        label: Text('Full Name'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Mobile No'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Email'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Status'),
        numeric: false,
      ),
      DataColumn(
        label: Text('Edit'),
        numeric: false,

      ),
    ];
  }
}

class DTS extends DataTableSource {
  List<User> _ourData;
  List<User> _backUp;
  int size;

  final BuildContext context;
  AgentService _agentService = new AgentService();

  void setList() async {
    _ourData = await _agentService.getAllAgents();
    if (_ourData == null) {
      size = 0;
    } else {
      size = _ourData.length;
    }

    print('This is our data $_ourData');
    notifyListeners();

  }


  DTS(this.context ) {
    print('length');
    // size = _ourData.length;

    _ourData = TestFile.getTestUsers();
    size = _ourData.length;

    setList();
  }


  void searchData(String searchCharacter) {
    _ourData.clear();
    if (searchCharacter == '' || searchCharacter == null) {
      _ourData = _backUp;
    } else {
      List<User> temp;
      _backUp.forEach((e) {
        if (e.firstName.toUpperCase().contains(searchCharacter.toUpperCase())) {
          print('in here ' + e.firstName);
          temp[0] = e;
        }

        _ourData = temp;
      });
    }


    notifyListeners();
  }

  void sortTable(int colIndex, bool asc) {
    print(_ourData[0].firstName);
    print('sort table is called $colIndex');
    print(' $asc');
    if (colIndex == 1) {
      if (asc) {
        _ourData.sort((a, b) =>
            a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));
      } else {
        _ourData.sort((a, b) =>
            b.firstName.toUpperCase().compareTo(a.firstName.toUpperCase()));
      }
    } else if (colIndex == 2) {
      if (asc) {
        _ourData.sort((a, b) =>
            a.mobile.toUpperCase().compareTo(b.mobile.toUpperCase()));
      } else {
        _ourData.sort((a, b) =>
            b.mobile.toUpperCase().compareTo(a.mobile.toUpperCase()));
      }
    } else if (colIndex == 3) {
      if (asc) {
        _ourData.sort((a, b) =>
            a.email.toUpperCase().compareTo(b.email.toUpperCase()));
      } else {
        _ourData.sort((a, b) =>
            b.email.toUpperCase().compareTo(a.email.toUpperCase()));
      }
    }
    print('After sort sort table is ' + _ourData[0].firstName);
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);


    if (index >= size) return null;

    final users = _ourData[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(users.id.toString())),
      DataCell(Text(users.firstName)),
      DataCell(Text(users.mobile)),
      DataCell(Text(users.email)),
      DataCell(Text(users.isVerified.toString())),
      DataCell(Icon(
        Icons.edit, semanticLabel: 'Edit',
      ), onTap: () {
        Navigator.pushNamed(context, EditAgentPage, arguments: index);
      })
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => size;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
