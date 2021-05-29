# Plant 🌱 Disease 🐛 Detector 🔎

Image classifier Built on PyTorch framework using CNN architecture. Currently Project Detects 17 States of disease in 4 plants ( Aiming Kerala State ) namely Cherry, Pepper, Potato and tomato. 

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

#### How to train

Upload the [Python notebook](https://github.com/nandakishormpai2001/Plant_Disease_Detector/blob/main/model/Plant_Disease_Identifier.ipynb) to Google Colab and run each cell for training the model. I have included a demo dataset to configure quickly. You can use this [Kaggle Dataset](https://www.kaggle.com/vipoooool/new-plant-diseases-dataset) which is the original one with huge amount of pictures.

<table>
  <tr>

<td align="center"><a href="https://github.com/nandakishormpai2001%22%3E><img src="https://avatars.githubusercontent.com/u/57388834?v=4" width="180px;" alt=""/><br /><sub><b>Nanda Kishor M Pai<br />ML Model, Data collection</b></sub></a><br />

  <td align="center"><a href="https://github.com/AJAYK-01%22%3E><img src="https://avatars.githubusercontent.com/u/55079486?v=4" width="180px;" alt=""/><br /><sub><b>Ajay Krishna K V<br /> Flutter Dev</b></sub></a><br />

  <td align="center"><a href="https://github.com/Harikrishnan6336%22%3E><img src="https://avatars.githubusercontent.com/u/53964426?v=4" width="180px;" alt=""/><br /><sub><b>Hari Krishnan U<br />ML model, Data collection</b></sub></a><br />

<td align="center"><a href="https://github.com/AntonySJohn%22%3E><img src="https://media-exp1.licdn.com/dms/image/C5603AQEh8as-rR4xog/profile-displayphoto-shrink_400_400/0/1605618124497?e=1627516800&v=beta&t=v85thHTJrum9u8HKhtKJkpPrY5YtdQYQoqrVYP6iyzk" width="180px;" alt=""/><br /><sub><b>Antony S John<br />Flutter Dev</b></sub></a><br />

</tr>
</table>
