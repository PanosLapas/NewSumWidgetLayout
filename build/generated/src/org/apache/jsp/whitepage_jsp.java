package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.util.ArrayList;
import org.scify.NewSumServer.Server.JSon.*;
import org.scify.NewSumServer.Server.Adaptor.*;

public final class whitepage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8; width=device-width, initial-scale=1.0;\">\n");
      out.write("        <link href=\"css/bootstrap/CreateCss.jsp\" type=\"text/css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <title>NewSum Widget</title>\n");
      out.write("        <script>\n");
      out.write("            function showmenu(elmnt)\n");
      out.write("            {\n");
      out.write("                document.getElementById(elmnt).style.visibility = \"visible\";\n");
      out.write("            }\n");
      out.write("            function hidemenu(elmnt)\n");
      out.write("            {\n");
      out.write("                document.getElementById(elmnt).style.visibility = \"hidden\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("            var divState = {}; // we store the status in this object\n");
      out.write("            function showhide(id) {\n");
      out.write("                if (document.getElementById) {\n");
      out.write("                    var divid = document.getElementById(id);\n");
      out.write("\n");
      out.write("                    divState[id] = (divState[id]) ? false : true; // initialize / invert status (true is visible and false is closed)\n");
      out.write("                    //close others\n");
      out.write("                    for (var div in divState) {\n");
      out.write("                        if (divState[div] && div != id) { // ignore closed ones and the current\n");
      out.write("                            document.getElementById(div).style.display = 'none'; // hide\n");
      out.write("                            divState[div] = false; // reset status\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                    divid.style.display = (divid.style.display == 'block' ? 'none' : 'block');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body >\n");
      out.write("        <!--   <div class=\"container\" style=\"width: auto;\">\n");
      out.write("               <div class=\"navbar navbar-static\">\n");
      out.write("                   <div class=\"navbar-inner\">\n");
      out.write("                       <div class=\"container\" style=\"width: auto;\">\n");
      out.write("   \n");
      out.write("                           <ul class=\"nav\">\n");
      out.write("                               <li><a href=\"http://www.scify.gr/site/en/newsum-en\" target='_blank'><img src=\"img/logoNewSum2.png\"></a></li>\n");
      out.write("                               \n");
      out.write("                                   <li style=\" padding-top: 4%; font-family: sans-serif; font-size: 110%;\" onmouseover=\"mopen('m1')\"\n");
      out.write("                                       onmouseout=\"mclosetime()\"><a href=\"#\" style=\" color: #9900ff;\">Categories</a>\n");
      out.write("                                       <div id=\"m1\"><a href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Technology\" class=\"navbar\">Technology</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=SciFY News\" class=\"navbar\">Scify News </a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Europe\" class=\"navbar\">Europe</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Top News\" class=\"navbar\">Top News</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Science\" class=\"navbar\">Science</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Business\" class=\"navbar\">Business</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=World\" class=\"navbar\">World</a>\n");
      out.write("                                       <a href=\"category.jsp?cat=Education\" class=\"navbar\">Education</a></div>\n");
      out.write("                                   </li>\n");
      out.write("        <!--<li class=\"dropdown\"><a onmouseover=\"showhide('infid')\"  href=\"#\" >Categories</a>\n");
      out.write("            <ul class=\"dropdown-menu\" data-toggle=\"dropdown\" id=\"info\">\n");
      out.write("                <li ><a  href=\"#\" >Τεχνολογία</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Επιστήμη</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Αθλητισμός</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Ελλάδα</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Κόσμος</a></li>\n");
      out.write("                <li ><a  href=\"#\" >SciFY News</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Γενικά</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Οικονομία</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Εκπαίδευση</a></li>\n");
      out.write("                <li ><a  href=\"#\" >Πολιτισμός</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("        <li><a href=\"http://www.scify.gr/site/en/support-us\" target=\"_blank\"><img src=\"img/Scify-min.png\"></a></li>\n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("    <img src=\"img/gr.png\">\n");
      out.write("    <img src=\"img/us.png\" style=\"padding-left: 0.8%;\">\n");
      out.write("    </br>\n");
      out.write("    <a onclick=\"getElementById('searchDIV').style.visibility = 'visible';\" href=\"#\"><i class=\"icon-search\"></i></a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("     <li><a href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></li>\n");
      out.write("        <li><a href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></li>\n");
      out.write("        <li><a href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></li>\n");
      out.write("        <li><a href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></li>\n");
      out.write("</div><ul id=\"info\" class=\"dropdown-submenu\" style=\" background-color: #9999ff; border-color: #000000; border: 1;\">\n");
      out.write("                           \n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Technology\" class=\"navbar\">Technology</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=SciFY News\" class=\"navbar\">Scify News </a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Europe\" class=\"navbar\">Europe</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Top News\" class=\"navbar\">Top News</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Science\" class=\"navbar\">Science</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Business\" class=\"navbar\">Business</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=World\" class=\"navbar\">World</a></li></br>\n");
      out.write("                            <li><a style=\" color: #666666;\" href=\"category.jsp?cat=Education\" class=\"navbar\">Education</a></li></br>\n");
      out.write("                           \n");
      out.write("                        </ul> \n");
      out.write("\n");
      out.write("        -->\n");
      out.write("        <div class='navbar'>\n");
      out.write("\n");
      out.write("            <div class='navbar-inner' >\n");
      out.write("                <ul class=\"nav\" >\n");
      out.write("\n");
      out.write("                    <li ><a href=\"http://www.scify.gr/site/en/newsum-en\" target='_blank'><img src=\"img/logoNewSum2.png\"></a></li>\n");
      out.write("                    <li style=\" padding-top: 4%; font-family: sans-serif; \" onmouseover=\"showmenu('info')\" onmouseout=\"hidemenu('info')\"><a href=\"#\" style=\" color: #000000;\">Categories</a>    \n");
      out.write("                        <table  class=\"nav table\"  id=\"info\" height=\"0\" style=\" width: 100%; padding-top: 9%; text-align:  center\"  border=\"0\">\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Open Source\" class=\"navbar\">Open Source</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Technology\" class=\"navbar\">Technology</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=SciFY News\" class=\"navbar\">Scify News </a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Europe\" class=\"navbar\">Europe</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Top News\" class=\"navbar\">Top News</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Science\" class=\"navbar\">Science</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Business\" class=\"navbar\">Business</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=World\" class=\"navbar\">World</a></td></tr>\n");
      out.write("                            <tr style=\" background-color: #ffffff;\"><td class=\"navbar\"><a style=\" color: #666666;\" href=\"category.jsp?cat=Education\" class=\"navbar\">Education</a></td></tr>\n");
      out.write("                        </table> \n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li style=\" padding-top: 0.5%;\"><a href=\"http://www.scify.gr/site/en/support-us\" target=\"_blank\"><img src=\"img/Scify-min.png\"></a></li>\n");
      out.write("\n");
      out.write("                    <li><img src=\"img/gr.png\"></li></br>\n");
      out.write("                    <li><img src=\"img/us.png\"></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\" >\n");
      out.write("\n");
      out.write("            <div class=\"row-fluid\" >\n");
      out.write("                <div id=\"output\" class=\"span10\">\n");
      out.write("                    ");
      out.write("<hr/>\n");
      out.write("                    ");
/*
                         try {
                         org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                         org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                         // TODO process result here
                         //java.lang.String result = port.getLinkLabels();
                         LinksData dl= NewSumInstance.getLinkLabels();//new LinksData(result);
                         ArrayList <String> values = dl.getLinks();
                         CategoriesData categories = NewSumInstance.getCategories(values);
                         for(String each : categories){
                         //dl.getLinks();
                         out.print(each+"\n");*//*
                         //out.println(each.getLink());
                         }
        
                         } catch (Exception ex) {
                         // TODO handle custom exceptions here
                         out.println(ex);
                         }*/
                    
      out.write("\n");
      out.write("                    ");
      out.write("<hr/>\n");
      out.write("                    ");
      out.write("<hr/>\n");
      out.write("                    ");

                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                            TopicsData topics = NewSumInstance.getTopics(values, categories.get(1)); //.getTopics(values, categories.get(1));
                            out.print("Category : " + categories.get(1));
                            
      out.write("<br>");

                           ArrayList<String> topicIds = topics.getTopicIDs();
                           int s=0;
                           for(String each2 : topicIds ){
                               out.print("IDs : "+ each2  );
                           
      out.write("<br>");

                               s++;
                            }
                           for(int i = 0 ; i < s; i++){
                           Calendar datetime = topics.get(i).getDate();
                           //datetime.getWeekYear();
                           out.print("Day : "+ datetime.getTime().getDay() );
                           
      out.write("<br>");

                           out.print("Month : "+ datetime.getTime().getMonth() );
                           
      out.write("<br>");

                           out.print("Year : "+ datetime.getTime().getYear());
                           
      out.write("<br>");

                           out.print("Hour : "+ datetime.getTime().getHours()+ " : " + datetime.getTime().getMinutes() + " : " + datetime.getTime().getSeconds()   );
                           
      out.write("<br>");

                           String title = topics.get(2).getTopicTitle();
                           out.print("Title : "+ title);
                           
      out.write("<br>");

                           SummaryData summary = NewSumInstance.getSummary(topicIds.get(2), values);
                           ArrayList<String> sum = summary.getSummaries();
                           for (String each1 : sum) {
                                out.print(each1 );
      out.write("<br>");

                            }
                            int src = topics.get(2).getSourcesNum();
                            out.print("Sources: "+src);
      out.write("<br>");

                           }
                                     //java.lang.String result = port.getTopics(sUserSources, sCategory);
                                     //out.println("Result = "+result);
                                 } catch (Exception ex) {
                                     // TODO handle custom exceptions here
                                     out.print(ex);
                                 }
                    
      out.write("\n");
      out.write("                    ");
      out.write("<hr/>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/scify.index.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
