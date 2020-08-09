class Dog{
    int[] wetness;
    int thesaga;

    int return_thing(int ind){
        return this.wetness[ind];
    }
}

class Wet{
    Dog[] dogness;
    int wetdog;

    int getwetdog(){
        return this.wetdog;
    }
}
int main(){
    Dog a;
    Wet b;
    int c;
    c = ReadInteger();
    a = new Dog;
    b = new Wet;
    a.wetness = NewArray(5, int);
    a.thesaga = 56;
    a.wetness[c] = 5;
    b.dogness = NewArray(10, Dog);
    b.wetdog = 2;
    b.dogness[5] = a;
    //Print(b.dogness[a.return_thing(b.getwetdog())].thesaga);
    Print(a.thesaga);
    //Print(a.return_thing(b.getwetdog()));
    //Print(b.dogness[5]);
    //Print(b.dogness[5].thesaga);
    //Print(a.thesaga);

}