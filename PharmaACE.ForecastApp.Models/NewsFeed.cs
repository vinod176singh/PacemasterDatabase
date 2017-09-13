﻿using System;
using System.Collections.Generic;

namespace PharmaACE.ForecastApp.Models
{
    public class NewsFeed
    {
        public string UserEmail { get; set; }
        public string NewsFeedLink { get; set; }
        public int FeedCount { get; set; }
        //public string LogoImagePath { get; set; }
        //public string PageHeader { get; set; }
        public string RegulatoryKeyword { get; set; }
    }

    public class ForecastAssumptions
    {
        public bool Visible { get; set; }
    }

    public class ForecastAuxiliary
    {
        public NewsFeed NewsDetails { get; set; }
        public ForecastAssumptions Assumptions { get; set; }
    }

    public class Feed
    {
        public string url { get; set; }
        
    }

    public class FDAApprovalDetails
    {
        public int RowIndex
        { get; set; }

        public string ApprovalDate
        { get; set; }

        public string DrugName
        { get; set; }

        public string Submission
        { get; set; }

        public string ActiveIngredients
        { get; set; }

        public string Company
        { get; set; }

        public string SubmissionClassification
        { get; set; }

        public string SubmissionStatus
        { get; set; }

        public string ApplicationNo
        { get; set; }

    }
}
