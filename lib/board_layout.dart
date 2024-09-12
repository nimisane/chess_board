import 'package:flutter/material.dart';

class BoardLayout extends StatelessWidget {
  const BoardLayout({super.key});

  final int gridSize = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.grey,
          child: ListView.builder(
              itemCount: gridSize,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < gridSize; i++)
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? i % 2 == 0
                                            ? Colors.white
                                            : Colors.black
                                        : i % 2 == 0
                                            ? Colors.black
                                            : Colors.white),
                              ),
                              if (i % (gridSize - 1) == 0) ...[
                                Positioned(
                                  top: 0,
                                  right: 1,
                                  child: Text(
                                    "${gridSize - index}",
                                    style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                )
                              ],
                              if (index % (gridSize - 1) == 0) ...[
                                Positioned(
                                  bottom: 0,
                                  left: 1,
                                  child: Text(
                                    String.fromCharCode(97 + i),
                                    style: TextStyle(
                                        color: i % 2 != 0
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                )
                              ],
                            ],
                          ),
                        )
                    ],
                  ),
                );
              })),
    );
  }
}
