#include<bits/stdc++.h>

#define lc(n) ((n)<<1)
#define rc(n) ((n)<<1|1)

#define modu(a) (((a%mod)+mod)%mod)

#define dout if(debugg) shift(),cout<<" "
#define show(x) if(debugg) shift(),cout<<#x<<" := "<<x<<endl;

   /* * * * * * * * * * * * * * * * * * * * * * * *
    *                                             *
    *            _/_/_/            _/             *
    *         _/        _/  _/_/  _/_/_/          *
    *          _/_/    _/_/      _/    _/         *
    *             _/  _/        _/    _/          *
    *      _/_/_/    _/        _/_/_/             *
    *                                             *
    * * * * * * * * * * * * * * * * * * * * * * * */

using namespace std;

typedef unsigned long long int ulli;
typedef unsigned int ui;
typedef pair<int,int> mp;
typedef vector<vector<int> > matrix;

int dx[] = {0,0,1,-1};
int dy[] = {1,-1,0,0};
const int mod = 1e9+7;

int debugg = 0;

int ss=0;
void shift(){
    if(debugg)
        for(int i=0;i<ss;i++)
            cout<<".";
}

void solve(){

}
signed main(){
    int t=1;
    ios_base::sync_with_stdio(0);cin.tie(0);
    cin>>t;
    while(t--)solve();
}
// a code by srbcheema1
