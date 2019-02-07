using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BObjects
/// </summary>
namespace BObjects
{
    public class Student
    {
        public string regid { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string email  { get; set; }
        public string phno { get; set; }
        public string pwd { get; set; }
        public string courseid { get; set; }
    }
    public class Teacher
    {
        public string regid { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string email  { get; set; }
        public string pwd { get; set; }
        public string phno { get; set; }
        public string courseid { get; set; }
        public string qualificationid { get; set; }
        public string experiance { get; set; }
    }
    public class Course
    {
        public string courseid { get; set; }
        public string cname { get; set; }
        public string fee { get; set; }
        public string duartion { get; set; }
        public string semcount { get; set; }
        public string classname { get; set; }
        public string year_sem { get; set; }
        public string abbre { get; set; }
    }
    public class seminar
    {
        public string semid { get; set; }
        public string topic { get; set; }
        public string descriptn { get; set; }
        public string img { get; set; }
        public string file { get; set; }
        public string category { get; set; }
        public string uploadedby { get; set; }
        public string status { get; set; }
        public string rate { get; set; }
        public string type { get; set; }
    }
    public class question
    {
        public string qstnid { get; set; }
        public string subjectid { get; set; }
        public string qstn { get; set; }
        public string option1 { get; set; }
        public string option2 { get; set; }
        public string option3 { get; set; }
        public string option4 { get; set; }
        public string answer { get; set; }
    }

    public class Notes
    {
        public string noteid { get; set; }
        public string uploaded_by { get; set; }
        public string uploaded_on { get; set; }
        public string status { get; set; }
        public string subject_id { get; set; }
        public string type { get; set; }
        public string preference { get; set; }
        public string topic { get; set; }
        public string note_path { get; set; }
        public string image_file { get; set; }
        public string download_type { get; set; }
        public string rate { get; set; }
    }
    public class qstnPaper
    {
        public string qstnid { get; set; }
        public string subjectid { get; set; }
        public string qstn_name { get; set; }
        public string status { get; set; }
        public string year { get; set; }
        public string semester { get; set; }
        public string setnum { get; set; }
        public string filepath { get; set; }
    }
}