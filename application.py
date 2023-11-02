from flask import Flask, request, jsonify
from rembg import remove

app = Flask(__name__)


@app.route('/remove_background', methods=['POST'])
def remove_background():
    if 'image' not in request.files:
        return jsonify({'error': 'No image uploaded'}), 400

    image = request.files['image']
    image_data = image.read()

    try:
        output = remove(image_data)
    except Exception as e:
        return jsonify({'error': 'Failed to process image', 'details': str(e)}), 500

    return output, 200, {'Content-Type': 'image/png'}


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
