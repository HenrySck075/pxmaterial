import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

Material skeltal(Widget widget) => Material(child:Skeletonizer(child: widget));
