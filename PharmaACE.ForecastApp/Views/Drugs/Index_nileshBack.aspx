﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/KMSite.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PharmaACE.ForecastApp.Models.Drug>>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Drugs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%--    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />--%>
<%--    <link href="../../Content/CSS/bootstrap-select.min.css" rel="stylesheet" />--%>
    <%--<script src="../../Scripts/export/buttons.flash.min.js"></script>
    <script src="../../Scripts/export/buttons.html5.min.js"></script>
    <script src="../../Scripts/export/dataTables.buttons.min.js"></script>
    <script src="../../Scripts/export/buttons.print.min.js"></script>
        <link href="../../Scripts/export/buttons.dataTables.min.css" rel="stylesheet" />--%>
<%--    <link href="../../Scripts/export/buttons.dataTables.css" rel="stylesheet" />--%>
    <script src="../../Scripts/export/dataTables.tableTools.min.js"></script>
        <script src="../../Scripts/export/copy_csv_xls_pdf.swf"></script>

<%--    <a href="../../Scripts/export/copy_csv_xls_pdf.swf">../../Scripts/export/copy_csv_xls_pdf.swf</a>--%>
    <script src="../../Scripts/export/dataTables.buttons.min.js"></script>
    <script src="../../Scripts/export/buttons.flash.min.js"></script>
    <script src="../../Scripts/export/jszip.min.js"></script>
    <script src="../../Scripts/export/pdfmake.min.js"></script>
    <script src="../../Scripts/export/vfs_fonts.js"></script>
    <script src="../../Scripts/export/buttons.html5.min.js"></script>
    <script src="../../Scripts/export/buttons.print.min.js"></script>


     <script src="../../Scripts/lib/jquery/jquery-ui.js"></script>
    <script src="../../Scripts/lib/jquery/typeahead.bundle.min.js"></script>
    <script src="../../Scripts/lib/jquery/typeahead.tagging.js"></script>
    <link href="../../Content/CSS/typeahead.tagging.css" rel="stylesheet" />
           <%: Styles.Render("~/Content/KMDrugCSS") %>
<style>
    ul.tagging_ul li.tagging_tag:hover{cursor:pointer;}
    .ui-autocomplete{background-color:#ddd !important; z-index:9999;}
.ui-autocomplete li:hover{color: #ffffff!important;background-color:#0097cf!important;}
.ui-autocomplete li:focus, .ui-autocomplete li:active{color: #ffffff!important;background-color:#0097cf!important;}
.nav-tabs>li>a{
    padding:6px 23px;
}
#patenttab .nav-tabs>li.active>a:after{
    display:none;
}
#patenttab .nav-tabs li:last-child{
    border-bottom: 1px solid #e6e6e6;
}
#patenttab .nav-tabs
{border-right:0px;}
#patenttab{
    margin-top: 4px;
}

#exclusiveinfoable{
    width:100%;
}

 #sectionB table, th, td {
    border: 1px solid #e6e6e6;
    text-align: center;
     padding: 5px;
     border-radius:4px;
    
}
 #sectionD table, th, td {
    border: 1px solid #e6e6e6;
    text-align: center;
     padding: 5px;
    
}
  #sectionE table, th, td {
    border: 1px solid #e6e6e6;
    text-align: center;
     padding: 5px;
    
}
 .divd1{margin-top:8px;}
.textareasize{resize:none;}
.divd2{width:682px;}

 .ui-autocomplete > li.ui-state-focus {
  background-color: #0097cf!important;
  color: #ffffff!important;
}
</style>
   
    <div id="popalert" class="modal" style="overflow: visible;" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <p style="text-align: center"></p>
                </div>
            </div>
        </div>
    </div>
    <div class="container " id="contentbox">

        <div class="reportdynamidiv" id="kmoverlayid">
            <div id="Search"><% Html.RenderPartial("_Search"); %>
                <%--<% Html.RenderAction("RenderSearch","Drugs"); %>--%>
                <%if(Session["RoleId"] != null)%>
                           <%if(int.Parse(Session["RoleId"].ToString())== 3 || int.Parse(Session["RoleId"].ToString()) == 2){ %>
               <button type="button" class="btn btn-default" data-toggle="modal" role="button" id="addDurgs1"  data-target='#addDurgs'>Add Inline Drugs</></button>
                  <% } %>
                               <button type="button" class="btn btn-default" data-toggle="modal" role="button" id="patent"  data-target='#addPatent'>Add Drugs Patent</></button>
            </div>
            <div id="SearchResult" class="kmBox19"></div>
            <br />
            <br />
            <div class="kmBox20">
                <img src="../../Content/img/ajax-loader.gif" id="loading-indicator" style="display: none" />
            </div>
        </div>
    </div>
    <div class="modal" id="addDurgs" tabindex="-1" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title custom_align" id="Heading">Add Inline Durgs Information</h4>
                </div>
                <div style="overflow-y:scroll;height:513px; cursor:pointer;">
                <form class="form" role="form" id="addDrugsform" name="form1">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Application Short No.</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="applicationshortno" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product ID</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="productid" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product NDC</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="productndc" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product Code</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="productcode" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product Name</label>
                                <div class="col-md-8">
                                    <div class="ui-widget">
                                    <input class="form-control" id="productname" type="text"  required />
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Company Name</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="companyname" type="text" required/>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Marketing Partner</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="marketingpartner" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product Category</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="productcategory" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Molecule</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" id="molecule" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Substance</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="substance" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Form</label>
                                <div class="col-md-8 ">
                                    <input class="form-control" id="form" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Strength</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="strength" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Route of Administration</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="routeofadministration" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Disease Area</label>
                                <div class="col-md-8" id="diseaseareaarray">
                                    <input class="form-control tags-input" id="diseasearea" type="text" style="display: none;" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Indication</label>
                                <div class="col-md-8" id="indicationarray">
                                     <div class="ui-widget">
                                                        <input id="indication" required="required" class="form-control tags-input" value="" style="display: none;">
                                              
                                                 </div>
                                    <%--<input class="form-control tags-input" id="indication" type="text" required />--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Sub Indication</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" id="subindication"  required ></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Dosage Adult</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="dosageadult" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Dosage Pediatric</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="dosagepediatric" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Price</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="price" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Pricing Unit</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pricingunit" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Price Source</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pricesource" type="text" required />
                                </div>
                            </div>
                        </div>
                     <%--   <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">PI Link</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pilink" type="text" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">PI Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pidate" type="text" />
                                </div>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Pharma Class</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pharmaclass" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Pharma Class 2</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pharmaclass2" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Pharma Class 3</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="pharmaclass3" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">IMS Class</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="imsclass" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">MoA</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="moa" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Approval Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="approval" type="date" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Start Marketing Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="startmarketingdate" type="date" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Product Type</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="producttype" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Drug Type</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="durgstype" type="text" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Marketing Status</label>
                                <div class="col-md-8">
<%--                                    <input class="form-control" id="marstatus" type="text" />--%>

                                    <select id="marstatus" style="width:100%;">
                                        <option>Please Select</option>
                                        <option value="0">Prescription</option>
                                        <option value="1">Discontinued</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Latest Label Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="latestlabeldate" type="date" />
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">RLD</label>
                                <div class="col-md-8">
                                    <input  name="rld"  value="1" type="radio" checked>Yes
                                     <input name="rld" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">TE Code</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="tecode" type="text" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
<%--                          <input type="submit" class="btn btn-primary" id="validationdurgs"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary" onclick="addInlineDurgs();" value="Save" />
                    </div>
                </form>
                    </div>
            </div>
        <!-- /.modal-content -->
    </div>
                  <!-- /.modal-dialog -->
               </div>
    <div class="modal" id="addPatent" tabindex="-1" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content divd2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2 class="modal-title custom_align" id="Heading1">Add Patent Information </h2>
                    <div id="patenttab">
                         <ul class="nav nav-tabs" id="tablist">
                        <li class="active">
                            <a   href="#sectionA" data-toggle="tab" ><b>Generic Availability</b></a>
                        </li>
                        <li class="">
                            <a data-toggle="tab" class="" id="secb"  href="#sectionB" ><b>API Info</b></a>
                        </li>
                              <li class="">
                            <a data-toggle="tab" class="" id="secc"  href="#sectionC" ><b>Sale Info</b></a>
                        </li>
                              <li class="">
                              <a data-toggle="tab" class="" id="secd" href="#sectionD" onclick="showExclusivityInfoTab();" ><b>Exclusivity Info</b></a>
                        </li>
                              <li class="">
                            <a data-toggle="tab" class="" id="sece"  href="#sectionE" ><b>Patent Info</b></a>
                        </li>
                    </ul>
                    </div>

                </div>
                <div class="tab-content">
               <div style="cursor:pointer;" id="sectionA" class="tab-pane fade in active">
                <form class="form" role="form"  name="form1">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Generic Availability</label>
                                <div class="col-md-8 divd1">
                                     <input  name="genericavailability"  value="1" type="radio" checked>Yes
                                     <input name="genericavailability" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">FTF Filing date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="ftffillingdate" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">FTF Approval Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="ftfapprovedate" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">FTF Launch Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="ftflaunchdate" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">FTF Holder</label>
                                <div class="col-md-8">
                                    <div class="ui-widget">
                                                        <input id="ftfholder" required="required" class="form-control tags-input" value="" style="display: none;">
                                                 </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Generic Players</label>
                                <div class="col-md-8">
                                    <input class="form-control tags-input" id="genericplayer" style="display: none;"  required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Authorized Generic</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="authorizedgeneric" type="text" required/>
                                </div>
                            </div>
                        </div> 
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                          <%--<input type="submit" class="btn btn-primary" id="validationdurgs"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary" onclick="Savepatent();"  value="Save" />
                    </div>
                    
                </form>
                    </div>
               <div style="cursor:pointer;" id="sectionB" class="tab-pane fade">
               <div class="form-group" >
                    <table id="apitable" class="table table-striped">
                        <tr>
                            
                            <th>Submission Date</th>
                            <th>DMF Holder Name</th>
                            <th>DMF Status</th>
                            <th>ANDA Holder Against DMF</th>
                            <th>Org Commercializes Product in US</th>
                            <th></th>
                        </tr>

                    </table>
                   </div>
                    <form class="form" role="form"  name="form1">
                         
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Submission Date </label>
                                <div class="col-md-8">
                                    <input class="form-control" id="submissiondate" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">DMF Holder Name</label>
                                <div class="col-md-8 ui-widget">                                                
                                    <input class="form-control tags-input" id="dmfholdername" type="text" required  style="display: none;"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-3">DMF Status</label>
                                <div class="col-md-3 divd1">
                                    <input  name="dmfstatus" class="control-label " value="1" type="radio" checked/>Active
                                     <input name="dmfstatus"  class="control-label" value="0" type="radio"/>Inactive
                                   
                                </div>
                                
                            <%--</div>
                        </div>
                        <div class="form-group">
                            <div class="row">--%>
                                <label class="control-label col-md-4">ANDA Holder Against DMF</label>
                                <div class="col-md-2 divd1">
                                    <input  name="andaholder"  value="1" type="radio" checked>Yes
                                     <input name="andaholder" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-6">Org Commercializes Product in US</label>
                                <div class="col-md-4 divd1">
                                    <div class="ui-widget">
                                        <input  name="orgcomm"  value="1" type="radio" checked>Yes
                                     <input name="orgcomm" value="0" type="radio">No
                                        </div>
                                </div>
                                <div class="col-md-2">
                                 <input type="button" class="btn btn-primary"  onclick="addApiData();" value="Add" />
                                    </div>
                            </div>
                        </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                          <input type="submit" class="btn btn-primary" id="validationdurgs1"  style="display:none" />
                        <input type="button" class="btn btn-primary"  value="Save" />
                    </div>
                </form>
                    </div>
                <div style="cursor:pointer;" id="sectionC" class="tab-pane fade">
                <form class="form" role="form"  name="form1">   
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Current Year </label>
                                <div class="col-md-8">
                                    <input class="form-control" id="currentyear" type="number" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Previous Year</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="previousyear" type="number" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">% Change</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="change" type="number" required />
                                </div>
                            </div>
                        </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                         <%-- <input type="submit" class="btn btn-primary" id="validationdurgs1"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary" value="Save" />
                    </div>
                </form>
                    </div>
               <div style="cursor:pointer;" id="sectionD" class="tab-pane fade">
                    <div class="form-group" >
                    <table id="exclusiveinfoable"  class="table table-striped" >
                        <tr>
                            <th>Exclusivity</th>
                            <th>Expiry</th>
                            <th>Description</th>
                            <th></th>
                        </tr>
                    </table>
                        </div>
                <form class="form" role="form"  name="form1">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-2">Exclusivity</label>
                             <div class="col-sm-4">
                                 <select id="exclusivitydrop" style="width:100%;" onchange="showExclusivityDescription();">
                                        <option>Please Select</option>
                                       
                                    </select>

                            </div>
                                <label class="control-label col-md-2">Expiry Date</label>
                                <div class="col-md-4">
                                    <input class="form-control" id="expirydate1" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-2">Description</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" readonly id="description"  required ></textarea>
                                </div>
                                <div class="col-md-2">
                                 <input type="button" class="btn btn-primary"  onclick="addExlusivityInfo();" value="Add" />
                                    </div>
                            </div>
                        </div>
                      <%--  <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-3">Expiry Date</label>
                                <div class="col-md-7">
                                    <input class="form-control" id="expirydate1" type="date" required />
                                </div>
                                
                            </div>
                        </div>--%>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                         <%-- <input type="submit" class="btn btn-primary" id="validationdurgs1"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary"  value="Save" />
                    </div>
                </form>
                    </div>
                <div style="cursor:pointer;" id="sectionE" class="tab-pane fade">
                    <div class="form-group" >
                    <table id="patentinfotable"  class="table table-striped" >
                        <tr>
                            <th>Patent No.</th>
                            <th>Type of Patent</th>
                            <th>Patent Use Code</th>
                            <th>Expiry Date</th>
                            <th>PTE Granted</th>
                             <th>Independent Claims</th>
                             <th>Delist Requested</th>
                             <th>Patent Licensing Info.</th>
                            <th></th>
                        </tr>
                    </table>
                        </div>
                <form class="form" role="form"  name="form1">
                  
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Patent No.</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="patentno" type="text" required />
                                </div>
                            </div>
                        </div>
                  
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Type of Patent</label>
                                <div class="col-md-8">
                                     <select id="typeofpatent" style="width:100%;" required>
                                        <option disabled>Please Select</option>
                                        <option value="0">MOU</option>
                                        <option value="1">Formulation</option>
                                        <option value="2">Polymorph</option>
                                        <option value="3">Combination</option>
                                          <option value="4">Composition and MOU</option>
                                          <option value="5">Prodrug</option>
                                     </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Patent Use Code</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" id="patentusecode"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Expiry Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="expirydate" type="date" required />
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">PTE Granted</label>
                                <div class="col-md-8 divd1">
                                    <input  name="ptegranted"  value="1" type="radio" checked>Yes
                                     <input name="ptegranted" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Independent Claims</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" id="independentclaims" ></textarea>
                                </div>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Delist Requested</label>
                                <div class="col-md-8 divd1">
                                      <input  name="delistrequested"  value="1" type="radio" checked>Yes
                                     <input name="delistrequested" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Patent Licensing Info</label>
                                <div class="col-md-6">
                                    <textarea class="form-control textareasize" id="patentlicensinginfo" ></textarea>
                                </div>
                                <div class="col-md-2">
                                 <input type="button" class="btn btn-primary"  onclick="addPatentInfo();" value="Add" />
                                    </div>
                            </div>
                        </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                         <%-- <input type="submit" class="btn btn-primary" id="validationdurgs1"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary"  value="Save" />
                    </div>
                </form>
                    </div>
                    </div>

            </div>
        <!-- /.modal-content -->
    </div>
                  <!-- /.modal-dialog -->
               </div>


   
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsSection" runat="server">  
    <script type="text/javascript" src="../../Scripts/lib/jquery/jquery.easy-overlay.js"></script>
<script type="text/javascript" src="../../Scripts/custom/PharmaACE.ForecastApp.Utility.js"></script>
    <script src="../../Scripts/lib/jquery/jquery-ui.js"></script>
    <script>
       
            
       
        $('#exportall').css("display", "block");
        var autocompleteListData;
        var productNameList = [];
        var pharmaClassNameList = [];
        var indicationNameList = [];
        var indicationNameList1 = [];
        var moleculeNameList = [];
        var companyNameList = [];
        var companyNameList1 = [];
        var productCategoryList = [];
        var substanceList = [];
        var formList ="";
        var roaList = [];
        var diseaseAreaList = [];
        var moaList = [];
        var productTypeList = [];
        var priceUnitList = [];
        var priceSourceList = [];
        var drugsTypeList = [];
        var strengthList = [];
        var IsBothChecked = false;
        var jsonData;
        var exclusivityData = [];
        var patentInfoData = [];

        function getFormattedDate(fdate)
        {
            var r = new Date(parseInt(GenericData.FTFfilingDate.substr(6)));
            var d = ("0" + r.getDate()).slice(-2);
            var m = ("0" + (r.getMonth() + 1)).slice(-2);
            var dt = r.getFullYear() + "-" + (m) + "-" + (d);
            return dt;


        }

        function setGenericAvailability(GenericData)
        {
          
            var fillingDate =getFormattedDate(GenericData.FTFfilingDate);
            var ftfApprovalDate = getFormattedDate(GenericData.FTFApprovalDate);
            var ftfLaunchDate = getFormattedDate(GenericData.FTFLaunchDate);

            //var Generic = {
            //    Id: 1,
                //GenericAvailability: rad;
                //InlineTrasnactionId: 1;
            $("#ftffillingdate").val(fillingDate);
            $("#ftfapprovedate").val(ftfApprovalDate);
            $("#ftflaunchdate").val(ftfLaunchDate);
            
            //    FTFHolders: getFTFHolders(),
            //    GenericPlayers: getGenericsPlayers(),
            //    AuthorisedGenerics: getAuthorisedGenerics(),
            //}
        }

       

        function fillPatentPopup(currentDrug) {
            var inlineId = $(currentDrug).parent().parent().attr('inlineId');
            alert(inlineId);

            PHARMAACE.FORECASTAPP.SERVICE.getJsonData("/Drugs/FetchPatentDetails", { inlineTransId: inlineId },
            function (result) {
                if (result.success) {
                    debugger;
                    if (result.result != null)
                    {
                        debugger;
                        setGenericAvailability(result.result.generic);
                    }
                    //if (result.userForShare.length == 0) {

                    //}
                    //else if (result.userForShare.length > 0) {

                    //    $("#btnShowShare").click();
                    //    populateSharePopupWithFetchedData(result.userForShare, fileForShare, fileLineage);

                    //}
                }

                else
                    PHARMAACE.FORECASTAPP.UTILITY.popalert("Fetching contents failed: " + result.errors.join(), '');
            },
           function (result) {
               PHARMAACE.FORECASTAPP.UTILITY.popalert("Fetching contents failed! " + result.responseText, '');
           });





        }



        function getAuthorisedGenerics() {

            var ul = $("#authorizedgeneric").parent()[0].getElementsByTagName("ul");

            var li = ul[0].getElementsByTagName("li");

            var AuthorisedGenerics = [];

            for (var i = 0; i < li.length - 1 ; i++) {

                //if (AuthorisedGenerics=="") {
                //    AuthorisedGenerics =  li[i].firstChild.nodeValue;//nnerText;
                //}
                //else {
                    AuthorisedGenerics.push(li[i].firstChild.nodeValue);
                   // AuthorisedGenerics =  + ">" + li[i].firstChild.nodeValue;//nnerText;
               // }
            }
            return AuthorisedGenerics;

        }

        function getGenericsPlayers() {

            var ul = $("#genericplayer").parent()[0].getElementsByTagName("ul");

            var li = ul[0].getElementsByTagName("li");

            var GenericsPlayers = [];

            for (var i = 0; i < li.length - 1 ; i++) {

                //if (GenericsPlayers == "") {
                //    GenericsPlayers = li[i].firstChild.nodeValue;
                //}
                //else {
                     GenericsPlayers.push(li[i].firstChild.nodeValue);
              //  }
            }
            return GenericsPlayers;

        }

        function getFTFHolders() {

            var ul = $("#ftfholder").parent()[0].getElementsByTagName("ul");

            var li = ul[0].getElementsByTagName("li");

            var FTFHolders = [];

            for (var i = 0; i < li.length - 1 ; i++) {

                //if (FTFHolders == "") {
                //    FTFHolders = li[i].firstChild.nodeValue;
                //}
                //else {
                     FTFHolders.push(li[i].firstChild.nodeValue);
               // }
            }
            return FTFHolders;

        }

        function buildSaleInfoObject(currentYear, previousyear, percentChange) {
            var salesInfo;

            salesInfo = {
                CurrentYear: currentYear,
                PrevYear: previousyear,
                Change: percentChange,

            };
            return salesInfo;

        }

        function saveSalesInfo() {
            currentYear = (document.getElementById("currentyear").value).trim();
            PrevYear = (document.getElementById("previousyear").value).trim();
            percentChange = (document.getElementById("change").value).trim();

            return buildSaleInfoObject(currentYear, PrevYear, percentChange);

        }

        function getExclusivityInfo() {
            var table = $("#exclusiveinfoable table tbody");

            table.find('tr').each(function (key, val) {
                $(this).find('td').each(function (key, val) {
                    
                    var exclusivity =  $("#exclusivity").val();
                    var description = $("#description").val();
                    var expirydate1 = $("#expirydate1").val();

                    });
            });

             
            var Generic = {
                Id: 1,
                GenericAvailability: rad,
                InlineTrasnactionId: 1,
                FTFfilingDate: $("#ftffillingdate").val(),
                FTFApprovalDate: $("#ftfapprovedate").val(),
                FTFLaunchDate: $("#ftflaunchdate").val(),
                FTFHolders: $("#ftfholder").val(),
                GenericPlayers: $("#genericplayer").val(),
                AuthorisedGenerics: $("#authorizedgeneric").val(),
            }
    
        }

        function buildExclusivityDataObject(Exclusivity, Expiry, Description) {
            var ExclusivityData;

            ExclusivityData = {

                Exclusivity: Exclusivity,
                Expiry: Expiry,
                Description: Description,

            }
            return ExclusivityData;
        }

        function buildPatentInfoObject(patentNo, typeOfPatent, patentUseCode, expiryDate, PteGranted, independentClaims, delistRequested, patentLicensingInfo) {
            var patentInfoObject = "";
            patentInfoObject =
                {
                    PatentNo: patentNo,
                    TypeOfPatent: typeOfPatent,
                    PatentUseCode: patentUseCode,
                    ExpiryDate: expiryDate,
                    PTEGranted: PteGranted,
                    IndependentClaims: independentClaims,
                    DelistRequested: delistRequested,
                    PatentLicensingInfo: patentLicensingInfo

                }
            return patentInfoObject;


        }

        function savePatentInfoData() {

            
            $('#patentinfotable').find('tr').each(function () {
                if (this.rowIndex != 0) {
                    var patentNo = $(this).find('td:first')[0].innerText;
                    var typeOfPatent = $(this).find('td:eq(1)')[0].innerText;
                    var patentUseCode = $(this).find('td:eq(2)')[0].innerText;
                    var expiryDate = $(this).find('td:eq(3)')[0].innerText;
                  //  var PteGranted = $(this).find('td:eq(4)')[0].innerText;
                    var PteGranted = 1;
                    if ( $(this).find('td:eq(4)')[0].innerText == "Yes") {
                        PteGranted = 1;
                    }
                    else {
                        PteGranted = 0;
                    }
                   
                    var independentClaims = $(this).find('td:eq(5)')[0].innerText;
                    //var delistRequested = $(this).find('td:eq(6)')[0].innerText
                    if ($(this).find('td:eq(6)')[0].innerText == "No") {
                        delistRequested = 1;
                    }
                    else {
                        delistRequested = 0;
                    }


                    var patentLicensingInfo = $(this).find('td:eq(7)')[0].innerText

                    patentInfoData.push(buildPatentInfoObject(patentNo, typeOfPatent, patentUseCode, expiryDate, PteGranted, independentClaims, delistRequested, patentLicensingInfo));
                }
            });

        }


        var exclusivityDataArr = "";

        function showExclusivityInfoTab() {
            var length = $('#exclusivitydrop > option').length;
            if (length <= 1) {
                exclusivityDataArr = "";
                PHARMAACE.FORECASTAPP.SERVICE.getJsonData("/Drugs/GetExclusivityData", {},
                         function (result) {
                             if (result.success) {
                                 exclusivityDataArr = result.result;
                                 for (var i = 0; i < result.result.length; i++) {
                                     $('#exclusivitydrop').append('<option>' + result.result[i].Exclusivity + '</option>');

                                 }

                             }
                             else {

                             }

                         },
                          function (result) {
                              PHARMAACE.FORECASTAPP.UTILITY.popalert("Failed! " + result.responseText, '');

                          });
            }
        }

        function showExclusivityDescription() {
            var flag = 0;
            var exclusivity = document.getElementById('exclusivitydrop').value;

            for (var i = 0; i < exclusivityDataArr.length; i++) {
                if ((exclusivityDataArr[i].Exclusivity).trim() == exclusivity.trim()) {
                    document.getElementById('description').value = exclusivityDataArr[i].Description;
                    flag = 1;
                    break;
                }


            }
            if (flag == 0) {
                document.getElementById('description').value = "";
            }
        }


        function createExclusivityInfo() {

            $('#exclusiveinfoable').find('tr').each(function () {

                if (this.rowIndex!=0) {
                    var Exclusivity = $(this).find('td:first')[0].innerText;
                    var Expiry = $(this).find('td:eq(1)')[0].innerText;
                    var Description = $(this).find('td:eq(2)')[0].innerText;

                    exclusivityData.push(buildExclusivityDataObject(Exclusivity, Expiry, Description));

                }
               
            });

        }

        function Savepatent() {

           // getAuthorisedGenerics();
            createExclusivityInfo();
            savePatentInfoData();

            var rad = $('input[name=genericavailability]').filter(':checked').val();
           

            var Generic = {
                Id: 1,
                GenericAvailability: rad,
                InlineTrasnactionId: 1,
                FTFfilingDate: $("#ftffillingdate").val(),
                FTFApprovalDate: $("#ftfapprovedate").val(),
                FTFLaunchDate: $("#ftflaunchdate").val(),
                FTFHolders: getFTFHolders(),
                GenericPlayers: getGenericsPlayers(),
                AuthorisedGenerics: getAuthorisedGenerics(),
            }
      
            var patent = {
                generic: Generic,
                saleInfo: saveSalesInfo(),
                exclusivity: exclusivityData,
                piData: patentInfoData
            }
          //  debugger;


            PHARMAACE.FORECASTAPP.SERVICE.traditionalPostJsonData("/Drugs/AddPatentDetails", JSON.stringify(patent),
                                                   function (result) {
                                                       if (result.success) {
                                                           PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('editableWorkSpace');
                                                          
                                                       }
                                                   },
                                                   function (result) {
                                                       PHARMAACE.FORECASTAPP.UTILITY.popalert("Failed! " + result.responseText, '');
                                                   });

         
        }




        $(document).ready(function () {
            
            PHARMAACE.FORECASTAPP.SERVICE.traditionalPostJsonData("/Drugs/GetAutocompleteListData", null,
                 function (data) {

                     productNameList = data.ProductList;
                     pharmaClassNameList = data.PharmaClassList;
                     indicationNameList = data.IndicationList.value;
                     moleculeNameList = data.MoleculeList;
                     autocompleteListData = productNameList;


                     companyNameList = data.CompanyList;
                     productCategoryList = data.ProductCategoryList;
                     substanceList= data.SubstanceList;
                     formList = data.FormList;
                     roaList = data.ROA_MasterList;
                    
                     moaList = data.MOA_MasterList;
                     productTypeList = data.ProductTypeList;
                     priceUnitList = data.PriceUnitList;
                     priceSourceList=data.PriceSourceList;
                     drugsTypeList=data.DrugsTypeList;
                     strengthList = data.StrengthList;

                     for (var i = 0; i < data.IndicationList.length; i++) {
                         indicationNameList1.push(data.IndicationList[i].value);
                     };
                     
                      for (var i = 0; i < data.DiseaseAreaList.length; i++) {
                          diseaseAreaList.push(data.DiseaseAreaList[i].value);
                      };
                      
                      for (var i = 0; i < data.CompanyList.length; i++) {
                          companyNameList1.push(data.CompanyList[i].value);
                      };
                     
                 },
                  function (data) {
                      //alert(data);
                  });
           
        });
            $("#searchInput").autocomplete({

                source: function (request, response) {
                   
                    var matches = $.map(autocompleteListData, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#searchInput").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#searchInput").val(ui.item.label);
                }
            });
            $("#productname").autocomplete({
                source: function (request, response) {
                   
                    var matches = $.map(productNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#productname").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#productname").val(ui.item.label);
                }
               
            });

            $("#pharmaclass").autocomplete({
                source: function (request, response) {

                    var matches = $.map(pharmaClassNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#pharmaclass").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#pharmaclass").val(ui.item.label);
                }

            });
            $("#pharmaclass2").autocomplete({
                source: function (request, response) {

                    var matches = $.map(pharmaClassNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#pharmaclass2").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#pharmaclass2").val(ui.item.label);
                }

            });
            $("#pharmaclass3").autocomplete({
                source: function (request, response) {

                    var matches = $.map(pharmaClassNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#pharmaclass3").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#pharmaclass3").val(ui.item.label);
                }

            });
            $("#imsclass").autocomplete({
                source: function (request, response) {

                    var matches = $.map(pharmaClassNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#imsclass").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#imsclass").val(ui.item.label);
                }

            });


            // Turn the input into the tagging input
            $('#indication').tagging(indicationNameList1);
            $('#diseasearea').tagging(diseaseAreaList);
            $('#authorizedgeneric').tagging(companyNameList1);
            $('#ftfholder').tagging(companyNameList1);
            $('#genericplayer').tagging(companyNameList1);
            $('#dmfholdername').tagging(companyNameList1);
           
            $("#molecule").autocomplete({
                source: function (request, response) {

                    var matches = $.map(moleculeNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#molecule").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#molecule").val(ui.item.label);
                }

            });
            $("#companyname").autocomplete({
                source: function (request, response) {

                    var matches = $.map(companyNameList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#companyname").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#companyname").val(ui.item.label);
                }

            });
            $("#dmfholdername").autocomplete({
                source: companyNameList1
            });
            $("#productcategory").autocomplete({
                source: function (request, response) {

                    var matches = $.map(productCategoryList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#productcategory").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#productcategory").val(ui.item.label);
                }

            });
            $("#substance").autocomplete({
                source: function (request, response) {

                    var matches = $.map(substanceList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#substance").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#substance").val(ui.item.label);
                }

            });
            $("#form").autocomplete({
                source: formList
//function (request, response) {

//                    var matches = $.map(formList, function (acItem) {
//                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
//                            return acItem;
//                        }
//                    });
//                    response(matches);
//                },
//                minLength: 1,
//                select: function (event, ui) {
//                    $("#form").val(ui.item.label);
//                },
//                focus: function (event, ui) {
//                    event.preventDefault();
//                    $("#form").val(ui.item.label);
//                }

            });
            $("#routeofadministration").autocomplete({
                source: function (request, response) {

                    var matches = $.map(roaList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#routeofadministration").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#routeofadministration").val(ui.item.label);
                }

            });
            $("#moa").autocomplete({
                source: function (request, response) {

                    var matches = $.map(moaList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#moa").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#moa").val(ui.item.label);
                }

            });
            $("#producttype").autocomplete({
                source: function (request, response) {

                    var matches = $.map(productTypeList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#producttype").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#producttype").val(ui.item.label);
                }

            });
            $("#pricingunit").autocomplete({
                source: function (request, response) {

                    var matches = $.map(priceUnitList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#pricingunit").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#pricingunit").val(ui.item.label);
                }

            });
            $("#pricesource").autocomplete({
                source: function (request, response) {

                    var matches = $.map(priceSourceList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#pricesource").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#pricesource").val(ui.item.label);
                }

            });
            $("#durgstype").autocomplete({
                source: function (request, response) {

                    var matches = $.map(drugsTypeList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#durgstype").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#durgstype").val(ui.item.label);
                }

            });
            $("#strength").autocomplete({
                source: function (request, response) {

                    var matches = $.map(strengthList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#strength").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#strength").val(ui.item.label);
                }

            });
      
            if ('<%=Session["returnBack"]%>' != null && '<%=Session["returnBack"]%>' == 'True') {
                PHARMAACE.FORECASTAPP.UTILITY.showOverlay("Getting your data", 'kmoverlayid', "15", "");
                var searchKey = '<%=Session["searchKey"]%>';
                var searchParam = '<%=Session["searchParam"]%>';
                var searchCondition = '<%=Session["searchCondition"]%>';
                var switchView = '<%=Session["switchView"]%>';
                var searchModule = '<%=Session["searchModule"]%>';
                $("#searchInput").val(searchKey);
                var dd = document.getElementById('search-filter-dropdown');
                for (var i = 0; i < dd.options.length; i++) {
                    if (dd.options[i].value === searchParam) {
                        dd.selectedIndex = i;
                        break;
                    }
                }

                if (searchModule == 0) {
                    $("#chkInline").prop('checked', true);
                    $("#chkPipeline").prop('checked', true);
                }
                else if (searchModule == 1) {
                    $("#chkInline").prop('checked', true);
                    $("#chkPipeline").prop('checked', false);
                }
                else if (searchModule == 2) {
                    $("#chkInline").prop('checked', false);
                    $("#chkPipeline").prop('checked', true);
                }

                PHARMAACE.FORECASTAPP.SERVICE.getHtmlData("/Drugs/GetDrugs", { searchKey: searchKey, searchParam: searchParam, searchCondition: searchCondition, switchView: switchView, searchModule: searchModule },
                    function (data) {
                        $('#SearchResult').hide();
                        PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                        var element = document.getElementById('SearchResult');
                        element.innerHTML = data;
                        PHARMAACE.FORECASTAPP.UTILITY.loadScriptsFromPartialView(element);
                        if (($("#tbltfoot") && $("#tbltfoot").length > 0)) {
                            PHARMAACE.FORECASTAPP.UTILITY.filteration(populateSummary);
                        }
                       
                       
                        $('#SearchResult').show();
                    },
                    function (status) {
                        PHARMAACE.FORECASTAPP.UTILITY.popalert(status);
                       
                        $('#SearchResult').show();
                    });
            }

          /*  $('input[type="checkbox"]').on('change', function () {
                var searchText = $("#searchInput").val();
                var selectedButtonstatus = $("#SearchResult   #example").length;
                    var chkinline = document.getElementById("chkInline").checked
                    var chkpipeline = document.getElementById("chkPipeline").checked;
                    if (searchText != "" || selectedButtonstatus != 0) {
                        
                        getDrugs($("#searchInput").val(), 1);
                    
                    return false;
                    }
                    else if ((chkinline) || (chkpipeline)) {
                        PHARMAACE.FORECASTAPP.UTILITY.popalert("Please enter search word..");
                    }
                    else {
                            pharmaace.forecastapp.utility.popalert("please select drug type..");
                        }      
            }); */

            $('input[type="checkbox"]').on('change', function () {
                var searchText = $("#searchInput").val();
                var selectedButtonstatus = $("#SearchResult   #example").length;
                var chkinline = document.getElementById("chkInline").checked
                var chkpipeline = document.getElementById("chkPipeline").checked;
                if (searchText != "" || selectedButtonstatus != 0 && ((chkinline) || (chkpipeline))) {

                    getDrugs($("#searchInput").val(), 1);

                    return false;
                }
                else if (!(chkinline) && !(chkpipeline)) {
                    PHARMAACE.FORECASTAPP.UTILITY.popalert("please select drug type..");
                }
                else {
                    pharmaace.forecastapp.utility.popalert("Please enter search text..");
                }
            });

            $('#searchbar').submit(function () {
                if (PreId != "")
                {
                    document.getElementById(PreId).style.backgroundColor = '#fff';
                }      
                var searchText = $("#searchInput").val();
                if (searchText != "") {

                    getDrugs($("#searchInput").val(), 1);
                    return false;
                } else {
                    PHARMAACE.FORECASTAPP.UTILITY.popalert("Please enter search text..");
                    return false;
                }
            });
            var count = 0;
            var PreId = "";
            $('#SearchABCD').on('click', '> *', function () {
                if (this.id != PreId){
                    onclick = document.getElementById(this.id).style.backgroundColor = '#d4d4d4';
                }
                if (count != 0 && this.id != PreId)
                {
                    onclick = document.getElementById(PreId).style.backgroundColor = '#fff';
               }
                count++;
                PreId = this.id;
                document.getElementById("searchInput").value= "";
                getDrugs(this.id, 2);    
            });
           
       
        function getDrugs(searchKey, condition) {
            $('#SearchResult').hide();
            PHARMAACE.FORECASTAPP.UTILITY.showOverlay("Getting your data", 'kmoverlayid', "15", "");
            var e = document.getElementById("search-filter-dropdown");
            var searchParam = e.options[e.selectedIndex].value;
            var searchModule = null;
            var chkinline = document.getElementById("chkInline").checked
            var chkpipeline = document.getElementById("chkPipeline").checked;
            if ((chkinline) && (chkpipeline))
            {
                searchModule = 0;
                IsBothChecked = true;
            }

            if ((!chkinline) && (chkpipeline))
            {
                searchModule = 2;
                IsBothChecked = false;
            }                
            else if ((chkinline) && (!chkpipeline))
            {
                IsBothChecked = false;
                searchModule = 1;
            }                
            if (searchModule != null) {
                PHARMAACE.FORECASTAPP.SERVICE.getHtmlData("/Drugs/GetDrugs", { searchKey: searchKey, searchParam: searchParam, searchCondition: condition, switchView: false, searchModule: searchModule },
                    function (data) {
                        PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                        var element = document.getElementById('SearchResult');
                        element.innerHTML = data;
                        PHARMAACE.FORECASTAPP.UTILITY.loadScriptsFromPartialView(element);
                        if (($("#tbltfoot") && $("#tbltfoot").length > 0)) {
                            PHARMAACE.FORECASTAPP.UTILITY.loadScript("../../Scripts/lib/jquery/jquery.dataTables.min.js", function () {
                                PHARMAACE.FORECASTAPP.UTILITY.filteration(populateSummary);
                            });
                        }


                        $('#SearchResult').show();

                    },
                    function (status) {
                        PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                        $('#SearchResult').show();
                        PHARMAACE.FORECASTAPP.UTILITY.popalert(status);


                    });

            }
            else {
                PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                PHARMAACE.FORECASTAPP.UTILITY.popalert("Please select drug type..");
                $('#SearchResult').show();
            }
                
        }
        function popup() {
            $('[data-rel=popover]').popover({
                placement: 'top'
            });
        }

        $("#search-filter-dropdown").change(function () {
            var Selectedfilter = this.value;
            
            if (Selectedfilter == 1)
                autocompleteListData = productNameList;
            else if (Selectedfilter == 2)
                autocompleteListData = moleculeNameList;
            else if (Selectedfilter == 3)
                autocompleteListData = pharmaClassNameList;
            else if (Selectedfilter == 4)
                autocompleteListData = indicationNameList;
        });
        //});
       
        function addInlineDurgs()
        {
           
            //$('#validationdurgs').click();
            var applicationshortno = document.getElementById('applicationshortno').value;
            var productid = document.getElementById('productid').value;
            var productndc = document.getElementById('productndc').value;
            var productcode = document.getElementById('productcode').value;
           var codeandndc = productcode.concat(productndc);
            var productname = document.getElementById('productname').value;
            var companyname = document.getElementById('companyname').value;
            var marketingPartner = document.getElementById('marketingpartner').value;
            var productcategory = document.getElementById('productcategory').value;
            var molecule = document.getElementById('molecule').value;
            var substance = document.getElementById('substance').value;
            var form = document.getElementById('form').value;
            var strength = document.getElementById('strength').value;
            var routeofadministration = document.getElementById('routeofadministration').value;
            //var diseasearea = document.getElementById('diseasearea').value;
            var diseasearea = [];
            $('#diseaseareaarray').find('ul').find('li.tagging_tag').each(function () {
                diseasearea.push($(this).text().slice(0,-1));
            });
            //var indication = document.getElementById('indication').value;
            var indication = [];
            $('#indicationarray').find('ul').find('li.tagging_tag').each(function () {
                indication.push($(this).text().slice(0, -1));
            });
            var subindication = document.getElementById('subindication').value;
            var dosageadult = document.getElementById('dosageadult').value;
            var dosagepediatric = document.getElementById('dosagepediatric').value;
            var price = document.getElementById('price').value;
            var pricingunit = document.getElementById('pricingunit').value;
            var pricesource = document.getElementById('pricesource').value;
            var pharmaclass = document.getElementById('pharmaclass').value;
            var pharmaclass2 = document.getElementById('pharmaclass2').value;
            var pharmaclass3 = document.getElementById('pharmaclass3').value;
            var imsclass = document.getElementById('imsclass').value;
            var moa = document.getElementById('moa').value;
            var approval = document.getElementById('approval').value;
            var startmarketingdate = document.getElementById('startmarketingdate').value;
            var producttype = document.getElementById('producttype').value;
            var durgstype = document.getElementById('durgstype').value;
            var marketStatus = document.getElementById('marstatus').value;
            var latestLabelDate = document.getElementById('latestlabeldate').value;
            var rld =  $('input[name="rld"]:checked').val();
            var teCode = document.getElementById('tecode').value;
                                                                                                                                                                                                                                       
            //if (!productid || !productndc || !productcode || !codeandndc || !productname || !companyname || !marketingPartner || !productcategory || !molecule || !substance || !form || !strength || !routeofadministration || !diseasearea || !indication || !subindication,
            //   !dosageadult || !dosagepediatric || !price || !pricingunit || !pricesource || !pharmaclass || !pharmaclass2 || !pharmaclass3 || !imsclass || !moa || !approval || !startmarketingdate || !producttype || !durgstype || !marketStatus || !latestLabelDate || !rld || !teCode) {
            //    $('#validationdurgs').click();
             
            //}
            //else {
                var inlineDurgsData = inlineDurgsDataObj(applicationshortno, productid, productndc, productcode, codeandndc, productname, companyname,marketingPartner, productcategory, molecule, substance, form, strength, routeofadministration,diseasearea, indication, subindication,
                    dosageadult, dosagepediatric, price, pricingunit, pricesource, pharmaclass, pharmaclass2, pharmaclass3, imsclass, moa, approval, startmarketingdate, producttype, durgstype, marketStatus, latestLabelDate, rld, teCode);
                PHARMAACE.FORECASTAPP.UTILITY.showOverlay("Saving your data", 'kmoverlayid', "15", "");
                PHARMAACE.FORECASTAPP.SERVICE.getJsonData("/Drugs/AddInlineDurgs", inlineDurgsData,
                     function (result) {
                         if (result.success) {
                             PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                             PHARMAACE.FORECASTAPP.UTILITY.popalert("Successfully added drugs data");
                         }
                         else {
                             PHARMAACE.FORECASTAPP.UTILITY.hideOverlay('kmoverlayid');
                             PHARMAACE.FORECASTAPP.UTILITY.popalert("Fail to add drugs data");
                         }

                     },
                      function (result) {
                          PHARMAACE.FORECASTAPP.UTILITY.popalert("Failed! " + result.responseText, '');

                      });
            //}
        }
        function inlineDurgsDataObj(applicationshortno, productid, productndc, productcode,codeandndc, productname,companyname,marketingPartner, productcategory, molecule, substance, form, strength, routeofadministration,diseasearea, indication, subindication,
                dosageadult, dosagepediatric, price, pricingunit, pricesource, pharmaclass, pharmaclass2, pharmaclass3, imsclass, moa, approval, startmarketingdate, producttype, durgstype ,marketStatus, latestLabelDate, rld, teCode)
        {
            var inlineDurgsObject =  {
                Application_Short_Number: applicationshortno,
                Product_ID: productid,
                Product_NDC: productndc,
                Product_Code: productcode,
                Code_and_NDC: codeandndc,
                ProductName: productname,
                CompanyName: companyname,
                MarketingPartner: marketingPartner,
                ProductCategory: productcategory,
                MoleculeName: molecule,
                Substance: substance,
                FormName: form,
                Strength: strength,
                ROAType: routeofadministration,
                Disease_Area: diseasearea,
                IndicationName: indication,
                Sub_Indication: subindication,
                Dosage_Adult: dosageadult,
                Dosage_Pediatric: dosagepediatric,
                Price: price,
                Pricing_Unit: pricingunit,
                Price_Source: pricesource,
                PHARMA_CLASSES: pharmaclass,
                PHARMA_CLASSES2: pharmaclass2,
                PHARMA_CLASSES3: pharmaclass3,
                IMSClass: imsclass,
                MOA: moa,
                Approval_Date: approval,
                Phase: startmarketingdate,
                Product_Type: producttype,
                Drug_Type: durgstype,
                MarketingStatus:marketStatus,
                LatestLabelDate:latestLabelDate,
                RLD:rld,
                TECode:teCode
            }
            return inlineDurgsObject;
        }
        function clearInputField()
        {
            
            $('#applicationshortno').val('');
            $('#productid').val('');
            $('#productndc').val('');
            $('#productcode').val('');
            $('#productname').val('');
            $('#companyname').val('');
            $('#productcategory').val('');
            $('#molecule').val('');
            $('#substance').val('');
            $('#form').val('');
            $('#strength').val('');
            $('#routeofadministration').val('');
            $('#diseasearea').val('');
            $('#indication').val('');
            $('#subindication').val('');
            $('#dosageadult').val('');
            $('#dosagepediatric').val('');
            $('#price').val('');
            $('#pricingunit').val('');
            $('#pricesource').val('');
            $('#pharmaclass').val('');
            $('#pharmaclass2').val('');
            $('#pharmaclass3').val('');
            $('#imsclass').val('');
            $('#moa').val('');
            $('#approval').val('');
            $('#startmarketingdate').val('');
            $('#producttype').val('');
            $('#durgstype').val('');
        }
        
        function addApiData()
        {
            
             var submissionDate=document.getElementById("submissiondate").value;
             var dmfholdername=document.getElementById("dmfholdername").value;
             var dmfStatus=document.getElementsByName("dmfstatus").value;
           var andaHolder = document.getElementsByName("andaholder").value;
            var orgComm = document.getElementsByName("orgcomm").value;
            var apiData = '<tr><td>' + submissionDate +'</td>'+
                               '<td>' + dmfholdername + '</td>' +
                                '<td>' + dmfStatus +'</td>'+
                                 '<td>' + andaHolder + '</td>'+
                             '<td>' + orgComm + '</td>'
            +
                 '<td class="kmBox54"><a class="btn" onclick="delCurrentRow(this)" href="#"><i title="Remove" class="fa fa-times kmBox55"></i></a></td>' +           
            '</tr>';
            $("#apitable tr:first").after(apiData);
            

        }

        function delCurrentRow(numrow) {

            $(numrow).parent().parent().remove();

        }
        function addExlusivityInfo() {
            var Exclusivity = document.getElementById("exclusivitydrop").value;
            var Description = document.getElementById("description").value;
            var expiryDate = document.getElementById("expirydate1").value;
            var exclusiveData = '<tr><td>' + Exclusivity + '</td>' +
                                           '<td>' + expiryDate + '</td>' +
                                         '<td>' + Description + '</td>' +
                                         '<td class="kmBox54"><a class="btn" onclick="delCurrentRow(this)" href="#"><i title="Remove" class="fa fa-times kmBox55"></i></a></td>' +
                                         '</tr>';
            $("#exclusiveinfoable tr:first").after(exclusiveData);
        }

        function addPatentInfo() {
                    
            var patentNo = document.getElementById("patentno").value;
            var typeofpatent = document.getElementById("typeofpatent").value;
            var patentusecode = document.getElementById("patentusecode").value;
            var expirydate = document.getElementById("expirydate").value;
            var ptegranted = "Yes";
           
            if ($('input[name=ptegranted]').filter(':checked').val() == "1")
            {
                 ptegranted = "Yes";
            }
            else {
                ptegranted = "No";
            }
                //document.getElementsByName("ptegranted").value;

            var independentclaims = document.getElementById("independentclaims").value;

            var delistrequested = "Yes";
                //document.getElementsByName("delistrequested").value;

            if ($('input[name=delistrequested]').filter(':checked').val() == "1") {
                delistrequested = "Yes";
            }
            else {
                delistrequested = "No";
            }


            var patentlicensinginfo = document.getElementById("patentlicensinginfo").value;
            
            var patentData = '<tr><td>' + patentNo + '</td>' +
                                           '<td>' + typeofpatent + '</td>' +
                                            '<td>' + patentusecode + '</td>' +
                                            '<td>' + expirydate + '</td>' +
                                            '<td>' + ptegranted + '</td>' +
                                            '<td>' + independentclaims + '</td>' +
                                            '<td>' + delistrequested + '</td>' +
                                         '<td>' + patentlicensinginfo + '</td>' +
            '<td class="kmBox54"><a class="btn" onclick="delCurrentRow(this)" href="#"><i title="Remove" class="fa fa-times kmBox55"></i></a></td>' + '</tr>';
            $("#patentinfotable tr:first").after(patentData);
        }
            
    </script>

     
   
</asp:Content>