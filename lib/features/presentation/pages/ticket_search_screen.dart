import 'dart:math';

import 'package:effective_flight/core/constants/colors.dart';
import 'package:effective_flight/features/domain/entities/offer_model.dart';
import 'package:effective_flight/features/presentation/bloc/offers/offers_bloc.dart';
import 'package:effective_flight/features/presentation/pages/search_selected_state_screen.dart';
import 'package:effective_flight/features/presentation/widgets/show_search_location_widget_button.dart';
import 'package:effective_flight/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketSearchScreen extends StatefulWidget {
  const TicketSearchScreen({super.key});

  @override
  State<TicketSearchScreen> createState() => _TicketSearchScreenState();
}

class _TicketSearchScreenState extends State<TicketSearchScreen> {
  TextEditingController _search1Controller = TextEditingController();
  TextEditingController _search2Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _showSearchTicket(Size size) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return _showSearchTicketAction(size);
      },
    );
  }

  Widget _showSearchTicketAction(Size size) {
    return CupertinoActionSheet(
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: AppColors.grey4, borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: CupertinoTextField(
                        prefix: const Icon(
                          CupertinoIcons.airplane,
                          color: AppColors.grey7,
                        ),
                        controller: _search1Controller,
                        decoration: BoxDecoration(color: CupertinoColors.black.withOpacity(.0)),
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 18,
                        ),
                        placeholder: 'Откуда - Москва',
                        placeholderStyle: const TextStyle(
                          color: AppColors.grey6,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                      width: size.width,
                      height: 1,
                      color: AppColors.grey5,
                    ),
                    SizedBox(
                      height: 30,
                      child: CupertinoTextField(
                        controller: _search2Controller,
                        prefix: const Icon(
                          CupertinoIcons.search,
                          color: AppColors.grey7,
                        ),
                        suffix: CupertinoButton(
                            onPressed: () {
                              _search2Controller.clear();
                            },
                            padding: EdgeInsets.zero,
                            child: const Icon(CupertinoIcons.clear)),
                        suffixMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(color: CupertinoColors.black.withOpacity(.0)),
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 18,
                        ),
                        placeholder: 'Куда - Турция',
                        placeholderStyle: const TextStyle(
                          color: AppColors.grey6,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: ShowSearchLocationWidgetButton(title: 'Сложный маршрут', color: AppColors.darkGreen, icon: CupertinoIcons.command, onPressed: () {})),
                  Flexible(child: ShowSearchLocationWidgetButton(title: 'Куда угодно', color: AppColors.primaryColor, icon: CupertinoIcons.globe, onPressed: () {})),
                  Flexible(child: ShowSearchLocationWidgetButton(title: 'Выходные', color: AppColors.darkBlue, icon: CupertinoIcons.calendar, onPressed: () {})),
                  Flexible(child: ShowSearchLocationWidgetButton(title: 'Горячие билеты', color: AppColors.red, icon: CupertinoIcons.flame_fill, onPressed: () {})),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.grey4,
                ),
                child: ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, item) {
                    return CupertinoListTile(
                      onTap: () => Navigator.of(context, rootNavigator: false).push(
                        CupertinoPageRoute(
                          maintainState: false,
                          builder: (context) => const SearchSelectedStateScreen(),
                        ),
                      ),
                      title: const Text(
                        'City',
                        style: TextStyle(color: CupertinoColors.white, fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      leadingSize: 40,
                      padding: EdgeInsets.zero,
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(image: AssetImage(Assets.images76aee0c4632df7a3d3c7ff427d179b33), fit: BoxFit.cover),
                        ),
                      ),
                      subtitle: const Text(
                        'description',
                        style: TextStyle(
                          color: AppColors.grey6,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 15,
                      ),
                      width: size.width,
                      height: 1,
                      color: AppColors.grey5,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _search1Controller.dispose();
    _search2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Поиск дешевых авиабилетов',
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.grey3,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.grey4,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Flexible(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => _showSearchTicket(size),
                            child: const Icon(
                              CupertinoIcons.search,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 7,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                child: CupertinoTextField(
                                  controller: _search1Controller,
                                  decoration: BoxDecoration(color: CupertinoColors.black.withOpacity(.0)),
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 18,
                                  ),
                                  placeholder: 'Откуда - Москва',
                                  placeholderStyle: const TextStyle(
                                    color: AppColors.grey6,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                                width: size.width,
                                height: 1,
                                color: AppColors.grey6,
                              ),
                              SizedBox(
                                height: 30,
                                child: CupertinoTextField(
                                  controller: _search2Controller,
                                  decoration: BoxDecoration(color: CupertinoColors.activeOrange.withOpacity(.0)),
                                  placeholder: 'Куда - Турция',
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 18,
                                  ),
                                  placeholderStyle: const TextStyle(
                                    color: AppColors.grey6,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Музыкально отлететь',
                        style: TextStyle(color: CupertinoColors.white, fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: BlocBuilder<OffersBloc, OffersState>(
                        builder: (context, state) {
                          if (state is OffersLoading) {
                            return const Center(child: CupertinoActivityIndicator());
                          } else if (state is OffersLoaded) {
                            Offers offers = state.offers;
                            List<OfferItem> offerList = offers.offersItem;
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: offerList.length,
                              itemBuilder: (context, index) {
                                OfferItem offer = offerList[index];
                                return Padding(
                                  padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: index == 4 ? 20 : 85),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * .35,
                                        height: size.width * .35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(
                                            image: AssetImage(Assets.images76aee0c4632df7a3d3c7ff427d179b33),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        offer.title,
                                        style: const TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 22,
                                        ),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        offer.town,
                                        style: const TextStyle(color: CupertinoColors.white, fontSize: 14),
                                        softWrap: true,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Transform.rotate(
                                            angle: -pi / 4,
                                            child: const Icon(
                                              CupertinoIcons.airplane,
                                              color: AppColors.grey6,
                                            ),
                                          ),
                                          Text(
                                            'от ${offer.price.value} ₽ ',
                                            style: const TextStyle(color: AppColors.grey7, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (state is OffersError) {
                            return Center(
                              child: Text(
                                'No Internet connection',
                                style: CupertinoTheme.of(context).textTheme.textStyle,
                              ),
                            );
                          }
                          return Container(); // Другие состояния
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CupertinoButton(
                        color: AppColors.grey4,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Показать все места',
                          style: CupertinoTheme.of(context).textTheme.textStyle,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Ваш первый раз',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
