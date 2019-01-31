/*
 * add path of this file in CPATH env variable
 * and include it in your cpp file
 */

#ifdef ONLINE_JUDGE
#define debug false
#else
#define debug true
#endif

#define TP template
#define TN typename
TP<TN T>void show(const T &first){if(!debug)return;dout<<first<<"\n";}
TP<TN T,TN... Args>void show(const T &first,const Args&... args){if(!debug)return;dout<<first;show(args...);}
TP<TN T>void _p(const T &x){signed i=0;for(auto a: x){dout<<a<<",";if(i++ > 20)break;}}
TP<TN T>ostream &operator<<(ostream &os,const vector<T> &x){dout<<"[";_p(x);dout<<"] ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &os,const set<T,U> &x){dout<<"{";_p(x);dout<< "} ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &os,const map<T,U> &x){dout<<"[";_p(x);dout<< "] ";return os;}
TP<TN T,TN U>ostream &operator<<(ostream &o,const pair<T,U> &x){return o<<"("<<x.first<<","<<x.second<<")";}
