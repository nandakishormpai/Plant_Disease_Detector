from PIL import Image
import torch
from torchvision.transforms import ToTensor
import torchvision.transforms as transforms

import torch.nn as nn
import torch.nn.functional as F
import pickle
import base64
import io

# Model class to define the architecture
class Network(nn.Module):
    def __init__(self):
        super(Network,self).__init__()
        self.conv1= nn.Conv2d(in_channels=3,out_channels=6,kernel_size=5)
        self.conv2= nn.Conv2d(in_channels=6,out_channels=12,kernel_size=5)
        
        
        self.fc1 = nn.Linear(in_features=12*61*61,out_features=120)
        self.fc2 = nn.Linear(in_features=120,out_features=60)
        self.out = nn.Linear(in_features=60,out_features=17)
        
        
    def forward(self,t):
        t = t
        
        t=self.conv1(t)
        t=F.relu(t)
        t=F.max_pool2d(t,kernel_size = 2, stride = 2)
        
        
        t=self.conv2(t)
        t=F.relu(t)
        t=F.max_pool2d(t,kernel_size = 2, stride = 2)
        
        t=t.reshape(-1,12*61*61)
        t=self.fc1(t)
        t=F.relu(t)
        
        
        t=self.fc2(t)
        t=F.relu(t)
        
        t=self.out(t)
        
        
        return t

# to avoid gradients update
@torch.no_grad()
def predict_plant(model,imgdata):
    with open('model_files/labels.json', 'rb') as lb:
        labels = pickle.load(lb)

    loaded_model = model
    loaded_model.load_state_dict(torch.load("model_files/model.pth"))
    loaded_model.eval()

    image = Image.open(io.BytesIO(imgdata))
    resize = transforms.Compose([transforms.Resize((256,256))])
    image = ToTensor()(image)
    print(resize(image).unsqueeze(0).size())
    y_result = model(resize(image).unsqueeze(0))
    result_idx = y_result.argmax(dim=1)
    for key,value in labels.items():
        if(value==result_idx):
            return key

if __name__ == "__main__":
    model = Network()
    test = input("Enter image base64")
    imgdata = base64.b64decode(test)
    print(type(imgdata))
    plant = predict_plant(model,imgdata)
    print(plant)
