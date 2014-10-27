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
	
	public void jspInit(){  // 오버라이딩이므로 throws 작성할 수 없다
		try{
			path = getServletContext().getRealPath("/"); // "/" 현 프로젝트의 절대경로
			//System.out.println(path);					// 서버에 올려지면 바뀐 경로로 적용된다
			br = new BufferedReader(new FileReader(path+"\\counter.txt"));
		
			String line=br.readLine();
			count = Integer.parseInt(line);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			if(br!=null){ // br이 아직도 실행중이라면 닫아준다
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
<h2>총 방문자 수 : <%=count %></h2>
</body>
</html>