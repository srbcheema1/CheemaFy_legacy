#include <bits/stdc++.h>
using namespace std;

// clang-format off
#define int long long
#define endl "\n";cout.flush()
#define dout if(debug and (_t) ) cerr<<" " // condition can be added here ex: _t == 5
#ifdef ONLINE_JUDGE
#define debug false
#else // change this one
#define debug true
#endif
int _t = 0;// test_case counter

#define TP template
#define TN typename
TP<TN T>void show(const T &first){if(!debug)return;dout<<first<<"\n";}
TP<TN T,TN... Args>void show(const T &first,const Args&... args){if(!debug)return;dout<<first;show(args...);}
#define trace(...) _s(#__VA_ARGS__, __VA_ARGS__)
TP<TN T>void _s(const char* c,const T& first){if(!debug)return;dout<<c<<" : "<<first<<"\n";}
TP<TN T,TN... Args>void _s(const char *c,const T &first,const Args&... args)
{if(!debug)return;const char* t=strchr(c+1,',');dout;cerr.write(c,t-c)<<" : "<<first<< " |";_s(t+1,args...);}
TP<TN T>void _p(const T &x){signed i=0;for(auto a: x){dout<<a<<",";if(i++ > 20)break;}}
TP<TN T>ostream &operator<<(ostream &os,const vector<T> &x){dout<<"[";_p(x);dout<<"] ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &os,const set<T,U> &x){dout<<"{";_p(x);dout<< "} ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &os,const map<T,U> &x){dout<<"[";_p(x);dout<< "] ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &o,const pair<T,U> &x){return o<<"("<<x.first<<","<<x.second<<")";}

typedef pair<int,int> pii; typedef vector<int> vi; typedef set<int> si;
template<class A,class B> using umap = unordered_map<A,B>;
template<class A,class B> using pqueue = priority_queue<A,vector<A>,B>;
typedef vector<vi> matrix; // matrix matt(n,vector<int>(m,0));
#define dmatrix(n,m) matrix(n,vector<int>(m,0)) // to define matrix use dmatrix(n,m)
#define substring(i,j) substr(i,(j-i+1)) // both i,j are included
#define all(container) container.begin(),container.end()
#define FF first
#define SS second
template<class T>int sz(T &x){return (int)x.size();}
template<class T,class U>bool found(T t,U u){if(t.find(u)==t.end())return false;return true;}
struct AscPQ{bool operator()(int a,int b){return a>b;}}; // for ascending PQ, does descending by default

const int mod = 1e9+7, inf = ((1LL<<((sizeof mod)*8-2))-1)<<1|1, none = inf/2-9;// inf is self adjustable
int add(int x,int y){int res=(x+y)%mod;return res<0?res+mod:res;}
int mul(int x,int y){int res=(x*1LL*y)%mod;return res<0?res+mod:res;}
int dx[] = {0,1,0,-1,1,1,-1,-1},dy[] = {1,0,-1,0,1,-1,-1,1};// use 0-3 for 4dir 0-7 for 8dir
// clang-format off

