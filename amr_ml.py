import scipy.io as sio

data = sio.loadmat("AMR_dataset.mat")

print(data.keys())
X = data["X"]
Y = data["Y"]

print("X shape:", X.shape)
print("Y shape:", Y.shape)
print(Y[:5])
Y = Y.flatten()
Y = [str(y) for y in Y]

print(Y[:5])