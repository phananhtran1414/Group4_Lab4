using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class BookGUI : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayButtons(1);

            }
            
        }

        protected void btnCopies_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                lblError.Text = "Error: No a book is selected!";
                lblError.Visible = true;
                return;
            }
            lblError.Visible = false;
            GridViewRow vr = GridView1.SelectedRow;
            Session["book"] = vr;
            Response.Redirect("CopyGUI.aspx");
        }


        protected void btnFilter_Click(object sender, EventArgs e)
        {

            ObjectDataSource1.FilterExpression = " title LIKE '%" + txtFilter.Text + "%'";

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            lblNumberOfBook.Text = GridView1.Rows.Count.ToString() ;
            
        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // View
                case 1:
                    check = -1;
                    lblError.Visible = false;
                    txtTitle.Enabled = false;
                    txtPublisher.Enabled = false;
                    txtAuthors.Enabled = false;

                    btnAdd.Enabled = true;
                    btnEdit.Enabled = true;
                    btnCopies.Enabled = true;

                    btnSave.Enabled = false;
                    btnCancel.Enabled = false;

                    RequiredFieldValidator1.Enabled = false;

                    break;

                // Adding or editing
                case 2:
                    txtTitle.Enabled = true;
                    txtPublisher.Enabled = true;
                    txtAuthors.Enabled = true;

                    btnAdd.Enabled = false;
                    btnEdit.Enabled = false;
                    btnCopies.Enabled = false;

                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;

                    RequiredFieldValidator1.Enabled = true;
                    /*lblMessage.Visible = true;*/
                    break;

            }
        }

        static int check = -1;
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            check = 1;           //check = 1 là Add, = 2 là Edit;
            txtTitle.Text = "";
            txtAuthors.Text = "";
            txtPublisher.Text = "";
            lblMessage.Text = "1";
            displayButtons(2);

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                lblError.Text = "Error: No a book is selected!";
                lblError.Visible = true;
                return;
            }
            check = 2;            //check = 1 là Add, = 2 là Edit;
            lblMessage.Text = "2";
            displayButtons(2);

        }

        private void clear()
        {
            txtTitle.Text = "";
            txtPublisher.Text = "";
            txtAuthors.Text = "";
            txtFilter.Text = "";
            ObjectDataSource1.FilterExpression = " title LIKE '%" + txtFilter.Text + "%'";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            /*if (txtTitle.Text.Trim().Equals(""))
            {
                lblError.Text = "Title must not be empty";
                lblError.Visible = true;
                return;
            }*/
            
            if(check == 1)
            {
                string title = txtTitle.Text;
                string authors = txtAuthors.Text;
                string publisher = txtPublisher.Text;
                Book b = new Book(title, authors, publisher);
                if (BookDAO.Insert(b))
                {         
                    //lblError.Text = "";
                    clear();
                    displayButtons(1);
                    
                }
            }
            if(check == 2)
            {

                int bookNum = (int)Session["bookNumber"];
                string title = txtTitle.Text;
                string authors = txtAuthors.Text;
                string publisher = txtPublisher.Text;
                Book b = new Book(bookNum,title, authors, publisher);
                if (BookDAO.Update(b))
                {
                    //lblError.Text = "";
                    clear(); 
                    displayButtons(1);
                    
                }
            }
            /*GridView1.DataBind();
            ObjectDataSource1.Select();*/
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["bookNumber"] = int.Parse(GridView1.SelectedRow.Cells[1].Text);
            txtTitle.Text = GridView1.SelectedRow.Cells[2].Text;
            txtAuthors.Text = GridView1.SelectedRow.Cells[3].Text;
            txtPublisher.Text = GridView1.SelectedRow.Cells[4].Text;
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
            displayButtons(1);
        }

        
    }
}