import { APIGatewayEvent, APIGatewayProxyCallback, APIGatewayProxyEvent, APIGatewayProxyResult, Context } from 'aws-lambda';


export const handler = (event: APIGatewayEvent, context: Context, callback: APIGatewayProxyCallback): void => {
    console.log("hewwo world")
}