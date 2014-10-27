<%@ page contentType="text/html; charset=EUC-KR"%>
<hr/>
[²¿¸´¸»]<br/>
<jsp:useBean id="req" class="mybean.RequestBean" scope="request"/>
<jsp:getProperty property="footer" name="req"/>
<hr/>