﻿using PharmaACE.ForecastApp.Business;
using PharmaACE.ForecastApp.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using Microsoft.WindowsAzure;
//using Microsoft.WindowsAzure.Storage;
//using Microsoft.WindowsAzure.Storage.Auth;
//using Microsoft.WindowsAzure.Storage.Blob;
namespace PharmaACE.ForecastApp.Controllers
{
    public class DiseaseAreaController : BaseController
    {
        //
        // GET: /DiseaseArea/
        public ActionResult Index(bool? ReturnBack)
        {
            logger.Info("Inside DiseaseArea/Index");
            if ((Session != null && (!string.IsNullOrEmpty(Session["User"] as string)) && (Session["AccessTypeKM"].SafeToNum() != 0)))
            {
                Session["DSearchPage"] = "DiseaseAreaIndex";
                Session["DAReturnBack"] = ReturnBack;
                return View();
            }
            else
                return RedirectToAction("Index", "Home");
        }
        public ActionResult DiseaseAreaSearch(string diseaseName, SearchCondition searchCondition, int? SearchType)
        {
            logger.Info("Inside DiseaseArea/DiseaseAreaSearch");
            try
            {
            if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)) && (Session["AccessTypeKM"].SafeToNum() != 0))
            {
                if (SearchType == 1)
                {
                    ViewData["SearchType"] = 1;
                    Session["diseaseName"] = diseaseName;
                }
                if (SearchType == 0)
                {
                    ViewData["SearchType"] = 0;
                    Session["diseaseName"] = null;
                    Session["DAReturnBack"] = null;
                }
                DiseaseAreaSearchResult diseaseAreaSearchResult = new DiseaseAreaSearchResult();
                diseaseAreaSearchResult = new KnowledgeManager(UnitOfWork).GetDiseaseAreaSearchResultbySearchKey(diseaseName.Trim(), searchCondition);
                ViewData["DiseaseName"] = diseaseName;
                if (diseaseAreaSearchResult != null && (diseaseAreaSearchResult.IndicationsList.Count > 0 || diseaseAreaSearchResult.TherapyAreasList.Count > 0))
                    return View("DiseaseAreaSearch", diseaseAreaSearchResult);
                else
                    return PartialView("_DataNotFound");
            }
            else
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                logger.Error("Exception at DiseaseArea/Index: {0} \r\n {1}", ex.Message, ex.StackTrace);
                return RedirectToAction("Error", "Error");
            }
        }
        public ActionResult IndicationsSearch(string DiseaseName, int SearchType)
        {
            logger.Info("Inside DiseaseArea/IndicationsSearch");
            if (SearchType == 1)
            {
                ViewData["SearchType"] = 1;
                //  Session["diseaseName"] = DiseaseName;
            }
            if (SearchType == 0)
            {
                ViewData["SearchType"] = 0;
                Session["diseaseName"] = null;
                Session["DAReturnBack"] = null;
            }
            try
            {
            if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)) && (Session["AccessTypeKM"].SafeToNum() != 0))
            {
                IEnumerable<Indications> IndicationsList = new List<Indications>();
                IndicationsList = new KnowledgeManager(UnitOfWork).GetIndicationsByDiseaseAreaName(DiseaseName.Trim());
                ViewData["DiseaseName"] = DiseaseName;
                if (IndicationsList != null)
                    return View("IndicationSearch", IndicationsList);
                else
                    return PartialView("_DataNotFound");
            }
            else
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                logger.Error("Exception at DiseaseArea/IndicationsSearch: {0} \r\n {1}", ex.Message, ex.StackTrace);
                return RedirectToAction("Error", "Error");

            }
        }
       public JsonResult FetchRefernces()
        {
            logger.Info("Inside DiseaseArea/FetchRefernces");
            string msg = String.Empty;
            List<string> result = null;
            try
            {
                result = new KnowledgeManager(UnitOfWork).FetchRefernces();
                if (result != null)
                {
                    logger.Info("Refernces are fetched successfully");
                }
                else
                {
                    msg = "Fetch References fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/FetchRefernces: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else

                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);



        }
        public ActionResult DiseaseDetailBySecondaryInd(int diseaseId, string secondIndName, int searchType=0)
        {
            logger.Info("Inside DiseaseArea/DiseaseDetail");
            if (searchType == 1)
            {
                ViewData["SearchType"] = 1;
                // Session["diseaseName"] = DiseaseName;
            }
            if (searchType == 0)
            {
                ViewData["SearchType"] = 0;
                Session["diseaseName"] = null;
                Session["DAReturnBack"] = null;
            }
            try
            {
                if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)) && (Session["AccessTypeKM"].SafeToNum() != 0))
                {
                    DiseaseDetails diseaseAreaData = new DiseaseDetails();
                    //diseaseAreaData.diseaseDetails = BL.GetDiseaseAreaDetails(DiseaseName.Trim());
                    //diseaseAreaData.diseaseTableData = BL.GetDiseaseAreaTableData(DiseaseName.Trim());
                    diseaseAreaData = new KnowledgeManager(UnitOfWork).GetDiseaseAreaDetailsBySecondInd(diseaseId, secondIndName);
                    //diseaseAreaData.diseaseDetails.ImagePath = "https://kmimgstore.blob.core.windows.net/democontainerblockblob/HelloWorld.png";
                    ViewData["DiseaseName"] = secondIndName;
                    if (diseaseAreaData != null)
                           return View("DiseaseDetail", diseaseAreaData);
                       // return View("DiseaseDetailBySecondaryInd", diseaseAreaData);
                    else
                        return PartialView("_DataNotFound");
                }
                else
                    return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                logger.Error("Exception at DiseaseArea/DiseaseDetail: {0} \r\n {1}", ex.Message, ex.StackTrace);
                return RedirectToAction("Error", "Error");
            }
        }

        //public ActionResult DiseaseDetail(string DiseaseName, int SearchType)
        //{
        //    logger.Info("Inside DiseaseArea/DiseaseDetail");
        //    if (SearchType == 1)
        //    {
        //        ViewData["SearchType"] = 1;
        //        // Session["diseaseName"] = DiseaseName;
        //    }
        //    if (SearchType == 0)
        //    {
        //        ViewData["SearchType"] = 0;
        //        Session["diseaseName"] = null;
        //        Session["DAReturnBack"] = null;
        //    }
        //    try
        //    {
        //    if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)) && (Session["AccessTypeKM"].SafeToNum() != 0))
        //    {
        //        DiseaseDetails diseaseAreaData = new DiseaseDetails();
        //        //diseaseAreaData.diseaseDetails = BL.GetDiseaseAreaDetails(DiseaseName.Trim());
        //        //diseaseAreaData.diseaseTableData = BL.GetDiseaseAreaTableData(DiseaseName.Trim());
        //        diseaseAreaData = new KnowledgeManager(UnitOfWork).GetDiseaseAreaDetails(DiseaseName);
        //        //diseaseAreaData.diseaseDetails.ImagePath = "https://kmimgstore.blob.core.windows.net/democontainerblockblob/HelloWorld.png";
        //        ViewData["DiseaseName"] = DiseaseName;
        //        if (diseaseAreaData != null)
        //            return View("DiseaseDetail", diseaseAreaData);
        //        else
        //            return PartialView("_DataNotFound");
        //    }
        //    else
        //        return RedirectToAction("Index", "Home");
        //    }
        //    catch (Exception ex)
        //    {
        //        logger.Error("Exception at DiseaseArea/DiseaseDetail: {0} \r\n {1}", ex.Message, ex.StackTrace);
        //        return RedirectToAction("Error", "Error");
        //    }
        //}
        public JsonResult SaveNewReferences(List<NewRefernce> ListOfRefernces, string indication)
        {
            logger.Info("Inside DiseaseArea/SaveNewReferences");
            string msg = String.Empty;
            int result = 0;
            try
            {
                result = new KnowledgeManager(UnitOfWork).SaveNewReferences(ListOfRefernces, indication);
                if (result == 1)
                {
                    logger.Info("References added successfully");
                }
                else
                {
                    msg = "Save references fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/SaveNewReferences: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else

                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult DeleteCurrentRefernce(int refernceId, string indicationName)
        {
            logger.Info("Inside DiseaseArea/DeleteCurrentRefernce");
            string msg = String.Empty;
            int result = 0;
            try
            {
                result = new KnowledgeManager(UnitOfWork).DeleteCurrentRefernce(refernceId, indicationName);
                if (result == 1)
                {
                    logger.Info("References deleted successfully");
                }
                else
                {
                    msg = "delete references fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/SaveNewReferences: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else

                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult SaveTreatmentRegimen(List<treatmentDetailsForPopup> ListTreatmentdetails, string indication)
        {
            logger.Info("Inside DiseaseArea/SaveTreatmentRegimen");
            string msg = String.Empty;
            int result = 0;
            try
            {
                result = new KnowledgeManager(UnitOfWork).SaveTreatmentRegimenDetail(ListTreatmentdetails,indication);
                if (result == 1)
                {
                    logger.Info("treatment regimen Details successfully");
                }
                else
                {
                    msg = "Save Details fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/SaveTreatmentRegimen: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else

                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);
          
        }




        public JsonResult SaveEditedDetail(string editedData,String IndicationName)
        {
            logger.Info("Inside DiseaseArea/SaveEditedDetail");
            string msg = String.Empty;
            int result = 0;
            try
            {               
                result = new KnowledgeManager(UnitOfWork).SaveEditedDetailndication(editedData, IndicationName);
                if (result==1)
                {
                    logger.Info("Save Edited Details successfully");
                }
                else
                {
                    msg = "Save Edited Details fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/SaveEditedDetail: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else
                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult SaveEditedDiseaseOverView(string editedData, String IndicationName)
        {
            logger.Info("Inside DiseaseArea/SaveEditedDiseaseOverView");
            string msg = String.Empty;
            int result = 0;
            try
            {
                result = new KnowledgeManager(UnitOfWork).SaveEditedDiseaseOverViewDetails(editedData, IndicationName);
                if (result == 1)
                {
                    logger.Info("Save Edited overview successfully");
                }
                else
                {
                    msg = "Save Edited overview fail";
                    logger.Info(msg);
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
                logger.Error("Exception at DiseaseArea/SaveEditedDiseaseOverView: {0} \r\n {1}", ex.Message, ex.StackTrace);
            }
            if (String.IsNullOrEmpty(msg))
                return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);
            else
                return Json(new { success = false, errors = new[] { msg } }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult MediaManagement()
        {
            if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)))
                return View();
            else
                return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public void SaveMedia( string IndicationName,string VideoLink, int diseaseId)
        {
            string msg = String.Empty;
            bool isPathoImage = false;
            try
            {
                if (Request.Files.Count > 0)
                {
                    HttpPostedFileBase file = Request.Files[0];
                    if (file != null && file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        if (VideoLink == "")
                            VideoLink = "NA";
                        string url = HttpUtility.UrlEncode(VideoLink);
                        new KnowledgeManager(UnitOfWork).SaveMedia(diseaseId,IndicationName.Trim(), isPathoImage, file,url);
                    }
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
        }


        public void UploadSrollImages(string IndicationName,int diseaseId)
        {
            string msg = String.Empty;
            try
            {
                bool isPathoImage = true;
                if (Request.Files.Count > 0)
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        HttpPostedFileBase file = Request.Files[i];
                        if (file != null && file.ContentLength > 0)
                        {
                            var fileName = Path.GetFileName(file.FileName);

                        new KnowledgeManager(UnitOfWork).SaveMedia(diseaseId, IndicationName.Trim(), isPathoImage, file);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
        }




        //public void SaveMedia_nilesh(string IndicationName, string VideoLink, int diseaseId)
        //{
        //    string msg = String.Empty;
        //    try
        //    {
        //        if (Request.Files.Count > 0)
        //        {
        //            HttpPostedFileBase file = Request.Files[0];
        //            if (file != null && file.ContentLength > 0)
        //            {
        //                var fileName = Path.GetFileName(file.FileName);
        //                if (VideoLink == "")
        //                    VideoLink = "NA";
        //                string url = HttpUtility.UrlEncode(VideoLink);
        //                new KnowledgeManager(UnitOfWork).SaveMedia(diseaseId, IndicationName.Trim(), url, file);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        msg = ex.Message;
        //    }
        //}


        //public void SaveMedia_old(string DiseaseName, string IndicationName, string VideoLink)
        //{
        //    string msg = String.Empty;
        //    try
        //    {
        //        if (Request.Files.Count > 0)
        //        {
        //            HttpPostedFileBase file = Request.Files[0];
        //            if (file != null && file.ContentLength > 0)
        //            {
        //                var fileName = Path.GetFileName(file.FileName);
        //                if (VideoLink == "")
        //                    VideoLink = "NA";
        //                string url = HttpUtility.UrlEncode(VideoLink);
        //                new KnowledgeManager(UnitOfWork).SaveMedia(DiseaseName, IndicationName.Trim(), url, file);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        msg = ex.Message;
        //    }
        //}

        public ActionResult DownloadFile(string attstreamId, string attName)
        {
            logger.Info("Inside DiseaseArea/DownloadFile");
            if (Session != null && (!string.IsNullOrEmpty(Session["user"] as string)))
            {
                string fileName = string.Empty;
                fileName = attName;
                byte[] byteArr = null;
                string msg = string.Empty;
                StorageTypeFactory factory = new ConcreteStorageFactory();
                StorageIFactory storagefactory = factory.getSTorageType(GenUtil.GetStorageType());
                try
                {
                    byteArr = storagefactory.Download(UnitOfWork, attstreamId, StorageContext.Forum);
                    if (byteArr != null)
                    {
                        logger.Info("got byte array for downloading file");
                    }
                    else
                    {
                        msg = "not get byte array for downloading file";
                        logger.Info(msg);
                    }
                }
                catch (Exception ex)
                {
                    msg = ex.Message;
                    logger.Error("Exception at DiseaseArea/DownloadFile: {0} \r\n {1}", ex.Message, ex.StackTrace);
                }
                if (byteArr != null && String.IsNullOrEmpty(msg))
                    return File(byteArr, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
                return null;
            }
            else
                return RedirectToAction("Index", "Home");

        }


    }
}
