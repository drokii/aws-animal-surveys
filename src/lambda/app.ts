import { APIGatewayEvent, APIGatewayProxyCallback, APIGatewayProxyEvent, APIGatewayProxyResult, Context } from 'aws-lambda';
import { Duck } from '../entities/Animal'


export const lambdaHandler = (event: APIGatewayEvent, context: Context, callback: APIGatewayProxyCallback): void => {
    console.log("hewwo world")
}