import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/selection_page/selection_page_app_bar.dart';

// Base generic selection page (private)
class _NewSelectionPage<T> extends StatefulWidget {
  final String title;
  final String emptyPage;
  final List<T> primaryValues;
  final FormFieldState<T>? field;
  final T? currentValue;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) labelBuilder;
  final void Function(T)? onSelected;
  final bool Function(T)? isSelected;
  final bool search;
  final void Function(T)? onItemTap;

  const _NewSelectionPage({
    super.key,
    required this.title,
    required this.emptyPage,
    required this.primaryValues,
    this.field,
    this.currentValue,
    this.leadingBuilder,
    required this.labelBuilder,
    this.onSelected,
    this.isSelected,
    this.search = false,
    this.onItemTap,
  });

  @override
  State<_NewSelectionPage<T>> createState() => _NewSelectionPageState<T>();
}

class _NewSelectionPageState<T> extends State<_NewSelectionPage<T>> {
  late TextEditingController controller;
  late List<dynamic> filteredList;

  @override
  initState() {
    controller = TextEditingController();
    filteredList = widget.primaryValues;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void search(String query) {
    final q = query.toLowerCase();
    final sourceList = widget.primaryValues;

    filteredList = sourceList.where((val) {
      final label = widget.labelBuilder(val).toLowerCase();
      return label.startsWith(q) || label.contains(q);
    }).toList();
    setState(() {});
  }

  EdgeInsets margin = const EdgeInsets.symmetric(
    horizontal: AppPadding.p10,
    vertical: AppPadding.p12,
  );
  EdgeInsets searchPadding = const EdgeInsets.symmetric(
    horizontal: AppPadding.p10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectionPageAppBar(title: widget.title),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              widget.search
                  ? Padding(
                      padding: searchPadding,
                      child: SearchBar(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        controller: controller,
                        leading: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: StringsManager.searchLabel,
                        onChanged: (value) => search(value),
                      ),
                    )
                  : SizedBox(),
              const SizedBox(height: AppSize.s10),
              Expanded(
                child: filteredList.isEmpty
                    ? Center(child: Text(widget.emptyPage))
                    : SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s15),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).colorScheme.shadow.withAlpha(40),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                          ),
                          margin: margin,
                          padding: const EdgeInsets.only(
                            left: AppPadding.p2,
                            right: AppPadding.p2,
                            top: AppPadding.p8,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final item = filteredList[index];
                              final isSelected = widget.isSelected != null
                                  ? widget.isSelected?.call(item)
                                  : widget.field != null
                                  ? widget.field!.value == item
                                  : widget.currentValue == item;

                              return Container(
                                decoration: BoxDecoration(
                                  border: index != filteredList.length - 1
                                      ? Border(
                                          bottom: BorderSide(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onError.withAlpha(20),
                                            width: 1,
                                          ),
                                        )
                                      : Border(),
                                ),
                                child: ListTile(
                                  visualDensity: VisualDensity.comfortable,
                                  titleAlignment: ListTileTitleAlignment.center,
                                  leading: widget.leadingBuilder?.call(item),
                                  title: Text(
                                    widget.labelBuilder(item),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  onTap: () {
                                    if (widget.onItemTap != null) {
                                      widget.onItemTap!(item);
                                    } else {
                                      widget.onSelected?.call(item);
                                      widget.field?.didChange(item);
                                      widget.field?.validate();
                                      Navigator.pop(context);
                                    }
                                  },
                                  splashColor: Theme.of(
                                    context,
                                  ).colorScheme.primary.withAlpha(50),
                                  trailing: isSelected ?? false
                                      ? Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: AppSize.s22,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          size: AppSize.s16,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onError,
                                        ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.s12,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Public generic selection page (for use in custom implementations)
class NewSelectionPageGeneric<T> extends StatelessWidget {
  final String title;
  final String emptyPage;
  final List<T> values;
  final FormFieldState<T>? field;
  final T? currentValue;
  final Widget Function(T)? leadingBuilder;
  final String Function(T) labelBuilder;
  final bool Function(T)? isSelected;

  final void Function(T)? onSelected;
  final bool search;
  final void Function(T)? onItemTap;

  const NewSelectionPageGeneric({
    super.key,
    required this.title,
    required this.emptyPage,
    required this.values,
    this.field,
    this.currentValue,
    this.leadingBuilder,
    required this.labelBuilder,
    this.onSelected,
    this.search = false,
    this.onItemTap,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return _NewSelectionPage<T>(
      title: title,
      emptyPage: emptyPage,
      primaryValues: values,
      isSelected: isSelected,
      field: field,
      currentValue: currentValue,
      leadingBuilder: leadingBuilder,
      labelBuilder: labelBuilder,
      onSelected: onSelected,
      search: search,
      onItemTap: onItemTap,
    );
  }
}
