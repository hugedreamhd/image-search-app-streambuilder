import 'package:flutter/material.dart';
import 'package:image_search_app_futurebuilder_01/ui/view_model.dart';
import 'package:image_search_app_futurebuilder_01/ui/widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final viewModel = ViewModel();
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: '입력하세요',
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.searchImage(searchTextController.text);
                        },
                        color: Colors.green,
                        icon: Icon(
                          Icons.search,
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                StreamBuilder<bool>(
                  initialData: false,
                  stream: viewModel.loadingController,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = viewModel.imageItems[index];
                      
                          return ImageItemWidget(imageItem: imageItem);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
