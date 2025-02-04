// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserOrderdetailsStruct extends FFFirebaseStruct {
  UserOrderdetailsStruct({
    String? email,
    String? firstname,
    String? lastname,
    String? address,
    String? pincode,
    String? mobileNo,
    String? state,
    String? city,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? zipCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _firstname = firstname,
        _lastname = lastname,
        _address = address,
        _pincode = pincode,
        _mobileNo = mobileNo,
        _state = state,
        _city = city,
        _firstName = firstName,
        _lastName = lastName,
        _mobileNumber = mobileNumber,
        _zipCode = zipCode,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  set firstname(String? val) => _firstname = val;

  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  set lastname(String? val) => _lastname = val;

  bool hasLastname() => _lastname != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  set pincode(String? val) => _pincode = val;

  bool hasPincode() => _pincode != null;

  // "mobileNo" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;

  bool hasMobileNo() => _mobileNo != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "mobileNumber" field.
  String? _mobileNumber;
  String get mobileNumber => _mobileNumber ?? '';
  set mobileNumber(String? val) => _mobileNumber = val;

  bool hasMobileNumber() => _mobileNumber != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  static UserOrderdetailsStruct fromMap(Map<String, dynamic> data) =>
      UserOrderdetailsStruct(
        email: data['email'] as String?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        address: data['address'] as String?,
        pincode: data['pincode'] as String?,
        mobileNo: data['mobileNo'] as String?,
        state: data['state'] as String?,
        city: data['city'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        mobileNumber: data['mobileNumber'] as String?,
        zipCode: data['zipCode'] as String?,
      );

  static UserOrderdetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserOrderdetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'firstname': _firstname,
        'lastname': _lastname,
        'address': _address,
        'pincode': _pincode,
        'mobileNo': _mobileNo,
        'state': _state,
        'city': _city,
        'firstName': _firstName,
        'lastName': _lastName,
        'mobileNumber': _mobileNumber,
        'zipCode': _zipCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'firstname': serializeParam(
          _firstname,
          ParamType.String,
        ),
        'lastname': serializeParam(
          _lastname,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'pincode': serializeParam(
          _pincode,
          ParamType.String,
        ),
        'mobileNo': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'mobileNumber': serializeParam(
          _mobileNumber,
          ParamType.String,
        ),
        'zipCode': serializeParam(
          _zipCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserOrderdetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserOrderdetailsStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        firstname: deserializeParam(
          data['firstname'],
          ParamType.String,
          false,
        ),
        lastname: deserializeParam(
          data['lastname'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        pincode: deserializeParam(
          data['pincode'],
          ParamType.String,
          false,
        ),
        mobileNo: deserializeParam(
          data['mobileNo'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        mobileNumber: deserializeParam(
          data['mobileNumber'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zipCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserOrderdetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserOrderdetailsStruct &&
        email == other.email &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        address == other.address &&
        pincode == other.pincode &&
        mobileNo == other.mobileNo &&
        state == other.state &&
        city == other.city &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        mobileNumber == other.mobileNumber &&
        zipCode == other.zipCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        firstname,
        lastname,
        address,
        pincode,
        mobileNo,
        state,
        city,
        firstName,
        lastName,
        mobileNumber,
        zipCode
      ]);
}

UserOrderdetailsStruct createUserOrderdetailsStruct({
  String? email,
  String? firstname,
  String? lastname,
  String? address,
  String? pincode,
  String? mobileNo,
  String? state,
  String? city,
  String? firstName,
  String? lastName,
  String? mobileNumber,
  String? zipCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserOrderdetailsStruct(
      email: email,
      firstname: firstname,
      lastname: lastname,
      address: address,
      pincode: pincode,
      mobileNo: mobileNo,
      state: state,
      city: city,
      firstName: firstName,
      lastName: lastName,
      mobileNumber: mobileNumber,
      zipCode: zipCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserOrderdetailsStruct? updateUserOrderdetailsStruct(
  UserOrderdetailsStruct? userOrderdetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userOrderdetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserOrderdetailsStructData(
  Map<String, dynamic> firestoreData,
  UserOrderdetailsStruct? userOrderdetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userOrderdetails == null) {
    return;
  }
  if (userOrderdetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userOrderdetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userOrderdetailsData =
      getUserOrderdetailsFirestoreData(userOrderdetails, forFieldValue);
  final nestedData =
      userOrderdetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userOrderdetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserOrderdetailsFirestoreData(
  UserOrderdetailsStruct? userOrderdetails, [
  bool forFieldValue = false,
]) {
  if (userOrderdetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userOrderdetails.toMap());

  // Add any Firestore field values
  userOrderdetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserOrderdetailsListFirestoreData(
  List<UserOrderdetailsStruct>? userOrderdetailss,
) =>
    userOrderdetailss
        ?.map((e) => getUserOrderdetailsFirestoreData(e, true))
        .toList() ??
    [];
