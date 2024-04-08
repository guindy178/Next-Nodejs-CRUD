import { Response } from 'express';

export function formatResponse(status: string, data: any) {
    return {
        status: status,
        message: "OK",
        data: data 
    };
}

export function sendFormattedResponse(res: Response, status: string, data: any) {
    const formattedResponse = formatResponse(status, data);
    res.json(formattedResponse);
}
