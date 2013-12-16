package jong;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;

import org.json.simple.JSONArray;
//주문내역을 저장하기 위한 클래스
public class FileJson{
	static String filePath;
	String selllist;
	static FileWriter fw = null;
	// 파일에 주문내역 기록

	public static void writeFileIO(JSONArray mainarr){
		filePath = "/Users/choijohnghoon/autumnmill-server/dbtest/WebContent/at1/JSONFile.json";
		
		File f1 = new File(filePath);
		
		try {
			// 파일이 존재하지 않을시 생성하여 인덱스 1부터 주문내역 기록
			if(!f1.exists())
			{
				 
				fw = new FileWriter(f1);
				System.out.println("파일생성 : "+f1);
				fw.write(mainarr.toString());
				fw.close();
			}
			// 파일이 존재하면 추가적으로 주문내역 저장
			else
			{
				System.out.println("파일존재");
				fw = new FileWriter(f1);
				fw.write(mainarr.toString());
				fw.close();
			}	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

