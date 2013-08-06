package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.scify.NewSumServer.Server.JSon.LinksData;
import org.scify.NewSumServer.Server.JSon.CategoriesData;
import org.scify.NewSumServer.Server.Adaptor.NewSumInstance;
import java.util.ArrayList;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String RefTime = request.getParameter("refresh");
    response.setHeader("Refresh", RefTime);
    String separator1 = null;
    String separator2 = null;
    //String separator3 = null;
      out.write('\n');


    //ArrayList categori = (ArrayList) request.getParameter("df");
    //ArrayList categories = (ArrayList) request.getParameter("category");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8; width=device-width, initial-scale=1.0;\" >\n");
      out.write("\n");
      out.write("        <link href=\"css/bootstrap/bootstrap-responsive.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/bootstrap/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <title>NewSum Widget</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body >\n");
      out.write("\n");
      out.write("        <div class='navbar'>\n");
      out.write("\n");
      out.write("            <div class='navbar-inner' >\n");
      out.write("                <ul class=\"nav\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <li style=\" padding-top: 0.5%;\"><a href=\"http://www.scify.gr/site/en/support-us\" target=\"_blank\"><img src=\"img/Scify-min.png\"></a></li>\n");
      out.write("\n");
      out.write("                    <li><img src=\"img/gr.png\" style=\" padding-top: 50%;\"><img style=\" padding-left: 1%;\" src=\"img/us.png\"></li>\n");
      out.write("\n");
      out.write("                    <li><p class=\"navbar-text pull-right\" style=\" margin-top: 12%; padding-left: 10%;\"><a onclick=\"resize(1)\" href=\"javascript:void(0);\"><i class=\"icon-plus icon-black\"></i></a><a onclick=\"resize(-1)\" href=\"javascript:void(0);\"><i class=\"icon-minus icon-black\"></i></a><i class=\"icon-text-height icon-black\" title=\"Άλλαξε το μέγεθος των γραμμάτων\" data-toggle=\"tooltip\"></i></p></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>    \n");
      out.write("<form name=colorform>\n");
      out.write("                   \n");
      out.write("                        <table cellpadding=2 cellspacing=0 style=\"border: 1px black;\">\n");
      out.write("                      \n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("        ");
      out.write("<hr/>\n");
      out.write("        ");

            try {
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service service = new org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService_Service();
                org.scify.newsumserver.server.newsumfreeservice.NewSumFreeService port = service.getNewSumFreeServicePort();
                // TODO initialize WS operation arguments here

                LinksData dl = NewSumInstance.getLinkLabels();
                ArrayList<String> values = dl.getLinks();
                CategoriesData categories = NewSumInstance.getCategories(values);
                for(String each : categories)
                    out.print(each);
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        
      out.write("\n");
      out.write("        ");
      out.write("<hr/>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/scify.index.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write(" ");
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
