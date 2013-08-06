package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.jms.Session;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.ArrayList;
import org.scify.NewSumServer.Server.JSon.*;
import org.scify.NewSumServer.Server.Adaptor.*;
import java.net.URLDecoder;

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
      response.setContentType("text/html; charset=UTF-8;");
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
      out.write(" \n");
      out.write("\n");

    String BackGrCol = request.getParameter("backGrCol");
    String FontCol = request.getParameter("fontCol");
    String fonFm = request.getParameter("font-family");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8; width=device-width, initial-scale=1.0;\" >\n");
      out.write("        <link href=\"css/bootstrap/bootstrap-responsive.min.css\" rel=\"stylesheet\" >\n");
      out.write("        <link href=\"css/bootstrap/CreateCss.jsp?backGrCol=");
out.print(BackGrCol);
      out.write("&FontCol=");
out.print(FontCol);
      out.write("&fonFm=");
out.print(fonFm);
      out.write("\" rel=\"stylesheet\">\n");
      out.write("        <title>NewSum Widget</title>\n");
      out.write("        ");


            ArrayList colors = new ArrayList();
            colors.add("0099CC");
            colors.add("9933CC");
            colors.add("669900");
            colors.add("FF8800");
            colors.add("CC0000");

            String categ = "Τεχνολογία,Αθλητισμός,Επιστήμη,Οικονομία,Ελλάδα,Εκπαίδευση,SciFY News,Πολιτισμός";
            session.setAttribute("categories", categ);
            String categories1[] = categ.split(",");
            ArrayList<String> cats = new ArrayList();
            for (int c = 0; c < categories1.length; c++) {
                cats.add(categories1[c]);
            }
        
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
      out.write("\n");
      out.write("        <div class='navbar navbar-inverse'>\n");
      out.write("            <div class='navbar-inner' style=\"height: auto; text-align:  center;\">\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("                    <ul class=\"nav\" role=\"navigation\">\n");
      out.write("                        <li style=\" font-size: 18px; color: #ffffff; padding-top: 2%;\" ><a href=\"http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=");
out.print(fonFm);
      out.write("&backGrCol=");
out.print(BackGrCol);
      out.write("&fontCol=");
out.print(FontCol);
      out.write("\"> <img src=\"img/home.png\"><b> News</b></a></i></li>                      \n");
      out.write("                        <li ><a href=\"http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el\" target=\"_blank\">powered by <img src=\"img/logoNewSum2.png\"></a></li>\n");
      out.write("                        <li class=\"dropdown\"><a id=\"drop1\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" href=\"#\"><img src=\"img/settings2.png\"></a>\n");
      out.write("                            <ul class=\"dropdown-menu\" aria-labelledby=\"drop1\" role=\"menu\">\n");
      out.write("                                <li role=\"presentation\"><a role=\"menuitem\">Ελληνικά</a></li>\n");
      out.write("                                <li role=\"presentation\"><a role=\"menuitem\">English</a></li>\n");
      out.write("                                <li role=\"presentation\"><a role=\"menuitem\" href=\"http://www.scify.gr/site/en/support-us\" target=\"_blank\">developed by <img src=\"img/Scify-min.png\"></a></li>\n");
      out.write("                            </ul></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row-fluid\">\n");
      out.write("                <div class=\"span12\">\n");
      out.write("                    ");
      out.write("\n");
      out.write("                    ");

                        try {
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                            org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                            LinksData dl = NewSumInstance.getLinkLabels();
                            ArrayList<String> values = dl.getLinks();
                            CategoriesData categories = NewSumInstance.getCategories(values);
                    
      out.write("<table class=\"table \" style=\" text-align: center;\">");

    for (int u = 0; u < cats.size(); u++) {
        for (int color_ch = 0; color_ch < colors.size(); color_ch++) {
            if (u % colors.size() == color_ch) {
                        
      out.write("<tr class=\"warning1\"  style=\" background-color: #");
out.print(BackGrCol);
      out.write(";\" ><td><a onclick=\"showhide('");
out.print(u);
      out.write("')\" style=\" color: #");
out.print(colors.get(color_ch));
      out.write(";\"><b>");
out.print(cats.get(u));
      out.write("</b></a></td></tr>");

                                }
                            }
                            TopicsData topics = NewSumInstance.getTopics(values, cats.get(u));
                                        
      out.write("<tr id=\"");
out.print(u);
      out.write("\" class=\"warning1\" style=\" font-size: 15px; display:none;\"><td>");

    for (int TopTwo = 0; TopTwo < 2; TopTwo++) {

                                
      out.write("\n");
      out.write("                                <div>\n");
      out.write("                                    <a href=\"category.jsp?&c=");
out.print(u);
      out.write("&fonFm=");
out.print(fonFm);
      out.write("&col=");
out.print("ffffff");
      out.write("&backGrCol=");
out.print(BackGrCol);
      out.write("&fontCol=");
out.print(FontCol);
      out.write("\"  style=\" color: #");
out.print(FontCol);
      out.write(";\">");
out.print(topics.get(TopTwo).getTopicTitle());
      out.write("</a>\n");
      out.write("                                </div>\n");
      out.write("                                <hr style=\"height: 3px;\"/>");


                                    }
      out.write("</td></tr>");


                                          }
                                
      out.write("</table>");

                                    } catch (Exception ex) {
                                        // TODO handle custom exceptions here
                                        out.print(ex);
                                    }
                        
      out.write("\n");
      out.write("                        ");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
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
