from flask import Flask, request, jsonify
import util

app = Flask(__name__)

@app.route('/classify_image', methods=['POST'])
def classify_image():
    image_data = request.files.get('image')

    if image_data:
        # Save the uploaded image temporarily
        file_path = "./temp.jpg"
        image_data.save(file_path)

        # classify the image
        result = util.classify_image(None, file_path)
        return jsonify(result)
    else:
        return jsonify({'error': 'No image provided'}), 400

if __name__ == "__main__":
    print("Starting Python server...")
    util.load_saved_artifacts()
    app.run(port=5000)
