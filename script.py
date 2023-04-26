import pandas as pd
import numpy as np
import config
import datetime as dt


def readExcelFile(sheet_index=0):
    try:
        df = pd.read_excel(config.filename, sheet_name=config.sheetNames[sheet_index])
        print(df)
    except Exception as e:
        print(e)
        return


'''
def runRscript():
   '''


def main():
    readExcelFile()


if __name__ == "__main__":
    main()
