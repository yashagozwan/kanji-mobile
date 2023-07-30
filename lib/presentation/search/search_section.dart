import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/core.dart';
import '../detail/detail.dart';
import 'search.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>()..started();

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: cubit.cSearch,
              onChanged: (value) => cubit.search(),
              decoration: InputDecoration(
                hintText: 'Search Kanji...',
                fillColor: Colors.white,
                filled: true,
                suffixIcon: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.search.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Transform.scale(
                      scale: 0.5,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 0,
                        elevation: 0,
                        shape: const CircleBorder(),
                        color: Theme.of(context).primaryColor,
                        onPressed: cubit.clearSearchText,
                        child: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return switch (state.status) {
                Status.initial => render(state),
                Status.loading => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: LinearProgressIndicator(),
                  ),
                Status.success => render(state),
                Status.failure => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }

  Widget render(SearchState state) {
    if (state.search.isEmpty && state.japaneses.isEmpty) {
      return Expanded(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(
                  builder: (context) {
                    return Text(
                      '漢字',
                      style: TextStyle(
                        fontFamily: FontFamilyType.notoSansJP,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                        fontSize: 50,
                      ),
                    );
                  },
                ),
                const Text(
                  'かんじ',
                  style: TextStyle(
                    fontFamily: FontFamilyType.notoSansJP,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final japanese = state.japaneses.elementAt(index);
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  final listKanji = Utils.isKanji(japanese.word);

                  return AlertDialog(
                    buttonPadding: EdgeInsets.zero,
                    actionsPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            japanese.word,
                            style: TextStyle(
                              fontFamily: FontFamilyType.notoSansJP,
                              fontWeight: FontWeight.w700,
                              fontSize: 50,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            japanese.reading,
                            style: const TextStyle(
                              fontFamily: FontFamilyType.notoSansJP,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            japanese.romaji,
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const SizedBox(height: 8),
                          Builder(
                            builder: (context) {
                              if (japanese.jlpt.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'JLTP ${japanese.jlpt}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 50,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final kanji = listKanji.elementAt(index);
                                return OutlinedButton(
                                  onPressed: () {
                                    context.read<DetailCubit>().setKanji(kanji);

                                    Navigator.pop(context);

                                    Navigator.pushNamed(context, Routes.detail);
                                  },
                                  child: Text(
                                    kanji,
                                    style: const TextStyle(
                                      fontFamily: FontFamilyType.notoSansJP,
                                      fontSize: 24,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 8);
                              },
                              itemCount: listKanji.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    japanese.word,
                    style: TextStyle(
                      fontFamily: FontFamilyType.notoSansJP,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    japanese.reading,
                    style: const TextStyle(
                      fontFamily: FontFamilyType.notoSansJP,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    japanese.romaji,
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const SizedBox(height: 8),
                  Builder(
                    builder: (context) {
                      if (japanese.jlpt.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'JLTP ${japanese.jlpt}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: state.japaneses.length,
      ),
    );
  }
}
