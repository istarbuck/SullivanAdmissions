using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Text;
using System.Threading;

namespace Admissions
{
    public partial class IPED : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        List<string> allAttachments = new List<string>();
        List<string> transcriptAttatchments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody = "";


            ViewState["Transcript"] = Session["Transcript"];
            ViewState["Campus"] = Session["Campus"];
            ViewState["enrollmentFee"] = Session["enrollmentFee"];
            ViewState["StudentName"] = Session["StudentName"];
            ViewState["CampusNumber"] = Session["CampusNumber"];
            ViewState["EnrollQueue"] = Session["EnrollQueue"];
            ViewState["Email"] = Session["Email"];
            ViewState["Phone"] = Session["Phone"];
            ViewState["ZipCode"] = Session["ZipCode"];
            ViewState["Form"] = Session["Form"];
            ViewState["Tuition"] = Session["Tuition"];
            ViewState["Military"] = Session["Military"];


            if (!Page.IsPostBack)
            {
                if (Session["AllAttachments"] != null)
                {
                    allAttachments = (List<string>)Session["AllAttachments"];

                    foreach (string attachment in allAttachments)
                    {
                        try
                        {
                            if (!attachment.Contains("ESig_"))
                            {
                                File.Delete(attachment);
                            }
                        }
                        catch
                        {
                        }
                    }

                    allAttachments.Clear();
                }

                

            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;

            foreach (Control currentControl in IPEDs.Controls)
            {
                if (currentControl is Panel)
                {
                    formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                }
            }

            emailBody = email.CreateEmailBody(formInfo);

            if (ViewState["Campus"] == null)
            {
                ViewState["Campus"] = IPEDs.CampusAttending;
            }

            if ((string)ViewState["Campus"] == "Louisville")
            {
                if ((string)ViewState["Form"] != "PA")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
                }
                else if((string)ViewState["Form"] == "PA")
                {
                    To.Add("paprogram@sullivan.edu");
                }
            }

            else if ((string)ViewState["Campus"] == "Online" || (string)ViewState["Campus"] == "Louisa" || (string)ViewState["Campus"] == "Northern Kentucky" || (string)ViewState["Campus"] == "CarlisleNicholas")
            {
                To.Add("slvadmissions@sullivan.edu");
                To.Add("ONLINE-DOA@sullivan.edu");
            }

            else if ((string)ViewState["Campus"] == "Lexington")
            {
                To.Add("slxadmission@sullivan.edu");
            }

            else if ((string)ViewState["Campus"] == "Fort Knox")
            {
                To.Add("slk-doa@sullivan.edu");
            }

            //mail.To.Add("istarbuck@sullivan.edu");

            email.SendHTMLEmail("IPED Info  - " + (string)ViewState["StudentName"], emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //Send and create tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Session["Campus"] = ViewState["Campus"];
            Session["StudentName"] = ViewState["StudentName"];
            Session["CampusNumber"] = ViewState["CampusNumber"];
            Session["Phone"] = ViewState["Phone"];
            Session["Email"] = ViewState["Email"];
            Session["enrollmentFee"] = ViewState["enrollmentFee"];
            Session["Transcript"] = ViewState["Transcript"];
            Session["ZipCode"] = ViewState["ZipCode"];
            Session["Military"] = ViewState["Military"];

            if (ViewState["Form"] != null)
            {
                if(Session["Tuition"] == null)
                {
                    Response.Redirect("PADeposit.aspx");
                }
                else
                {
                    Response.Redirect("Confirmation.aspx");
                }
            }
            else
            {
                Response.Redirect("EnrollmentPayment.aspx");
            }
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            RoutingRules rules = new RoutingRules();

            if (ViewState["CampusNumber"] == null)
            {
                ViewState["CampusNumber"] = rules.CampusID(IPEDs.CampusAttending, "");
                ViewState["Phone"] = IPEDs.Phone;
                ViewState["StudentName"] = IPEDs.StudentName;
                ViewState["Email"] = IPEDs.Email;
                ViewState["Campus"] = IPEDs.CampusAttending;
                ViewState["ZipCode"] = IPEDs.ZipCode;
            }

            string tiffEmailBody = "campusid=" + (string)ViewState["CampusNumber"] + "\r\ntab=Naw|" + (string)ViewState["Phone"] + "\r\nfolder=" + (string)ViewState["StudentName"] + "\r\n";
            List<string> attachments = new List<string>();

            tiffEmailBody += "f4=" + (string)ViewState["Email"] + "\r\n";

            //Create IPED
            panelsNeeded.Add("IPEDPanel");

            var IPED = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("IPED", 0, IPED))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("IPED", tiffEmailBody + "doctype=ADM - Integrated Postsecondary Ed DSS", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
        public static List<Process> GetProcessesLockingFile(string filePath)
        {
            var procs = new List<Process>();

            var processListSnapshot = Process.GetProcesses();
            foreach (var process in processListSnapshot)
            {
                if (process.Id <= 4) { continue; } // system processes
                var files = GetFilesLockedBy(process);
                if (files.Contains(filePath)) procs.Add(process);
            }
            return procs;
        }

        /// <summary>
        /// Return a list of file locks held by the process.
        /// </summary>
        public static List<string> GetFilesLockedBy(Process process)
        {
            var outp = new List<string>();

            ThreadStart ts = delegate
            {
                try
                {
                    outp = UnsafeGetFilesLockedBy(process);
                }
                catch { Ignore(); }
            };

            try
            {
                var t = new Thread(ts);
                t.IsBackground = true;
                t.Start();
                if (!t.Join(250))
                {
                    try
                    {
                        t.Interrupt();
                        t.Abort();
                    }
                    catch { Ignore(); }
                }
            }
            catch { Ignore(); }

            return outp;
        }


        #region Inner Workings
        private static void Ignore() { }
        private static List<string> UnsafeGetFilesLockedBy(Process process)
        {
            try
            {
                var handles = GetHandles(process);
                var files = new List<string>();

                foreach (var handle in handles)
                {
                    var file = GetFilePath(handle, process);
                    if (file != null) files.Add(file);
                }

                return files;
            }
            catch
            {
                return new List<string>();
            }
        }

        const int CNST_SYSTEM_HANDLE_INFORMATION = 16;
        private static string GetFilePath(Win32API.SYSTEM_HANDLE_INFORMATION systemHandleInformation, Process process)
        {
            var ipProcessHwnd = Win32API.OpenProcess(Win32API.ProcessAccessFlags.All, false, process.Id);
            var objBasic = new Win32API.OBJECT_BASIC_INFORMATION();
            var objObjectType = new Win32API.OBJECT_TYPE_INFORMATION();
            var objObjectName = new Win32API.OBJECT_NAME_INFORMATION();
            var strObjectName = "";
            var nLength = 0;
            IntPtr ipTemp, ipHandle;

            if (!Win32API.DuplicateHandle(ipProcessHwnd, systemHandleInformation.Handle, Win32API.GetCurrentProcess(), out ipHandle, 0, false, Win32API.DUPLICATE_SAME_ACCESS))
                return null;

            IntPtr ipBasic = Marshal.AllocHGlobal(Marshal.SizeOf(objBasic));
            Win32API.NtQueryObject(ipHandle, (int)Win32API.ObjectInformationClass.ObjectBasicInformation, ipBasic, Marshal.SizeOf(objBasic), ref nLength);
            objBasic = (Win32API.OBJECT_BASIC_INFORMATION)Marshal.PtrToStructure(ipBasic, objBasic.GetType());
            Marshal.FreeHGlobal(ipBasic);

            IntPtr ipObjectType = Marshal.AllocHGlobal(objBasic.TypeInformationLength);
            nLength = objBasic.TypeInformationLength;
            // this one never locks...
            while ((uint)(Win32API.NtQueryObject(ipHandle, (int)Win32API.ObjectInformationClass.ObjectTypeInformation, ipObjectType, nLength, ref nLength)) == Win32API.STATUS_INFO_LENGTH_MISMATCH)
            {
                if (nLength == 0)
                {
                    Console.WriteLine("nLength returned at zero! ");
                    return null;
                }
                Marshal.FreeHGlobal(ipObjectType);
                ipObjectType = Marshal.AllocHGlobal(nLength);
            }

            objObjectType = (Win32API.OBJECT_TYPE_INFORMATION)Marshal.PtrToStructure(ipObjectType, objObjectType.GetType());
            if (Is64Bits())
            {
                ipTemp = new IntPtr(Convert.ToInt64(objObjectType.Name.Buffer.ToString(), 10) >> 32);
            }
            else
            {
                ipTemp = objObjectType.Name.Buffer;
            }

            var strObjectTypeName = Marshal.PtrToStringUni(ipTemp, objObjectType.Name.Length >> 1);
            Marshal.FreeHGlobal(ipObjectType);
            if (strObjectTypeName != "File")
                return null;

            nLength = objBasic.NameInformationLength;

            var ipObjectName = Marshal.AllocHGlobal(nLength);

            // ...this call sometimes hangs. Is a Windows error.
            while ((uint)(Win32API.NtQueryObject(ipHandle, (int)Win32API.ObjectInformationClass.ObjectNameInformation, ipObjectName, nLength, ref nLength)) == Win32API.STATUS_INFO_LENGTH_MISMATCH)
            {
                Marshal.FreeHGlobal(ipObjectName);
                if (nLength == 0)
                {
                    Console.WriteLine("nLength returned at zero! " + strObjectTypeName);
                    return null;
                }
                ipObjectName = Marshal.AllocHGlobal(nLength);
            }
            objObjectName = (Win32API.OBJECT_NAME_INFORMATION)Marshal.PtrToStructure(ipObjectName, objObjectName.GetType());

            if (Is64Bits())
            {
                ipTemp = new IntPtr(Convert.ToInt64(objObjectName.Name.Buffer.ToString(), 10) >> 32);
            }
            else
            {
                ipTemp = objObjectName.Name.Buffer;
            }

            if (ipTemp != IntPtr.Zero)
            {

                var baTemp = new byte[nLength];
                try
                {
                    Marshal.Copy(ipTemp, baTemp, 0, nLength);

                    strObjectName = Marshal.PtrToStringUni(Is64Bits() ? new IntPtr(ipTemp.ToInt64()) : new IntPtr(ipTemp.ToInt32()));
                }
                catch (AccessViolationException)
                {
                    return null;
                }
                finally
                {
                    Marshal.FreeHGlobal(ipObjectName);
                    Win32API.CloseHandle(ipHandle);
                }
            }

            string path = GetRegularFileNameFromDevice(strObjectName);
            try
            {
                return path;
            }
            catch
            {
                return null;
            }
        }

        private static string GetRegularFileNameFromDevice(string strRawName)
        {
            string strFileName = strRawName;
            foreach (string strDrivePath in Environment.GetLogicalDrives())
            {
                var sbTargetPath = new StringBuilder(Win32API.MAX_PATH);
                if (Win32API.QueryDosDevice(strDrivePath.Substring(0, 2), sbTargetPath, Win32API.MAX_PATH) == 0)
                {
                    return strRawName;
                }
                string strTargetPath = sbTargetPath.ToString();
                if (strFileName.StartsWith(strTargetPath))
                {
                    strFileName = strFileName.Replace(strTargetPath, strDrivePath.Substring(0, 2));
                    break;
                }
            }
            return strFileName;
        }

        private static IEnumerable<Win32API.SYSTEM_HANDLE_INFORMATION> GetHandles(Process process)
        {
            var nHandleInfoSize = 0x10000;
            var ipHandlePointer = Marshal.AllocHGlobal(nHandleInfoSize);
            var nLength = 0;
            IntPtr ipHandle;

            while (Win32API.NtQuerySystemInformation(CNST_SYSTEM_HANDLE_INFORMATION, ipHandlePointer, nHandleInfoSize, ref nLength) == Win32API.STATUS_INFO_LENGTH_MISMATCH)
            {
                nHandleInfoSize = nLength;
                Marshal.FreeHGlobal(ipHandlePointer);
                ipHandlePointer = Marshal.AllocHGlobal(nLength);
            }

            var baTemp = new byte[nLength];
            Marshal.Copy(ipHandlePointer, baTemp, 0, nLength);

            long lHandleCount;
            if (Is64Bits())
            {
                lHandleCount = Marshal.ReadInt64(ipHandlePointer);
                ipHandle = new IntPtr(ipHandlePointer.ToInt64() + 8);
            }
            else
            {
                lHandleCount = Marshal.ReadInt32(ipHandlePointer);
                ipHandle = new IntPtr(ipHandlePointer.ToInt32() + 4);
            }

            var lstHandles = new List<Win32API.SYSTEM_HANDLE_INFORMATION>();

            for (long lIndex = 0; lIndex < lHandleCount; lIndex++)
            {
                var shHandle = new Win32API.SYSTEM_HANDLE_INFORMATION();
                if (Is64Bits())
                {
                    shHandle = (Win32API.SYSTEM_HANDLE_INFORMATION)Marshal.PtrToStructure(ipHandle, shHandle.GetType());
                    ipHandle = new IntPtr(ipHandle.ToInt64() + Marshal.SizeOf(shHandle) + 8);
                }
                else
                {
                    ipHandle = new IntPtr(ipHandle.ToInt64() + Marshal.SizeOf(shHandle));
                    shHandle = (Win32API.SYSTEM_HANDLE_INFORMATION)Marshal.PtrToStructure(ipHandle, shHandle.GetType());
                }
                if (shHandle.ProcessID != process.Id) continue;
                lstHandles.Add(shHandle);
            }
            return lstHandles;
        }

        private static bool Is64Bits()
        {
            return Marshal.SizeOf(typeof(IntPtr)) == 8;
        }

        internal class Win32API
        {
            [DllImport("ntdll.dll")]
            public static extern int NtQueryObject(IntPtr ObjectHandle, int
                ObjectInformationClass, IntPtr ObjectInformation, int ObjectInformationLength,
                ref int returnLength);

            [DllImport("kernel32.dll", SetLastError = true)]
            public static extern uint QueryDosDevice(string lpDeviceName, StringBuilder lpTargetPath, int ucchMax);

            [DllImport("ntdll.dll")]
            public static extern uint NtQuerySystemInformation(int
                SystemInformationClass, IntPtr SystemInformation, int SystemInformationLength,
                ref int returnLength);

            [DllImport("kernel32.dll")]
            public static extern IntPtr OpenProcess(ProcessAccessFlags dwDesiredAccess, [MarshalAs(UnmanagedType.Bool)] bool bInheritHandle, int dwProcessId);
            [DllImport("kernel32.dll")]
            public static extern int CloseHandle(IntPtr hObject);
            [DllImport("kernel32.dll", SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            public static extern bool DuplicateHandle(IntPtr hSourceProcessHandle,
               ushort hSourceHandle, IntPtr hTargetProcessHandle, out IntPtr lpTargetHandle,
               uint dwDesiredAccess, [MarshalAs(UnmanagedType.Bool)] bool bInheritHandle, uint dwOptions);
            [DllImport("kernel32.dll")]
            public static extern IntPtr GetCurrentProcess();

            public enum ObjectInformationClass
            {
                ObjectBasicInformation = 0,
                ObjectNameInformation = 1,
                ObjectTypeInformation = 2,
                ObjectAllTypesInformation = 3,
                ObjectHandleInformation = 4
            }

            [Flags]
            public enum ProcessAccessFlags : uint
            {
                All = 0x001F0FFF,
                Terminate = 0x00000001,
                CreateThread = 0x00000002,
                VMOperation = 0x00000008,
                VMRead = 0x00000010,
                VMWrite = 0x00000020,
                DupHandle = 0x00000040,
                SetInformation = 0x00000200,
                QueryInformation = 0x00000400,
                Synchronize = 0x00100000
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct OBJECT_BASIC_INFORMATION
            { // Information Class 0
                public int Attributes;
                public int GrantedAccess;
                public int HandleCount;
                public int PointerCount;
                public int PagedPoolUsage;
                public int NonPagedPoolUsage;
                public int Reserved1;
                public int Reserved2;
                public int Reserved3;
                public int NameInformationLength;
                public int TypeInformationLength;
                public int SecurityDescriptorLength;
                public System.Runtime.InteropServices.ComTypes.FILETIME CreateTime;
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct OBJECT_TYPE_INFORMATION
            { // Information Class 2
                public UNICODE_STRING Name;
                public int ObjectCount;
                public int HandleCount;
                public int Reserved1;
                public int Reserved2;
                public int Reserved3;
                public int Reserved4;
                public int PeakObjectCount;
                public int PeakHandleCount;
                public int Reserved5;
                public int Reserved6;
                public int Reserved7;
                public int Reserved8;
                public int InvalidAttributes;
                public GENERIC_MAPPING GenericMapping;
                public int ValidAccess;
                public byte Unknown;
                public byte MaintainHandleDatabase;
                public int PoolType;
                public int PagedPoolUsage;
                public int NonPagedPoolUsage;
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct OBJECT_NAME_INFORMATION
            { // Information Class 1
                public UNICODE_STRING Name;
            }

            [StructLayout(LayoutKind.Sequential, Pack = 1)]
            public struct UNICODE_STRING
            {
                public ushort Length;
                public ushort MaximumLength;
                public IntPtr Buffer;
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct GENERIC_MAPPING
            {
                public int GenericRead;
                public int GenericWrite;
                public int GenericExecute;
                public int GenericAll;
            }

            [StructLayout(LayoutKind.Sequential, Pack = 1)]
            public struct SYSTEM_HANDLE_INFORMATION
            { // Information Class 16
                public int ProcessID;
                public byte ObjectTypeNumber;
                public byte Flags; // 0x01 = PROTECT_FROM_CLOSE, 0x02 = INHERIT
                public ushort Handle;
                public int Object_Pointer;
                public UInt32 GrantedAccess;
            }

            public const int MAX_PATH = 260;
            public const uint STATUS_INFO_LENGTH_MISMATCH = 0xC0000004;
            public const int DUPLICATE_SAME_ACCESS = 0x2;
            public const uint FILE_SEQUENTIAL_ONLY = 0x00000004;
        }
        #endregion
    }
}