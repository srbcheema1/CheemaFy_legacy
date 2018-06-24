#include<bits/stdc++.h>
#define dout if(debug) cout<<" "

using namespace std;

int debug = 1;

typedef unsigned long long int ulli;
typedef unsigned int ui;
typedef pair<int,int> mp;
typedef vector<vector<int> > matrix;

const int mod = 1e9+7;
int fun2(int);

int fun3(int x){
    if(x==0) return 0;
    return 2*x + fun2(x-1);
}

int fun2(int x){
    if(x==0) return 0;
    return x + fun3(x-1);
}

void fun1(int x){
    int y = x+1;
    cout << fun2(y) << endl;
}


signed main(){
    int arr[] = {1,2,3,4,5};
    int hell =  5;
    int sum=0;
    for (int i=0;i<hell;i++){
        sum+=arr[i];
    }
    cout << arr[2] << endl;
    fun1(3);
}
