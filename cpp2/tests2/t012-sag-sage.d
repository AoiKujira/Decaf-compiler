class Dog{
    int[] wetness;

    int return_thing(int ind){
        return this.wetness[ind];
    }
}

class Wet{
    int[] dogness;
}
int main(){
    Dog a;
    Wet b;
    int c;
    c = ReadInteger();
    a = new Dog;
    b = new Wet;
    a.wetness = NewArray(5, int);
    a.wetness[2] = c;
    b.dogness = NewArray(10, int);
    b.dogness[a.return_thing(2)] = 89;
    Print(b.dogness[a.wetness[2]]);
}