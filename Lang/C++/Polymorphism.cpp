#include <iostream>

class Animal
{
    public:
    virtual void print()
    {
        std::cout << "This is an animal." << std::endl;
    }
};

class Dog:public Animal
{
    public:
    void print()
    {
        std::cout << "This is a dog." << std::endl;
    }
};

class Spot:public Dog
{
    public:
    void print()
    {
        std::cout << "THis is a spot." << std::endl;
    }
};

int main()
{

    Animal* dog = new Dog;
    Animal* spot = new Spot;

    dog->print();
    spot->print();

    return 0;
}