package com.cczu.sys.comm.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ConnectException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

/**
 * word转PDF转swf
 * 
 * @author Administrator
 * 
 */
public class wordToPDF {

	// word转PDF
	public static void WordToPDF(String docfile, String pdf2File) {
	/**	jacob Word转PDF
        ActiveXComponent app = new ActiveXComponent("Word.Application"); // 启动word    
        try {    
            app.setProperty("Visible", new Variant(false));    
            Dispatch docs = app.getProperty("Documents").toDispatch();    
            Dispatch doc = Dispatch.invoke(    
                    docs,    
                    "Open",    
                    Dispatch.Method,    
                    new Object[] { docfile, new Variant(false),    
                            new Variant(true) }, new int[1]).toDispatch();    
          //new Variant(type)，这里面的type的决定另存为什么类型的文件  
            Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {    
                    toFile, new Variant(type) }, new int[1]);    
            Variant f = new Variant(false);    
            Dispatch.call(doc, "Close", f);    
        } catch (Exception e) {    
            e.printStackTrace();    
        } finally {    
            app.invoke("Quit", new Variant[] {});    
        }  
        */  
		File sourceFile = new File(docfile);
		File pdfFile = new File(pdf2File);
		/*
		 * 转换成pdf文件
		 * 项目执行需要启动OpenOffice服务，在系统命令窗口执行命令。
		 *	cd C:\Program Files (x86)\OpenOffice 4\program
		 *  soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard
		 */
		if(sourceFile.exists()) {
			if(!pdfFile.exists()) {
				OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				try {
					connection.connect();
					DocumentConverter converter = new OpenOfficeDocumentConverter(connection);   
					converter.convert(sourceFile, pdfFile);
					pdfFile.createNewFile();
					connection.disconnect();  
					System.out.println("第二步：转换为PDF格式	路径" + pdfFile.getPath());
			    } catch (java.net.ConnectException e) {
				//} catch (Exception e) {
					e.printStackTrace();
					System.out.println("OpenOffice服务未启动");
					try {
						throw e;
					} catch (ConnectException e1) {
						e1.printStackTrace();
					}
				} catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
					e.printStackTrace();
					System.out.println("读取文件失败");
					throw e;
				} catch (Exception e){
					e.printStackTrace();
					try {
						throw e;
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
			} else {
				System.out.println("已转换为PDF，无需再次转换");
			}
		} else {
			System.out.println("要转换的文件不存在");
		} 
    }    
   

	// PDF转swf
	public static String ConvertPdfToSwf(String pdfName, String swfName) {

		File pdfFile = new File(pdfName);
		File swfFile = new File(swfName);

		Runtime r = null;
		Process p = null;
		/*
		 * 转换成swf文件
		 */
		r = Runtime.getRuntime();
		if (!swfFile.exists()) {
			if (pdfFile.exists()) {
				try {
					// 注意cmdString字符串之间的空格否则转化失败
					String cmdString = "C:/Program Files (x86)/SWFTools/pdf2swf.exe -t "
							+ pdfFile.getPath() + " -o " + swfFile.getPath()
							+ " -T 9";
					System.out.println(cmdString);
					p = r.exec(cmdString);
					//获取进程的标准输入流  
					 final InputStream is1 = p.getInputStream();   
					 //获取进城的错误流  
					 final InputStream is2 = p.getErrorStream();  
					 //启动两个线程，一个线程负责读标准输出流，另一个负责读标准错误流  
					 
					 new Thread() {  
						    public void run() {  
						       BufferedReader br1 = new BufferedReader(new InputStreamReader(is1));  
						        try {  
						            String line1 = null;  
						            while ((line1 = br1.readLine())!= null) {  
						                  if (line1 != null){}  
						              }  
						        } catch (IOException e) {  
						             e.printStackTrace();  
						        }  
						        finally{  
						             try {  
						               is1.close();  
						             } catch (IOException e) {  
						                e.printStackTrace();  
						              }  
						         }  
						       }  
						     }.start();  
						                                
						   new Thread() {   
						      public void  run() {   
						       BufferedReader br2 = new  BufferedReader(new  InputStreamReader(is2));   
						          try {   
						             String line2 = null ;   
						             while ((line2 = br2.readLine()) !=  null ) {   
						                  if (line2 != null){}  
						             }   
						           } catch (IOException e) {   
						                 e.printStackTrace();  
						           }   
						          finally{  
						             try {  
						                 is2.close();  
						             } catch (IOException e) {  
						                 e.printStackTrace();  
						             }  
						           }  
						        }   
						      }.start();    
						                                
						      p.waitFor();  
						      p.destroy();   
					
					/**
			    	BufferedReader buff = new BufferedReader(
							new InputStreamReader(p.getInputStream()));
					while (buff.readLine() != null);

					p.waitFor();
					
					*/
					//
					// System.out.println(swfFile.length());
					// System.out.println("第三步：转换为SWF格式	路径：" +
					// swfFile.getPath());
					// System.out.println("第四步：转换为SWF格式   名称：" +
					// swfFile.getName());
					// 下面这段代码保留pdf文件（根据用户需要）当执行两次以上的时候pdf文件会保留下来
					// if(pdfFile.exists()) {
					// pdfFile.delete();
					// }
				} catch (Exception e) {
					  try {
						p.getErrorStream().close();
						p.getInputStream().close();  
			            p.getOutputStream().close();  
					} catch (IOException e1) {
						e1.printStackTrace();
					}  
					e.printStackTrace();
				}
			} else {
				System.out.println("PDF文件不存在，无法转换");
			}
		} else {
			System.out.println("已经转为SWF文件，无需再次转换");
		}
		return  swfFile.getName();
		// return p.exitValue();
	}
	
	//获取路径和文件名
	public static String[] getUN(String url){
		String[] wurl=url.split("\\.")[0].split("/");
		String str="";
		for(int i=1;i<wurl.length-1;i++){//获取word存放路径
			str+="/"+wurl[i];
		}
		String[] s=new String[3];
		s[0]=str;
		s[1]=wurl[wurl.length-1];
		return s;
	}
	
	//给word路径做处理
	public static String getWurl(String url){
		String s1=url.split("[||]")[0];
		String[] wurl=s1.split("/");
		String str="";
		for(int i=1;i<wurl.length-1;i++){//获取word存放路径
			if(i==1){
				str+=wurl[i];
			}else{
			str+="/"+wurl[i];
			}
		}
		String[] s=new String[3];
		s[0]=str;
		s[1]=wurl[wurl.length-1];
		String wurl2=s[0]+"/"+s[1];
		return wurl2;
	}
	
	public static void main(String[] args) {
//		WordToPDF("F:\\ceshi.docx","F:\\12\\ceshi.pdf");
////		System.out.println(ConvertPdfToSwf("F:\\12\\ceshi.pdf","F:\\13\\ceshi.swf"));
//		String url="/CCZU2/upload/file/20170628/20170628132231_176.docx||心得";
//		String s=wordToPDF.getWurl(url);//获取存放word地址和文件名的数组
//		System.out.println(s);
//		String str1="";
//		for(int i=1;i<url2.length-1;i++){
//			str1+="/"+url2[i];
//			}
//		System.out.println(str1);
//		String s[]=wordToPDF.getUN(url);//获取存放word地址和文件名的数组
//		String purl=s[0]+"/pdf/"+s[1]+".pdf||"+s[2];//设置pdf存放路径
//		System.out.println(purl);

	}
}
