package student_registration.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import student_registration.models.Student;

public class StudentReposistory {

	public static Connection con=null;
	static {
		con = MyConnection.getConnection();
	}
	
	//crud
	//create
	public int add(Student student) { 
		int result=0;
		String sql="INSERT INTO student(id,student_id,student_name,dateofbirth,gender,phone,education,course) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, student.getId());
			ps.setString(2, student.getStudent_id());
			ps.setString(3, student.getStudent_name());
			ps.setString(4, student.getDateofbirth());
			ps.setString(5, student.getGender());
			ps.setString(6, student.getPhone());
			ps.setString(7, student.getEducation());
			ps.setString(8, student.getCourse());
			result=ps.executeUpdate();
//			
			
			
		}catch(SQLException e) {
			result=0;
			System.out.println("insert error: "+e);
		}
		return result;
	}
	
	public int edit(Student student) {
		int result=0;
		String sql="UPDATE student SET student_id=?,student_name=?,dateofbirth=?,gender=?,phone=?,education=?,course=? where id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,student.getStudent_id());
			ps.setString(2,student.getStudent_name());
			ps.setString(3,student.getDateofbirth());
			ps.setString(4,student.getGender());
			ps.setString(5,student.getPhone());
			ps.setString(6,student.getEducation());
			ps.setString(7,student.getCourse());
			ps.setInt(8,student.getId());
			result=ps.executeUpdate();
			
		}catch(SQLException e) {
			result=0;
			System.out.println("student edit error: "+e);
		}
		return result;
	}
	//delete
	public int delete(Integer id) {
		int result=0;
		String sql="DELETE FROM student WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1 , id);
			result=ps.executeUpdate();
			
		}catch(SQLException e) {
			result=0;
			System.out.println("student delete err: "+e);
		}
		return result;
	}
	
	//getAll
			public List<Student>getAll(){
				
				List<Student> students=new ArrayList<>();
				String sql="SELECT * FROM Student";
				try {
					PreparedStatement ps=con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						Student student = new Student();
						student.setId(rs.getInt("id"));
						student.setStudent_id(rs.getString("student_id"));
						student.setStudent_name(rs.getString("student_name"));
						student.setDateofbirth(rs.getString("dateofbirth"));
						student.setGender(rs.getString("gender"));
						student.setPhone(rs.getString("phone"));
						student.setEducation(rs.getString("education"));
						student.setCourse(rs.getString("course"));
						students.add(student);
					}
				}catch(SQLException e) {
					System.out.println("student select error: "+e);
				}
				return students;
			}
			
			//getbycode
			public Student getById(Integer id) {
				Student student=null;
				
				String sql="SELECT * FROM student WHERE id=?";
				try {
					PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					student=new Student();
					student.setId(rs.getInt("id"));
					student.setStudent_id(rs.getString("student_id"));
					student.setStudent_name(rs.getString("student_name"));
					student.setDateofbirth(rs.getString("dateofbirth"));
					student.setGender(rs.getString("gender"));
					student.setPhone(rs.getString("phone"));
					student.setEducation(rs.getString("education"));
					student.setCourse(rs.getString("course"));
					
				}
				}catch(SQLException e) {
					System.out.println("student select err: "+e);
				}
				return student;
			}
//			ps.setInt(1, student.getId());
//			ps.setString(2, student.getStudent_id());
//			ps.setString(3, student.getStudent_name());
//			ps.setString(4, student.getDateofbirth());
//			ps.setString(5, student.getGender());
//			ps.setString(6, student.getPhone());
//			ps.setString(7, student.getEducation());
//			ps.setString(8, student.getAttend());
}
