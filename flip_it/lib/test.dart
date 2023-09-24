import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flip_it/_core/app_size.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Testing',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _category(title: 'UI', widgets: [
              _item(
                context: context,
                content: 'Memo UI',
                namedRouter: "/UI/memo_ui",
              ),
              _item(
                context: context,
                content: 'UI 1',
                namedRouter: "/UI/ui1",
              ),
              _item(
                context: context,
                content: 'UI 2',
                namedRouter: "/UI/ui2",
              ),
              _item(
                context: context,
                content: 'UI 3',
                namedRouter: "/UI/ui3",
              ),
              _item(
                context: context,
                content: 'UI 4',
                namedRouter: "/UI/ui4",
              ),
              _item(
                context: context,
                content: 'UI 5',
                namedRouter: "/UI/ui5",
              ),
            ]),
            _category(title: "Firebase", widgets: [
              _item(
                length: 1,
                context: context,
                content: "Sign In",
                namedRouter: "/LogIn/signin",
              ),
              _item(
                length: 1,
                context: context,
                content: "Sign Up",
                namedRouter: "/LogIn/signup",
              ),
              _item(
                length: 1,
                context: context,
                content: "Read Data",
                namedRouter: "/DB/read_data",
              ),
              _item(
                length: 1,
                context: context,
                content: "Write Data",
                namedRouter: "/DB/write_data",
              ),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  IgnorePointer _item({
    required BuildContext context,
    required String content,
    String? namedRouter,
    int length = 2,
    bool isPost = false,
  }) {
    return IgnorePointer(
      ignoring: namedRouter == null,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          if (namedRouter != null) {
            Navigator.of(context).pushNamed(namedRouter);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            width: length == 1
                ? size.width
                : length == 2
                ? (size.width / 2) - (50 / 2)
                : length == 3
                ? (size.width / 3) - (60 / 3)
                : size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: namedRouter != null
                  ? (isPost
                  ? Colors.green
                  : const Color.fromRGBO(125, 125, 125, 1))
                  : const Color.fromRGBO(61, 61, 61, 1),
            ),
            child: Center(
              child: Text(
                content,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: namedRouter != null
                        ? const Color.fromRGBO(215, 215, 215, 1)
                        : const Color.fromRGBO(155, 155, 155, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _category({
    required String title,
    required List<Widget> widgets,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [...widgets],
          ),
        ],
      ),
    );
  }
}
