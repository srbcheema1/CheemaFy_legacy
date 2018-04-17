import pickle
import os

class data_bank:
    def __init__(self,file_name="temp"):
        file_name = "."+file_name+"_bank"
        self.file_name = file_name
        if not os.path.exists(file_name):
            fout = open(file_name,'wb')
            self.data = dict()
            pickle.dump(self.data,fout)
            fout.close()
        self.load()

    def load(self):
        self.data = pickle.load(open(self.file_name,'rb'))
        return self.data

    def __getitem__(self,index):
        if(index in self.data):
            return self.data[index]
        else:
            return False

    def __setitem__(self,index,value):
        self.data[index]=value
        self.save()

    def __delitem__(self,index):
        del self.data[index]
        self.save()

    def __contains__(self,value):
        return value in self.data

    def get(self):
       return True

    def save(self):
        pickle.dump(self.data,open(self.file_name,'wb'))

