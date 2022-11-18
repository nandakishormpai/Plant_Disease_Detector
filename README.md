# SUSya - Plant 🌱 Disease 🐛 Detector 🔎

ML Powered App to assist farmers in crop disease detection and alerts.

## Product Walkthrough


https://user-images.githubusercontent.com/57388834/120083080-fd9d8480-c0e3-11eb-9f9e-0a3f114f6d78.mp4



## Download Product Apk **[here](https://drive.google.com/file/d/1OldNeNr5KRfFX5G56689_fnSCuSGvTCM/view?usp=sharing)**
## Machine Learning **[Python Notebook](https://github.com/nandakishormpai2001/Plant_Disease_Detector/blob/main/model/Plant_Disease_Identifier.ipynb)**

## Solutions

#### System to detect the problem when it arises and warn the farmers.

Disease Detection using Machine Learning Model enabled through Android [app](https://drive.google.com/file/d/1OldNeNr5KRfFX5G56689_fnSCuSGvTCM/view?usp=sharing) which uses Flask API.

#### Solution to overcome the problem once it arises.

Remedy is suggested for the disease detected by the app using ML model.

#### Solution that will ensure that the problem will never occur in the future again

PDF report is generated on the disease predicted along with User Information. PDF can be used as a document to be submitted in nearby Krishibhavan thereby seeking help easily.

#### Method that will reduce the impact of the dilemma to a significant level

Disease detected news can be sent to other users as a notification which contatins User,plant and disease. This will help other farmers take up precautions thereby reducing the impact of the dilemma to a significant level considering a region.


## Machine Learning Model

Multi-Class Image classifier Built on PyTorch framework using CNN architecture. Currently Project Detects 17 States of disease in 4 plants ( Aiming Kerala State ) namely Cherry, Pepper, Potato and tomato.

* Framework : PyTorch
* Architecture : Convolutional Neural Networks
* Validation Accuracy : 77.7%



#### How to train

Upload the **[Python notebook](https://github.com/nandakishormpai2001/Plant_Disease_Detector/blob/main/model/Plant_Disease_Identifier.ipynb)** to Google Colab and run each cell for training the model. I have included a demo dataset to configure quickly. You can use this **[Kaggle Dataset](https://www.kaggle.com/vipoooool/new-plant-diseases-dataset)** which is the original one with huge amount of pictures.

#### How It Works

The input image dataset is converted to tensor and is passed through a CNN model, returning an output value corresponding to the plant disease. Input image tensor is passed through four convolutional layers and then flattened and inputted to fully connected layers.

## API

API is built using Flask framework and hosted in Render. The API provides two functionalities, they are

- Plant Disease Detection

    Accepts a POST request with an image in the form of base64 string and returns plant, disease and remedy.
    
- Notification
    
    Accepts a POST request with plant, user and disease , which is then pushed as a notification to other users to warn them regarding a probable outbreak of disease.
    

#### How to use

API has been built on this classifier. URL = "https://susya.onrender.com"

User has to send a POST request to the given api with Base64 string of the Image to be input. 

```python
import requests
url = "https://susya.onrender.com"
#imgdata = base64 string of image
r = requests.post(url,json = {"image":imgdata})
print(r.text.strip())
```
Output
```python
'{"disease":"Septoria leaf spot","plant":"Tomato","remedy":"Remove infected leaves immediately,......Fungonil and Daconil)."}'
```

## App

#### Download Product Apk **[here](https://drive.google.com/file/d/1OldNeNr5KRfFX5G56689_fnSCuSGvTCM/view?usp=sharing)**

#### To Run App

```shell
$ cd app
$ flutter run
```

#### To Build App

```shell
$ cd app 
$ flutter build apk
```

#### Features

- Authentication using Google OAuth
- User Profile page
- Uses camera or device media to get an image of the crop
- Preview the image and sends it to API, for disease detection
- Result page showing detected disease and remedy
- Generates a PDF report to save/share predicted disease details
- Option to send the generated result as a notification warning to other users


## Tech Stack Used

- Python
- PyTorch
- Flask
- Flutter
- Firebase


## Contributors

<table>
  <tr>

<td align="center"><a href="https://github.com/nandakishormpai"><img src="https://avatars.githubusercontent.com/u/57388834?v=4" width="180px;" alt=""/><br /><sub><b>Nanda Kishor M Pai<br />ML Model, API</b></sub></a><br />

  <td align="center"><a href="https://github.com/AJAYK-01"><img src="https://avatars.githubusercontent.com/u/55079486?v=4" width="180px;" alt=""/><br /><sub><b>Ajay Krishna K V<br /> Flutter Dev, API</b></sub></a><br />

  <td align="center"><a href="https://github.com/Harikrishnan6336"><img src="https://avatars.githubusercontent.com/u/53964426?v=4" width="180px;" alt=""/><br /><sub><b>Hari Krishnan U<br />ML model, Data collection</b></sub></a><br />

<td align="center"><a href="https://github.com/AntonySJohn"><img src="https://avatars.githubusercontent.com/u/57054372?v=4" width="180px;" alt=""/><br /><sub><b>Antony S John<br />Flutter Dev</b></sub></a><br />

</tr>
</table>
