import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  final List<String> givenList;
  // final ValueChanged<String> onTap;
  final String title;
  final String emptyPage;
  final bool search;
  final String? hintText;
  const SelectionPage({
    super.key,
    required this.givenList,
    required this.title,
    required this.emptyPage,
    this.search = true,
    this.hintText,
  });

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late TextEditingController controller;
  late List<String> filterdList;

  @override
  void initState() {
    controller = TextEditingController();
    filterdList = widget.givenList;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {
    filterdList = widget.givenList
        .where((val) => val.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // var cubit = AddCubit.get(context);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              widget.search
                  ? SearchBar(
                      controller: controller,
                      leading: Icon(Icons.search),
                      trailing: [
                        IconButton(
                          onPressed: () {
                            controller.clear();
                            search('');
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ],
                      // search
                      onChanged: (value) => search(value),
                    )
                  : SizedBox(),
              SizedBox(height: AppSize.s10),
              Expanded(
                child: filterdList.isEmpty
                    ? Center(child: Text(widget.emptyPage))
                    : ListView.builder(
                        itemCount: filterdList.length,

                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              '${filterdList[index]} ${widget.hintText ?? ''}',

                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            onTap: () {
                              Navigator.of(context).pop(filterdList[index]);
                            },
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
