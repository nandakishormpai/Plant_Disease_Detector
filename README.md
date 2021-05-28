# Plant 🌱 Disease 🐛 Detector 🔎

Image classifier Built on PyTorch framework on using architecture. Currently Project Detects 17 States of disease in 4 plants ( Aiming Kerala State ) namely Cherry, Pepper, Potato and tomato. 

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
'{"disease":"Early blight","plant":"Potato"}'
```

#### How to train

Upload the [Python notebook](https://github.com/nandakishormpai2001/Plant_Disease_Detector/blob/main/Plant_Disease_Identifier.ipynb) to Google Colab and run each cell for training the model. I have included a demo dataset to configure quickly. You can use this [Kaggle Dataset](https://www.kaggle.com/vipoooool/new-plant-diseases-dataset) which is the original one with huge amount of pictures.
