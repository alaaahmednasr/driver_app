// ignore_for_file: avoid_print

import 'package:driver_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var textController = TextEditingController();

  List<String> textList = [];

  FocusNode foucus = FocusNode();

  void addText() {
    setState(() {
      foucus.unfocus();
      textList.add(textController.text);
      textController.clear();
    });
  }

  void removeText(int index) {
    setState(() {
      textList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 20),
                  child: TextFormField(
                    focusNode: foucus,
                    controller: textController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (textController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "You Can't Add Empty String !!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black45,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              addText();
                              print(textList);
                            }
                          }),
                      alignLabelWithHint: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  children: List.generate(
                    textList.length,
                    (index) => IntrinsicWidth(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            Text(textList[index]),
                            IconButton(
                              onPressed: () {
                                removeText(index);
                                print(textList);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    growable: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 150),
                  child: defaultButton(
                      buttonText: 'open bottom sheet',
                      onTapFunction: () {
                        if (Theme.of(context).platform == TargetPlatform.iOS) {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.edit),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: textPoppinsMedium(
                                              text: 'Edit',
                                              textColor: Colors.black,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.copy),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: textPoppinsMedium(
                                              text: 'Copy',
                                              textColor: Colors.black,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.cut),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: textPoppinsMedium(
                                              text: 'Cut',
                                              textColor: Colors.black,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          scaffoldKey.currentState!.showBottomSheet(
                            (context) => Container(
                                padding: const EdgeInsets.all(30),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(35),
                                  topEnd: Radius.circular(35),
                                )),
                                child: IntrinsicHeight(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.edit),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: textPoppinsMedium(
                                                text: 'Edit',
                                                textColor: Colors.black,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.copy),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: textPoppinsMedium(
                                                  text: 'Copy',
                                                  textColor: Colors.black,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.cut),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: textPoppinsMedium(
                                                text: 'Cut',
                                                textColor: Colors.black,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
