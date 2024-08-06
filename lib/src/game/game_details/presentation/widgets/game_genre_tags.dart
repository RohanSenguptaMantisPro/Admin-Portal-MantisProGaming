import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/enums/game_genre_enums.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class GameGenreTags extends StatefulWidget {
  const GameGenreTags({super.key});

  @override
  State<GameGenreTags> createState() => _GameGenreTagsState();
}

class _GameGenreTagsState extends State<GameGenreTags> {
  late StringTagController _stringTagController;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  static final List<String> _initialTags = GameGenre.values.map<String>((
    GameGenre gameGenre,
  ) {
    return gameGenre.value;
  }).toList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tags'),
            Autocomplete<String>(
              optionsViewBuilder: (context, onSelected, options) {
                //AutoComplete uses overlay to display the options container
                // but overlays don't respect parent widget's dimensions, here
                // the Container.
                // but wrapping with Align creates a new root and provided a new
                // context for the children to follow the dimensions of.
                // so now the children respect the parent's dimensions.
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: boxConstraints.maxWidth,
                    height: 150,
                    color: Colours.backgroundColorDark,
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      thickness: 6,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return TextButton(
                            style: const ButtonStyle(
                              overlayColor: WidgetStatePropertyAll(
                                Colours.greyBackground,
                              ),
                            ),
                            onPressed: () {
                              onSelected(option);
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                option,
                                style: context.theme.textTheme.bodySmall,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _initialTags.where((String option) {
                  return option.toLowerCase().contains(textEditingValue.text);
                });
              },
              onSelected: (String selectedTag) {
                _stringTagController.onTagSubmitted(selectedTag);
              },
              fieldViewBuilder: (
                context,
                textEditingController,
                focusNode,
                onFieldSubmitted,
              ) {
                return TextFieldTags<String>(
                  textEditingController: textEditingController,
                  focusNode: focusNode,
                  textfieldTagsController: _stringTagController,
                  initialTags: [
                    GameGenre.arpg.value,
                    GameGenre.battleRoyale.value,
                  ],
                  textSeparators: const [' ', ','],
                  letterCase: LetterCase.normal,
                  validator: (String tag) {
                    if (_stringTagController.getTags!.contains(tag)) {
                      return "You've already entered that";
                    }
                    return null;
                  },
                  inputFieldBuilder: (context, inputFieldValues) {
                    return IField(
                      controller: inputFieldValues.textEditingController,
                      focusNode: inputFieldValues.focusNode,
                      errorText: inputFieldValues.error,
                      hintText: inputFieldValues.tags.isNotEmpty
                          ? ''
                          : 'Enter tag...',
                      prefixIconConstraints: BoxConstraints(
                        maxWidth: boxConstraints.maxWidth * 0.98,
                      ),
                      onChanged: inputFieldValues.onTagChanged,
                      prefixIconPadding: EdgeInsets.zero,
                      prefixIcon: inputFieldValues.tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: inputFieldValues.tagScrollController,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Wrap(
                                  runSpacing: 4,
                                  spacing: 4,
                                  children:
                                      inputFieldValues.tags.map((String tag) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colours.greyBackground,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              tag,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          InkWell(
                                            child: const Icon(
                                              Icons.close,
                                              size: 14,
                                              color: Colours.whiteIconsColor,
                                            ),
                                            onTap: () {
                                              inputFieldValues
                                                  .onTagRemoved(tag);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : null,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
