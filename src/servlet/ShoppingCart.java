package servlet;

import java.util.ArrayList;
import java.util.Arrays;

public class ShoppingCart {
   
	public static void main(String[] args) 
    {
        ArrayList<String> namesList = new ArrayList<String>(Arrays.asList( "alex", "brian", "charles") );
         
        System.out.println(namesList);  //list size is 3
         
        //Add element at 0 index
        namesList.add(0, "Lokesh");
         
        System.out.println(namesList);  //list size is 4
    }
}


