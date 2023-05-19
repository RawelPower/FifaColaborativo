package Fifa;

import Fifa.Carta;

public class backgroundColors {

	public Carta  bgColor(int num) {
		String bgRed= "background-color: red; color: white";
		String bgOrange= "background-color: orange; color: white";
		String bgYellow= "background-color: yellow; color: black";
		String bgGreen= "background-color: green; color: white";
		String bgDarkGreen= "background-color: darkgreen; color: white";
		 if(num>0&&num<50) {
			System.out.println(bgRed);
		 }else if(num>=50&& num<60) {
			 System.out.println(bgOrange);
		 }else if(num>=60&& num<70) {
			 System.out.println(bgYellow);
		 }else if(num>=70&& num<90) {
			 System.out.println(bgGreen);
		 }else if(num>=90&& num<100) {
			 System.out.println(bgDarkGreen);
		 }
		 return null;
	}
}
