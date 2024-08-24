// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersDataTable extends UsersData
    with TableInfo<$UsersDataTable, UsersTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
      'position', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, position, email, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_data';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $UsersDataTable createAlias(String alias) {
    return $UsersDataTable(attachedDatabase, alias);
  }
}

class UsersTable extends DataClass implements Insertable<UsersTable> {
  final int id;
  final String firstName;
  final String lastName;
  final String position;
  final String email;
  final String image;
  const UsersTable(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.position,
      required this.email,
      required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['position'] = Variable<String>(position);
    map['email'] = Variable<String>(email);
    map['image'] = Variable<String>(image);
    return map;
  }

  UsersDataCompanion toCompanion(bool nullToAbsent) {
    return UsersDataCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      position: Value(position),
      email: Value(email),
      image: Value(image),
    );
  }

  factory UsersTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTable(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      position: serializer.fromJson<String>(json['position']),
      email: serializer.fromJson<String>(json['email']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'position': serializer.toJson<String>(position),
      'email': serializer.toJson<String>(email),
      'image': serializer.toJson<String>(image),
    };
  }

  UsersTable copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          String? position,
          String? email,
          String? image}) =>
      UsersTable(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        position: position ?? this.position,
        email: email ?? this.email,
        image: image ?? this.image,
      );
  UsersTable copyWithCompanion(UsersDataCompanion data) {
    return UsersTable(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      position: data.position.present ? data.position.value : this.position,
      email: data.email.present ? data.email.value : this.email,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTable(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('position: $position, ')
          ..write('email: $email, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, position, email, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTable &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.position == this.position &&
          other.email == this.email &&
          other.image == this.image);
}

class UsersDataCompanion extends UpdateCompanion<UsersTable> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> position;
  final Value<String> email;
  final Value<String> image;
  const UsersDataCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.position = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
  });
  UsersDataCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String position,
    required String email,
    required String image,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        position = Value(position),
        email = Value(email),
        image = Value(image);
  static Insertable<UsersTable> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? position,
    Expression<String>? email,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (position != null) 'position': position,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
    });
  }

  UsersDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? position,
      Value<String>? email,
      Value<String>? image}) {
    return UsersDataCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      position: position ?? this.position,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersDataCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('position: $position, ')
          ..write('email: $email, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $SettingsDataTable extends SettingsData
    with TableInfo<$SettingsDataTable, SettingsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
      'id_user', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UsersTable(id)');
  static const VerificationMeta _duplicateBarCodesMeta =
      const VerificationMeta('duplicateBarCodes');
  @override
  late final GeneratedColumn<String> duplicateBarCodes =
      GeneratedColumn<String>('duplicate_bar_codes', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _muteMeta = const VerificationMeta('mute');
  @override
  late final GeneratedColumn<String> mute = GeneratedColumn<String>(
      'mute', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _vibrationMeta =
      const VerificationMeta('vibration');
  @override
  late final GeneratedColumn<String> vibration = GeneratedColumn<String>(
      'vibration', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _copyToClipBoardMeta =
      const VerificationMeta('copyToClipBoard');
  @override
  late final GeneratedColumn<String> copyToClipBoard = GeneratedColumn<String>(
      'copy_to_clip_board', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idUser, duplicateBarCodes, mute, vibration, copyToClipBoard];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_data';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('duplicate_bar_codes')) {
      context.handle(
          _duplicateBarCodesMeta,
          duplicateBarCodes.isAcceptableOrUnknown(
              data['duplicate_bar_codes']!, _duplicateBarCodesMeta));
    } else if (isInserting) {
      context.missing(_duplicateBarCodesMeta);
    }
    if (data.containsKey('mute')) {
      context.handle(
          _muteMeta, mute.isAcceptableOrUnknown(data['mute']!, _muteMeta));
    } else if (isInserting) {
      context.missing(_muteMeta);
    }
    if (data.containsKey('vibration')) {
      context.handle(_vibrationMeta,
          vibration.isAcceptableOrUnknown(data['vibration']!, _vibrationMeta));
    } else if (isInserting) {
      context.missing(_vibrationMeta);
    }
    if (data.containsKey('copy_to_clip_board')) {
      context.handle(
          _copyToClipBoardMeta,
          copyToClipBoard.isAcceptableOrUnknown(
              data['copy_to_clip_board']!, _copyToClipBoardMeta));
    } else if (isInserting) {
      context.missing(_copyToClipBoardMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idUser: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_user'])!,
      duplicateBarCodes: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}duplicate_bar_codes'])!,
      mute: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mute'])!,
      vibration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vibration'])!,
      copyToClipBoard: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}copy_to_clip_board'])!,
    );
  }

  @override
  $SettingsDataTable createAlias(String alias) {
    return $SettingsDataTable(attachedDatabase, alias);
  }
}

class SettingsTable extends DataClass implements Insertable<SettingsTable> {
  final int id;
  final int idUser;
  final String duplicateBarCodes;
  final String mute;
  final String vibration;
  final String copyToClipBoard;
  const SettingsTable(
      {required this.id,
      required this.idUser,
      required this.duplicateBarCodes,
      required this.mute,
      required this.vibration,
      required this.copyToClipBoard});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_user'] = Variable<int>(idUser);
    map['duplicate_bar_codes'] = Variable<String>(duplicateBarCodes);
    map['mute'] = Variable<String>(mute);
    map['vibration'] = Variable<String>(vibration);
    map['copy_to_clip_board'] = Variable<String>(copyToClipBoard);
    return map;
  }

  SettingsDataCompanion toCompanion(bool nullToAbsent) {
    return SettingsDataCompanion(
      id: Value(id),
      idUser: Value(idUser),
      duplicateBarCodes: Value(duplicateBarCodes),
      mute: Value(mute),
      vibration: Value(vibration),
      copyToClipBoard: Value(copyToClipBoard),
    );
  }

  factory SettingsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsTable(
      id: serializer.fromJson<int>(json['id']),
      idUser: serializer.fromJson<int>(json['idUser']),
      duplicateBarCodes: serializer.fromJson<String>(json['duplicateBarCodes']),
      mute: serializer.fromJson<String>(json['mute']),
      vibration: serializer.fromJson<String>(json['vibration']),
      copyToClipBoard: serializer.fromJson<String>(json['copyToClipBoard']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idUser': serializer.toJson<int>(idUser),
      'duplicateBarCodes': serializer.toJson<String>(duplicateBarCodes),
      'mute': serializer.toJson<String>(mute),
      'vibration': serializer.toJson<String>(vibration),
      'copyToClipBoard': serializer.toJson<String>(copyToClipBoard),
    };
  }

  SettingsTable copyWith(
          {int? id,
          int? idUser,
          String? duplicateBarCodes,
          String? mute,
          String? vibration,
          String? copyToClipBoard}) =>
      SettingsTable(
        id: id ?? this.id,
        idUser: idUser ?? this.idUser,
        duplicateBarCodes: duplicateBarCodes ?? this.duplicateBarCodes,
        mute: mute ?? this.mute,
        vibration: vibration ?? this.vibration,
        copyToClipBoard: copyToClipBoard ?? this.copyToClipBoard,
      );
  SettingsTable copyWithCompanion(SettingsDataCompanion data) {
    return SettingsTable(
      id: data.id.present ? data.id.value : this.id,
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      duplicateBarCodes: data.duplicateBarCodes.present
          ? data.duplicateBarCodes.value
          : this.duplicateBarCodes,
      mute: data.mute.present ? data.mute.value : this.mute,
      vibration: data.vibration.present ? data.vibration.value : this.vibration,
      copyToClipBoard: data.copyToClipBoard.present
          ? data.copyToClipBoard.value
          : this.copyToClipBoard,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTable(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('duplicateBarCodes: $duplicateBarCodes, ')
          ..write('mute: $mute, ')
          ..write('vibration: $vibration, ')
          ..write('copyToClipBoard: $copyToClipBoard')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, idUser, duplicateBarCodes, mute, vibration, copyToClipBoard);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsTable &&
          other.id == this.id &&
          other.idUser == this.idUser &&
          other.duplicateBarCodes == this.duplicateBarCodes &&
          other.mute == this.mute &&
          other.vibration == this.vibration &&
          other.copyToClipBoard == this.copyToClipBoard);
}

class SettingsDataCompanion extends UpdateCompanion<SettingsTable> {
  final Value<int> id;
  final Value<int> idUser;
  final Value<String> duplicateBarCodes;
  final Value<String> mute;
  final Value<String> vibration;
  final Value<String> copyToClipBoard;
  const SettingsDataCompanion({
    this.id = const Value.absent(),
    this.idUser = const Value.absent(),
    this.duplicateBarCodes = const Value.absent(),
    this.mute = const Value.absent(),
    this.vibration = const Value.absent(),
    this.copyToClipBoard = const Value.absent(),
  });
  SettingsDataCompanion.insert({
    this.id = const Value.absent(),
    required int idUser,
    required String duplicateBarCodes,
    required String mute,
    required String vibration,
    required String copyToClipBoard,
  })  : idUser = Value(idUser),
        duplicateBarCodes = Value(duplicateBarCodes),
        mute = Value(mute),
        vibration = Value(vibration),
        copyToClipBoard = Value(copyToClipBoard);
  static Insertable<SettingsTable> custom({
    Expression<int>? id,
    Expression<int>? idUser,
    Expression<String>? duplicateBarCodes,
    Expression<String>? mute,
    Expression<String>? vibration,
    Expression<String>? copyToClipBoard,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idUser != null) 'id_user': idUser,
      if (duplicateBarCodes != null) 'duplicate_bar_codes': duplicateBarCodes,
      if (mute != null) 'mute': mute,
      if (vibration != null) 'vibration': vibration,
      if (copyToClipBoard != null) 'copy_to_clip_board': copyToClipBoard,
    });
  }

  SettingsDataCompanion copyWith(
      {Value<int>? id,
      Value<int>? idUser,
      Value<String>? duplicateBarCodes,
      Value<String>? mute,
      Value<String>? vibration,
      Value<String>? copyToClipBoard}) {
    return SettingsDataCompanion(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      duplicateBarCodes: duplicateBarCodes ?? this.duplicateBarCodes,
      mute: mute ?? this.mute,
      vibration: vibration ?? this.vibration,
      copyToClipBoard: copyToClipBoard ?? this.copyToClipBoard,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (duplicateBarCodes.present) {
      map['duplicate_bar_codes'] = Variable<String>(duplicateBarCodes.value);
    }
    if (mute.present) {
      map['mute'] = Variable<String>(mute.value);
    }
    if (vibration.present) {
      map['vibration'] = Variable<String>(vibration.value);
    }
    if (copyToClipBoard.present) {
      map['copy_to_clip_board'] = Variable<String>(copyToClipBoard.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsDataCompanion(')
          ..write('id: $id, ')
          ..write('idUser: $idUser, ')
          ..write('duplicateBarCodes: $duplicateBarCodes, ')
          ..write('mute: $mute, ')
          ..write('vibration: $vibration, ')
          ..write('copyToClipBoard: $copyToClipBoard')
          ..write(')'))
        .toString();
  }
}

abstract class _$DataBase extends GeneratedDatabase {
  _$DataBase(QueryExecutor e) : super(e);
  $DataBaseManager get managers => $DataBaseManager(this);
  late final $UsersDataTable usersData = $UsersDataTable(this);
  late final $SettingsDataTable settingsData = $SettingsDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [usersData, settingsData];
}

typedef $$UsersDataTableCreateCompanionBuilder = UsersDataCompanion Function({
  Value<int> id,
  required String firstName,
  required String lastName,
  required String position,
  required String email,
  required String image,
});
typedef $$UsersDataTableUpdateCompanionBuilder = UsersDataCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> position,
  Value<String> email,
  Value<String> image,
});

class $$UsersDataTableFilterComposer
    extends FilterComposer<_$DataBase, $UsersDataTable> {
  $$UsersDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get position => $state.composableBuilder(
      column: $state.table.position,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsersDataTableOrderingComposer
    extends OrderingComposer<_$DataBase, $UsersDataTable> {
  $$UsersDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get position => $state.composableBuilder(
      column: $state.table.position,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UsersDataTableTableManager extends RootTableManager<
    _$DataBase,
    $UsersDataTable,
    UsersTable,
    $$UsersDataTableFilterComposer,
    $$UsersDataTableOrderingComposer,
    $$UsersDataTableCreateCompanionBuilder,
    $$UsersDataTableUpdateCompanionBuilder,
    (UsersTable, BaseReferences<_$DataBase, $UsersDataTable, UsersTable>),
    UsersTable,
    PrefetchHooks Function()> {
  $$UsersDataTableTableManager(_$DataBase db, $UsersDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> position = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> image = const Value.absent(),
          }) =>
              UsersDataCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            position: position,
            email: email,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String lastName,
            required String position,
            required String email,
            required String image,
          }) =>
              UsersDataCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            position: position,
            email: email,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersDataTableProcessedTableManager = ProcessedTableManager<
    _$DataBase,
    $UsersDataTable,
    UsersTable,
    $$UsersDataTableFilterComposer,
    $$UsersDataTableOrderingComposer,
    $$UsersDataTableCreateCompanionBuilder,
    $$UsersDataTableUpdateCompanionBuilder,
    (UsersTable, BaseReferences<_$DataBase, $UsersDataTable, UsersTable>),
    UsersTable,
    PrefetchHooks Function()>;
typedef $$SettingsDataTableCreateCompanionBuilder = SettingsDataCompanion
    Function({
  Value<int> id,
  required int idUser,
  required String duplicateBarCodes,
  required String mute,
  required String vibration,
  required String copyToClipBoard,
});
typedef $$SettingsDataTableUpdateCompanionBuilder = SettingsDataCompanion
    Function({
  Value<int> id,
  Value<int> idUser,
  Value<String> duplicateBarCodes,
  Value<String> mute,
  Value<String> vibration,
  Value<String> copyToClipBoard,
});

class $$SettingsDataTableFilterComposer
    extends FilterComposer<_$DataBase, $SettingsDataTable> {
  $$SettingsDataTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get idUser => $state.composableBuilder(
      column: $state.table.idUser,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get duplicateBarCodes => $state.composableBuilder(
      column: $state.table.duplicateBarCodes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mute => $state.composableBuilder(
      column: $state.table.mute,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vibration => $state.composableBuilder(
      column: $state.table.vibration,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get copyToClipBoard => $state.composableBuilder(
      column: $state.table.copyToClipBoard,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SettingsDataTableOrderingComposer
    extends OrderingComposer<_$DataBase, $SettingsDataTable> {
  $$SettingsDataTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get idUser => $state.composableBuilder(
      column: $state.table.idUser,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get duplicateBarCodes => $state.composableBuilder(
      column: $state.table.duplicateBarCodes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mute => $state.composableBuilder(
      column: $state.table.mute,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vibration => $state.composableBuilder(
      column: $state.table.vibration,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get copyToClipBoard => $state.composableBuilder(
      column: $state.table.copyToClipBoard,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$SettingsDataTableTableManager extends RootTableManager<
    _$DataBase,
    $SettingsDataTable,
    SettingsTable,
    $$SettingsDataTableFilterComposer,
    $$SettingsDataTableOrderingComposer,
    $$SettingsDataTableCreateCompanionBuilder,
    $$SettingsDataTableUpdateCompanionBuilder,
    (
      SettingsTable,
      BaseReferences<_$DataBase, $SettingsDataTable, SettingsTable>
    ),
    SettingsTable,
    PrefetchHooks Function()> {
  $$SettingsDataTableTableManager(_$DataBase db, $SettingsDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingsDataTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingsDataTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> idUser = const Value.absent(),
            Value<String> duplicateBarCodes = const Value.absent(),
            Value<String> mute = const Value.absent(),
            Value<String> vibration = const Value.absent(),
            Value<String> copyToClipBoard = const Value.absent(),
          }) =>
              SettingsDataCompanion(
            id: id,
            idUser: idUser,
            duplicateBarCodes: duplicateBarCodes,
            mute: mute,
            vibration: vibration,
            copyToClipBoard: copyToClipBoard,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int idUser,
            required String duplicateBarCodes,
            required String mute,
            required String vibration,
            required String copyToClipBoard,
          }) =>
              SettingsDataCompanion.insert(
            id: id,
            idUser: idUser,
            duplicateBarCodes: duplicateBarCodes,
            mute: mute,
            vibration: vibration,
            copyToClipBoard: copyToClipBoard,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsDataTableProcessedTableManager = ProcessedTableManager<
    _$DataBase,
    $SettingsDataTable,
    SettingsTable,
    $$SettingsDataTableFilterComposer,
    $$SettingsDataTableOrderingComposer,
    $$SettingsDataTableCreateCompanionBuilder,
    $$SettingsDataTableUpdateCompanionBuilder,
    (
      SettingsTable,
      BaseReferences<_$DataBase, $SettingsDataTable, SettingsTable>
    ),
    SettingsTable,
    PrefetchHooks Function()>;

class $DataBaseManager {
  final _$DataBase _db;
  $DataBaseManager(this._db);
  $$UsersDataTableTableManager get usersData =>
      $$UsersDataTableTableManager(_db, _db.usersData);
  $$SettingsDataTableTableManager get settingsData =>
      $$SettingsDataTableTableManager(_db, _db.settingsData);
}
