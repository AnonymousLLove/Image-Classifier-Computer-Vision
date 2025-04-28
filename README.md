<p align="center"> <h1 align="center">🦸‍♂️ Superhero Image Classifier</h1> </p> <p align="center"> <a href="#"><img src="https://img.shields.io/badge/Python-3.11-blue?logo=python" alt="Python"></a> <a href="#"><img src="https://img.shields.io/badge/Flutter-3.19-blue?logo=flutter" alt="Flutter"></a> <a href="#"><img src="https://img.shields.io/badge/Machine%20Learning-Enabled-green?logo=scikit-learn" alt="Machine Learning"></a> <a href="#"><img src="https://img.shields.io/badge/OpenCV-Computer%20Vision-red?logo=opencv" alt="OpenCV"></a> </p>


This project is an Image Classification App that classifies images into four superhero classes based on the uploaded picture

- 
## 🧠 Technologies Used

| Tech | Purpose |
| :--- | :------ |
| **Python** | Core backend, Machine Learning logic |
| **Flask** | API server for receiving images and returning predictions |
| **OpenCV** | Face and eye detection (Computer Vision) |
| **Scikit-learn** | Training and loading the Machine Learning model |
| **PyWavelets** | Feature extraction using Wavelet transforms |
| **Flutter** | Beautiful frontend app |
| **NumPy** | Data wrangling and preprocessing |

---

This app can recognize **four superheroes** just from an uploaded image — using real-time ML predictions!

---

## 🎥 Demo (Add your screenshots / videos here)

<!-- Insert Demo GIF or Screenshots -->
<p align="center">
  <img src="assets/demo_screenshot.png" width="300" alt="App Demo">
</p>

---

## 🛠️ How It Works (Behind the Scenes)

1. You upload a photo through the Flutter app.
2. Flutter sends it to the Python Flask server 🔥.
3. Flask:
   - Detects the face and eyes using **OpenCV** (Computer Vision 🤖).
   - Preprocesses the uploaded image (cropping, resizing, applying Wavelet Transforms).
   - Feeds it into a trained **Machine Learning model** (built with Scikit-learn).
4. The server predicts which superhero the image most resembles and sends the result back.


This project is a **live example of using Machine Learning + Computer Vision together**!

---


## 🖥️ Backend Structure (Python + Flask)

- `app.py`:  
  👉 Flask server with `/classify_image` endpoint to accept images and return predictions.

- `util.py`:  
  👉 Handles:
    - Loading the ML model and class mappings
    - Image preprocessing (cropping faces, resizing, applying wavelet transforms)
    - Running predictions with the loaded model

- `wavelet.py`:  
  👉 A helper for applying Wavelet Transformations to images.

- `saved_model.pkl`:  
  👉 The trained ML model file (Scikit-learn).

- `class_dictionary.json`:  
  👉 Maps class labels (Superman, Batman, etc.) to model outputs.

---

## 📲 Frontend Structure (Flutter)

- Simple clean interface.
- Upload your image and get your superhero match.
- Friendly error handling and loading animations.

---

## ⚡ Quick Start

### 1. Run the Backend (Python + Flask)

```bash
git clone https://github.com/your-username/superhero-classifier.git
cd superhero-classifier/backend

# Create a virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install the dependencies
pip install -r requirements.txt

# Start the Flask server
python app.py
```
✅ Server will run at: `http://localhost:5000`

---

### 2. Run the Frontend (Flutter)

```bash
cd superhero-classifier/flutter-app

# Install Flutter dependencies
flutter pub get

# Run the app
flutter run
```
✅ Launch on emulator!

---

## 📡 API Overview

- **POST** `/classify_image`
  - **Body**: `multipart/form-data` with `image`
  - **Response**:
    ```json
    [
      {
        "class": "Tom",
        "class_probability": [95.23, 2.1, 1.5, 1.17],
        "class_dictionary": {
          "Tom Holland(Spiderman)": 0,
          "Gal Gadot(Wonder Woman)": 1,
          "Chris Evans( Captain America)": 2,
          "Chris Hemsworth(Thor)": 3
        }
      }
    ]
    ```

# 🎯 About

Built with ❤️ by **[Your Name]**  
> _Turning superheroes into Machine Learning models — one face at a time!_  

---

# 🎉 Final Note

This project is a fun way to practice:
- Building ML models 🧠
- Deploying a Flask backend 🌐
- Applying real-world Computer Vision 🖼️
- Connecting a mobile app to ML services 📱



---

Would you like me to also show you how to add some **cool GitHub badges** like `Python`, `Flutter`, `Machine Learning`, `OpenCV` at the top of the README? 🚀 (It would make your project look even more professional!)  
Would you also want a **small project poster/banner** you can put on GitHub too? 🎨 (optional)  
Let me know!
