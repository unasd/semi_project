<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String realPath = getServletContext().getRealPath("/board/upload");// upload라는 가상경로를 넘겨주면 실제경로를 구해준다
	
	response.setContentType("Application/octet-stream"); // setContentType으로 
										// 파일을 1바이트(8비트)씩 쪼개서 전송하겠다
	response.setHeader("content-Disposition", "attachment;filename="+name); // content-Disposition이라는 속성을 조정? 파일명을 지정

	File f= new File(realPath + "/" + new String(name.getBytes("8859_1"), "euc-kr")); //8859_1형식의 인코딩을 euc-kr로 
	byte[] data = new byte[1024]; // 1024바이트로 묶어서 전달
	
	try{
		BufferedInputStream input = 
				new BufferedInputStream(new FileInputStream(f)); // f객체를 읽어일 객체
				
		BufferedOutputStream output =
			new BufferedOutputStream(response.getOutputStream()); // 내보낼 객체
			
		int read = input.read(data); // 1024바이트 단위로 읽어 들인다 
		while(read != -1){ //read가 끝이 아닌동안
			output.write(data, 0 , read); // data배열의 0번째 위치에서 read만큼 출력
			read = input.read(data); // 1024바이트씩 끊어서 읽어들이길 반복
		}
		output.flush(); // 버퍼가 꽉 차지 않아도 내보낸다
		output.close();
		input.close();
	}
	catch(Exception err){
		err.printStackTrace();
	}
%>