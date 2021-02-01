import 'package:flutter/material.dart';
import 'package:realstate/Model/Property.dart';
import 'package:realstate/Model/User.dart';
import 'package:realstate/View/Widgets/Admin/AdminNavigationBar.dart';
import 'package:realstate/View/Widgets/Agent/AgentNavigationBar.dart';
import 'package:realstate/View/centered_view.dart';
import 'package:realstate/company_constant.dart';

import '../../TestFile.dart';
import '../../routing_constants.dart';

class PropertyList extends StatefulWidget {
  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
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
                      'Property ',
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
                                Navigator.pushNamed(context, AddPropertyPage);

                              },
                              icon: Icon(Icons.add),
                              label: Text("ADD PROPERTY"))
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
        label: Text('Price'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('IsFeatured'),
        numeric: false,
        onSort: (colIndex, asc) {
          setState(() {
            sortType = !sortType;
          });
          dts.sortTable(colIndex, sortType);
        },
      ),
      DataColumn(
        label: Text('Edit'),
        numeric: false,
      ),
      DataColumn(
        label: Text('Add Inspection'),
        numeric: false,

      ),
    ];
  }
}

class DTS extends DataTableSource {
  List<Property> _ourData;
  List<Property> _backUp;
  int size ;
  final BuildContext context;

  DTS(this.context){
    _ourData = TestFile.getProperty1();
    _backUp = TestFile.getProperty1();
    size = TestFile.getProperty1().length;
  }

  void searchData(String searchCharacter){
    _ourData.clear();
    if(searchCharacter == '' || searchCharacter == null){
      _ourData = _backUp;
    }else{
      List<Property> temp;
      _backUp.forEach((e) {
        if(e.address.streetName.toUpperCase().contains(searchCharacter.toUpperCase())){
          temp[0] = e;
        }

        _ourData = temp;

      });
    }


    notifyListeners();
  }

  void sortTable(int colIndex, bool asc){
    if(colIndex == 1){
      if(asc){
        _ourData.sort((a,b) => a.address.streetName.toUpperCase().compareTo(b.address.streetName.toUpperCase()));
      }else{
        _ourData.sort((a,b) => b.address.streetName.toUpperCase().compareTo(a.address.streetName.toUpperCase()));

      }

    }else if(colIndex == 2){
      if(asc){
        _ourData.sort((a,b) => a.price.compareTo(b.price));
      }else{
        _ourData.sort((a,b) => b.price.compareTo(a.price));

      }
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= size) return null;
    final property = _ourData[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(property.id.toString())),
      DataCell(Text(property.address.streetName)),
      DataCell(Text(property.price.toString())),
      DataCell(Text(property.isFeatured.toString())),
      DataCell(Icon(
        Icons.edit,semanticLabel: 'Edit',
      ) ,onTap: (){
        Navigator.pushNamed(context, EditAgentPage, arguments: index);
      }),
      DataCell(Icon(
        Icons.add,semanticLabel: 'Add Inspection',
      ) ,onTap: (){
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
