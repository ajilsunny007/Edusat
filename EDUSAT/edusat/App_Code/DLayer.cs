using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BObjects;
using System.Data;

/// <summary>
/// Summary description for DLayer
/// </summary>
public class DLayer
{
    Dboperation db = new Dboperation();
    public int saveStudent(Student ob)
    {
        string sql1 = "insert into tbl_login values('" + ob.email + "','" + ob.pwd + "',2);";
        db.OpenConnection();
        db.ExeNonQuery(sql1);
        string sql2 = "insert into tbl_user values('" + ob.fname + "','" + ob.lname + "','" + ob.phno + "','" + ob.email + "',NULL," + ob.courseid + ",NULL,'" + DateTime.Now.ToShortDateString() + "')";
        int r1 = db.ExeNonQuery(sql2);
        db.CloseConnection();
        return r1;
    }
    public int checkEmailExist(string email)
    {
        DataTable dt = db.FillDataTable("select * from tbl_login where email='" + email + "'");
        return dt.Rows.Count;
    }
    public DataTable login(string uname, string pwd)
    {
        return db.FillDataTable("select * from tbl_login where email='" + uname + "' and password='" + pwd + "'");
    }
    public int saveTeacher(Teacher ob)
    {
        string sql1 = "insert into tbl_login values('" + ob.email + "','" + ob.pwd + "',3);";
        db.OpenConnection();
        db.ExeNonQuery(sql1);
        string sql2 = "insert into tbl_user values('" + ob.fname + "','" + ob.lname + "','" + ob.phno + "','" + ob.email + "'," + ob.experiance + ",'" + ob.courseid + "','" + ob.qualificationid + "','" + DateTime.Now.ToShortDateString() + "')";
        int r1 = db.ExeNonQuery(sql2);
        db.CloseConnection();
        return r1;
    }
    public int saveCourse(Course ob)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_course values('" + ob.cname + "','" + ob.duartion + "','" + ob.classname + "'," + ob.fee + ",'" + ob.year_sem + "','" + ob.semcount + "','" + ob.abbre + "')");
        db.CloseConnection();
        return r1;
    }
    public int checkCourseExist(string coursename)
    {
        DataTable dt = db.FillDataTable("select cname from tbl_course where cname='" + coursename + "'");
        return dt.Rows.Count;
    }
    public DataTable selectCourseS()
    {
        return db.FillDataTable("select row_number() over( order by  cname)as 'SL.No' ,* from tbl_course order by cname ");
    }
    public DataTable selectCourse(string id)
    {
        return db.FillDataTable("select * from tbl_course where courseid=" + id);
    }
    public int updateCourse(Course ob)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_course  set cname='" + ob.cname + "',duration='" + ob.duartion + "',abbrev='" + ob.abbre + "',class_type='" + ob.classname + "',fees=" + ob.fee + ",category='" + ob.year_sem + "',sem_count='" + ob.semcount + "'  where courseid=" + ob.courseid);
        db.CloseConnection();
        return r1;
    }
    public DataTable selectteacher(string email)
    {
        return db.FillDataTable("select a.*,b.cname,c.cname as 'qualif' from tbl_user a join tbl_course b on a.courseid=b.courseid join tbl_course c on a.qualification=c.courseid where email='" + email + "'");
    }
    public DataTable selectstudent(string email)
    {
        return db.FillDataTable("select a.*,b.cname from tbl_user a join tbl_course b on a.courseid =b.courseid where email='" + email + "'");
    }
    public int updateMobileForTeacher(string email, string phno)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_user  set phno='" + phno + "' where email='" + email + "'");
        db.CloseConnection();
        return r1;
    }
    public int updateMobileForstudent(string email, string phno)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_user  set phno='" + phno + "' where email='" + email + "'");
        db.CloseConnection();
        return r1;
    }
    public int checkSyllabusExist(string courseid,string sem)
    {
        DataTable dt = db.FillDataTable("select courseid from tbl_syllabus where courseid=" + courseid +" and semester="+sem);
        return dt.Rows.Count;
    }
    public int saveSyllabus(string courseid, string path, string snumber)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_syllabus values(" + courseid + ",'" + snumber + "','" + path + "','" + DateTime.Now.ToString() + "')");
        db.CloseConnection();
        return r1;
    }
    public int updateSyllabus(string courseid, string path, string snumber)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_syllabus  set spath='" + path + "',semester='" + snumber + "',upload_date='" + DateTime.Now.ToString() + "' where courseid='" + courseid + "'");
        db.CloseConnection();
        return r1;
    }
    public DataTable selectSyllabusS()
    {
        return db.FillDataTable("select row_number() over( order by  cname)as 'SL.No',spath,cname,sid,upload_date,'Semester '+semester as 'semester' from tbl_course a  join tbl_syllabus b on a.courseid=b.courseid order by a.cname");
    }
    public int deleteSyllabus(string sid)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("delete from tbl_syllabus where sid=" + sid);
        db.CloseConnection();
        return r1;
    }
    public int saveSeminarCategory(string cat)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_sem_category values('" + cat + "')");
        db.CloseConnection();
        return r1;
    }
    public int checkExiSemCategoryS(string cat)
    {
        DataTable dt = db.FillDataTable("select category  from tbl_sem_category where category='" + cat + "'");
        return dt.Rows.Count;
    }
    public DataTable selectSemCategoryS()
    {
        return db.FillDataTable("select row_number() over( order by  category)as 'no',category,id from tbl_sem_category order by category");
    }
    public int saveSeminar(seminar ob)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_seminars values('" + ob.topic.Replace("'", "''") + "','" + ob.descriptn.Replace("'", "''") + "','" + ob.img + "','" + ob.file + "','" + ob.uploadedby + "'," + ob.status + ",'" + DateTime.Now.ToString() + "'," + ob.category + ",'" + ob.type + "'," + ob.rate + ")");
        db.CloseConnection();
        return r1;
    }
    public int deleteSeminar(string sid)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("delete from tbl_seminars where seminarid=" + sid);
        db.CloseConnection();
        return r1;
    }
    public DataTable selectSeminarSForAdminApproval()
    {
        return db.FillDataTable(@"select  row_number() over( order by  uploadedon desc)as 'no',a.seminarid, a.topic,a.abstractfile,a.uploadedon,
b.category , c.fname + ' ' + c.lname as 'Name', c.experiance +' Year' as 'Experiance',d.abbrev as 'Takencourse',e.abbrev as 'Qualif' from tbl_seminars a 
join tbl_sem_category b on a.catid=b.id join tbl_user c on c.email=a.uploadedby 
join tbl_course d on d.courseid=c.courseid join tbl_course e on e.courseid=c.qualification
 where  status=0 order by uploadedon desc");
    }
    public DataTable selectSeminarSForAdminView()
    {
        return db.FillDataTable("select row_number() over( order by  uploadedon desc)as 'no',a.*,b.category,'Rs.'+CONVERT(varchar(10), a.rate ) as 'DRate' from tbl_seminars a join tbl_sem_category b on a.catid=b.id where status=1 order by uploadedon desc ");
    }
    public DataTable selectSeminarSForUsers()
    {
        return db.FillDataTable("select top 50 row_number() over( order by  uploadedon desc)as 'no',a.*,b.category from tbl_seminars a join tbl_sem_category b on a.catid=b.id where status=1 order by uploadedon desc ");
    }
    public DataTable selectSeminarSForTeacherOwn(string userid)
    {
        return db.FillDataTable(@"select  row_number() over( order by  uploadedon desc)as 'no',a.topic,a.abstractfile,a.uploadedon,
        case when a.status=0 then 'Not Approved' when a.status=1 then 'Approved' when a.status=0 then 'Rejected' end as 'status',
        b.category from tbl_seminars a join tbl_sem_category b on a.catid=b.id  and uploadedby='" + userid + "' order by uploadedon desc ");
    }
    public int saveQuestion(question ob)
    {
        try
        {
            db.begintransaction();
            db.OpenConnection();
            int qstnid = (int)db.ExeScalar("insert into tbl_question output inserted.qstnid values('" + ob.qstn + "'," + ob.subjectid + ",'" + ob.answer + "')");

            string sql = "insert into tbl_options values('" + ob.option1 + "'," + qstnid + "),('" + ob.option2 + "'," + qstnid + "),('" + ob.option3 + "'," + qstnid + "),('" + ob.option4 + "'," + qstnid + ");";
            int i = db.ExeNonQuery(sql);
            db.CloseConnection();
            db.committransaction();
            return i;
        }
        catch
        {
            db.rollbacktransaction(); return 0;
        }
    }
    public DataTable selectQuestionbySubject(string subid)
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        dt2.Columns.Add("no", typeof(int));
        dt2.Columns.Add("q_id", typeof(int));
        dt2.Columns.Add("qstn", typeof(string));
        dt2.Columns.Add("op1", typeof(string));
        dt2.Columns.Add("op2", typeof(string));
        dt2.Columns.Add("op3", typeof(string));
        dt2.Columns.Add("op4", typeof(string));
        dt2.Columns.Add("answr", typeof(string));
        string str = "select top(15) * from tbl_question where subjectid=" + subid + " order by NEWID() ";
        dt = db.FillDataTable(str);
        //Label1.Text = dt.Rows[i]["question"].ToString();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string ques = dt.Rows[i]["qstnid"].ToString();
            int q = Convert.ToInt32(ques);
            string str1 = "select optid,questionid,optn from tbl_options where questionid=" + q + " order by NEWID()";
            dt1 = db.FillDataTable(str1);
            //dt2.Rows.Add(dt1.Rows[0][]);
            DataRow dr = dt2.NewRow();
            dr["no"] = i + 1;
            dr["q_id"] = dt.Rows[i]["qstnid"];
            dr["qstn"] = dt.Rows[i]["qstn"];
            dr["op1"] = dt1.Rows[0]["optn"];
            dr["op2"] = dt1.Rows[1]["optn"];
            dr["op3"] = dt1.Rows[2]["optn"];
            dr["op4"] = dt1.Rows[3]["optn"];
            dr["answr"] = dt.Rows[i]["answer"];
            dt2.Rows.Add(dr);
        }
        return dt2;
    }
    public int deletetQuestions(string id)
    {
        try
        {
            db.begintransaction();
            db.OpenConnection();
            int qstnid = (int)db.ExeScalar("delete from tbl_question where qstnid=" + id);

            string sql = "delete from tbl_options where qstnid=" + id;
            int i = db.ExeNonQuery(sql);
            db.CloseConnection();
            db.committransaction();
            return i;
        }
        catch
        {
            db.rollbacktransaction(); return 0;
        }
    }
    public int saveSubject(string subname, string courseid, string sem)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_subject values('" + subname + "'," + courseid + "," + sem + ")");
        db.CloseConnection();
        return r1;
    }
    public DataTable selectSubjectbyCourse(string cid)
    {
        return db.FillDataTable("select row_number() over( order by  sem, subname)as 'no',* from tbl_subject where courseid=" + cid + " order by sem, subname");
    }
    public int deleteSubject(string subid)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("delete from tbl_subject where subid=" + subid);
        db.CloseConnection();
        return r1;
    }
    public DataTable getSeminarDeatils(string semid)
    {
        return db.FillDataTable("select * from tbl_seminars where seminarid=" + semid);
    }
    public DataTable getSeminarDeatilsByCategory(string semid)
    {
        return db.FillDataTable("select * from tbl_seminars where catid=" + semid);

    }
    public int updateSeminarstatus(string semid, string status)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_seminars set status=" + status + " where seminarid=" + semid);
        db.CloseConnection();
        return r1;
    }
    public int saveNotes(Notes obj)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_note values('" + obj.uploaded_by + "','" + obj.uploaded_on + "'," + obj.status + ",'" + obj.subject_id + "','" + obj.type + "','" + obj.preference + "','" + obj.topic + "','" + obj.note_path + "','" + obj.image_file + "','" + obj.download_type + "'," + obj.rate + ")");
        db.CloseConnection();
        return r1;
    }
    public DataTable selectNotePref()
    {
        return db.FillDataTable("select * from tbl_note_pref");
    }
    public DataTable selectQuestionbyCourse(string courseid)
    {
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        dt2.Columns.Add("no", typeof(int));
        dt2.Columns.Add("q_id", typeof(int));
        dt2.Columns.Add("qstn", typeof(string));
        dt2.Columns.Add("op1", typeof(string));
        dt2.Columns.Add("op2", typeof(string));
        dt2.Columns.Add("op3", typeof(string));
        dt2.Columns.Add("op4", typeof(string));
        dt2.Columns.Add("answr", typeof(string));
        string str = "select top(15) * from tbl_question where subjectid in(select subid from tbl_subject where courseid=" + courseid + " ) order by NEWID() ";
        dt = db.FillDataTable(str);
        //Label1.Text = dt.Rows[i]["question"].ToString();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string ques = dt.Rows[i]["qstnid"].ToString();
            int q = Convert.ToInt32(ques);
            string str1 = "select optid,questionid,optn from tbl_options where questionid=" + q + " order by NEWID()";
            dt1 = db.FillDataTable(str1);
            //dt2.Rows.Add(dt1.Rows[0][]);
            DataRow dr = dt2.NewRow();
            dr["no"] = i + 1;
            dr["q_id"] = dt.Rows[i]["qstnid"];
            dr["qstn"] = dt.Rows[i]["qstn"];
            dr["op1"] = dt1.Rows[0]["optn"];
            dr["op2"] = dt1.Rows[1]["optn"];
            dr["op3"] = dt1.Rows[2]["optn"];
            dr["op4"] = dt1.Rows[3]["optn"];
            dr["answr"] = dt.Rows[i]["answer"];
            dt2.Rows.Add(dr);
        }
        return dt2;
    }
    public int saveScore(int score, int rate, string username)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_exam_score values('" + DateTime.Now.ToString("MM-dd-yyyy") + "'," + score + ",'" + rate + "','" + username + "')");
        db.CloseConnection();
        return r1;
    }
    public DataTable selectStudentNotes(string email)
    {
        return db.FillDataTable(@"select top 10 * from tbl_note where preference=( select top 1 rate  from tbl_exam_score where username='" + email + "' order by exdate desc) and subject_id in(select subid from tbl_subject where courseid=(select courseid from tbl_user where email='" + email + "'))");
    }
    public DataTable selectUserNotes(string subjectid, string type)
    {
        return db.FillDataTable("select row_number() over( order by  uploaded_on desc)as 'no',*,b.preference as 'qual' from tbl_note a join tbl_note_pref b on a.preference=b.npid  where type='" + type + "' and subject_id=" + subjectid);
    }
    public DataTable selectNoteSForAdminApproval()
    {
        return db.FillDataTable(@"select  row_number() over( order by  uploaded_on desc)as 'no',a.note_id, a.topic,
a.note_path,a.uploaded_on,b.subname , c.fname + ' ' + c.lname as 'Name',
 c.experiance +' Year' as 'Experiance',d.abbrev as 'Takencourse',e.abbrev as 'Qualif',f.preference
  from tbl_note a join tbl_subject b on a.subject_id=b.subid join tbl_user c 
  on c.email=a.uploaded_by join tbl_course d on d.courseid=c.courseid join tbl_course e 
  on e.courseid=c.qualification join tbl_note_pref f on f.npid=a.preference where  status=0 order by uploaded_on desc");
    }
    public DataTable getNotedetails(string noteid)
    {
        return db.FillDataTable("select * from tbl_note where note_id=" + noteid);
    }
    public int updateNoteStatus(string noteid, string status)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("update tbl_note set status=" + status + " where note_id=" + noteid);
        db.CloseConnection();
        return r1;
    }
    public DataTable getPassword(string email)
    {
        return db.FillDataTable("select password from tbl_login where email=" + email);
    }
    public DataTable getChatMsg(string courseid)
    {
        return db.FillDataTable("select * from tbl_user r join textchat t on r.email=t.email join tbl_login u on u.email=r.email where r.courseid='" + courseid + "' order by chatdate");
    }
    public DataTable getchatname(string email)
    {
        return db.FillDataTable("select fname+' '+ lname as 'name' from tbl_user a join tbl_login b on a.email=b.email where b.email='" + email + "'");
    }
    public string getcourseid(string email)
    {
        return db.FillDataTable("select courseid from tbl_user where email='" + email + "'").Rows[0]["courseid"].ToString();
    }
    public int saveChat(string msg,string cid,string email)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into textchat values('" + msg + "','" + cid + "','" + email + "','" + DateTime.Now.ToString("MM-dd-yyyy hh:ss:mm") + "')");
        db.CloseConnection();
        return r1;
    }
    public DataTable getnoteById(string noteid)
    {
        return db.FillDataTable(@"select row_number() over( order by  uploaded_on desc)as 'no',*,b.preference as 'qual' from
 tbl_note a join tbl_note_pref b on a.preference=b.npid  where note_id="+noteid);
    }
    public int savePrevQstn(qstnPaper ob)
    {
        db.OpenConnection();
        int r1 = db.ExeNonQuery("insert into tbl_qstnpaper values(" + ob.subjectid + ",'" + ob.qstn_name + "'," + ob.year + ",'" + ob.semester + "',"+ob.setnum+",'"+ob.filepath+"')");
        db.CloseConnection();
        return r1;
    }
    public DataTable getQuestionPapers(string semester, string subid)
    {
        return db.FillDataTable("select * from tbl_qstnpaper a join tbl_subject b on a.subjectid=b.subid where  b.subid='" + subid + "' and a.semester='" + semester + "' order by a.year");
    }
    public DataTable getSyllabusbyCourse(string cid)
    {
        return db.FillDataTable("select row_number() over( order by  cname)as 'SL.No',spath,cname,sid,upload_date,'Semester '+semester as 'semester' from tbl_course a  join tbl_syllabus b on a.courseid=b.courseid where a.courseid="+cid+" order by a.cname");
    }
}