#include<bits/stdc++.h>
using namespace std;

// clang-format off
#define int long long
signed _t = 0;// test_case counter
#ifdef SRB
#include <srbdebug.hpp>
#define dout if(true and debug and (_t) ) cerr<<" " // condition can be added here ex: _t == 5
#else
template<class T,class...A>void show(T&&f,A&&...a){f;show(a...);}template<class T>void show(T&&f){f;}
#endif

typedef pair<int,int> pii; typedef vector<int> vi; typedef set<int> si;
template<class A,class B> using pqueue = priority_queue<A,vector<A>,B>;
typedef vector<vi> matrix; // matrix matt(n,vector<int>(m,0));
#define dmatrix(n,m) matrix(n,vector<int>(m,0)) // to define matrix use dmatrix(n,m)
#define substring(i,j) substr(i,(j-i+1)) // both i,j are included
#define all(container) container.begin(),container.end()
template<class T>int sz(T &x){return (int)x.size();}
template<class T,class U>bool found(T t,U u){if(t.find(u)==t.end())return false;return true;}
struct AscPQ{bool operator()(int a,int b){return a>b;}}; // for ascending PQ, does descending by default

const int mod = 1e9+7, inf = ((1LL<<((sizeof mod)*8-2))-1)<<1|1, none = inf/2-9;// inf is self adjustable
int add(int x,int y){int res=(x+y)%mod;return res<0?res+mod:res;}
int mul(int x,int y){int res=(x*1LL*y)%mod;return res<0?res+mod:res;}
int dx[] = {0,1,0,-1,1,1,-1,-1},dy[] = {1,0,-1,0,1,-1,-1,1};// use 0-3 for 4dir 0-7 for 8dir
// clang-format off
