using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class CopyGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["book"] != null)
            {
                GridViewRow vrow = (GridViewRow)Session["book"];
                txtBookNum.Text = vrow.Cells[1].Text;
                txtTitle.Text = vrow.Cells[2].Text;
                displayButtons(1);
                txtBookNum.Enabled = false;
                txtTitle.Enabled = false;
                    
            }


        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // View
                case 1:
                    check = -1;
                    lblError.Visible = false;
                    txtType.Enabled = false;
                    txtPrice.Enabled = false;

                    btnAdd.Enabled = true;
                    btnEdit.Enabled = true;

                    btnSave.Enabled = false;
                    btnCancel.Enabled = false;

                    RequiredFieldValidator1.Enabled = false;
                    RegularExpressionValidator1.Enabled = false;
                    RegularExpressionValidator2.Enabled = false;
                    break;

                // Adding or editing
                case 2:
                    txtType.Enabled = true;
                    txtPrice.Enabled = true;
                    txtType.Focus();

                    btnAdd.Enabled = false;
                    btnEdit.Enabled = false;

                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;

                    RequiredFieldValidator1.Enabled = true;
                    RegularExpressionValidator1.Enabled = true;
                    RegularExpressionValidator2.Enabled = true;

                    break;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            check = 1;
            displayButtons(2);
            clear();
        }


        static int check = -1;

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                lblError.Text = "Error: No a copy is selected!";
                lblError.Visible = true;
                return;
            }
            check = 2;
            displayButtons(2);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Copy c = new Copy();
            c.BookNumber = int.Parse(txtBookNum.Text);
            c.SequenceNumber = CopyDAO.GetSeqNumMaxOfBook(c.BookNumber) + 1;

            ///Set Type
            if (!(txtType.Text[0].Equals('A')))
            {
                if (!(txtType.Text[0].Equals('R')))
                {
                    lblError.Text = "Type must be A or R";
                    lblError.Visible = true;
                    return;
                }
            }
            c.Type = txtType.Text[0];

            //Set Price
            if (txtPrice.Text == "") c.Price = 0;
            else
            {
                if (DAO.checkFloat(txtPrice.Text))
                {
                    c.Price = float.Parse(txtPrice.Text);
                }
                else
                {
                    lblError.Text = "Price must in range 0-999.999.999";
                    lblError.Visible = true;
                    return;
                }
            }
                
            

            if (check == 1)
            {
                CopyDAO.Insert(c);
                clear();
                displayButtons(1);
            }
                
            if(check == 2)
            {
                c.CopyNumber = (int)Session["copyNumber"];
                CopyDAO.Update(c);
                clear();
                displayButtons(1);
            }
            ObjectDataSource1.Select();
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["copyNumber"] = int.Parse(GridView1.SelectedRow.Cells[1].Text);
            txtType.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[4].Text);
            txtPrice.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[5].Text);
            if (txtType.Text.Equals("&nbsp;"))
            {
                txtType.Text = "";
            }
            if (txtPrice.Text.Equals("&nbsp;"))
            {
                txtPrice.Text = "";
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            lblNumberOfCopy.Text = GridView1.Rows.Count.ToString();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
            displayButtons(1);
        }

        private void clear()
        {
            txtPrice.Text = "";
            txtType.Text = "";

        }

        protected void txtBookNum_TextChanged(object sender, EventArgs e)
        {

        }
    }
}