module.exports.handler = async (event) => {
  console.log('Event: ', event);
  const message = 'Hello, World!';

  return {
    statusCode: 200,
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ message }),
  }
}
