import scipy.io as sio
import numpy as np

from sklearn.model_selection import train_test_split

data = sio.loadmat("AMR_dataset.mat")

print(data.keys())
X = data["X"]
Y = data["Y"]

print("X shape:", X.shape)
print("Y shape:", Y.shape)# stored in form of numpy array 
print(Y[:5])
Y = Y.flatten() # numpy array is converted into python list so dtype is not used for python list
Y = [str(y) for y in Y]

print(Y[:5])
#preprocessing the data
print("X dtype:", X.dtype)
print("y type:",type(Y))

print("NaN in X:", np.isnan(X).sum())
print("Inf in X:", np.isinf(X).sum())

#label encoding
from sklearn.preprocessing import LabelEncoder
label_encoder=LabelEncoder()
Y_encoded = label_encoder.fit_transform(Y)

print(label_encoder.classes_)
print(Y_encoded[:5])
print(Y_encoded[90:103])
#splitting dataset
X_train, X_test, y_train, y_test = train_test_split(
    X,
    Y_encoded,
    test_size=0.2,
    random_state=42,
    stratify=Y_encoded
)

# we need to standarise the dataset
from sklearn.preprocessing import StandardScaler
scaler=StandardScaler()
X_train=scaler.fit_transform(X_train)#x_train data is fit into scaler it calculates mean and standard deviation from point
#then subtract mean from that point divided by standard deviation
X_test=scaler.transform(X_test)# testing data is not feed into scaler as it will cause leakage
print("X_train:", X_train.shape)
print("X_test:", X_test.shape)
print("y_train:", y_train.shape)
print("y_test:", y_test.shape)