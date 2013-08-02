package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.util.ArrayList;
import org.scify.NewSumServer.Server.JSon.*;
import org.scify.NewSumServer.Server.Adaptor.*;

public final class BasicLayout_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8; width=device-width, initial-scale=1.0;\" >\n");
      out.write("        <link href=\"css/bootstrap/bootstrap-responsive.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css/bootstrap/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Custom Widget</title>\n");

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
String fonSz="14px";
String fonFm = "sans"; 

      out.write("\n");
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
      out.write("        \n");
      out.write("            <div class='navbar navbar-inverse'>\n");
      out.write("                <div class='navbar-inner' style=\"height: auto; text-align:  center;\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                    <ul class=\"nav\" role=\"navigation\">\n");
      out.write("                        <li style=\" font-size: 18px; color: #ffffff; padding-top: 7%;\" ><b>News</b></li>                      \n");
      out.write("                        <li ><a href=\"http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el\" target=\"_blank\">powered by <img src=\"img/logoNewSum2.png\"></a></li>\n");
      out.write("                        <li class=\"dropdown\"><a id=\"drop1\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" href=\"#\"><img src=\"img/settings2.png\"></a>\n");
      out.write("                        <ul class=\"dropdown-menu\" aria-labelledby=\"drop1\" role=\"menu\">\n");
      out.write("                            <li role=\"presentation\"><a role=\"menuitem\">Ελληνικά</a></li>\n");
      out.write("                            <li role=\"presentation\"><a role=\"menuitem\">English</a></li>\n");
      out.write("                            <li role=\"presentation\"><a role=\"menuitem\" href=\"http://www.scify.gr/site/en/support-us\" target=\"_blank\">developed by <img src=\"img/Scify-min.png\"></a></li>\n");
      out.write("                        </ul></li>\n");
      out.write("                    </ul>\n");
      out.write("                        </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("                <div class=\"span12\">\n");
      out.write("                     ");
      out.write("\n");
      out.write("                    ");

                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                            
                           int color_id = 0;
                           
      out.write("<table class=\"table \" style=\" text-align: center;\">");

                           for(String eachCat : categories){
                               
      out.write("<tr  style=\" background-color: #");
out.print(colors.get(color_id));
      out.write(" ;\" ><td><a onclick=\"showhide('");
out.print(eachCat);
      out.write("')\" style=\" font-family:  sans; color: #000000;\">");
out.print(eachCat);
      out.write("</a></td></tr>");

                              
                               TopicsData topics = NewSumInstance.getTopics(values, categories.get(color_id)); //.getTopics(values, categories.get(1));
                               color_id++;
                               ArrayList<String> topicIds = topics.getTopicIDs();
                               
      out.write("<tr id=\"");
out.print(eachCat);
      out.write("\" style=\"font-family:  sans; color: #000000; font-size: 14px; display:none; background-color: #58595b;\"><td>");

                              for(int TopTwo = 0 ; TopTwo < 2 ; TopTwo++){
                                  
                               
      out.write("<div><a href=\"category.jsp?cat=");
out.print(eachCat);
      out.write("&fonSz=");
out.print(fonSz);
      out.write("&fonFm=");
out.print(fonFm);
      out.write("&col=");
out.print(colors.get(color_id-1));
      out.write("\" style=\" color: #ffffff;\" >");
out.print(topics.get(TopTwo).getTopicTitle());
      out.write("</a></div><hr>");

                              
                              }
      out.write("</td></tr>");

                              
                           }
                           
      out.write("</table>");

                           
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
                    
      out.write("\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/scify.index.js\"></script>\n");
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
