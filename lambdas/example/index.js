const logger = require('pino')();

exports.handler = async (event, context) => {
    context.callbackWaitsForEmptyEventLoop = false;

    const dataEvent = JSON.stringify(event);
    logger.info('Display data event: '+ dataEvent);

    return context.succeed({ data: dataEvent });
};