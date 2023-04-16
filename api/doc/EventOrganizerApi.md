# openapi.api.EventOrganizerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://yourbackenhosting.edu.pl*

Method | HTTP request | Description
------------- | ------------- | -------------
[**confirm**](EventOrganizerApi.md#confirm) | **POST** /organizer/{id} | Confirm orginizer account
[**deleteOrganizer**](EventOrganizerApi.md#deleteorganizer) | **DELETE** /organizer/{id} | Confirm orginizer account
[**getOrganizer**](EventOrganizerApi.md#getorganizer) | **GET** /organizer | Get organizer account (my account)
[**loginOrganizer**](EventOrganizerApi.md#loginorganizer) | **GET** /organizer/login | Logs organizer into the system
[**patchOrganizer**](EventOrganizerApi.md#patchorganizer) | **PATCH** /organizer/{id} | Patch orginizer account
[**signUp**](EventOrganizerApi.md#signup) | **POST** /organizer | Create orginizer account


# **confirm**
> confirm(id, code)

Confirm orginizer account

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final String id = id_example; // String | id of Organizer
final String code = code_example; // String | code from email

try {
    api.confirm(id, code);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->confirm: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| id of Organizer | 
 **code** | **String**| code from email | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizer**
> deleteOrganizer(sessionToken, id)

Confirm orginizer account

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token
final String id = id_example; // String | id of Organizer

try {
    api.deleteOrganizer(sessionToken, id);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->deleteOrganizer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 
 **id** | **String**| id of Organizer | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizer**
> Organizer getOrganizer(sessionToken)

Get organizer account (my account)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token

try {
    final response = api.getOrganizer(sessionToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->getOrganizer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 

### Return type

[**Organizer**](Organizer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginOrganizer**
> LoginOrganizer200Response loginOrganizer(email, password)

Logs organizer into the system



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final String email = email_example; // String | The organizer email for login
final String password = password_example; // String | the password

try {
    final response = api.loginOrganizer(email, password);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->loginOrganizer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**| The organizer email for login | 
 **password** | **String**| the password | 

### Return type

[**LoginOrganizer200Response**](LoginOrganizer200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchOrganizer**
> patchOrganizer(sessionToken, id, organizerPatch)

Patch orginizer account

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final String sessionToken = 3424bn3b3tii3t4ibt43in; // String | session Token
final String id = id_example; // String | id of Organizer
final OrganizerPatch organizerPatch = ; // OrganizerPatch | Update an existent user in the store

try {
    api.patchOrganizer(sessionToken, id, organizerPatch);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->patchOrganizer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionToken** | **String**| session Token | 
 **id** | **String**| id of Organizer | 
 **organizerPatch** | [**OrganizerPatch**](OrganizerPatch.md)| Update an existent user in the store | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signUp**
> Organizer signUp(organizerForm)

Create orginizer account

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventOrganizerApi();
final OrganizerForm organizerForm = ; // OrganizerForm | Add event

try {
    final response = api.signUp(organizerForm);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EventOrganizerApi->signUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizerForm** | [**OrganizerForm**](OrganizerForm.md)| Add event | [optional] 

### Return type

[**Organizer**](Organizer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

