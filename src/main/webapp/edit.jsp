<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit page</title>
<%@ include file="all_js_css.jsp" %>

</head>
<body>

<div class="container" >
    
    <%@ include file="navbar.jsp" %>
    <h1 class="text-uppercase">Edit your note here</h1>
    <br>
    
    <%
    
    	int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    
    Session s=FactoryProvider.getFactory().openSession();
    Note note = s.get(Note.class, noteId);
    
	
    
    %>
    
    
     <form action="UpdateServlet" method="post">
     
     
     <input  value="<%=note.getId() %>" name="noteId" type="hidden" >
    
  <div class="form-group">
    <label for="title">Note Title</label>
    <input 
    
    value="<%= note.getTitle() %>"
    required="required" 
    type="text" 
    name="title"
    class="form-control" 
    id="title" 
    aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="content">Note Content</label>
    
   <textarea 
   name="content"
   required="required"
   id="content"
   
   class="form-control"
   style="height: 200px;"><%=note.getContent() %>
   
   </textarea>
  </div>
  
  <div class="container text-center">
  
   <button type="submit" class="btn btn-success">Save note</button>
  </div>
  
 
</form>
    
    </div>
    

</body>
</html>