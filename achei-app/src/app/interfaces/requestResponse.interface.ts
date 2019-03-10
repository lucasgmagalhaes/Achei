export interface RequestResponse {
    message?: string;
    status?: HttpRequestCode;
    usuario?: any;
    token?: string;
    authenticated?: boolean;
}

export type HttpRequestCode =
    200 |
    201 |
    202 |
    204 |
    301 |
    302 |
    303 |
    304 |
    307 |
    400 |
    401 |
    403 |
    404 |
    405 |
    406 |
    412 |
    415 |
    500 |
    501;
