class Dog{
    int[] wetness;
}

int main(){
    Dog a;
    Dog b;
    int c;
    c = ReadInteger();
    a = new Dog;
    a.wetness = NewArray(5, int);
    a.wetness[2] = c;
    Print(a.wetness[2]);
}