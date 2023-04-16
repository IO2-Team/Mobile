# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://yourbackenhosting.edu.pl*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteReservation**](ReservationApi.md#deletereservation) | **DELETE** /reservation | Create new reservation
[**makeReservation**](ReservationApi.md#makereservation) | **POST** /reservation | Create new reservation


# **deleteReservation**
> deleteReservation(reservationToken)

Create new reservation

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final String reservationToken = df0d69cbe68fb6e2b27aa88f6f94497e; // String | token of reservation

try {
    api.deleteReservation(reservationToken);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->deleteReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservationToken** | **String**| token of reservation | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **makeReservation**
> ReservationDTO makeReservation(eventId, placeID)

Create new reservation

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int eventId = 789; // int | ID of event
final int placeID = 789; // int | ID of place

try {
    final response = api.makeReservation(eventId, placeID);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->makeReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**| ID of event | 
 **placeID** | **int**| ID of place | [optional] 

### Return type

[**ReservationDTO**](ReservationDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

