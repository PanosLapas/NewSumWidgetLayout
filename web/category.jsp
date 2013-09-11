<%-- 
    Document   : starting
    Created on : 11 Ιουλ 2013, 6:12:29 μμ
    Author     : plapas
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="org.scify.NewSumInterface.Server.JSon.*"%>
<%@page import="org.scify.NewSumInterface.Server.Adaptor.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%> 
<%  response.addHeader("Refresh","1800");
    String top1 = null;
    Integer top = -1;
    try {
        top1 = request.getParameter("top");//getting the number(0 or 1 -depends on which title of the first two- the user clicked )
        top = Integer.parseInt(top1);//reverse it to integer
    } catch (Exception exc) {
    }
    String g = request.getParameter("c");//getting the position of the category in the list
    Integer in = Integer.parseInt(g);//reverse it to integer 
    String BackGrCol = request.getParameter("backGrCol");//getting the theme color
    String FontCol = request.getParameter("fontCol");
    String fontFm = request.getParameter("fonFm");//font family
    String col = request.getParameter("col");
    String cat_name = null;//finding the selected category(when clicking on category's name)
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <!--Calling the css with appropriate variables--> 
        <link href="css/bootstrap/CreateCss.jsp?backGrCol=<%out.print(BackGrCol);%>&FontCol=<%out.print(FontCol);%>&fonFm=<%out.print(fontFm);%>" rel="stylesheet">
        <title>Categories</title>
        <script>
            var divState = {}; // we store the status in this object
            function showhide(id) {
                if (document.getElementById) {
                    var divid = document.getElementById(id);

                    divState[id] = (divState[id]) ? false : true; // initialize / invert status (true is visible and false is closed)
                    //close others
                    for (var div in divState) {
                        if (divState[div] && div != id) { // ignore closed ones and the current
                            document.getElementById(div).style.display = 'none'; // hide
                            divState[div] = false; // reset status
                        }
                    }
                    divid.style.display = (divid.style.display == 'block' ? 'none' : 'block');
                    if (document.getElementById("im" + id).className === "icon-arrow-right") {//using right arrow
                        document.getElementById("im" + id).className = "icon-arrow-down";//reversre it to down arrow
                    } else {
                        document.getElementById("im" + id).className = "icon-arrow-right";//change to right 
                    }
                }
            }
            function readit(Id){
                    var color=document.getElementById(Id).style.color;
                    
                    if(color=="rgb(222, 189, 238)"){                  
                        document.getElementById(Id).style.color='#FF8800';
                    }
                    if(color=="rgb(153, 51, 204)"){                  
                       document.getElementById(Id).style.color='#FF8800';
                    }   
            }
        </script>
    </head>
    <body>
        <div class='navbar navbar-inverse'>
            <div class='navbar-inner' style="height: auto; text-align:  center;">
                <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank"><img src="img/Widget-logo.png"></a></li>
                        <li style=" font-size: 16px; color: #ffffff;" ><a href="Layout.jsp?&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b>NewSum</b></a></li>                      
                        <li class="dropdown"><a id="drop1" class="dropdown-toggle" data-toggle="dropdown" role="button" href="#"><img src="img/sett.png"></a>
                            <ul class="dropdown-menu" aria-labelledby="drop1" role="menu">
                                <li role="presentation"><a role="menuitem">Ελληνικά</a></li>
                                <li role="presentation"><a role="menuitem">English</a></li>
                                <li role="presentation"><a role="menuitem" href="http://www.scify.gr/site/en/support-us" target="_blank">developed by <img src="img/Scify-min.png"></a></li>
                            </ul></li>
                    </ul>
                </div>
            </div>
        </div>
        <%  ArrayList<String> values=null;
            CategoriesData categories=null;
            TopicsData topics=null;
            ArrayList<String> topicIds=null;
            SummaryData summary=null;
            ArrayList<String> sum=null;
            try{
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                try{
                LinksData dl = NewSumInstance.getLinkLabels();//get link labels
                values = dl.getLinks();
                }catch (Exception ex){
                 response.sendRedirect("error.jsp?&m=links&font-family="+fontFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                }
                try{
                categories = NewSumInstance.getCategories(values);//get categories
                }catch (Exception ex){
                 response.sendRedirect("error.jsp?&m=cats&font-family="+fontFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                }
                for (int category = 0; category < categories.size(); category++) {
                    if (category == in) {
                        cat_name = categories.get(category);//find the category the user want to see
                    }
                }
                try{
                topics = NewSumInstance.getTopics(values, cat_name);//getting topics from all sources but for the selected category
                topicIds = topics.getTopicIDs();//creating a list of topics
                }catch (Exception ex){
                 response.sendRedirect("error.jsp?&m=topics&font-family="+fontFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                }
                
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
             
          if ((top == 0) || (top == 1)) {
 //when user clicks on one topic in the BasicLayout show him only the 'sentence' for the specified topic
                   %><table class="table " style=" text-align: center;">         
                   <br><tr class="warning1" style="font-size: 12px;"><td style="color: #<%out.print(col);%>;"><a href="Layout.jsp?&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><span class="badge badge-info"><i class="icon-arrow-left"></i></span></a>&nbsp;&nbsp;<a href="category.jsp?c=<%out.print(g);%>&fonFm=<%out.print(fontFm);%>&col=<%out.print(col);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><b><%out.print(cat_name);%></b></a></td></tr>
                   <tr><td><a style="color:#<%out.print(FontCol);%>;"><%out.print(topics.get(top).getTopicTitle());%></a></td></tr>          
                   <%
                   try{
                   summary = NewSumInstance.getSummary(topicIds.get(top), values);//getting summaries from all sources for the specified topic
                   sum = summary.getSummaries();//creating a list of the summaries
                   }catch (Exception ex){
                    response.sendRedirect("error.jsp?&m=sum&font-family="+fontFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
                   }
                   %><tr class="warning1" id="<%out.print(top);%>" style="font-size: 12px;"><td>
                   <%
                   Calendar datetime = topics.get(top).getDate();//getting the published date of the topic and print it
                   %><img style=" width: 150px; height: 100px;" src="img/<%out.print(cat_name);%>.png"><br><%//expecting image url
                   %><br><span class="label label-info" <%if(BackGrCol.equals("58595b")){%>style="background-color:#<%out.print("C0C0C0");%>; color:#007FFF;"<%}else{%>style="background-color:#<%out.print("00C5CD");%>;"<%}%> ><%out.print(datetime.getTime().getDate() + "-" + (datetime.getTime().getMonth()+1) + "-" + (datetime.getTime().getYear() + 1900));%></span><br><%
      //for all the size of the snippets show each summary
                   for (int position = 0; position < sum.size(); position++) {
      //show summaries with the appropriate source label and url
                       if(position>0){
                           if(!(summary.getSnippets().get(position).getSourceName()).equals(summary.getSnippets().get(position - 1).getSourceName())){%><i class="icon-asterisk"></i><%}
                       }
                       else{%><i class="icon-asterisk"></i><%}
                       %><%out.print(sum.get(position));%>
                       
                       <%if(position < (sum.size() - 1)) {
                            if(!(summary.getSnippets().get(position).getSourceName()).equals(summary.getSnippets().get(position + 1).getSourceName())) {%>
                            <span class="label label-info" <%if (BackGrCol.equals("58595b")) {%>style="background-color:#<%out.print("ffffff");%>"<%}%>><a href="<%out.print(summary.getSnippets().get(position).getSourceUrl());%>" target="_blank" <%if (BackGrCol.equals("ffffff")) {%>style="color:#<%out.print("ffffff");%>"<%}%>><%out.print(summary.getSnippets().get(position).getSourceName());%></a></span>
                        <%}
                        }%>
                        <%if (position == sum.size() - 1) {%>
                        <span class="label label-info" <%if (BackGrCol.equals("58595b")) {%>style="background-color:#<%out.print("ffffff");%>"<%}%>><a href="<%out.print(summary.getSnippets().get(position).getSourceUrl());%>" target="_blank" <%if (BackGrCol.equals("ffffff")) {%>style="color:#<%out.print("ffffff");%>"<%}%>><%out.print(summary.getSnippets().get(position).getSourceName());%></a></span>
                        <%}%><br>
                        <%
                    }
      //show all the sources of the topic
                    %><br>Sources : <%for (int snip = 0; snip < summary.getSources().size(); snip++) {
                    %> 
                    <span class="label label-info" <%if (BackGrCol.equals("58595b")) {%>style="background-color:#<%out.print("ffffff");%>"<%}%>><a href="<%out.print(summary.getSources().get(snip).getUrl());%>" target="_blank" <%if (BackGrCol.equals("ffffff")) {%>style="color:#<%out.print("ffffff");%>"<%}%> ><%out.print(summary.getSources().get(snip).getName() + "  ");%></a></span>
                    <%}%>
                    <br>
                    </td></tr>
                    <%
           } //end of code when user clicks on a topic
                
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
                
           else{
              
//when the user clicks on a category name show him only topics with size greater than 1 (the summary comes from more than one sources)
                %><table class="table " style=" text-align: center;"><%
                int counter = 0;//counter for checking if this specified moment we have topics with size greater than one
                Calendar datetime = topics.get(0).getDate();//get Date
                int day = datetime.getTime().getDate();//initilize date by the date of the first topic
                int month = (datetime.getTime().getMonth() + 1);
                int year = datetime.getTime().getYear();
                int hours = datetime.getTime().getHours();
                int mins = datetime.getTime().getMinutes();
                %><div class="warning1" style="font-size: 12px;">
                <a href="Layout.jsp?&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"><span class="badge badge-info"><i class="icon-arrow-left"></i></span></a>
                <b><%out.print(cat_name);%></b></div><%
                
                for (int k = 0; k < topics.size(); k++) {//loop for all the size of the topics   

                    if (topics.get(k).getSourcesNum() > 1) {//check topic's date and if date is different change the values
                          int day1 = topics.get(k).getDate().getTime().getDate();
                          int month1 = (topics.get(k).getDate().getTime().getMonth() + 1);
                          int year1 = topics.get(k).getDate().getTime().getYear();
                          if (k != 0) {
                             if ((day1 != day) || (month1 != month) || (year1 != year)) {
                                datetime = topics.get(k).getDate();
                                day = datetime.getTime().getDate();
                                month = (datetime.getTime().getMonth() + 1);
                                year = datetime.getTime().getYear();
                                %><div><span class="label label-info" <%if(BackGrCol.equals("58595b")){%>style="background-color:#<%out.print("C0C0C0");%>; color:#007FFF;"<%}else{%>style="background-color:#<%out.print("00C5CD");%>;"<%}%> > <%out.print(day + "-" + month + "-" + (year + 1900));%></span></div><%
                              }
                          }else {
                                %><div><span class="label label-info"<%if(BackGrCol.equals("58595b")){%>style="background-color:#<%out.print("C0C0C0");%>; color:#007FFF;"<%}else{%>style="background-color:#<%out.print("00C5CD");%>;"<%}%> > <%out.print(day + "-" + month + "-" + (year + 1900));%></span></div><%
                          }
                          hours = topics.get(k).getDate().getTime().getHours();//get hours and minutes
                          mins = topics.get(k).getDate().getTime().getMinutes();
                          %><div  style="font-size:12px;"><a href="Topic.jsp?&c=<%out.print(in);%>&t=<%out.print(k);%>&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>" <%if(!BackGrCol.equals("ffffff")){%> style="color: #debdee;"<%}else{%>style="color: #9933CC"<%}%>><%out.print(topics.get(k).getTopicTitle() + " " + "(" + hours + ":" + mins + ")");%></a><%
                          %></div><hr style="border-color:#<%out.print(FontCol);%>; height: 1px;"/><%
                     }else{
                       counter++;//change counter value
                     }
                }
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                          
  //if the counter is equal to the topics.size this means that we have no topics with size greater than one at this moment
                       //show first two topics
                if (counter == topicIds.size()) {
                   for (int TopTwo = 0; TopTwo < 2; TopTwo++) {
                       if (TopTwo == 1){
                          int day1 = topics.get(1).getDate().getTime().getDate();
                          int month1 = (topics.get(1).getDate().getTime().getMonth() + 1);
                          int year1 = topics.get(1).getDate().getTime().getYear();
                            if ((day1 != day) || (month1 != month) || (year1 != year)) {
                               datetime = topics.get(1).getDate();
                               day = datetime.getTime().getDate();
                               month = (datetime.getTime().getMonth() + 1);
                               year = datetime.getTime().getYear();
                               %><tr><td><span class="label label-info" <%if(BackGrCol.equals("58595b")){%>style="background-color:#<%out.print("C0C0C0");%>; color:#007FFF;"<%}else{%>style="background-color:#<%out.print("00C5CD");%>;"<%}%>><%out.print(day + "-" + month + "-" + (year + 1900));%></span></td></tr><%
                            }
                        }else{
                            %><tr><td><span class="label label-info" <%if(BackGrCol.equals("58595b")){%>style="background-color:#<%out.print("C0C0C0");%>; color:#007FFF;"<%}else{%>style="background-color:#<%out.print("00C5CD");%>;"<%}%>><%out.print(day + "-" + month + "-" + (year + 1900));%></span></td></tr><%
                        }
                        %><tr class="warning1" style=" font-size: 12px;"><td><a href="Topic.jsp?&c=<%out.print(in);%>&t=<%out.print(TopTwo);%>&font-family=<%out.print(fontFm);%>&backGrCol=<%out.print(BackGrCol);%>&fontCol=<%out.print(FontCol);%>"  <%if(!BackGrCol.equals("ffffff")){%> style="color: #debdee;"<%}else{%>style="color: #9933CC"<%}%>><%out.print(topics.get(TopTwo).getTopicTitle());%></a></td></tr>
                        <%
                   }
                }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////            
                %></table><%
           }
          }catch (Exception ex){
            response.sendRedirect("error.jsp?&m=sun&font-family="+fontFm+"&backGrCol="+BackGrCol+"&fontCol= "+FontCol);
          }
                %>


            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
