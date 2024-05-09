import 'package:effective_flight/core/constants/colors.dart';
import 'package:effective_flight/features/domain/entities/tickets_offers_model.dart';
import 'package:effective_flight/features/presentation/bloc/ticket_offers/ticket_offers_bloc.dart';
import 'package:effective_flight/features/presentation/pages/all_ticket_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchSelectedStateScreen extends StatefulWidget {
  const SearchSelectedStateScreen({super.key});

  @override
  State<SearchSelectedStateScreen> createState() => _SearchSelectedStateScreenState();
}

class _SearchSelectedStateScreenState extends State<SearchSelectedStateScreen> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController _search1Controller = TextEditingController();
  TextEditingController _search2Controller = TextEditingController();
  bool isScroll = false;
  double position = 0;
  int selectedCategoryIndex = 0;
  bool _isSubscription = false;

  @override
  void initState() {
    print(isScroll);
    super.initState();
  }

  String formattedDate(DateTime unformattedDateTime) {
    DateFormat dateFormat = DateFormat.Hm();
    String formattedDateTime = dateFormat.format(unformattedDateTime);
    return formattedDateTime;
  }

  String compareDate(DateTime departureTime, DateTime arrivalTime) {
    Duration comparedTime = arrivalTime.difference(departureTime);
    print(comparedTime);
    return '${comparedTime.inHours}';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    _search1Controller.dispose();
    _search2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.grey4, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Flexible(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        CupertinoIcons.back,
                        color: CupertinoColors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: CupertinoTextField(
                            decoration: BoxDecoration(color: CupertinoColors.black.withOpacity(.0)),
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 18,
                            ),
                            suffix: CupertinoButton(
                              onPressed: () {
                                String state1 = _search1Controller.text;
                                _search1Controller = _search2Controller;
                                _search2Controller.text = state1;
                              },
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                CupertinoIcons.arrow_up_arrow_down,
                                color: CupertinoColors.white,
                              ),
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
                            suffix: CupertinoButton(
                              onPressed: () {
                                _search2Controller.clear();
                              },
                              padding: EdgeInsets.zero,
                              child: const Icon(CupertinoIcons.clear),
                            ),
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
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.add,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'обратно',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '24 фев, ',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: 'сб',
                                  style: TextStyle(
                                    color: AppColors.grey6,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.person_solid,
                            color: AppColors.grey5,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          RichText(
                            text: const TextSpan(
                              text: '1, ',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: 'эконом',
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.slider_horizontal_3,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'фильтры',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.grey4,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Прямые рельсы',
                    style: TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<TicketOffersBloc, TicketOffersState>(
                    builder: (context, state) {
                      if (state is TicketOffersLoading) {
                        return const Center(child: CupertinoActivityIndicator());
                      } else if (state is TicketOffersLoaded) {
                        TicketsOffers ticketsOffers = state.ticketOffers;
                        List<TicketsOfferItem> ticketOffersList = ticketsOffers.ticketsOffersItem;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: ticketOffersList.length,
                          itemBuilder: (context, index) {
                            TicketsOfferItem ticketOffer = ticketOffersList[index];
                            // List<String> formattedTime = [];
                            // for (var element in ticketOffer.timeRange) {
                            //   formattedTime.add(formattedDate(element));
                            // }
                            String timeRange = '';
                            for (var element in ticketOffer.timeRange) {
                              timeRange += '$element ';
                            }
                            return Column(
                              children: [
                                CupertinoListTile(
                                  padding: EdgeInsets.zero,
                                  leadingSize: 35,
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    width: 40,
                                    height: 40,
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ticketOffer.title,
                                        style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${ticketOffer.price.value} ₽ ',
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    timeRange,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  height: 1,
                                  color: AppColors.grey5,
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (state is TicketOffersError) {
                        return Center(child: Text(state.message));
                      }
                      return Container(); // Другие состояния
                    },
                  ),
                  Center(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text(
                        'Показать все',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton(
                color: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  'Посмотреть все билеты',
                  style: TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => const AllTicketScreen()));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.grey4,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(CupertinoIcons.bell_fill),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Подписка на цену',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: _isSubscription,
                    onChanged: (bool value) {
                      setState(() {
                        _isSubscription = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
