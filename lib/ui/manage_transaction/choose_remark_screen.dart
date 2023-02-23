import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/remark.dart';
import 'package:cashbook/stores/remarks_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';

class ChooseRemarkScreen extends StatefulWidget {
  ChooseRemarkScreen({Key? key, required this.isCashIn}) : super(key: key);
  static const routeName = '/choose-remark-screen';

  //route data
  final bool isCashIn;

  @override
  State<ChooseRemarkScreen> createState() => _ChooseRemarkScreenState();
}

class _ChooseRemarkScreenState extends State<ChooseRemarkScreen> {
  //Stores
  final RemarksStore _remarksStore = getIt<RemarksStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();

  //Utitlities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  //Screen Functions
  Future<void> deleteRemark(String id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    _fResponse = await _remarksStore.deleteRemark(id);

    print(_fResponse.message);
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
  }

  @override
  void initState() {
    super.initState();
    _remarksStore.fetchAndSetRemarks(widget.isCashIn);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Observer(builder: (_) {
      return SafeArea(
        child: _remarksStore.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            : SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Choose Remark',
                          style: _theme.textTheme.headline4,
                        ),
                        const SizedBox(height: 15),
                        Observer(builder: (_) {
                          print(
                              'remarks in screen ${_remarksStore.remarksList.length}');
                          return _remarksStore.remarksList.isEmpty
                              ? Center(
                                  child: Text('No record Found',
                                      style: _theme.textTheme.headline5),
                                )
                              : ListView.builder(
                                  itemCount: _remarksStore.remarksList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Remark _currentItem =
                                        _remarksStore.remarksList[index];
                                    return InkWell(
                                      onTap: () {
                                        _transactionStore
                                            .updateRemaks(_currentItem.title);
                                        Navigator.of(context).pop();
                                      },
                                      child: ListTile(
                                        title: Text(
                                          _currentItem.title,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () async {
                                            deleteRemark(_currentItem.id);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: _theme.colorScheme.error,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
