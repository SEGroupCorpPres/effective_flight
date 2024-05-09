import 'package:effective_flight/core/constants/colors.dart';
import 'package:effective_flight/features/domain/entities/ticket_model.dart';
import 'package:effective_flight/features/presentation/bloc/ticket/ticket_bloc.dart';
import 'package:effective_flight/features/presentation/widgets/widget_backgroud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AllTicketScreen extends StatefulWidget {
  const AllTicketScreen({super.key});

  @override
  State<AllTicketScreen> createState() => _AllTicketScreenState();
}

class _AllTicketScreenState extends State<AllTicketScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  WidgetBackground(
                    horizontalPadding: 0,
                    verticalPadding: 10,
                    horizontalMargin: 0,
                    verticalMargin: 0,
                    child: SizedBox(
                      height: 45,
                      child: CupertinoListTile(
                        padding: EdgeInsets.zero,
                        leading: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(CupertinoIcons.back),
                          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                        ),
                        title: const Text(
                          'Москва-Сочи',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          '23 февраля, 1 пассажир',
                          style: TextStyle(
                            color: AppColors.grey6,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height - MediaQuery.of(context).padding.top - 85,
                    child: BlocBuilder<TicketBloc, TicketState>(
                      builder: (context, state) {
                        if (state is TicketLoading) {
                          return const Center(child: CupertinoActivityIndicator());
                        } else if (state is TicketLoaded) {
                          Tickets tickets = state.tickets;
                          List<Ticket> ticketList = tickets.tickets;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: ticketList.length,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemBuilder: (context, item) {
                              final Ticket ticket = ticketList[item];
                              final String departureTime = formattedDate(ticket.departure.date);
                              final String arrivalTime = formattedDate(ticket.arrival.date);
                              final String compareTime = compareDate(ticket.departure.date, ticket.arrival.date);
                              return Stack(
                                children: [
                                  WidgetBackground(
                                    verticalMargin: 10,
                                    horizontalMargin: 0,
                                    horizontalPadding: 20,
                                    verticalPadding: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${ticket.price.value}₽ ',
                                          style: const TextStyle(
                                            color: CupertinoColors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: AppColors.red,
                                              ),
                                              width: 28,
                                              height: 28,
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: size.width - 120,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 6,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              departureTime.toString(),
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              ticket.departure.airport,
                                                              style: const TextStyle(color: AppColors.grey6, fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(width: 5),
                                                        const Text(
                                                          '—',
                                                          style: TextStyle(color: AppColors.grey6),
                                                        ),
                                                        const SizedBox(width: 5),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              arrivalTime,
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              ticket.arrival.airport,
                                                              style: const TextStyle(color: AppColors.grey6, fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Flexible(
                                                    flex: 9,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '$compareTime ч в пути',
                                                          style: const TextStyle(fontSize: 15, height: 1.25),
                                                          softWrap: true,
                                                        ),
                                                        Text(
                                                          !ticket.hasTransfer ? '/ Без пересадок' : '',
                                                          style: const TextStyle(fontSize: 15, height: 1.25),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ticket.badge != null
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppColors.primaryColor,
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                          child: Text(
                                            ticket.badge.toString(),
                                            style: const TextStyle(
                                              color: CupertinoColors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              );
                            },
                          );
                        } else if (state is TicketError) {
                          return Center(child: Text(state.message));
                        }
                        return Container(); // Другие состояния
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.primaryColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.slider_horizontal_3,
                          color: CupertinoColors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Фильтр',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.chart_bar_alt_fill,
                          color: CupertinoColors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'График цен',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
