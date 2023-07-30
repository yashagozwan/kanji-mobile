import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/core.dart';
import '../../domain/model/kanji_example/kanji_example_model.dart';
import '../widget/layout_slot.dart';
import 'package:kanji_drawing_animation/kanji_drawing_animation.dart';
import 'detail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DetailCubit>().started();
    return Scaffold(
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          return switch (state.status) {
            Status.initial => const SizedBox.shrink(),
            Status.loading => SpinKitCircle(
                color: Theme.of(context).primaryColor,
                size: 100,
              ),
            Status.success => ListView(
                children: [
                  const SizedBox(height: 24),
                  SizedBox(
                    child: LayoutSlot(
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    state.kanjiModel.kanji,
                                    style: TextStyle(
                                      fontFamily: FontFamilyType.notoSansJP,
                                      fontSize: 150,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    state.kanjiModel.meaning,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "JLPT ${state.kanjiModel.jlptLevel}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        buttonPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        iconPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        insetPadding: EdgeInsets.zero,
                                        content: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'How write this kanji',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              KanjiDrawingAnimation(
                                                state.kanji,
                                                speed: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const FaIcon(FontAwesomeIcons.marker),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child:
                                    const FaIcon(FontAwesomeIcons.floppyDisk),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  LayoutSlot(
                    children: [
                      yomi(state.kanjiModel.kunyomi, 'Kunyomi 訓読み'),
                    ],
                  ),
                  LayoutSlot(
                    children: [
                      yomi(state.kanjiModel.onyomi, 'Onyomi 音読み'),
                    ],
                  ),
                  LayoutSlot(
                    bottom: 8,
                    children: [
                      Text(
                        'Kunyomi Examples',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  example(state.kanjiModel.kunyomiExamples),
                  const SizedBox(height: 16),
                  LayoutSlot(
                    bottom: 8,
                    children: [
                      Text(
                        'Onyomi Examples',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  example(state.kanjiModel.onyomiExamples),
                  const SizedBox(height: 24),
                ],
              ),
            Status.failure => const SizedBox.shrink(),
          };
        },
      ),
    );
  }

  Widget yomi(Iterable<String> texts, String title) {
    return Builder(
      builder: (context) {
        if (texts.isEmpty) {
          return const SizedBox.shrink();
        }

        const style = TextStyle(
          fontFamily: FontFamilyType.notoSansJP,
          color: Colors.black54,
          fontSize: 16,
        );

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final kunyomi = texts.elementAt(index);
                    return Text(
                      kunyomi,
                      style: style,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Text(
                      '、',
                      style: style,
                    );
                  },
                  itemCount: texts.length,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 20,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final kunyomi = texts.elementAt(index);
                    return Text(
                      Utils.toRomaji(kunyomi),
                      style: style.copyWith(
                        fontSize: 12,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Text(
                      '・',
                      style: style,
                    );
                  },
                  itemCount: texts.length,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget example(Iterable<KanjiExampleModel> listKanji) {
    const style = TextStyle(
      fontFamily: FontFamilyType.notoSansJP,
      color: Colors.black54,
    );

    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final kanjiModel = listKanji.elementAt(index);
          return Container(
            width: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kanjiModel.example,
                    style: TextStyle(
                      fontFamily: FontFamilyType.notoSansJP,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    kanjiModel.reading,
                    style: style,
                  ),
                  Text(
                    kanjiModel.romaji,
                    style: style,
                  ),
                  const Divider(),
                  Text(
                    kanjiModel.meaning,
                    style: style,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemCount: listKanji.length,
      ),
    );
  }
}
