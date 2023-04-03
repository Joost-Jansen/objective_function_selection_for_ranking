import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
import os

def getPercentageOfData(file, percentage):
    df = pd.read_csv(file)
    df = df.sample(frac=1).reset_index(drop=True)
    if "test" in file or percentage == 0:
        return df, df
    df_train, df_test = train_test_split(df, test_size=percentage)
    return df_train, df_test



if __name__ == "__main__":
    folders = ["datasets/MQ2008/Fold1", "datasets/MSLR-WEB10K/Fold1"]
    files = ["test.txt", "train.txt", "vali.txt"]
    percentages = [0.2, 0.4, 0.6, 0.8, 1.0]

    for folder in folders:
        for percentage in percentages:
            if not os.path.exists(folder+ "_percentage_" + str(int(percentage*100))):
                os.mkdir(folder+ "_percentage_" + str(int(percentage*100)))
            for file in files:
                df_train, df_test = getPercentageOfData(folder + "/" + file, (1-percentage))
                df_train.to_csv(folder+ "_percentage_" + str(int(percentage*100)) +  "/" + file , index=False)
