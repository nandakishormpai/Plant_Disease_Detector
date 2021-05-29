# Plant 🌱 Disease 🐛 Detector 🔎


## Link to product walkthrough

### Watch the video by clicking image below

<a href="https://drive.google.com/file/d/1cteVX54vOSFa_IBLUTDD8D-Gv_Gbrxrs/view?usp=sharing"   title="Product Walkthrough" target="_blank" ><img src="https://github.com/nandakishormpai2001/manglish_lyrics_generator/blob/frontend/images/walk.jpg" alt="Product Walkthrough" /></a>

## Download Product Apk [here](https://drive.google.com/file/d/1OldNeNr5KRfFX5G56689_fnSCuSGvTCM/view?usp=sharing)

## Machine Learning Model

Multi-Class Image classifier Built on PyTorch framework using CNN architecture. Currently Project Detects 17 States of disease in 4 plants ( Aiming Kerala State ) namely Cherry, Pepper, Potato and tomato.

* Framework : PyTorch
* Architecture : Convolutional Neural Networks



#### How to train

Upload the [Python notebook](https://github.com/nandakishormpai2001/Plant_Disease_Detector/blob/main/model/Plant_Disease_Identifier.ipynb) to Google Colab and run each cell for training the model. I have included a demo dataset to configure quickly. You can use this [Kaggle Dataset](https://www.kaggle.com/vipoooool/new-plant-diseases-dataset) which is the original one with huge amount of pictures.

#### How It Works

The input image dataset is converted to tensors and is passed through a CNN model, returning a output value corresponding to the plant disease. Input image tensor is passed through four convolutional layers and then flattened and inputted to fully connected layers.

## API

API is built using Flask framework and hosted in Heroku. The API provides two functionalities, they are

- Plant Disease Detection

    Accepts a POST request with an image in the form of base64 string and returns plant, disease and remedy.
    
- Notification
    
    Accepts a POST request with plant, user and disease , which is then pushed as a notification to other users to warn them regarding a probable outbreak of disease.
    

#### How to use

API has been built on this classifier. URL = "https://plant-disease-detector-pytorch.herokuapp.com/"

User has to send a POST request to the given api with Base64 string of the Image to be input. 

```python
import requests
url = "https://plant-disease-detector-pytorch.herokuapp.com/"
#imgdata = base64 string of image
r = requests.post(url,json = {"image":imgdata})
print(r.text.strip())
```
Output
```python
'{"disease":"Septoria leaf spot","plant":"Tomato","remedy":"Remove infected leaves immediately,......Fungonil and Daconil)."}'
```

## App

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

<td align="center"><a href="https://github.com/nandakishormpai2001%22%3E"><img src="https://avatars.githubusercontent.com/u/57388834?v=4" width="180px;" alt=""/><br /><sub><b>Nanda Kishor M Pai<br />ML Model, API</b></sub></a><br />

  <td align="center"><a href="https://github.com/AJAYK-01%22%3E"><img src="https://avatars.githubusercontent.com/u/55079486?v=4" width="180px;" alt=""/><br /><sub><b>Ajay Krishna K V<br /> Flutter Dev, API</b></sub></a><br />

  <td align="center"><a href="https://github.com/Harikrishnan6336%22%3E"><img src="https://avatars.githubusercontent.com/u/53964426?v=4" width="180px;" alt=""/><br /><sub><b>Hari Krishnan U<br />ML model, Data collection</b></sub></a><br />

<td align="center"><a href="https://github.com/AntonySJohn%22%3E"><img src="https://media-exp1.licdn.com/dms/image/C5603AQEh8as-rR4xog/profile-displayphoto-shrink_400_400/0/1605618124497?e=1627516800&v=beta&t=v85thHTJrum9u8HKhtKJkpPrY5YtdQYQoqrVYP6iyzk" width="180px;" alt=""/><br /><sub><b>Antony S John<br />Flutter Dev</b></sub></a><br />

</tr>
</table>
