import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple/simple.dart';

void main() {
  test('bool extension test', () {
    //! OnTrue
    expect(true.onTrue("result"), "result");
    expect(null.onTrue("result"), null);
    expect(false.onTrue("result"), null);
    //! OnFalse
    expect(false.onFalse("result"), "result");
    expect(null.onFalse("result"), null);
    expect(true.onFalse("result"), null);
    //! onFalseOrNull
    expect(false.onFalseOrNull("result"), "result");
    expect(null.onFalseOrNull("result"), "result");
    expect(true.onFalseOrNull("result"), null);
    //! onTrueOrNull
    expect(false.onTrueOrNull("result"), null);
    expect(null.onTrueOrNull("result"), "result");
    expect(true.onTrueOrNull("result"), "result");
  });

  test('Color extension test', () {
    expect(Colors.white.darken(0.5), Color(0xff808080));
    expect(Colors.black.lighten(0.5), Color(0xffff0000));
  });

  test('double extensions', () {
    expect(15.0.format(), "15");
    expect(15.5.format(), "15.50");
    expect(15.5.format(" sar"), "15.50 sar");
  });

  test('duration extensions', () {
    expect(Duration(hours: 16767).format(), "one year & 11 months");
  });

  test('iterable extensions', () {
    var list = [DateTime(2000), DateTime(2001), DateTime(2002)];
    expect(list.firstOrDefault(), list[0]);
    expect(list.firstOrDefault((i) => i.year == 2001), list[1]);
    expect(list.firstOrDefault((i) => i.year == 2005), null);

    expect(list.lastOrDefault(), list[2]);
    expect(list.lastOrDefault((i) => i.year == 2001), list[1]);
    expect(list.lastOrDefault((i) => i.year == 2005), null);
  });

  test('string extensions', () {
    expect("ss".toTimeOfDay(), null);
    expect("19:16".toTimeOfDay(), TimeOfDay(hour: 19, minute: 16));
    expect("7:16 pm".toTimeOfDay(), TimeOfDay(hour: 19, minute: 16));
    expect("07:16 pm".toTimeOfDay(), TimeOfDay(hour: 19, minute: 16));
    expect("07:16 am".toTimeOfDay(), TimeOfDay(hour: 07, minute: 16));
  });
}
