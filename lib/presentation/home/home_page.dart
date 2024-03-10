import 'package:cat_api/core/routes/routes.dart';
import 'package:cat_api/core/utils/debouncer.dart';
import 'package:cat_api/presentation/home/widgets/custom_card.dart';
import 'package:cat_api/presentation/home/widgets/shimmer_list.dart';
import 'package:cat_api/presentation/logic/provider/cat/cats_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _search = TextEditingController();
  final _debounce = Debounce(milliseconds: 300);

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => ref.read(catProvider.notifier).getCats(name: null));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cats = ref.watch(catProvider).cats;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            TextField(
              controller: _search,
              onChanged: (value) {
                onTextChange();
              },
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search), hintText: 'Search'),
            ),
            if (cats.isEmpty && _search.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 0.25.sh),
                child: Column(
                  children: [
                    Image.asset('assets/images/cat.png'),
                    SizedBox(height: 5.h,),
                    const Text("Not Found")
                  ],
                ),
              ),
            if (cats.isEmpty && _search.text.isEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(3, (index) => const ShimmerList()),
                  ),
                ),
              ),
            if (cats.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          context.pushNamed(CatRoutesNames.detailPage.name,
                              extra: cats[index]);
                        },
                        child: CustomCard(cat: cats[index]));
                  },
                  itemCount: cats.length,
                ),
              )
          ],
        ),
      ),
    ));
  }

  onTextChange() {
    _debounce.run(() {
      if (_search.text.isNotEmpty) {
        ref.read(catProvider.notifier).getCats(name: _search.text);
      } else {
        ref.read(catProvider.notifier).getCats(name: null);
      }
    });
  }
}
