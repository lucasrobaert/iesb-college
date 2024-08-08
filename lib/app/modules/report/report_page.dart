import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iesb_college/app/modules/report/report_store.dart';
import 'package:iesb_college/app/shared/util/constants/routes.dart';
import 'package:mobx/mobx.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  var store = Modular.get<ReportStore>();
  late final ReactionDisposer _disposer;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    store.clearReports();
    _loadReports();
  }

  Future<void> _loadReports() async {
    await store.getReport();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Material(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('IESB College - Reports'),
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        return ListView.builder(
                          itemCount: store.reports.length,
                          itemBuilder: (context, index) {
                            final report = store.reports[index];
                            return Card(
                              child: ListTile(
                                title: Text(report.name),
                                subtitle: Text(
                                    '${report.media.toString()} - ${report.status}'),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Modular.to.pushNamed(
                                      '${Routes.course}${Routes.notes}',
                                      arguments: report);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
