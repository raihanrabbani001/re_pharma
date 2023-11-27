import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:re_pharma/models/navigation_item_model.dart';

class NavigationView extends StatelessWidget {
  const NavigationView(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationChanged,
      required this.destination,
      required this.child,
      this.trailling = const SizedBox()});

  final int selectedIndex;
  final void Function(int) onDestinationChanged;
  final List<NavigationItemModel> destination;
  final Widget child;
  final Widget trailling;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final Color containerColor = colorScheme.surfaceVariant.withOpacity(0.2);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        leading: const Text('Apotek Bunz'),
        leadingWidth: 200,
        actions: [
          Expanded(
            child: MoveWindow(),
          ),
          const WindowButtons(),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: containerColor,
              border: Border(
                  right:
                      BorderSide(width: 1, color: colorScheme.surfaceVariant)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: destination.asMap().entries.map((entry) {
                        final index = entry.key;
                        final value = entry.value;

                        final isActive = index == selectedIndex;

                        return GestureDetector(
                          onTap: () {

                            onDestinationChanged(index);
                            context.go('/${value.label}');
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (value.header) != null
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 16, 0, 8),
                                      child: Text(
                                        value.header!,
                                        style: textTheme.titleSmall!.copyWith(
                                            color:
                                                colorScheme.onSurfaceVariant),
                                      ),
                                    )
                                  : const SizedBox(),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInOut,
                                margin: const EdgeInsets.only(right: 16),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  color: isActive
                                      ? colorScheme.primary.withOpacity(0.2)
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          value.prefix,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          value.label,
                                          style: textTheme.titleSmall!.copyWith(
                                              color:
                                                  colorScheme.onSurfaceVariant),
                                        ),
                                      ],
                                    ),
                                    Icon(value.suffix),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                trailling,
              ],
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
