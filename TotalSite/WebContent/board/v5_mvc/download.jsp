<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String realPath = getServletContext().getRealPath("/board/upload");// upload��� �����θ� �Ѱ��ָ� ������θ� �����ش�
	
	response.setContentType("Application/octet-stream"); // setContentType���� 
										// ������ 1����Ʈ(8��Ʈ)�� �ɰ��� �����ϰڴ�
	response.setHeader("content-Disposition", "attachment;filename="+name); // content-Disposition�̶�� �Ӽ��� ����? ���ϸ��� ����

	File f= new File(realPath + "/" + new String(name.getBytes("8859_1"), "euc-kr")); //8859_1������ ���ڵ��� euc-kr�� 
	byte[] data = new byte[1024]; // 1024����Ʈ�� ��� ����
	
	try{
		BufferedInputStream input = 
				new BufferedInputStream(new FileInputStream(f)); // f��ü�� �о��� ��ü
				
		BufferedOutputStream output =
			new BufferedOutputStream(response.getOutputStream()); // ������ ��ü
			
		int read = input.read(data); // 1024����Ʈ ������ �о� ���δ� 
		while(read != -1){ //read�� ���� �ƴѵ���
			output.write(data, 0 , read); // data�迭�� 0��° ��ġ���� read��ŭ ���
			read = input.read(data); // 1024����Ʈ�� ��� �о���̱� �ݺ�
		}
		output.flush(); // ���۰� �� ���� �ʾƵ� ��������
		output.close();
		input.close();
	}
	catch(Exception err){
		err.printStackTrace();
	}
%>