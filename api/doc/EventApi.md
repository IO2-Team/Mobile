# openapi.api.EventApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://pw.edu.pl/api/v3*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addEvent**](EventApi.md#addevent) | **POST** /events | Add new event
[**cancelEvent**](EventApi.md#cancelevent) | **DELETE** /events/{id} | Cancel event
[**getByCategory**](EventApi.md#getbycategory) | **GET** /events/getByCategory | Return list of all events in category
[**getEventById**](EventApi.md#geteventbyid) | **GET** /events/{id} | Find event by ID
[**getEvents**](EventApi.md#getevents) | **GET** /events | Return list of all events
[**getMyEvents**](EventApi.md#getmyevents) | **GET** /events/my | Return list of events made by organizer, according to session
[**patchEvent**](EventApi.md#patchevent) | **PATCH** /events/{id} | patch existing event


# **addEvent**
> Event addEvent(sessionToken, title, name, freePlace, startTime, endTime, latitude, longitude, categories, placeSchema)

Add new event

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token
final String title = Short description of Event; // String | title of Event
final String name = Long description of Event; // String | title of Event
final int freePlace = 56; // int | No of free places
final int startTime = 1683034164; // int | Unix time stamp of begin of event
final int endTime = 1683034164; // int | Unix time stamp of end of event
final String latitude = 40.4775315; // String | Latitude of event
final String longitude = -3.7051359; // String | Longitude of event
final BuiltList<int> categories = ; // BuiltList<int> | Array of id of categories that event belong to.
final String placeSchema = placeSchema_example; // String | seralized place schema

try {
    final response = api.addEvent(sessionToken, title, name, freePlace, startTime, endTime, latitude, longitude, categories, placeSchema);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventApi->addEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 
 **title** | **String**| title of Event | 
 **name** | **String**| title of Event | 
 **freePlace** | **int**| No of free places | 
 **startTime** | **int**| Unix time stamp of begin of event | 
 **endTime** | **int**| Unix time stamp of end of event | 
 **latitude** | **String**| Latitude of event | 
 **longitude** | **String**| Longitude of event | 
 **categories** | [**BuiltList&lt;int&gt;**](int.md)| Array of id of categories that event belong to. | 
 **placeSchema** | **String**| seralized place schema | [optional] 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelEvent**
> cancelEvent(sessionToken, id)

Cancel event

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token
final String id = id_example; // String | id of Event

try {
    api.cancelEvent(sessionToken, id);
} catch on DioError (e) {
    print('Exception when calling EventApi->cancelEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 
 **id** | **String**| id of Event | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getByCategory**
> BuiltList<Event> getByCategory(categoryId)

Return list of all events in category

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final int categoryId = 789; // int | ID of category

try {
    final response = api.getByCategory(categoryId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventApi->getByCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **int**| ID of category | 

### Return type

[**BuiltList&lt;Event&gt;**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventById**
> Event getEventById(id)

Find event by ID

Returns a single event

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final int id = 789; // int | ID of event to return

try {
    final response = api.getEventById(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventApi->getEventById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of event to return | 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEvents**
> BuiltList<Event> getEvents()

Return list of all events

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();

try {
    final response = api.getEvents();
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventApi->getEvents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Event&gt;**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyEvents**
> BuiltList<Event> getMyEvents(sessionToken)

Return list of events made by organizer, according to session

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token

try {
    final response = api.getMyEvents(sessionToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventApi->getMyEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 

### Return type

[**BuiltList&lt;Event&gt;**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchEvent**
> patchEvent(sessionToken, id, event)

patch existing event

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token
final String id = id_example; // String | id of Event
final Event event = ; // Event | Update an existent user in the store

try {
    api.patchEvent(sessionToken, id, event);
} catch on DioError (e) {
    print('Exception when calling EventApi->patchEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 
 **id** | **String**| id of Event | 
 **event** | [**Event**](Event.md)| Update an existent user in the store | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

