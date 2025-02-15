// ignore_for_file: camel_case_types

abstract class APIError {}

class NO_INTERNET extends APIError {}

class SEND_TIMEOUT extends NO_INTERNET {}

class RECIEVE_TIMEOUT extends NO_INTERNET {}

class CANCELED extends APIError {}

class SERVER_ERROR extends APIError {}

class VALIDATION_ERROR extends APIError {}

class UN_AUTHORIZED extends APIError {}

class FORBIDDEN extends APIError {}

class ModellingError extends APIError {}

class NO_CONTENT extends APIError {}

class OTHER extends APIError {}
