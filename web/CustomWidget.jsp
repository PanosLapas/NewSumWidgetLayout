<%-- 
    Document   : CustomWidget
    Created on : 26 Ιουλ 2013, 9:43:33 πμ
    Author     : plapas
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.scify.NewSumServer.Server.JSon.*"%>
<%@page import="org.scify.NewSumServer.Server.Adaptor.*" %>
<%@page  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0;" >
        <link href="css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
        <title>Custom Widget</title>

        <%
            session.setAttribute("categories", "Τεχνολογία,Αθλητισμός,Επιστήμη,Οικονομία,Ελλάδα,Εκπαίδευση,SciFY News,Πολιτισμός");

        %>
        <script>
            var CatArray = new Array();//arxikopoihsh ths listas me tis kathgories
            var fontsz = 12;//arxikopoihsh font-size
            var fontfm = "sans-serif";//arxikopoihsh font-family
            var refTim = 1800;
            var backGrCol = "ffffff";
            var FontCol = "000000";
            var WidVal = 470;
            var HeiVal = 270;
            var thema = "light";
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
        <script>
            function CheckTheme(cTh) {
                thema = $(cTh).attr('id');
                //alert(thema);
            }
        </script>
        <script>
            function thisTheme(th) {
                if (thema === 'dark') {
                    backGrCol = '58595b';
                    FontCol = 'ffffff';
                    parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=" + fontfm + "&backGrCol=" + backGrCol + "&fontCol=" + FontCol + "&refresh=" + refTim;
                }
                else {
                    backGrCol = 'ffffff';
                    FontCol = '000000';
                    parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=" + fontfm + "&backGrCol=" + backGrCol + "&fontCol=" + FontCol + "&refresh=" + refTim;
                }
            }
        </script>
        <script>
            function addCat(c) {//prosthiki kathgorias
                var CatId = $(c).attr('id');
                var CatName = $(c).attr('value');
                var check = document.getElementById(CatId).checked;
                if (check === true) {//ean einai epilegmeno to checkbox tote prosthetoume thn kathgoria
                    CatArray.push(CatName);
                }
                if (check === false) {//ean den einai thn afairoume(periptwsh pou o xrhsths epilegei mia kathgoria kai sthn sunexeia thn vgazei)
                    for (var b = 0; b < CatArray.length; b++) {
                        if (CatArray[b] === CatName) {
                            CatArray.splice(b, 1);
                        }
                    }
                }
            }
        </script>
        <script>
            //Script for checking which category the user wants
            function thisCat() {
                //afou exoun epilegei oi kathgories patwntas to koumpi "Proepiskophsh" ginetai anenewsh tou iframe
                // window.open("http://localhost:8080/NewSumWebWidgetLayoutDummy/tst.jsp?&cat="+CatArray);//"http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=" + fontfm + "&backGrCol="+backGrCol+"&fontCol="+ FontCol + "&refresh="+refTim;
              
            }

        </script>
        <script>
            function getWidth(wid) {//apothikeuoume thn timh tou platous
                WidVal = $(wid).attr('value');
            }
        </script>
        <script>
            function getHeight(hei) {//apothikeuoume thn timh tou upsous
                HeiVal = $(hei).attr('value');
            }
        </script>
        <script>
            //Change width and height of the widget-frame
            function ChangeSize() {
                var fId = document.getElementById('white1');
                fId.style.width = WidVal;
                fId.style.height = HeiVal;

            }
        </script>
        <script>
            function getFamily(ffamily) {//apothikeuoume thn epilogh grammatoseiras
                fontfm = $(ffamily).attr('value');
            }
        </script>
        <script>
            function changeFonts() {
                //afou exoun epilegei h grammatoseira kai to megethos grammatoseiras,  patwntas to koumpi "Proepiskophsh" ginetai anenewsh tou iframe

                parent.white1.location.href = "http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=" + fontfm + "&backGrCol=" + backGrCol + "&fontCol=" + FontCol + "&refresh=" + refTim;
            }
        </script>
        <script>
            function getRefreshTime(time) {
                refTim = $(time).attr('value');
                refTim = refTim * 60;
            }
        </script>
        <script type="text/javascript">
            function Generate() {
                var gener = document.getElementById('white1');
                var src = $(gener).attr('src');
                src = "http://localhost:8080/NewSumWebWidgetLayoutDummy/index.jsp?rowscol=" + rowcol + "&backgroundcol=" + backgrcol + "&titlecol=" + titlecol + "&categories=" + CatArray + "&font-size=" + fontsz + "&font-family=" + fontfm + "&refresh=" + refTim;
                var w = gener.style.width;
                var h = gener.style.height;
                document.getElementById('CodeText').value = "<iframe src='" + src + "' width='" + w + "' height='" + h + "'>";
                //alert(src);
                //alert(w);
            }
        </script>
        <script type="text/javascript">
            function ClipBoard()
            {
                CodeText.innerText = copytext.innerText;
                Copied = holdtext.createTextRange();
                Copied.execCommand("RemoveFormat");
                Copied.execCommand("Copy");
            }
        </script>  

    </head>
    <body >
        <div class="container-fluid" style=" background-color: #ffffff;">
            <div class='navbar navbar-inverse'>
                <div class='navbar-inner nav-collapse' style="height: auto; text-align:  center;">
                    <ul class="nav">
                        <li ><a href="http://www.scify.gr/site/el/our-projects-el/completed-projects-el/newsum-el" target="_blank">NewSum  <img src="img/logoNewSum2.png"></a></li>
                        <li style=" padding-top: 1%;"><a  onclick="showhide('categories')">Επιλογή Κατηγοριών</a></li>
                        <li style=" padding-top: 1%;"><a onclick="showhide('color')">Επιλογή χρωμάτων</a></li>
                        <li style=" padding-top: 1%;"><a onclick="showhide('size')">Επιλογή μεγέθους</a></li>
                        <li style=" padding-top: 1%;" ><a onclick="showhide('font')">Επιλογή γραμματοσειράς</a></li>
                        <li style=" padding-top: 1%;" ><a onclick="showhide('refresh')">Auto - refresh</a></li>
                        <li ><a href="http://www.scify.gr/site/el/support-us-el" target="_blank">powered by <img src="img/Scify-min.png"></a></li>
                    </ul>
                </div>
            </div>                       
            <h3 style=" text-align:  center;">Διαμορφώστε το widget σύμφωνα με το δικό σας site !</h3>

            <div class="span5">
                <div id="white" >
                    <iframe id="white1" name="white1" src="http://localhost:8080/NewSumWebWidgetLayoutDummy/BasicLayout.jsp?&font-family=Arial,sans-serif&backGrCol=ffffff&fontCol=000000"   width="470" height="270"></iframe> 
                </div><br><br><br><br><br><br><br>
            </div>

            <div class="span6" id="color" style=" display: none; padding-left: 15%;">
                <br>
                <h5>Επιλογή Θέμα</h5>
                <br><br>
                <select>
                    <option id="dark" onclick="CheckTheme(this)">Dark theme</option>
                    <option id="light" onclick="CheckTheme(this)">Light theme</option>
                </select>
                <br><br><br>
                <input type="submit" id="checked" onclick="thisTheme(this)"  class="btn btn-primary" value="Προεπισκόπηση">
            </div>

            <div class="span6" id="categories" style=" padding-left: 15%; display: none;">
                <form name="form1" id="form1" method="post" action="CustomWidget.jsp">
                    <br>
                    <h5>Επιλογή Κατηγοριών</h5>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="tech" value="Τεχνολογία">
                    Τεχνολογία
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="science" value="Επιστήμη">
                    Επιστήμη
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="sports" value="Αθλητισμός">
                    Αθλητισμός
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="hellas" value="">
                    Ελλάδα
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="world" value="">
                    Κόσμος
                    <br>               
                    <input type="checkbox" onclick="addCat(this)" name="s" id="scify" value="SciFY News">
                    SciFY News
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="general" value="">
                    Γενικά
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="economy" value="">
                    Οικονομία
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="edu" value="">
                    Εκπαίδευση
                    <br>
                    <input type="checkbox" onclick="addCat(this)" name="s" id="civil" value="">
                    Πολιτισμός
                    <br>
                    <br>
                    <button type="submit" id="checked" class="btn btn-primary" onclick="thisCat()" >Προεπισκόπηση</button>
                </form>
            </div>

            <div class="span6" id="size" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Πλάτος</h5>
                <select>
                    <%for (int w = 200; w < 1201; w++) {%> 
                    <option id="w<%out.print(w);%>" onclick="getWidth(this)"><%out.print(w + "px");%></option>
                    <%}%>
                </select><br>
                <br>
                <h5>Ύψος</h5>
                <select>
                    <%for (int h = 200; h < 1201; h++) {%> 
                    <option id="h<%out.print(h);%>" onclick="getHeight(this)"><%out.print(h + "px");%></option>
                    <%}%>
                </select>
                <br><br><br>
                <button type="submit" onclick="ChangeSize()" class="btn btn-primary">Προεπισκόπηση</button>
            </div>

            <div class="span6" id="font" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Επιλέξτε γραμματοσειρά</h5>
                <select>
                    <option onclick="getFamily(this)">Arial, sans-serif</option>
                    <option onclick="getFamily(this)">Helvetica, sans-serif</option>
                    <option onclick="getFamily(this)">Tahoma, sans-serif</option>
                    <option onclick="getFamily(this)">Palatino, serif</option>
                    <option onclick="getFamily(this)">New Century Schoolbook, serif</option>
                    <option onclick="getFamily(this)">"Times New Roman",Serif</option>
                    <option onclick="getFamily(this)">Oldtown, fantasy</option>
                    <option onclick="getFamily(this)">'21st Century', fantasy</option>
                    <option onclick="getFamily(this)">"Lucida Console", Monaco, monospace</option>
                    <option onclick="getFamily(this)">Fixed, monospace</option>
                    <option onclick="getFamily(this)">Courier New Lucida Console</option>
                </select>
                <br><br><br>
                <button type="submit" onclick="changeFonts()" class="btn btn-primary">Προεπισκόπηση</button>
            </div>   

            <div class="span6" id="refresh" style=" padding-left: 15%; display: none;">
                <br>
                <h5>Επιλέξτε το χρόνο αυτόματης ανανέωσης του widget (mins)</h5>
                <select>
                    <option>30 mins</option>
                    <%for (int m = 5; m < 61; m++) {%> 
                    <option  id="m<%out.print(m);%>" onclick="getRefreshTime(this)"><%out.print(m);%></option>
                    <%}%>
                </select>
                <button type="submit" onclick="refresh()" class="btn btn-primary">Αποθήκευση</button>
            </div>

            <div class="span6"id="code" style=" padding-left: 15%; height: 100%;">
                <br>
                <h5>Κάντε copy-paste τον κώδικα στο σημείο που θέλετε στο site σας και το widget είναι έτοιμο </h5>
                <div class="form-actions" id="generatedCode">
                    <input type="button" onclick="Generate()" value="Παραγωγή κώδικα">
                    <textarea readonly="readonly" id="CodeText" name="CodeText" style="width: 100%;"></textarea>
                </div>
            </div>

        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scify.index.js"></script>
    </body>
</html>
