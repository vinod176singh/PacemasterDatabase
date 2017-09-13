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
    padding:6px 15px;
}
#patenttab .nav-tabs>li.active>a:after{
    display:none;
}
.textareasize{resize:none;}


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
                               <button type="button" class="btn btn-default" data-toggle="modal" role="button" id="patent" data-target='#addPatent'>Add Drugs Patent</></button>
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
                   <%--     <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Code and NDC</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="codeandndc" type="text" />
                                </div>
                            </div>
                        </div>--%>
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
                                <div class="col-md-8">
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
                                <div class="col-md-8">
                                    <input class="form-control" id="diseasearea" type="text" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Indication</label>
                                <div class="col-md-8">
                                     <div class="ui-widget">
                                                        <input id='indication' required="required" class="form-control tags-input" value="" style="display: none;">
                                              
                                                 </div>
                                    <%--<input class="form-control tags-input" id="indication" type="text" required />--%>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Sub Indication</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="subindication" type="text" required />
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
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title custom_align" id="Heading1">Add Patent Information </h4>
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
                            <a data-toggle="tab" class="" id="secd" href="#sectionD" ><b>Exclusivity Info</b></a>
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
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Generic Availability</label>
                                <div class="col-md-8">
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
                                    <input class="form-control" id="ftfholder" type="text"  required />
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Generic Players</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="genericplayer" type="text" required/>
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
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                          <%--<input type="submit" class="btn btn-primary" id="validationdurgs"  style="display:none" />--%>
                        <input type="button" class="btn btn-primary" onclick="Savepatent();"  value="Save" />
                    </div>
                    
                </form>
                    </div>
               <div style="cursor:pointer;" id="sectionB" class="tab-pane fade">
                <form class="form" role="form"  name="form1">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Submission Date </label>
                                <div class="col-md-8">
                                    <input class="form-control" id="sunmissiondate" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">DMF Holder Name</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="ftffillingdate1" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">DMF Status</label>
                                <div class="col-md-8">
                                    <input  name="dmfstatus"  value="1" type="radio" checked>Active
                                     <input name="dmfstatus" value="0" type="radio">Inactive
                                   
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-6">ANDA Holder against the filed DMF</label>
                                <div class="col-md-6">
                                    <input  name="andaholder"  value="1" type="radio" checked>Yes
                                     <input name="andaholder" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-6">Organization commercializes finished products in US</label>
                                <div class="col-md-6">
                                    <div class="ui-widget">
                                        <input  name="ftfholder1"  value="1" type="radio" checked>Yes
                                     <input name="ftfholder1" value="0" type="radio">No
                                        </div>
                                </div>
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
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Current Year </label>
                                <div class="col-md-8">
                                    <input class="form-control" id="currentyear" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Previous Year</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="previousyear" type="date" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">% Change</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="change" type="text" required />
                                </div>
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
                <form class="form" role="form"  name="form1">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Exclusivity</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="exclusivity" type="text" required />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Description</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" id="description"  required ></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Expiry Date</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="expirydate1" type="date" required />
                                </div>
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
                <div style="cursor:pointer;" id="sectionE" class="tab-pane fade">
                <form class="form" role="form"  name="form1">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <label class="col-md-4">Patent No.</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="patentno" type="date" required />
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
                                <div class="col-md-8">
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
                                <div class="col-md-8">
                                      <input  name="delistrequested"  value="1" type="radio" checked>Yes
                                     <input name="delistrequested" value="0" type="radio">No
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-md-4">Patent Licensing Info</label>
                                <div class="col-md-8">
                                    <textarea class="form-control textareasize" id="patentlicensinginfo" ></textarea>
                                </div>
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
        var moleculeNameList = [];


        var companyNameList = [];
        var productCategoryList = [];
        var substanceList = [];
        var formList = [];
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


        function Savepatent() {

          
          
            var rad = $('input[name=genericavailability]').filter(':checked').val();
            debugger;

            var createdData = {
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
      

            PHARMAACE.FORECASTAPP.SERVICE.getJsonData("/Drugs/AddPatentDetails", createdData,
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
                     indicationNameList = data.IndicationList;
                     moleculeNameList = data.MoleculeList;
                     autocompleteListData = productNameList;


                     companyNameList = data.CompanyList;
                     productCategoryList = data.ProductCategoryList;
                     substanceList= data.SubstanceList;
                     formList = data.FormList;
                     roaList = data.ROA_MasterList;
                     diseaseAreaList = data.DiseaseAreaList;
                     moaList = data.MOA_MasterList;
                     productTypeList = data.ProductTypeList;
                     priceUnitList = data.PriceUnitList;
                     priceSourceList=data.PriceSourceList;
                     drugsTypeList=data.DrugsTypeList;
                     strengthList=data.StrengthList;
                 },
                  function (data) {
                      //alert(data);
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
            var indicationNameList = [
          'jquery-libs', 'jquery-multilingual-news',
          'jquert-typeahead-tagging', 'jquery-multilingual-tags',
          'jquery-forms-ajaxified', 'jquery-project-template',
          'jquery-development-fabfile', 'jquery-user-media',
          'jquery-feedback-form', 'jquery-review', 'jquery-hero-slider',
          'jquery-document-library', 'jquery-paypal-express-checkout'
            ]


            // Turn the input into the tagging input
            $('#indication').tagging(indicationNameList);
           // $('#indication').tagging(indicationNameList);
            //$("#indication").autocomplete({

            //    source: indicationNameList


            //});
            //$(".tagging_new_input").autocomplete({
            //    source: function (request, response) {

            //        var matches = $.map(indicationNameList, function (acItem) {
            //            if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
            //                return acItem;
            //            }
            //        });
            //        response(matches);
            //    },
            //    minLength: 1,
            //    select: function (event, ui) {
            //        $(".tagging_new_input").val(ui.item.label);
            //    },
            //    focus: function (event, ui) {
            //        event.preventDefault();
            //        $(".tagging_new_input").val(ui.item.label);
            //    }

            //});
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

            
            $("#genericplayer").autocomplete({
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
                    $("#genericplayer").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#genericplayer").val(ui.item.label);
                }

            });
              $("#authorizedgeneric").autocomplete({
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
                     $("#authorizedgeneric").val(ui.item.label);
                 },
                 focus: function (event, ui) {
                     event.preventDefault();
                     $("#authorizedgeneric").val(ui.item.label);
                 }

             });
             $("#ftfholder").autocomplete({
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
                    $("#ftfholder").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#ftfholder").val(ui.item.label);
                }

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
                source: function (request, response) {

                    var matches = $.map(formList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#form").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#form").val(ui.item.label);
                }

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
            $("#diseasearea").autocomplete({
                source: function (request, response) {

                    var matches = $.map(diseaseAreaList, function (acItem) {
                        if ((acItem.label).trim().toUpperCase().indexOf(request.term.toUpperCase()) === 0) {
                            return acItem;
                        }
                    });
                    response(matches);
                },
                minLength: 1,
                select: function (event, ui) {
                    $("#diseasearea").val(ui.item.label);
                },
                focus: function (event, ui) {
                    event.preventDefault();
                    $("#diseasearea").val(ui.item.label);
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
        });
       
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
            var diseasearea = document.getElementById('diseasearea').value;
            var indication = document.getElementById('indication').value;
            var subindication = document.getElementById('subindication').value;
            var dosageadult = document.getElementById('dosageadult').value;
            var dosagepediatric = document.getElementById('dosagepediatric').value;
            var price = document.getElementById('price').value;
            var pricingunit = document.getElementById('pricingunit').value;
            var pricesource = document.getElementById('pricesource').value;
            //var pilink = document.getElementById('pilink').value;
            //var pidate = document.getElementById('pidate').value;
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
                Indication: indication,
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
        
      

    </script>

     
   
</asp:Content>