<%-- 
    Document   : CustomWidget
    Created on : 26 Ιουλ 2013, 9:43:33 πμ
    Author     : plapas
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" >
        <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
        <title>Custom Widget</title>
<%
ArrayList colors = new ArrayList();
colors.add("33CCFF");
colors.add("66FF99");
colors.add("FFFF99");
colors.add("CC99CC");
colors.add("FFFFCC");
colors.add("99FFCC");
colors.add("D3BECF");
colors.add("FEF1B5");
colors.add("00FFFF"); 
colors.add("F6C9CC");

String RefTime = request.getParameter("refresh");
    response.setHeader("Refresh", RefTime); 
//String fonSz= request.getParameter("font-size");
String fonFm = request.getParameter("font-family"); 
String categ =  request.getParameter("categories");
    String categories1[] = categ.split(","); 
    ArrayList cats = new ArrayList();
    for(int c = 0 ; c < categories1.length; c++)
        cats.add(categories1[c]);
%>
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
                }
            }
        </script>
    </head>
    <body >
        
            <div class='navbar navbar-inverse'>
                <div class='navbar-inner' style="height: auto; text-align:  center;">
                    <div class="container-fluid">
                    <ul class="nav" role="navigation">
                        <li style=" font-size: 18px; color: #ffffff; padding-top: 7%;" ><b>News</b></li>                      
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank">powered by <img src="img/logoNewSum2.png"></a></li>
                        <li class="dropdown"><a id="drop1" class="dropdown-toggle" data-toggle="dropdown" role="button" href="#"><img src="img/settings2.png"></a>
                        <ul class="dropdown-menu" aria-labelledby="drop1" role="menu">
                            <li role="presentation"><a role="menuitem">Ελληνικά</a></li>
                            <li role="presentation"><a role="menuitem">English</a></li>
                            <li role="presentation"><a role="menuitem" href="http://www.scify.gr/site/en/support-us" target="_blank">developed by <img src="img/Scify-min.png"></a></li>
                        </ul></li>
                    </ul>
                        </div>
                </div>
            </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                     <%-- start web service invocation --%>
                    <%
                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                            
                           int color_id = 0;
                           %><table class="table " style=" text-align: center;"><%
                           for(int u = 0 ; u < cats.size(); u++){
                           %><tr  style=" background-color: #<%out.print(colors.get(color_id));%> ;" ><td><a onclick="showhide('<%out.print(u);%>')" style=" font-family: <%out.print(fonFm);%>; color: #000000;"><%out.print(cats.get(u));%></a></td></tr><%
                              
                               TopicsData topics = NewSumInstance.getTopics(values, categories.get(u)); //.getTopics(values, categories.get(1));
                               color_id++;
                               //ArrayList<String> topicIds = topics.getTopicIDs();
                               %><tr id="<%out.print(u);%>" style="font-family: <%out.print(fonFm);%>; color: #000000; font-size: 15px; display:none; background-color: #58595b;"><td><%
                              for(int TopTwo = 0 ; TopTwo < 2 ; TopTwo++){
                                  
                               %><div><a href="category.jsp?cat=<%out.print(cats.get(u));%>&fonFm=<%out.print(fonFm);%>&col=<%out.print(colors.get(color_id-1));%>" style=" color: #ffffff;" ><%out.print(topics.get(TopTwo).getTopicTitle());%></a></div><hr><%
                              
                              }%></td></tr><%
                              
                           }
                           %></table><%
                           
                          /* int s=0;
                           for(String each2 : topicIds ){
                            //   out.print("IDs : "+ each2  );
                          
                               s++;
                            }
                           for(int i = 0 ; i < topicIds.size(); i++){
                           Calendar datetime = topics.get(i).getDate();
                           //datetime.getWeekYear();
                          // out.print("Day : "+ datetime.getTime().getDay() );
                           
                          // out.print("Month : "+ datetime.getTime().getMonth() );
                          
                         //  out.print("Year : "+ (datetime.getTime().getYear()+1900));
                          
                          // out.print("Hour : "+ datetime.getTime().getHours()+ " : " + datetime.getTime().getMinutes() + " : " + datetime.getTime().getSeconds()   );
                           
                           String title = topics.get(i).getTopicTitle();
                          // out.print("Title : "+ title);
                          
                           SummaryData summary = NewSumInstance.getSummary(topicIds.get(i), values);
                           ArrayList<String> sum = summary.getSummaries();
                           for (String each1 : sum) {
                              //  out.print(each1 );
                            }
                            int src = topics.get(i).getSourcesNum();
                        //    out.print("Sources: "+src);
                           }
                                     //java.lang.String result = port.getTopics(sUserSources, sCategory);
                                */     //out.println("Result = "+result);
                                 } catch (Exception ex) {
                                     // TODO handle custom exceptions here
                                     out.print(ex);
                                 }
                    %>
                    <%-- end web service invocation --%>

                </div>
            </div>
        </div>
        
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
