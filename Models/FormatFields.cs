using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FormatFields
/// </summary>
public class FormatFields
{
    public string FormatPhone(string phone)
    {
        try
        {
            phone = phone.Replace("-", "");
            phone = phone.Replace("(", "");
            phone = phone.Replace(")", "");
            phone = phone.Replace(" ", "");

            if (phone.Length == 11 || phone.Length == 10)
            {
                if (phone.Length > 10)
                    phone = phone.Remove(0, 1);

                phone = phone.Insert(0, "(");
                phone = phone.Insert(4, ")");
                phone = phone.Insert(8, "-");
            }
        }
        catch { }

        return phone;
    }
}