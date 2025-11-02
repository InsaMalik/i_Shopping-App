
import 'package:shoppingapp/Shipping_Address/model/Address.dart';

class AddressRepositories {
  List<Address> getAddresses(){
    return [
    Address(
      id: '1',
      label: 'Home',
      fulladdress: '123  Main Street, apt 48',
      city: "Lahore",
      state: "Punjab",
      zipCode: "10001",
      isDefault: true,
      type: AddressType.home,
      ),
      Address(
      id: '2',
      label: 'office',
      fulladdress: '675 Business Ave, Suite 200',
      city: "Lahore",
      state: "Punjab",
      zipCode: "10002",
      type: AddressType.office,
      ),
    ];
  }
  Address? getDefaultAddress(){
    return getAddresses().firstWhere(
    (address) => address.isDefault,
    orElse: ()=>getAddresses().first,
    );
  }
}