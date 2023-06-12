import base64
import json
from rembg import remove

def lambda_handler(event, context):
    if 'body' not in event or not event['body']:
        return {
            'statusCode': 400,
            'body': 'No image uploaded'
        }

    body = json.loads(event['body'])
    image_data = base64.b64decode(body['image'].encode())

    try:
        output = remove(image_data)

        # Codificar a saída em base64
        encoded_output = base64.b64encode(output).decode('utf-8')

        return {
            'statusCode': 200,
            'body': encoded_output,
            'headers': {
                'Content-Type': 'image/png'
            }
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f'Failed to process image: {str(e)}'
        }
