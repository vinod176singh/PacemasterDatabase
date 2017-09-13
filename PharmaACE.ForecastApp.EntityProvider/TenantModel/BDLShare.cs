namespace PharmaACE.ForecastApp.EntityProvider.TenantModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BDL.Share")]
    public partial class BDLShare
    {
        [Key]
        [Column(Order = 0)]
        public int Id { get; set; }

        [Key]
        [Column(Order = 1)]
        public byte CountryId { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ScenarioId { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short ParameterId { get; set; }

        [Key]
        [Column(Order = 4)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SegmentId { get; set; }

        [Key]
        [Column(Order = 5)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProductId { get; set; }

        [Key]
        [Column(Order = 6, TypeName = "date")]
        public DateTime LaunchDate { get; set; }

        [Key]
        [Column(Order = 7)]
        public decimal StartShare { get; set; }

        [Key]
        [Column(Order = 8)]
        public decimal PeakShare { get; set; }

        [Key]
        [Column(Order = 9)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MonthstoPeak { get; set; }

        [Key]
        [Column(Order = 10)]
        public decimal CurveType { get; set; }

        [Key]
        [Column(Order = 11)]
        public DateTime CreationDate { get; set; }

        [Key]
        [Column(Order = 12)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProjectVersionProductId { get; set; }

        public virtual BDLCountryMaster CountryMaster { get; set; }

        public virtual BDLParameterMaster ParameterMaster { get; set; }

        public virtual BDLProductMaster ProductMaster { get; set; }

        public virtual BDLProjectVersionProduct ProjectVersionProduct { get; set; }

        public virtual BDLScenarioMaster ScenarioMaster { get; set; }

        public virtual BDLSegmentMaster SegmentMaster { get; set; }
    }
}