import { APIGatewayEvent, APIGatewayProxyCallback, APIGatewayProxyEvent, APIGatewayProxyResult, Context } from 'aws-lambda';


export const lambdaHandler = (event: APIGatewayEvent, context: Context, callback: APIGatewayProxyCallback): void => {
    console.log("hewwo world")
}