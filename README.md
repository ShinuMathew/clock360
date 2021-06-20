# Clock360
`Clock360 is flutter project to fetch current time for a given location using the [Worldtimeapi](http://worldtimeapi.org/)`

## Issues faced :
*   The Worldtimeapi response is inconsistent
*   Incase of inconsistent response app crashes

## To fix :
*   Error handling with error widget when  Worldtimeapi does not return a response.
*   Push Loading widget when new locationn is selected.
*   Add more vibrant images of the specific country timings. (i.e. if night should display countries night image)
*   Add climate and other details
*   Use a better api like [TimeZoneApi](https://timezoneapi.io/)