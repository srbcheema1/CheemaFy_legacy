#include<bits/stdc++.h>

#define derr(debug_input) cerr<<"\tLINE "<<__LINE__<<": "<<#debug_input<<" -> "<<debug_input<<"\n"
#define endl "\n"

using namespace std;

typedef unsigned long long ull;
typedef long long ll;
typedef pair<int,int> mp;
typedef vector<vector<int>> matrix;

template<class T>
bool scomp(const T &a,const T &b){
    return a<b;
}

const ll mod=1e9+7;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void run_for_test(){
}


int main(){
    ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    int _t=1;
    cin>>_t;
    int T=_t;
     derr("hello world "<<_t);
    while(_t--){
        cout<<"Case #"<<T-_t<<": ";
        run_for_test();
    }
    return 0;
}
