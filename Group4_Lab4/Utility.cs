using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Windows.Forms;

namespace Group4_Lab4
{
    public class Utility
    {
        public enum ErrorBorrow
        {
            OK,
            Connect,
            TooMuch,
            CopyNotExist,
            CopyReferenced,
            CopyBorrowed,
            CopyReserved
        };

        public enum ErrorReserve
        {
            OK,
            Connect,
            CopyNotExist,
            Reserved,
            Available,
            Referenced
        };

        /*public void Embed(Panel p, Form f)
        {
            p.Controls.Clear();
            f.FormBorderStyle = FormBorderStyle.None;
            f.TopLevel = false;
            f.Visible = true;
            f.Dock = DockStyle.Fill;
            p.Controls.Add(f);//thêm form mới vào panel
            p.Show();
        }*/
    }
}
