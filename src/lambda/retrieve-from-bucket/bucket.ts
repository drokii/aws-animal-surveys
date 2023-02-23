import { S3 } from 'aws-sdk';

export const handler = async (event: any, context: any) => {
    // create an instance of the S3 client
    const s3 = new S3();

    try {
        // specify the S3 bucket and file path
        const params = {
            Bucket: 'aws-animal-surveys-bucket',
            Key: 'test.csv'
        };

        // retrieve the file from S3
        const response = await s3.getObject(params).promise();

        if (response.Body != undefined) {
            const fileContents = response.Body.toString();
            console.log(fileContents);

        }

        return {
            statusCode: 200,
            body: 'File retrieved successfully'
        };
    } catch (error) {
        console.error(error);
        return {
            statusCode: 500,
            body: 'Error retrieving file'
        };
    }
};



