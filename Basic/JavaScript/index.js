const {Storage} = require('@google-cloud/storage');

const storage = new Storage();
const bucketName = 'kprusak-function-bucket'

exports.processMessage = async (message, context) => {
    const pubsubMessage = Buffer.from(message.data, 'base64').toString();

    const fileName = `message-${context.eventId}.txt`;
    const bucket = storage.bucket(bucketName);
    const file = bucket.file(fileName);

    await file.save(pubsubMessage);

    console.log(`Message processed and saved to ${fileName}`);
};