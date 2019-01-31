#include <bits/stdc++.h>
using namespace std;

// clang-format off
#define int long long
#define dout if(debug and (debug_test == 0 or _t == debug_test) ) cerr<<" "
#define endl "\n";cout.flush()
#ifdef ONLINE_JUDGE
#define DEBUG 0.0
#else
#define DEBUG 1
#endif
int debug = DEBUG;// it will take care of itself on online-judge
int debug_test = 0; // test_case to be debugged ... 0 means all ... -1 means none
int _t = 0;// test_case counter

typedef unsigned long long ulli;// rarely will be used
typedef pair<int,int> pii;
typedef vector<int> vi;
typedef set<int> si;
template<class A,class B> using umap = unordered_map<A,B>;
template<class A,class B> using pqueue = priority_queue<A,vector<A>,B>;
typedef vector<vector<int>> matrix; // matrix matt(n,vector<int>(m,0));
#define dmatrix(n,m) matrix(n,vector<int>(m,0)) // to define matrix use dmatrix(n,m)
#define substring(i,j) substr(i,(j-i+1)) // both i,j are included
#define all(container) container.begin(),container.end()
#define FF first
#define SS second

#define TP template
//TP<class T>void show(T &first){if(!debug)return;dout<<"SS "<<first<<"\n";}
//TP<class T,class... Args>void show(T &first,Args&... args){if(!debug)return;dout<<"SS "<<first;show(args...);}
TP<class T>void show(const T &first){if(!debug)return;dout<<"DD "<<first<<"\n";}
TP<class T,class... Args>void show(const T &first,const Args&... args){if(!debug)return;dout<<"DD "<<first;show(args...);}

TP<class T>void _p(const T &x){;int i=0;for(auto a: x){dout<<a<<",";if(i++ > 20)break;}}
TP<class T>ostream &operator<<(ostream &os,const vector<T> &x){dout<<"[";_p(x);dout<<"] ";return os;}
TP<class T>ostream &operator<<(ostream &os,const set<T> &x){dout<<"{";_p(x);dout<< "} ";return os;}
TP<class T>ostream &operator<<(ostream &os,const multiset<T> &x){dout<<"{";_p(x);dout<< "} ";return os;}
TP<class T,class U>ostream &operator<<(ostream &o,const pair<T,U> &x){return o<<"("<<x.FF<<","<<x.SS<<")";}
TP<class T,class U>ostream &operator<<(ostream &os,const map<T,U> &x){dout<<"[";_p(x);dout<< "] ";return os;}

TP<class T>int sz(T &x){return (int)x.size();}
TP<class T>bool sort_fun(T a,T b){return a>b;} // for desc sort // default sort is asc, use <() fxn
TP<class T,class U>bool found(T t,U u){if(t.find(u)==t.end())return false;return true;}
struct Desc{bool operator()(int a,int b){return a>b;}}desc; // for descending sort
struct AscPQ{bool operator()(int a,int b){return a>b;}}; // for ascending PQ, does descending by default

const int mod = 1e9+7, inf = ((1LL<<((sizeof mod)*8-2))-1)<<1|1, none = inf/2-9;// inf is self adjustable
int add(int x,int y){int res=(x+y)%mod;return res<0?res+mod:res;}
int mul(int x,int y){int res=(x*1LL*y)%mod;return res<0?res+mod:res;}
int dx[] = {0,1,0,-1,1,1,-1,-1},dy[] = {1,0,-1,0,1,-1,-1,1};// use 0-3 for 4dir 0-7 for 8dir
// clang-format off

// code begins here


void solve()
{
    set<int> ha{1,3};
    show(ha);
    show("hello");
    show("hello",ha);
    show("hello","done",ha);
    show("hello",1);
    show("hello",1,ha);
    show("hello",1,ha,1);
    show(1,ha);
    show(1,pii(1,1));
    /*
     * rvalues can't be passed to fun(type & parm)
     * lvalues and rvalues both can be passed to fun(const type & parm)
     * https://stackoverflow.com/questions/1565600/how-come-a-non-const-reference-cannot-bind-to-a-temporary-object
     */
}

void preprocess()
{

}

signed main()
{
    #ifdef ONLINE_JUDGE
    ios_base::sync_with_stdio(0);cin.tie(0);
    #else
    //freopen("Input.txt","r",stdin);
    #endif
    std::cout << std::fixed; std::cout.precision(7);
    preprocess();
    int test=1;
    //cin>>test;
    for(int t = 1; t <= test; t++)_t = t,solve();
}
// a code by srbcheema1

// https://codeforces.com/contest/527/problem/C
