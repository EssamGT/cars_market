import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionsSelectionPage extends StatefulWidget {
  final List<String> givenList;
  // final ValueChanged<String> onTap;
  final String title;
  final String emptyPage;
  final bool search;
  const OptionsSelectionPage({
    super.key,
    required this.givenList,
    required this.title,
    required this.emptyPage,
    this.search = true,
  });

  @override
  State<OptionsSelectionPage> createState() => _OptionsSelectionPageState();
}

class _OptionsSelectionPageState extends State<OptionsSelectionPage> {
  // late TextEditingController controller;

  // void search(String query) {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    var cubit = getIt.get<AddCubit>();

    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context, widget.givenList.length.toString());
                  return true;
                },
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context,widget.givenList.length.toString()),
                    ),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.s10),
              Expanded(
                child: widget.givenList.isEmpty
                    ? Center(child: Text(widget.emptyPage))
                    : ListView.builder(
                        itemCount: widget.givenList.length,

                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            onChanged: (value) {
                              if (!value!) {
                                cubit.safetyOptionRemove(
                                  widget.givenList[index],
                                );
                              } else {
                                cubit.safetyOptionAdd(widget.givenList[index]);
                              }

                              // print(cubit.car.safetyOptions);
                              setState(() {});
                            },
                            value: cubit.car.safetyOptions.contains(
                              widget.givenList[index],
                            ),

                            title: Text(
                              widget.givenList[index],

                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
