import 'package:flutter/material.dart';

class ContractView extends StatefulWidget {
  const ContractView({super.key});

  @override
  State<ContractView> createState() => _ContractViewState();
}

class _ContractViewState extends State<ContractView> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      body: Center(
        child: Text('Contract'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
