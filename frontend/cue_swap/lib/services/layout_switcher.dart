
import 'package:cue_swap/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter/material.dart';

class LayoutSwitcher{
  Widget usePrincipalLayout(Widget widget){
    return DashboardLayout(child: widget);
  }
}