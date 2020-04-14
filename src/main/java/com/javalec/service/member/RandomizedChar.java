package com.javalec.service.member;

import java.util.Random;

public class RandomizedChar {
	private static final int certCharLength = 10;
    private static final char[] characterTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
                                            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
                                            'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
                                            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                                            'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                                            'y', 'z'};
    
    public static String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        int tablelength = characterTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < certCharLength; i++) {
            buf.append(characterTable[random.nextInt(tablelength)]);
        }
        return buf.toString();
    }
    
}
