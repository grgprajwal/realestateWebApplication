import 'package:flutter/material.dart';
import 'package:realstate/Model/Owner.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/View/centered_view.dart';
import 'package:realstate/company_constant.dart';

import '../../TestFile.dart';
import '../../routing_constants.dart';

class OwnerList extends StatefulWidget {
  @override
  _OwnerListState createState() => _OwnerListState();
}

class _OwnerListState extends State<OwnerList> {

  var dts;
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool sortType = false;

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
      body: CenteredView(
        child: Container(
          color: backgroundColor,
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AgentNavigationBar(username: 'prajwal'),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                  child: SizedBox(
                    height: 80,
                    child: Text(
                      'Owner ',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: PaginatedDataTable(

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
                                Navigator.pushNamed(context, AddOwnerPage);

                              },
                              icon: Icon(Icons.add),
                              label: Text("ADD OWNER"))
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
                )
              ],
            ),
          ) ,
        ),
      ),
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
        label: Text('Name'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Address'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Contact'),
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
      ),
      DataColumn(
        label: Text('Edit'),
        numeric: false,

      ),
    ];
  }
}

class DTS extends DataTableSource {
  List<Owner> _ourData;
  List<Owner> _backUp;
  int size ;
  final BuildContext context;

  DTS(this.context){
    _ourData = TestFile.getOwners1();
    _backUp = TestFile.getOwners1();
    size = TestFile.getOwners1().length;
  }

  void searchData(String searchCharacter){
    // _ourData.clear();
    if(searchCharacter == '' || searchCharacter == null){
      _ourData = _backUp;
    }


    notifyListeners();
  }

  void sortTable(int colIndex, bool asc){
    if(colIndex == 1){
      if(asc){
        _ourData.sort((a,b) => a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));
      }else{
        _ourData.sort((a,b) => b.firstName.toUpperCase().compareTo(a.firstName.toUpperCase()));

      }

    }else if(colIndex == 2){
      if(asc){
        _ourData.sort((a,b) => a.address.streetName.compareTo(b.address.streetName));
      }else{
        _ourData.sort((a,b) => b.address.streetName.compareTo(a.address.streetName));

      }
    }else if(colIndex == 3){
      if(asc){
        _ourData.sort((a,b) => a.phone.compareTo(b.phone));
      }else{
        _ourData.sort((a,b) => b.phone.compareTo(a.phone));

      }
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= size) return null;
    final owner = _ourData[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(owner.id.toString())),
      DataCell(Text(owner.firstName)),
      DataCell(Text(owner.address.toString())),
      DataCell(Text(owner.phone)),
      DataCell(Text(owner.email)),

      DataCell(Icon(
        Icons.edit,semanticLabel: 'Edit',
      ) ,onTap: (){
        Navigator.pushNamed(context, EditOwnerPage, arguments: index);
      }),

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