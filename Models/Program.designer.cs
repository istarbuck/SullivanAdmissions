﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdultEnrollment
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="AdultEnrollment")]
	public partial class ProgramDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertSpencerianDayTuition(SpencerianDayTuition instance);
    partial void UpdateSpencerianDayTuition(SpencerianDayTuition instance);
    partial void DeleteSpencerianDayTuition(SpencerianDayTuition instance);
    partial void InsertSpencerianNightTuition(SpencerianNightTuition instance);
    partial void UpdateSpencerianNightTuition(SpencerianNightTuition instance);
    partial void DeleteSpencerianNightTuition(SpencerianNightTuition instance);
    partial void InsertSpencerianProgram(SpencerianProgram instance);
    partial void UpdateSpencerianProgram(SpencerianProgram instance);
    partial void DeleteSpencerianProgram(SpencerianProgram instance);
    partial void InsertPrograms(Programs instance);
    partial void UpdatePrograms(Programs instance);
    partial void DeletePrograms(Programs instance);
    #endregion
		
		public ProgramDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["AdultEnrollmentConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public ProgramDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ProgramDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ProgramDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public ProgramDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<SpencerianDayTuition> SpencerianDayTuitions
		{
			get
			{
				return this.GetTable<SpencerianDayTuition>();
			}
		}
		
		public System.Data.Linq.Table<SpencerianNightTuition> SpencerianNightTuitions
		{
			get
			{
				return this.GetTable<SpencerianNightTuition>();
			}
		}
		
		public System.Data.Linq.Table<SpencerianProgram> SpencerianPrograms
		{
			get
			{
				return this.GetTable<SpencerianProgram>();
			}
		}
		
		public System.Data.Linq.Table<Programs> Programs
		{
			get
			{
				return this.GetTable<Programs>();
			}
		}
		
		public System.Data.Linq.Table<ZipList> ZipLists
		{
			get
			{
				return this.GetTable<ZipList>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.SpencerianDayTuition")]
	public partial class SpencerianDayTuition : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private byte _DayTuitionID;
		
		private string _ProgramCode;
		
		private System.Nullable<decimal> _FirstQuarter;
		
		private System.Nullable<decimal> _AdditionalQuarters;
		
		private System.Nullable<decimal> _TotalTuition;
		
		private System.Nullable<short> _LiabilityInsurance;
		
		private System.Nullable<short> _CompFee;
		
		private System.Nullable<decimal> _BooksSupplies;
		
		private System.Nullable<short> _UniformFee;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnDayTuitionIDChanging(byte value);
    partial void OnDayTuitionIDChanged();
    partial void OnProgramCodeChanging(string value);
    partial void OnProgramCodeChanged();
    partial void OnFirstQuarterChanging(System.Nullable<decimal> value);
    partial void OnFirstQuarterChanged();
    partial void OnAdditionalQuartersChanging(System.Nullable<decimal> value);
    partial void OnAdditionalQuartersChanged();
    partial void OnTotalTuitionChanging(System.Nullable<decimal> value);
    partial void OnTotalTuitionChanged();
    partial void OnLiabilityInsuranceChanging(System.Nullable<short> value);
    partial void OnLiabilityInsuranceChanged();
    partial void OnCompFeeChanging(System.Nullable<short> value);
    partial void OnCompFeeChanged();
    partial void OnBooksSuppliesChanging(System.Nullable<decimal> value);
    partial void OnBooksSuppliesChanged();
    partial void OnUniformFeeChanging(System.Nullable<short> value);
    partial void OnUniformFeeChanged();
    #endregion
		
		public SpencerianDayTuition()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DayTuitionID", AutoSync=AutoSync.OnInsert, DbType="TinyInt NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public byte DayTuitionID
		{
			get
			{
				return this._DayTuitionID;
			}
			set
			{
				if ((this._DayTuitionID != value))
				{
					this.OnDayTuitionIDChanging(value);
					this.SendPropertyChanging();
					this._DayTuitionID = value;
					this.SendPropertyChanged("DayTuitionID");
					this.OnDayTuitionIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramCode", DbType="VarChar(10)")]
		public string ProgramCode
		{
			get
			{
				return this._ProgramCode;
			}
			set
			{
				if ((this._ProgramCode != value))
				{
					this.OnProgramCodeChanging(value);
					this.SendPropertyChanging();
					this._ProgramCode = value;
					this.SendPropertyChanged("ProgramCode");
					this.OnProgramCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstQuarter", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> FirstQuarter
		{
			get
			{
				return this._FirstQuarter;
			}
			set
			{
				if ((this._FirstQuarter != value))
				{
					this.OnFirstQuarterChanging(value);
					this.SendPropertyChanging();
					this._FirstQuarter = value;
					this.SendPropertyChanged("FirstQuarter");
					this.OnFirstQuarterChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AdditionalQuarters", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> AdditionalQuarters
		{
			get
			{
				return this._AdditionalQuarters;
			}
			set
			{
				if ((this._AdditionalQuarters != value))
				{
					this.OnAdditionalQuartersChanging(value);
					this.SendPropertyChanging();
					this._AdditionalQuarters = value;
					this.SendPropertyChanged("AdditionalQuarters");
					this.OnAdditionalQuartersChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TotalTuition", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> TotalTuition
		{
			get
			{
				return this._TotalTuition;
			}
			set
			{
				if ((this._TotalTuition != value))
				{
					this.OnTotalTuitionChanging(value);
					this.SendPropertyChanging();
					this._TotalTuition = value;
					this.SendPropertyChanged("TotalTuition");
					this.OnTotalTuitionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LiabilityInsurance", DbType="SmallInt")]
		public System.Nullable<short> LiabilityInsurance
		{
			get
			{
				return this._LiabilityInsurance;
			}
			set
			{
				if ((this._LiabilityInsurance != value))
				{
					this.OnLiabilityInsuranceChanging(value);
					this.SendPropertyChanging();
					this._LiabilityInsurance = value;
					this.SendPropertyChanged("LiabilityInsurance");
					this.OnLiabilityInsuranceChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CompFee", DbType="SmallInt")]
		public System.Nullable<short> CompFee
		{
			get
			{
				return this._CompFee;
			}
			set
			{
				if ((this._CompFee != value))
				{
					this.OnCompFeeChanging(value);
					this.SendPropertyChanging();
					this._CompFee = value;
					this.SendPropertyChanged("CompFee");
					this.OnCompFeeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BooksSupplies", DbType="Decimal(6,2)")]
		public System.Nullable<decimal> BooksSupplies
		{
			get
			{
				return this._BooksSupplies;
			}
			set
			{
				if ((this._BooksSupplies != value))
				{
					this.OnBooksSuppliesChanging(value);
					this.SendPropertyChanging();
					this._BooksSupplies = value;
					this.SendPropertyChanged("BooksSupplies");
					this.OnBooksSuppliesChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UniformFee", DbType="SmallInt")]
		public System.Nullable<short> UniformFee
		{
			get
			{
				return this._UniformFee;
			}
			set
			{
				if ((this._UniformFee != value))
				{
					this.OnUniformFeeChanging(value);
					this.SendPropertyChanging();
					this._UniformFee = value;
					this.SendPropertyChanged("UniformFee");
					this.OnUniformFeeChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.SpencerianNightTuition")]
	public partial class SpencerianNightTuition : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private short _NightProgramID;
		
		private string _ProgramCode;
		
		private System.Nullable<decimal> _FirstQuarter;
		
		private System.Nullable<decimal> _AdditionalQuarters;
		
		private System.Nullable<decimal> _TotalTuition;
		
		private System.Nullable<short> _LiabilityInsurance;
		
		private System.Nullable<short> _CompFee;
		
		private System.Nullable<decimal> _BooksSupplies;
		
		private System.Nullable<short> _UniformFee;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnNightProgramIDChanging(short value);
    partial void OnNightProgramIDChanged();
    partial void OnProgramCodeChanging(string value);
    partial void OnProgramCodeChanged();
    partial void OnFirstQuarterChanging(System.Nullable<decimal> value);
    partial void OnFirstQuarterChanged();
    partial void OnAdditionalQuartersChanging(System.Nullable<decimal> value);
    partial void OnAdditionalQuartersChanged();
    partial void OnTotalTuitionChanging(System.Nullable<decimal> value);
    partial void OnTotalTuitionChanged();
    partial void OnLiabilityInsuranceChanging(System.Nullable<short> value);
    partial void OnLiabilityInsuranceChanged();
    partial void OnCompFeeChanging(System.Nullable<short> value);
    partial void OnCompFeeChanged();
    partial void OnBooksSuppliesChanging(System.Nullable<decimal> value);
    partial void OnBooksSuppliesChanged();
    partial void OnUniformFeeChanging(System.Nullable<short> value);
    partial void OnUniformFeeChanged();
    #endregion
		
		public SpencerianNightTuition()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NightProgramID", AutoSync=AutoSync.OnInsert, DbType="SmallInt NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public short NightProgramID
		{
			get
			{
				return this._NightProgramID;
			}
			set
			{
				if ((this._NightProgramID != value))
				{
					this.OnNightProgramIDChanging(value);
					this.SendPropertyChanging();
					this._NightProgramID = value;
					this.SendPropertyChanged("NightProgramID");
					this.OnNightProgramIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramCode", DbType="VarChar(10)")]
		public string ProgramCode
		{
			get
			{
				return this._ProgramCode;
			}
			set
			{
				if ((this._ProgramCode != value))
				{
					this.OnProgramCodeChanging(value);
					this.SendPropertyChanging();
					this._ProgramCode = value;
					this.SendPropertyChanged("ProgramCode");
					this.OnProgramCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstQuarter", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> FirstQuarter
		{
			get
			{
				return this._FirstQuarter;
			}
			set
			{
				if ((this._FirstQuarter != value))
				{
					this.OnFirstQuarterChanging(value);
					this.SendPropertyChanging();
					this._FirstQuarter = value;
					this.SendPropertyChanged("FirstQuarter");
					this.OnFirstQuarterChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AdditionalQuarters", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> AdditionalQuarters
		{
			get
			{
				return this._AdditionalQuarters;
			}
			set
			{
				if ((this._AdditionalQuarters != value))
				{
					this.OnAdditionalQuartersChanging(value);
					this.SendPropertyChanging();
					this._AdditionalQuarters = value;
					this.SendPropertyChanged("AdditionalQuarters");
					this.OnAdditionalQuartersChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TotalTuition", DbType="Decimal(7,2)")]
		public System.Nullable<decimal> TotalTuition
		{
			get
			{
				return this._TotalTuition;
			}
			set
			{
				if ((this._TotalTuition != value))
				{
					this.OnTotalTuitionChanging(value);
					this.SendPropertyChanging();
					this._TotalTuition = value;
					this.SendPropertyChanged("TotalTuition");
					this.OnTotalTuitionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LiabilityInsurance", DbType="SmallInt")]
		public System.Nullable<short> LiabilityInsurance
		{
			get
			{
				return this._LiabilityInsurance;
			}
			set
			{
				if ((this._LiabilityInsurance != value))
				{
					this.OnLiabilityInsuranceChanging(value);
					this.SendPropertyChanging();
					this._LiabilityInsurance = value;
					this.SendPropertyChanged("LiabilityInsurance");
					this.OnLiabilityInsuranceChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CompFee", DbType="SmallInt")]
		public System.Nullable<short> CompFee
		{
			get
			{
				return this._CompFee;
			}
			set
			{
				if ((this._CompFee != value))
				{
					this.OnCompFeeChanging(value);
					this.SendPropertyChanging();
					this._CompFee = value;
					this.SendPropertyChanged("CompFee");
					this.OnCompFeeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BooksSupplies", DbType="Decimal(6,2)")]
		public System.Nullable<decimal> BooksSupplies
		{
			get
			{
				return this._BooksSupplies;
			}
			set
			{
				if ((this._BooksSupplies != value))
				{
					this.OnBooksSuppliesChanging(value);
					this.SendPropertyChanging();
					this._BooksSupplies = value;
					this.SendPropertyChanged("BooksSupplies");
					this.OnBooksSuppliesChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UniformFee", DbType="SmallInt")]
		public System.Nullable<short> UniformFee
		{
			get
			{
				return this._UniformFee;
			}
			set
			{
				if ((this._UniformFee != value))
				{
					this.OnUniformFeeChanging(value);
					this.SendPropertyChanging();
					this._UniformFee = value;
					this.SendPropertyChanged("UniformFee");
					this.OnUniformFeeChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.SpencerianPrograms")]
	public partial class SpencerianProgram : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private short _ProgramID;
		
		private string _ProgramName;
		
		private string _ProgramCode;
		
		private string _DegreeType;
		
		private System.Nullable<bool> _Blend;
		
		private System.Nullable<bool> _Day;
		
		private System.Nullable<bool> _Night;
		
		private string _EntranceExam;
		
		private string _ClinicExtern;
		
		private string _ClinicExternHours;
		
		private string _DD;
		
		private string _ED;
		
		private string _ExtDay;
		
		private string _WebAssist;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnProgramIDChanging(short value);
    partial void OnProgramIDChanged();
    partial void OnProgramNameChanging(string value);
    partial void OnProgramNameChanged();
    partial void OnProgramCodeChanging(string value);
    partial void OnProgramCodeChanged();
    partial void OnDegreeTypeChanging(string value);
    partial void OnDegreeTypeChanged();
    partial void OnBlendChanging(System.Nullable<bool> value);
    partial void OnBlendChanged();
    partial void OnDayChanging(System.Nullable<bool> value);
    partial void OnDayChanged();
    partial void OnNightChanging(System.Nullable<bool> value);
    partial void OnNightChanged();
    partial void OnEntranceExamChanging(string value);
    partial void OnEntranceExamChanged();
    partial void OnClinicExternChanging(string value);
    partial void OnClinicExternChanged();
    partial void OnClinicExternHoursChanging(string value);
    partial void OnClinicExternHoursChanged();
    partial void OnDDChanging(string value);
    partial void OnDDChanged();
    partial void OnEDChanging(string value);
    partial void OnEDChanged();
    partial void OnExtDayChanging(string value);
    partial void OnExtDayChanged();
    partial void OnWebAssistChanging(string value);
    partial void OnWebAssistChanged();
    #endregion
		
		public SpencerianProgram()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramID", AutoSync=AutoSync.OnInsert, DbType="SmallInt NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public short ProgramID
		{
			get
			{
				return this._ProgramID;
			}
			set
			{
				if ((this._ProgramID != value))
				{
					this.OnProgramIDChanging(value);
					this.SendPropertyChanging();
					this._ProgramID = value;
					this.SendPropertyChanged("ProgramID");
					this.OnProgramIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramName", DbType="VarChar(50)")]
		public string ProgramName
		{
			get
			{
				return this._ProgramName;
			}
			set
			{
				if ((this._ProgramName != value))
				{
					this.OnProgramNameChanging(value);
					this.SendPropertyChanging();
					this._ProgramName = value;
					this.SendPropertyChanged("ProgramName");
					this.OnProgramNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramCode", DbType="VarChar(10)")]
		public string ProgramCode
		{
			get
			{
				return this._ProgramCode;
			}
			set
			{
				if ((this._ProgramCode != value))
				{
					this.OnProgramCodeChanging(value);
					this.SendPropertyChanging();
					this._ProgramCode = value;
					this.SendPropertyChanged("ProgramCode");
					this.OnProgramCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DegreeType", DbType="VarChar(20)")]
		public string DegreeType
		{
			get
			{
				return this._DegreeType;
			}
			set
			{
				if ((this._DegreeType != value))
				{
					this.OnDegreeTypeChanging(value);
					this.SendPropertyChanging();
					this._DegreeType = value;
					this.SendPropertyChanged("DegreeType");
					this.OnDegreeTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Blend", DbType="Bit")]
		public System.Nullable<bool> Blend
		{
			get
			{
				return this._Blend;
			}
			set
			{
				if ((this._Blend != value))
				{
					this.OnBlendChanging(value);
					this.SendPropertyChanging();
					this._Blend = value;
					this.SendPropertyChanged("Blend");
					this.OnBlendChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Day", DbType="Bit")]
		public System.Nullable<bool> Day
		{
			get
			{
				return this._Day;
			}
			set
			{
				if ((this._Day != value))
				{
					this.OnDayChanging(value);
					this.SendPropertyChanging();
					this._Day = value;
					this.SendPropertyChanged("Day");
					this.OnDayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Night", DbType="Bit")]
		public System.Nullable<bool> Night
		{
			get
			{
				return this._Night;
			}
			set
			{
				if ((this._Night != value))
				{
					this.OnNightChanging(value);
					this.SendPropertyChanging();
					this._Night = value;
					this.SendPropertyChanged("Night");
					this.OnNightChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EntranceExam", DbType="VarChar(20)")]
		public string EntranceExam
		{
			get
			{
				return this._EntranceExam;
			}
			set
			{
				if ((this._EntranceExam != value))
				{
					this.OnEntranceExamChanging(value);
					this.SendPropertyChanging();
					this._EntranceExam = value;
					this.SendPropertyChanged("EntranceExam");
					this.OnEntranceExamChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ClinicExtern", DbType="VarChar(10)")]
		public string ClinicExtern
		{
			get
			{
				return this._ClinicExtern;
			}
			set
			{
				if ((this._ClinicExtern != value))
				{
					this.OnClinicExternChanging(value);
					this.SendPropertyChanging();
					this._ClinicExtern = value;
					this.SendPropertyChanged("ClinicExtern");
					this.OnClinicExternChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ClinicExternHours", DbType="VarChar(10)")]
		public string ClinicExternHours
		{
			get
			{
				return this._ClinicExternHours;
			}
			set
			{
				if ((this._ClinicExternHours != value))
				{
					this.OnClinicExternHoursChanging(value);
					this.SendPropertyChanging();
					this._ClinicExternHours = value;
					this.SendPropertyChanged("ClinicExternHours");
					this.OnClinicExternHoursChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DD", DbType="VarChar(10)")]
		public string DD
		{
			get
			{
				return this._DD;
			}
			set
			{
				if ((this._DD != value))
				{
					this.OnDDChanging(value);
					this.SendPropertyChanging();
					this._DD = value;
					this.SendPropertyChanged("DD");
					this.OnDDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ED", DbType="VarChar(10)")]
		public string ED
		{
			get
			{
				return this._ED;
			}
			set
			{
				if ((this._ED != value))
				{
					this.OnEDChanging(value);
					this.SendPropertyChanging();
					this._ED = value;
					this.SendPropertyChanged("ED");
					this.OnEDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ExtDay", DbType="VarChar(10)")]
		public string ExtDay
		{
			get
			{
				return this._ExtDay;
			}
			set
			{
				if ((this._ExtDay != value))
				{
					this.OnExtDayChanging(value);
					this.SendPropertyChanging();
					this._ExtDay = value;
					this.SendPropertyChanged("ExtDay");
					this.OnExtDayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_WebAssist", DbType="VarChar(10)")]
		public string WebAssist
		{
			get
			{
				return this._WebAssist;
			}
			set
			{
				if ((this._WebAssist != value))
				{
					this.OnWebAssistChanging(value);
					this.SendPropertyChanging();
					this._WebAssist = value;
					this.SendPropertyChanged("WebAssist");
					this.OnWebAssistChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ProgramInfo")]
	public partial class Programs : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _ProgCode;
		
		private string _VersionDescrip;
		
		private string _ProgramDoc;
		
		private string _Louisville;
		
		private string _Lexington;
		
		private string _FortKnox;
		
		private string _Online;
		
		private string _Louisa;
		
		private string _NorthernKentucky;
		
		private string _TuitionClassification;
		
		private string _DegreeType;
		
		private int _ProgramID;
		
		private System.Nullable<bool> _Active;
		
		private System.Nullable<bool> _Day;
		
		private System.Nullable<bool> _Night;
		
		private System.Nullable<bool> _Main;
		
		private System.Nullable<bool> _ReEntry;
		
		private System.Nullable<bool> _International;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnProgCodeChanging(string value);
    partial void OnProgCodeChanged();
    partial void OnVersionDescripChanging(string value);
    partial void OnVersionDescripChanged();
    partial void OnProgramDocChanging(string value);
    partial void OnProgramDocChanged();
    partial void OnLouisvilleChanging(string value);
    partial void OnLouisvilleChanged();
    partial void OnLexingtonChanging(string value);
    partial void OnLexingtonChanged();
    partial void OnFortKnoxChanging(string value);
    partial void OnFortKnoxChanged();
    partial void OnOnlineChanging(string value);
    partial void OnOnlineChanged();
    partial void OnLouisaChanging(string value);
    partial void OnLouisaChanged();
    partial void OnNorthernKentuckyChanging(string value);
    partial void OnNorthernKentuckyChanged();
    partial void OnTuitionClassificationChanging(string value);
    partial void OnTuitionClassificationChanged();
    partial void OnDegreeTypeChanging(string value);
    partial void OnDegreeTypeChanged();
    partial void OnProgramIDChanging(int value);
    partial void OnProgramIDChanged();
    partial void OnActiveChanging(System.Nullable<bool> value);
    partial void OnActiveChanged();
    partial void OnDayChanging(System.Nullable<bool> value);
    partial void OnDayChanged();
    partial void OnNightChanging(System.Nullable<bool> value);
    partial void OnNightChanged();
    partial void OnMainChanging(System.Nullable<bool> value);
    partial void OnMainChanged();
    partial void OnReEntryChanging(System.Nullable<bool> value);
    partial void OnReEntryChanged();
    partial void OnInternationalChanging(System.Nullable<bool> value);
    partial void OnInternationalChanged();
    #endregion
		
		public Programs()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgCode", DbType="VarChar(10)")]
		public string ProgCode
		{
			get
			{
				return this._ProgCode;
			}
			set
			{
				if ((this._ProgCode != value))
				{
					this.OnProgCodeChanging(value);
					this.SendPropertyChanging();
					this._ProgCode = value;
					this.SendPropertyChanged("ProgCode");
					this.OnProgCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VersionDescrip", DbType="VarChar(100)")]
		public string VersionDescrip
		{
			get
			{
				return this._VersionDescrip;
			}
			set
			{
				if ((this._VersionDescrip != value))
				{
					this.OnVersionDescripChanging(value);
					this.SendPropertyChanging();
					this._VersionDescrip = value;
					this.SendPropertyChanged("VersionDescrip");
					this.OnVersionDescripChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramDoc", DbType="VarChar(20)")]
		public string ProgramDoc
		{
			get
			{
				return this._ProgramDoc;
			}
			set
			{
				if ((this._ProgramDoc != value))
				{
					this.OnProgramDocChanging(value);
					this.SendPropertyChanging();
					this._ProgramDoc = value;
					this.SendPropertyChanged("ProgramDoc");
					this.OnProgramDocChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Louisville", DbType="VarChar(3)")]
		public string Louisville
		{
			get
			{
				return this._Louisville;
			}
			set
			{
				if ((this._Louisville != value))
				{
					this.OnLouisvilleChanging(value);
					this.SendPropertyChanging();
					this._Louisville = value;
					this.SendPropertyChanged("Louisville");
					this.OnLouisvilleChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Lexington", DbType="VarChar(3)")]
		public string Lexington
		{
			get
			{
				return this._Lexington;
			}
			set
			{
				if ((this._Lexington != value))
				{
					this.OnLexingtonChanging(value);
					this.SendPropertyChanging();
					this._Lexington = value;
					this.SendPropertyChanged("Lexington");
					this.OnLexingtonChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FortKnox", DbType="VarChar(3)")]
		public string FortKnox
		{
			get
			{
				return this._FortKnox;
			}
			set
			{
				if ((this._FortKnox != value))
				{
					this.OnFortKnoxChanging(value);
					this.SendPropertyChanging();
					this._FortKnox = value;
					this.SendPropertyChanged("FortKnox");
					this.OnFortKnoxChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Online", DbType="VarChar(3)")]
		public string Online
		{
			get
			{
				return this._Online;
			}
			set
			{
				if ((this._Online != value))
				{
					this.OnOnlineChanging(value);
					this.SendPropertyChanging();
					this._Online = value;
					this.SendPropertyChanged("Online");
					this.OnOnlineChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Louisa", DbType="VarChar(3)")]
		public string Louisa
		{
			get
			{
				return this._Louisa;
			}
			set
			{
				if ((this._Louisa != value))
				{
					this.OnLouisaChanging(value);
					this.SendPropertyChanging();
					this._Louisa = value;
					this.SendPropertyChanged("Louisa");
					this.OnLouisaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NorthernKentucky", DbType="VarChar(3)")]
		public string NorthernKentucky
		{
			get
			{
				return this._NorthernKentucky;
			}
			set
			{
				if ((this._NorthernKentucky != value))
				{
					this.OnNorthernKentuckyChanging(value);
					this.SendPropertyChanging();
					this._NorthernKentucky = value;
					this.SendPropertyChanged("NorthernKentucky");
					this.OnNorthernKentuckyChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TuitionClassification", DbType="VarChar(10)")]
		public string TuitionClassification
		{
			get
			{
				return this._TuitionClassification;
			}
			set
			{
				if ((this._TuitionClassification != value))
				{
					this.OnTuitionClassificationChanging(value);
					this.SendPropertyChanging();
					this._TuitionClassification = value;
					this.SendPropertyChanged("TuitionClassification");
					this.OnTuitionClassificationChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DegreeType", DbType="VarChar(15)")]
		public string DegreeType
		{
			get
			{
				return this._DegreeType;
			}
			set
			{
				if ((this._DegreeType != value))
				{
					this.OnDegreeTypeChanging(value);
					this.SendPropertyChanging();
					this._DegreeType = value;
					this.SendPropertyChanged("DegreeType");
					this.OnDegreeTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ProgramID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ProgramID
		{
			get
			{
				return this._ProgramID;
			}
			set
			{
				if ((this._ProgramID != value))
				{
					this.OnProgramIDChanging(value);
					this.SendPropertyChanging();
					this._ProgramID = value;
					this.SendPropertyChanged("ProgramID");
					this.OnProgramIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Active", DbType="Bit")]
		public System.Nullable<bool> Active
		{
			get
			{
				return this._Active;
			}
			set
			{
				if ((this._Active != value))
				{
					this.OnActiveChanging(value);
					this.SendPropertyChanging();
					this._Active = value;
					this.SendPropertyChanged("Active");
					this.OnActiveChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Day", DbType="Bit")]
		public System.Nullable<bool> Day
		{
			get
			{
				return this._Day;
			}
			set
			{
				if ((this._Day != value))
				{
					this.OnDayChanging(value);
					this.SendPropertyChanging();
					this._Day = value;
					this.SendPropertyChanged("Day");
					this.OnDayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Night", DbType="Bit")]
		public System.Nullable<bool> Night
		{
			get
			{
				return this._Night;
			}
			set
			{
				if ((this._Night != value))
				{
					this.OnNightChanging(value);
					this.SendPropertyChanging();
					this._Night = value;
					this.SendPropertyChanged("Night");
					this.OnNightChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Main", DbType="Bit")]
		public System.Nullable<bool> Main
		{
			get
			{
				return this._Main;
			}
			set
			{
				if ((this._Main != value))
				{
					this.OnMainChanging(value);
					this.SendPropertyChanging();
					this._Main = value;
					this.SendPropertyChanged("Main");
					this.OnMainChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ReEntry", DbType="Bit")]
		public System.Nullable<bool> ReEntry
		{
			get
			{
				return this._ReEntry;
			}
			set
			{
				if ((this._ReEntry != value))
				{
					this.OnReEntryChanging(value);
					this.SendPropertyChanging();
					this._ReEntry = value;
					this.SendPropertyChanged("ReEntry");
					this.OnReEntryChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_International", DbType="Bit")]
		public System.Nullable<bool> International
		{
			get
			{
				return this._International;
			}
			set
			{
				if ((this._International != value))
				{
					this.OnInternationalChanging(value);
					this.SendPropertyChanging();
					this._International = value;
					this.SendPropertyChanged("International");
					this.OnInternationalChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ZipList")]
	public partial class ZipList
	{
		
		private string _ZIP;
		
		private string _City;
		
		private string _County;
		
		private string _Location_Code;
		
		public ZipList()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ZIP", DbType="VarChar(20)")]
		public string ZIP
		{
			get
			{
				return this._ZIP;
			}
			set
			{
				if ((this._ZIP != value))
				{
					this._ZIP = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_City", DbType="VarChar(55)")]
		public string City
		{
			get
			{
				return this._City;
			}
			set
			{
				if ((this._City != value))
				{
					this._City = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_County", DbType="VarChar(55)")]
		public string County
		{
			get
			{
				return this._County;
			}
			set
			{
				if ((this._County != value))
				{
					this._County = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="[Location Code]", Storage="_Location_Code", DbType="VarChar(55)")]
		public string Location_Code
		{
			get
			{
				return this._Location_Code;
			}
			set
			{
				if ((this._Location_Code != value))
				{
					this._Location_Code = value;
				}
			}
		}
	}
}
#pragma warning restore 1591