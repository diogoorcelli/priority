import 'package:flutter/material.dart';

import 'alert_messenger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AlertPriorityApp());
}

class AlertPriorityApp extends StatelessWidget {
  const AlertPriorityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Priority',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(size: 16.0, color: Colors.white),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(110, 40)),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Alerts',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[200],
        body: AlertMessenger(
          child: Builder(builder: (context) {
            final alertMessenger = AlertMessenger.of(context);
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: ValueListenableBuilder<String>(
                        valueListenable:
                            alertMessenger.currentAlertTextNotifier,
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  AlertMessenger.of(context).showAlert(
                                    alert: const Alert(
                                      backgroundColor: Colors.red,
                                      leading: Icon(Icons.error),
                                      priority: AlertPriority.error,
                                      child: Text(
                                          'Oops, ocorreu um erro. Pedimos desculpas.'),
                                    ),
                                  );
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error, color: Colors.white),
                                    SizedBox(width: 4.0),
                                    Text(
                                      'Error',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  AlertMessenger.of(context).showAlert(
                                    alert: const Alert(
                                      backgroundColor: Colors.amber,
                                      leading: Icon(Icons.warning),
                                      priority: AlertPriority.warning,
                                      child: Text('Atenção! Você foi avisado.'),
                                    ),
                                  );
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.amber),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.warning_outlined,
                                        color: Colors.white),
                                    SizedBox(width: 4.0),
                                    Text(
                                      'Warning',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  AlertMessenger.of(context).showAlert(
                                    alert: const Alert(
                                      backgroundColor: Colors.green,
                                      leading: Icon(Icons.info),
                                      priority: AlertPriority.info,
                                      child: Text(
                                          'Este é um aplicativo escrito em Flutter.'),
                                    ),
                                  );
                                },
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.lightGreen),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.info_outline,
                                        color: Colors.white),
                                    SizedBox(width: 4.0),
                                    Text(
                                      'Info',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                              ),
                              onPressed: AlertMessenger.of(context).hideAlert,
                              child: const Text(
                                'Hide alert',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
