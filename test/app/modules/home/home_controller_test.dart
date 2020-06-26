import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slidytest/app/app_module.dart';
import 'package:slidytest/app/modules/home/home_controller.dart';
import 'package:slidytest/app/modules/home/home_module.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:slidytest/shared/repositories/localstorage/local_storage_mock.dart';

void main() {

  initModule(AppModule(),
      changeBinds: [
        Bind<ILocalStorage>((i) => LocalStorageMock())
      ]
  );
  initModule(HomeModule());

  test('click save', () async {
    final HomeController controller = Modular.get();
    controller.text = 'teste';
    controller.save();
    expect(controller.list.length, 1);
    expect(controller.list[0], 'teste');

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect( listStorage[0], 'teste');
  });


  test('click remove', () async {
    final HomeController controller = Modular.get();
    controller.text = 'teste';
    controller.save();

    controller.remove(0);
    expect(controller.list.length, 0);

    List<String> listStorage = await Modular.get<ILocalStorage>().get('key');

    expect( listStorage.isEmpty, true);
  });



 /* initModule(HomeModule());
  // HomeController home;
  //
  setUp(() {
    //     home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
    //   test("First Test", () {
    //     expect(home, isInstanceOf<HomeController>());
    //   });

    //   test("Set Value", () {
    //     expect(home.value, equals(0));
    //     home.increment();
    //     expect(home.value, equals(1));
    //   });
  });*/
}
