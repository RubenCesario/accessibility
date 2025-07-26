import 'package:accessibility/accessibility.dart';
import 'package:example/view/pages/complete_settings_page.dart';
import 'package:example/view/pages/recommended_settings_page.dart';
import 'package:flutter/material.dart';

/// {@template HomePage}
/// A widget that is the home page of your application.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// The title of the app.

  /// {@macro HomePage}
  const HomePage({required this.title, super.key});

  /// The title of the app.
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: AccessibleText(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(PaddingSize.large),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.warning_amber_rounded),
                  Icon(Icons.align_horizontal_center_outlined),
                  Flexible(
                    child: Text(
                      'This is a normal [Text] Widget. It will change based on '
                      'the accessibility settings a part of text alignment '
                      'properties.',
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.accessibility_new_outlined),
                  Flexible(
                    child: AccessibleText(
                      'The following texts are [AccessibleText] Widgets. '
                      'They will change based on all accessibility settings.',
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.build_circle_outlined),
                  Flexible(
                    child: AccessibleWidgetBuilder(
                      accessibleChild: AccessibleText(
                        'You will see this text because at least one '
                        'text accessibility setting is enabled.',
                      ),
                      child: AccessibleText(
                        'You will see this text because no '
                        'text accessibility setting is enabled.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: EffectsSettingListenableBuilder(
                builder:
                    (context, effectsEnabled, child) => Row(
                      spacing: 8,
                      children: [
                        Icon(
                          effectsEnabled
                              ? Icons.star
                              : Icons.star_border_outlined,
                        ),
                        AccessibleText(
                          effectsEnabled
                              ? 'Effects enabled.'
                              : 'Effects disabled.',
                        ),
                      ],
                    ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.zoom_in),
                  Flexible(
                    child: TextRawMagnifier(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: PaddingSize.large,
                        ),
                        child: AccessibleText(
                          'Long press this text to magnify it.',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: ReadMoreText(
                maxLines: 1,
                text:
                    'Click on the Read More button to expand the text. '
                    '\n'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'do eiusmod tempor incididunt ut labore et dolore magna.'
                    ' Ut enim ad minim veniam, quis nostrud exercitation '
                    'nisi ut aliquip ex ea commodo consequat. Duis aute irure '
                    'reprehenderit in voluptate velit esse cillum dolore eu. '
                    'Excepteur sint occaecat cupidatat non proident, sunt in '
                    'deserunt mollit anim id est laborum.',
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: AccessibleText(
                      'An example of a horizontal list with height determined '
                      'by accessibility settings.',
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      const Flexible(
                        child: AccessibleText(
                          'It is a good practice to use horizontal lists with '
                          'few elements and place a button above the list that '
                          'allows access to a dedicated page to show all the '
                          'contents. A horizontal list with many items makes '
                          'a user who uses Talkback/Voiceover stuck.',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // go to list details page
                        },
                        icon: Icon(
                          Icons.adaptive.arrow_forward_outlined,
                          semanticLabel: 'Go to list details',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: AccessibleSizedBox.fromHeight(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) =>
                          Center(child: AccessibleText('Text ${index + 1}')),
                  separatorBuilder: (context, index) => const VerticalDivider(),
                  itemCount: 6,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const CompleteSettingsPage(),
                          ),
                        );
                      },
                      child: const AccessibleText('Go to Complete Settings'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder:
                                (context) => const RecommendedSettingsPage(),
                          ),
                        );
                      },
                      child: const AccessibleText('Go to Recommended Settings'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
