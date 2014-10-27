<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<title>filrCounter.jsp</title>
</head>
<body>
<%!
	int count;
	BufferedReader br;	
	PrintWriter pw;
	String path;
	
	public void jspInit(){  // �������̵��̹Ƿ� throws �ۼ��� �� ����
		try{
			path = getServletContext().getRealPath("/"); // "/" �� ������Ʈ�� ������
			//System.out.println(path);					// ������ �÷����� �ٲ� ��η� ����ȴ�
			br = new BufferedReader(new FileReader(path+"\\counter.txt"));
		
			String line=br.readLine();
			count = Integer.parseInt(line);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(br!=null){ // br�� ������ �������̶�� �ݾ��ش�
				try{br.close();}
				catch(Exception err){err.printStackTrace();}
			}
		}
	}
	
	public void jspDestroy(){
		saveFile();
	}
	
	public void saveFile(){
		try{
			pw = new PrintWriter(path+"\\counter.txt");
			pw.println(count);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(pw!=null){ 
				try{pw.close();}
				catch(Exception err){err.printStackTrace();}
			}
		}
	}
%>

<%
	if(session.isNew()){
		count++;
		saveFile();
	}	
%>
<h2>�� �湮�� �� : <%=count %></h2>
</body>
</html>