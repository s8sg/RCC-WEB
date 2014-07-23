package model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;

public class ProcessLoader {

public static ArrayList<String> getProcessList(String uname,String comp)
{
	try{
	FileInputStream file = new FileInputStream( "E:\\Tasklist"+ uname + comp +".rcc" );
    InputStream buffer = new BufferedInputStream( file );
    ObjectInput input = new ObjectInputStream ( buffer );
    try{
    @SuppressWarnings("unchecked")
	ArrayList<String> plist = (ArrayList<String>)input.readObject();
    return plist;
    }
    finally{
        input.close();
    }
	}catch(Exception e){System.out.println(e);}
	return null;
}

public static boolean writeKillProcessList(ArrayList<String> plist,String uname,String comp)
{
	try
	{
		File file = new File("E:\\KPlist"+ uname + comp +".rcc");
		if(file != null)
		{
			if(file.delete()){
				System.out.println("Old " + file.getName() + " is deleted!");
			}else{
				System.out.println("Delete operation is failed in writeKillProcessList.");
			}
		}
		
		FileOutputStream fout = new FileOutputStream("E:\\KPlist"+ uname + comp +".rcc");
		System.out.println("new E:\\KPlist"+ uname + comp +".rcc is created for RMI server use!");
		OutputStream buffer = new BufferedOutputStream( fout );
		ObjectOutput output = new ObjectOutputStream( buffer );
 	
		try{
			output.writeObject(plist);
		}
		finally{
			output.close();
		}
		return true;
	}catch(Exception e){e.printStackTrace();return false;}
}

public static boolean writeNewProcessList(ArrayList<String> plist,String uname, String comp) {
	// TODO Auto-generated method stub
	try
	{
		File file = new File("E:\\NPlist"+ uname + comp +".rcc");
		if(file != null)
		{
			if(file.delete()){
				System.out.println("Old " + file.getName() + " is deleted!");
			}else{
				System.out.println("Delete operation is failed in writeNewProcessList.");
			}
		}
		
		FileOutputStream fout = new FileOutputStream("E:\\NPlist"+ uname + comp +".rcc");
		System.out.println("new E:\\NPlist"+ uname + comp +".rcc is created for RMI server use!");
		OutputStream buffer = new BufferedOutputStream( fout );
		ObjectOutput output = new ObjectOutputStream( buffer );
 	
		try{
			output.writeObject(plist);
		}
		finally{
			output.close();
		}
		return true;
	}catch(Exception e){e.printStackTrace();return false;}
}


}
