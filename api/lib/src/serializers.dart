//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/category.dart';
import 'package:openapi/src/model/event.dart';
import 'package:openapi/src/model/event_form.dart';
import 'package:openapi/src/model/event_patch.dart';
import 'package:openapi/src/model/event_status.dart';
import 'package:openapi/src/model/event_with_places.dart';
import 'package:openapi/src/model/login_organizer200_response.dart';
import 'package:openapi/src/model/organizer.dart';
import 'package:openapi/src/model/organizer_form.dart';
import 'package:openapi/src/model/organizer_patch.dart';
import 'package:openapi/src/model/place.dart';
import 'package:openapi/src/model/reservation_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  Category,
  Event,
  EventForm,
  EventPatch,
  EventStatus,
  EventWithPlaces,
  LoginOrganizer200Response,
  Organizer,
  OrganizerForm,
  OrganizerPatch,
  Place,
  ReservationDTO,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Event)]),
        () => ListBuilder<Event>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Category)]),
        () => ListBuilder<Category>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
