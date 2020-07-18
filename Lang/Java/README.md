JAVA


**Java_Ternary Conditional Operator**

String name = "Jessie";

int i = name.equals("Jessie") ? 1 : 3;

//If true, i = 1. If false, i = 3.



**ava_Continue**

//Different from *break* that let the program jump out of a loop, *continue* will skip the code after 
it in the current loop and then enter the next time of the loop.



**Java_toString() and deepToString()**

Array a = {1,2,3,4,4,5,6,7,4,3,2,3};

System.out.println(a);

//You'll get the address of a.

System.out.println(Array.toString(a));

//{1,2,3,4,4,5,6,7,4,3,2,3}

Array b = {{1,2,3,4},{4,5,6,7,4,3,2,3}};

System.out.println(Array.deepToString(b));

System.out.println(Array.toString(b));

//{1,2,3,4},{4,5,6,7,4,3,2,3}

//You'll get two addresses of the inner arraies.




**Java_sort() and parallelSort()**

int[] grades = {4,3,7,6,1,5,2};

Array.sort(grades);

System.out.println(Array.toString(grades));

//{1,2,3,4,5,6,7}



**Java_Array.equals(a, b) .fill(a, value) .asList(a)**

int[] grades1 = {1,2,3,4,123};

int[] grades2 = {1,2,3,4,123};

System.out.println(grades1 + " " + grades2);

if(grades1 == grades2) {

    System.out.println("1");

}

if(grades1.equals(grades2)) {

    System.out.println("2");

}

if(Array.equals(grades1, grades2)) {

    System.out.println("3");

}

// [I@3764951d [I@4b1210ee

//3

//The first two are comparing the addresses, seeing if they are the same array.

//Also we have Array.deepEquals() to deal with the nested array.

//.fill(a, val) fill every index of the array a with the val.

//.asList(a) returns a list.


**Notice**

Do not create a temp object to carry data from one array to another since the temp will point to the 
same object in the heap, and you are just changing the instances in the same object. So you'll get an 
array with elements that are all the same.


Create a Helper.tempLoader() to create the intermediate because it will create different objects in 
the heap, and the temporary intermediate will pass these different objects to the pointers in the 
array.

Plz see "Issue of moving data from one array to another"

// Why every element in the array list is the last one, which is the card object when i = 0.

public static ArrayList initialization() {

String[] firstName = {"Kyle","Cory","Tanner","Jordan","Jesse"};

String[] lastName = {"Bustami","Chambers","Douglas","Jones","Pecar"};

String[] cardNum = {"123456789","135792468","019283746","675849302","347821904"};

String[] pin = {"1111","2097","6194","0071","9871"};

float[] checking = {500,100,1500,50,150};

float[] saving = {200,700,2500,-1,250};

int[] counter = {2,3,5,0,1};

System.out.print("The size of database is: ");

Card.setTotalCards(Integer.parseInt(Helper.input()));

ArrayList cardDB = new ArrayList<>();

Card tempCard = new Card();

for (int i = 0; i < Card.getTotalCards(); i++) {

tempCard.setFirstName(firstName[i]);

tempCard.setLastName(lastName[i]);

tempCard.setCardNum(cardNum[i]);

tempCard.setPin(pin[i]);

tempCard.setChecking(checking[i]);

tempCard.setSaving(saving[i]);

tempCard.setCounter(counter[i]);

cardDB.add(tempCard);

}

return cardDB;

}











**Notice**

When you want to use a condition like the following:

while (string.equals(null))

You'll get an error.

If the string is null, then it points to nothing. Thus, it cannot call the equals() method under 
Object class.

Please revise it as:

while(string == null)


