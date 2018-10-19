// code begins here

void solve(){
    //dout << "Case #" << _t << ": " << endl;
    int n;
    cin>>n;
    vector<int> vec(n);
    for(int i=0;i<n;i++){
        cin>>vec[i];
    }
    //show("vec:",vec,"done");
}

signed main(){
    #ifdef ONLINE_JUDGE
    ios_base::sync_with_stdio(0);cin.tie(0);
    #else
    //freopen("input","r",stdin);
    #endif
    int test=1;
    //cin>>test;
    for(int t = 1; t <= test; t++)_t = t,solve();
}
// a code by srbcheema1
