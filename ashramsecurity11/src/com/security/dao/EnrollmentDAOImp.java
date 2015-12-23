package com.security.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.security.domain.ArtofLiving;
import com.security.domain.EmployeeActivities;
import com.security.domain.EmployeeEducation;
import com.security.domain.EmployeeFamily;
import com.security.domain.EmployeeForm;
import com.security.domain.EmployeeLanguage;
import com.security.domain.EmployeeLeaveDTO;
import com.security.domain.EmployeeRecommendation;
import com.security.domain.EmployeeReferences;
import com.security.domain.EmployeeSalaryDTO;
import com.security.domain.EmployeeWork;
import com.security.domain.FoundItems;
import com.security.domain.G4SSecurity;
import com.security.domain.InhouseSecurity;
import com.security.domain.LeaveApplication;
import com.security.domain.LostItems;
import com.security.domain.PassRegister;
import com.security.domain.Salary;
import com.security.domain.Twowheeler;
import com.security.dto.AgencyDto;
import com.security.dto.InHosueDto;

@Repository("EnrollmentDAO")
@Transactional
public class EnrollmentDAOImp implements 
EnrollmentDAO{
	
	
	@Resource
	private SessionFactory sessionFactory;
	
	
	public String getRole(String username,String password)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select l.role from Login l where l.username='"+username+"' and l.password='"+password+"'";
	String role=session.createQuery(hql).list().toString();
	return role;
	}
	
	public void insertEmployee(EmployeeForm empform)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		
        
		session.save(empform);
	}
	public void insertEmpFamily(EmployeeFamily empfamily)
	{
			org.hibernate.classic.Session session = sessionFactory
			.getCurrentSession();   
			  // Retrieve session from Hibernate
			
			  
			  // Persists to db
			  session.save(empfamily);
			   
			  // Add to person as well
			  // Retrieve existing person via id
			//  EmployeeForm existingPerson = (EmployeeForm) session.get(EmployeeForm.class,empid);
			   
			  // Assign updated values to this person
			 // existingPerson.getEmployeefamily().add(empfamily);
			 
			  // Save updates
			 // session.save(existingPerson);
		
		
		
	}
	public void saveEmpLang(EmployeeLanguage emplang)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(emplang);
	}
	public void saveEmpEducation(EmployeeEducation empeducation)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(empeducation);
	}
	public void saveEmpWork(EmployeeWork empwork)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(empwork);
	}
	public void saveEmpActivity(EmployeeActivities empactivities)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(empactivities);
	}
	public void saveArtofliving(ArtofLiving artofliving)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(artofliving);
	}
	public void saveEmployeeRecommendation(EmployeeRecommendation empracommendation)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(empracommendation);
	}
	public void saveEmployeeReferences(EmployeeReferences empreferences)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession(); 
		session.save(empreferences);
	}
	public List<EmployeeForm> getEmployeeList(String empname)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeForm empform where empform.empname='"+empname+"'";
	List<EmployeeForm>	list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeForm> getEmployeeDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeForm ";
	List<EmployeeForm>	list=session.createQuery(hql).list();
	System.out.println("In Emolyee Dao Impl List Size:"+list.size());
		return list;
	}
	public void deleteEmployee(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="delete EmployeeForm empform where empform.empid='"+empid+"'";
	session.createQuery(hql).executeUpdate();

	}
	public EmployeeForm employeeDetails(int empid)
	{
		
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		

		EmployeeForm empform= (EmployeeForm) session.get(EmployeeForm.class, empid);
		//empform.getEmpname();
		//empform.getEmpfname();
		return empform;
	
		/*org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeForm empform where empform.empid='"+empid+"'";
		EmployeeForm list=(EmployeeForm)session.createQuery(hql).list();
		return list;*/
		
	}
	public List<EmployeeFamily> employeeFamilyDetails(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeFamily empfamily where empfamily.empid='"+empid+"'";
		List<EmployeeFamily> list=session.createQuery(hql).list();
		return list;	
	}
	public List<EmployeeEducation> employeeEducation(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeEducation empeducation where empeducation.empid='"+empid+"'";
		List<EmployeeEducation> list=session.createQuery(hql).list();
		return list;
		
	}
	public List<EmployeeLanguage> employeeLanguage(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		//return (EmployeeLanguage) session.get(EmployeeLanguage.class, empid);
		String hql="from EmployeeLanguage emplanguage where emplanguage.empid='"+empid+"'";
		List<EmployeeLanguage> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeWork> employeeWork(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeWork empwork where empwork.empid='"+empid+"'";
		List<EmployeeWork> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeActivities> employeeActivity(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeActivities empactivity where empactivity.empid='"+empid+"'";
		List<EmployeeActivities> list=session.createQuery(hql).list();
		return list;
		
	}
	public List<ArtofLiving> employeeArtofliving(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from ArtofLiving artofliving where artofliving.empid='"+empid+"'";
		List<ArtofLiving> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeRecommendation> empRecommendation(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeRecommendation emprecommendation where emprecommendation.empid='"+empid+"'";
		List<EmployeeRecommendation> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeReferences> empReferences(int empid)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from EmployeeReferences empreferences where empreferences.empid='"+empid+"'";
		List<EmployeeReferences> list=session.createQuery(hql).list();
		return list;
	}
	public void updateEmployee(EmployeeForm empform)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeForm ef set ef.empname='"+empform.getEmpname()+"',ef.empdob='"+empform.getEmpdob()+"'," +
				"ef.empgender='"+empform.getEmpgender()+"',ef.empfname='"+empform.getEmpfname()+"',ef.empfproffession='"+empform.getEmpfproffession()+"'," +
						"ef.fcontactno='"+empform.getFcontactno()+"',ef.emp_currentaddress='"+empform.getEmp_currentaddress()+"',ef.emp_permanentaddress='"+empform.getEmp_permanentaddress()+"'," +
								"ef.emp_mobileno='"+empform.getEmp_mobileno()+"',ef.emp_alternatemobileno='"+empform.getEmp_alternatemobileno()+"',ef.emp_email='"+empform.getEmp_email()+"',ef.emp_maritalstatus='"+empform.getEmp_maritalstatus()+"'," +
										"ef.emp_noofchildrens='"+empform.getEmp_noofchildrens()+"',ef.emp_noofsons='"+empform.getEmp_noofsons()+"',ef.emp_sonage='"+empform.getEmp_sonage()+"'," +
												"ef.emp_noofdaughters='"+empform.getEmp_noofdaughters()+"',ef.emp_daughterage='"+empform.getEmp_daughterage()+"',ef.emp_date='"+empform.getEmp_date()+"',ef.emp_place='"+empform.getEmp_place()+"'," +
														"ef.emp_probation_period='"+empform.getEmp_probation_period()+"',ef.emp_department='"+empform.getEmp_department()+"',ef.emp_designation='"+empform.getEmp_designation()+"',ef.emp_expected_joining_date='"+empform.getEmp_expected_joining_date()+"'," +
																"ef.joinedon='"+empform.getJoinedon()+"',ef.emp_office_supervisor='"+empform.getEmp_office_supervisor()+"',ef.emp_head_training='"+empform.getEmp_head_training()+"',ef.emp_head_ashram_security='"+empform.getEmp_head_ashram_security()+"',ef.empstatus='"+empform.getEmpstatus()+"',ef.emp_rejoined_date='"+empform.getEmp_rejoined_date()+"' ,ef.rollno='"+empform.getRollno()+"',ef.employee_salary='"+empform.getEmployee_salary()+"' where ef.empid='"+empform.getEmpid()+"'";
	session.createQuery(hql).executeUpdate();
	}
	public void updateFamily(EmployeeFamily empfamily)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeFamily ef set ef.emp_fname='"+empfamily.getEmp_fname()+"',ef.emp_relationship='"+empfamily.getEmp_relationship()+"'," +
				"ef.emp_foccupation='"+empfamily.getEmp_foccupation()+"',ef.emp_fage='"+empfamily.getEmp_fage()+"' where ef.id='"+empfamily.getId()+"' and ef.empid='"+empfamily.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	
	}
	public void updateLanguage(EmployeeLanguage emplanguage)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeLanguage el set el.emp_lang_known='"+emplanguage.getEmp_lang_known()+"',el.emp_lang_speak='"+emplanguage.getEmp_lang_speak()+"'," +
				"el.emp_lang_read='"+emplanguage.getEmp_lang_read()+"',el.emp_lang_write='"+emplanguage.getEmp_lang_write()+"',el.emp_lang_level='"+emplanguage.getEmp_lang_level()+"' where el.id='"+emplanguage.getId()+"' and el.empid='"+emplanguage.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateEducation(EmployeeEducation empeducation)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeEducation ee set ee.emp_exam_passed='"+empeducation.getEmp_exam_passed()+"',ee.emp_institute='"+empeducation.getEmp_institute()+"'," +
				"ee.emp_duration_course='"+empeducation.getEmp_duration_course()+"',ee.emp_yearofpass='"+empeducation.getEmp_yearofpass()+"'," +
						"ee.emp_percentage='"+empeducation.getEmp_percentage()+"' where ee.id='"+empeducation.getId()+"' and ee.empid='"+empeducation.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateWork(EmployeeWork empwork)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeWork ew set ew.emp_company_name='"+empwork.getEmp_company_name()+"',ew.emp_designation='"+empwork.getEmp_designation()+"'," +
				"ew.emp_sal='"+empwork.getEmp_sal()+"',ew.emp_period='"+empwork.getEmp_period()+"',ew.emp_leavejob='"+empwork.getEmp_leavejob()+"'" +
						"where ew.id='"+empwork.getId()+"' and ew.empid='"+empwork.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateActivity(EmployeeActivities empactivity)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeActivities ea set ea.activitytype='"+empactivity.getActivitytype()+"',ea.emp_atschool='"+empactivity.getEmp_atschool()+"'," +
				"ea.emp_atcollege='"+empactivity.getEmp_atcollege()+"',ea.emp_later='"+empactivity.getEmp_later()+"'" +
						"where ea.id='"+empactivity.getId()+"' and ea.empid='"+empactivity.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateArtofliving(ArtofLiving artofliving)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update ArtofLiving al set al.emp_course='"+artofliving.getEmp_course()+"',al.emp_location='"+artofliving.getEmp_location()+"'," +
				"al.emp_teacher='"+artofliving.getEmp_teacher()+"',al.emp_date='"+artofliving.getEmp_date()+"',al.emp_remarks='"+artofliving.getEmp_remarks()+"'" +
						"where al.id='"+artofliving.getId()+"' and al.empid='"+artofliving.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateRecommendation(EmployeeRecommendation emprecommendation)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="update EmployeeRecommendation er set er.emp_name_address='"+emprecommendation.getEmp_name_address()+"'," +
				"er.emp_teachercode='"+emprecommendation.getEmp_teachercode()+"',er.emp_teacher_mobile='"+emprecommendation.getEmp_teacher_mobile()+"'," +
						"er.emp_teacher_email='"+emprecommendation.getEmp_teacher_email()+"' where er.id='"+emprecommendation.getId()+"' and er.empid='"+emprecommendation.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void updateReferences(EmployeeReferences empreferences)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		
		String hql="update EmployeeReferences ere set ere.emp_ref_name='"+empreferences.getEmp_ref_name()+"',ere.emp_ref_address='"+empreferences.getEmp_ref_address()+"'," +
				"ere.emp_ref_mobile='"+empreferences.getEmp_ref_mobile()+"',ere.emp_ref_emailid='"+empreferences.getEmp_ref_emailid()+"' where ere.id='"+empreferences.getId()+"' and ere.empid='"+empreferences.getEmpid()+"'";
		session.createQuery(hql).executeUpdate();
	}
	public void insertG4SSecurity(G4SSecurity g4ssecurity)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		session.save(g4ssecurity);
	}
	public void saveInhouseSecurity(InhouseSecurity inhousesecurity)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		session.save(inhousesecurity);
	}
	public List<G4SSecurity> getG4SSecuritydetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="From G4SSecurity";
		List<G4SSecurity> list=session.createQuery(hql).list();
		return list;
	}
	public List<G4SSecurity> getG4SSecuritydetailsById(int id)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="From G4SSecurity where id='"+id+"'";
		List<G4SSecurity> list=session.createQuery(hql).list();
		return list;
	}
	public List<G4SSecurity> getG4SSecurityDetailsByDate(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="From G4SSecurity where g4s_date='"+Date+"'";
		List<G4SSecurity> list=session.createQuery(hql).list();
		return list;
	}
	public List<InhouseSecurity> getInhouswSecuritydetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="From InhouseSecurity";
		List<InhouseSecurity> list=session.createQuery(hql).list();
		return list;
	}
	public Long getPoDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='P/O' and g4s_shift='Day Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getPoNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='P/O' and g4s_shift='Night Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getSsDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='S/S' and g4s_shift='Day Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getSsNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='S/S' and g4s_shift='Night Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getHgDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='H/G' and g4s_shift='Day Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getHgNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='H/G' and g4s_shift='Night Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getSgDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='S/G' and g4s_shift='Day Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getSgNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(g4s_shift) From G4SSecurity where g4s_date='"+Date+"' and g4s_rank='S/G' and g4s_shift='Night Shift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhousePoDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='P/O' and inhouse_shift='DayShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		System.out.println("dao pocount"+result);
		return result;
	}
	public Long getInhousePoNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='P/O' and inhouse_shift='NightShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseSsDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='S/S' and inhouse_shift='DayShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseSsNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='S/S' and inhouse_shift='NightShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseHgDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='H/G' and inhouse_shift='DayShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseHgNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='H/G' and inhouse_shift='NightShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseSgDayShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='S/G' and inhouse_shift='DayShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public Long getInhouseSgNightShiftCount(String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="select count(inhouse_shift) From InhouseSecurity where inhouse_date='"+Date+"' and inhouse_rank='S/G' and inhouse_shift='NightShift'";
		Long result=(Long)session.createQuery(hql).list().get(0);
		return result;
	}
	public List<InhouseSecurity> getMonthelyInhouseSecurityDetails(int emp_id,String fromDate,String toDate)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		Criteria criteria = session.createCriteria(InhouseSecurity.class);
		//criteria.add(Restrictions.between("date",startdate,enddate));

		 criteria.add(Restrictions.ge("inhouse_date",fromDate));
		 criteria.add(Restrictions.le("inhouse_date",toDate));
		criteria.add(Expression.eq("emp_id",emp_id));
		//criteria.add(Expression.le("date",enddate));
		criteria.addOrder(Order.asc("inhouse_date"));
		return criteria.list();
	}
	public List<G4SSecurity> getMonthelyG4SSecurityDetails(int emp_id,String fromDate,String toDate)
	{
		System.out.println("In getMonthelyG4SSecurityDetails Dao Impl");
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		Criteria criteria = session.createCriteria(G4SSecurity.class);
		//criteria.add(Restrictions.between("date",startdate,enddate));

		 criteria.add(Restrictions.ge("g4s_date",fromDate));
		 criteria.add(Restrictions.le("g4s_date",toDate));
		criteria.add(Expression.eq("emp_id",emp_id));
		//criteria.add(Expression.le("date",enddate));
		criteria.addOrder(Order.asc("g4s_date"));
		return criteria.list();
	}
	public int getCountOfLeaves(int emp_id,String fromDate,String toDate)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
	    String hql="select datediff(leave_todate,leave_fromdate) From LeaveApplication where emp_id='"+emp_id+"'";
		List list=session.createQuery(hql).list();
		int count=0;
		for(int i=0;i<list.size();i++)
		{
			int result=(Integer)list.get(i);
			
			count=count+result;
		}
		return count;
	}
	
	public Long getTotalNoofWorkingDays(int emp_id,String Date)
	{
	org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
    String hql="select count(g4s_date) from G4SSecurity where g4s_date like '"+Date+"%' and emp_id='"+emp_id+"' ";
	Long count=(Long)session.createQuery(hql).list().get(0);
	return count;
	}
	public Long getInhouseTotalNoofWorkingDays(int emp_id,String Date)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
    String hql="select count(inhouse_date) from InhouseSecurity where inhouse_date like '"+Date+"%' and emp_id='"+emp_id+"' ";
	Long count=(Long)session.createQuery(hql).list().get(0);
	
	return count;
	}
	
	public List<EmployeeForm> getEmpname(int emp_id)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		System.out.println("empname"+emp_id);
		String hql="from EmployeeForm where emp_id='"+emp_id+"'";
		List<EmployeeForm> list=session.createQuery(hql).list();
		//List list1=new ArrayList();
		//Iterator it=list.iterator();
		//while(it.hasNext())
		//{
			//EmployeeForm i=(EmployeeForm)it.next();
			
			//list1.add(i.getEmpname());
			//list1.add(i.getEmp_designation());
		//}
		return list;
		
	}
	
	/*public List getInhouseEmpname()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from InhouseSecurity ";
		List list=session.createQuery(hql).list();
		List list1=new ArrayList();
		Iterator it=list.iterator();
		while(it.hasNext())
		{
			InhouseSecurity i=(InhouseSecurity)it.next();
			
			list1.add("'"+i.getInhouse_empname()+"'");
		}
		return list1;
	}*/
	/*public List getG4SEmpname()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from G4SSecurity ";
		List list=session.createQuery(hql).list();
		List list1=new ArrayList();
		Iterator it=list.iterator();
		while(it.hasNext())
		{
			G4SSecurity i=(G4SSecurity)it.next();
			
			list1.add("'"+i.getG4s_empname()+"'");
		}
		return list1;
	}*/
	public void saveLostItems(LostItems lostitems)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		session.save(lostitems);
	}
	public void saveFoundItems(FoundItems founditems)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		session.save(founditems);
		
	}
	public List<LostItems> getLostItemDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from LostItems";
		List<LostItems> list=session.createQuery(hql).list();
		return list;
	}
	public List<FoundItems> getFoundItemDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from FoundItems";
		List<FoundItems> list=session.createQuery(hql).list();
		return list;
	}
	public void saveSalary(Salary salary)
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		session.save(salary);
	}
	public List<Salary> getG4SSalaryDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="from Salary where security_type='g4ssecurity'";
		List<Salary> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeSalaryDTO> getG4SEmployeeSalaryDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="SELECT NEW com.security.domain.EmployeeSalaryDTO(e.empid,e.empname, e.emp_designation, s.working_days, s.basic_salary, s.gross_salary, s.pf, s.esi,s.uniform,s.advance,s.total_deduction,s.net_pay,s.entered_by) FROM EmployeeForm e, Salary s WHERE e.empid=s.emp_id and s.security_type='g4ssecurity'";
		List<EmployeeSalaryDTO> list=session.createQuery(hql).list();
		return list;
	}
	public List<EmployeeSalaryDTO> getInhouseEmployeeSalaryDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="SELECT NEW com.security.domain.EmployeeSalaryDTO(e.empid,e.empname, e.emp_designation, s.working_days, s.basic_salary, s.gross_salary, s.pf, s.esi,s.uniform,s.advance,s.total_deduction,s.net_pay,s.entered_by) FROM EmployeeForm e, Salary s WHERE e.empid=s.emp_id and s.security_type='inhousesecurity'";
		List<EmployeeSalaryDTO> list=session.createQuery(hql).list();
		return list;
	}
	
	public List<EmployeeLeaveDTO> getEmployeeLeaveDetails()
	{
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="SELECT NEW com.security.domain.EmployeeLeaveDTO(e.empid,e.empname,l.dept,l.fromdate,l.todate,l.leavetype,l.number_duringleave)from EmployeeForm e,LeaveApplication l where e.empid=l.empid";
		List<EmployeeLeaveDTO> list=session.createQuery(hql).list();
		return list;
	}
	 public void insertLeaveForm(LeaveApplication leaveapplication) {
		 
		  System.out.println("from dao for leave");
		  org.hibernate.classic.Session session = sessionFactory
		    .getCurrentSession();
		    session.save(leaveapplication);
		 }
	 public List<LeaveApplication> getLeaveDetails()
	 {
	  org.hibernate.classic.Session session = sessionFactory
	  .getCurrentSession();
	  String hql="from LeaveApplication ";
	 List<LeaveApplication> list=session.createQuery(hql).list();
	  return list;
	 }
	 
	 public void insertTwowheeler(Twowheeler twowheeler) {
		  
		  System.out.println("from dao");
		  org.hibernate.classic.Session session = sessionFactory
		    .getCurrentSession();
		    session.save(twowheeler);
		 }
	 
	 public List<Twowheeler> getVehicledetails(String vehicletype,String fromdate,String todate) {
		  org.hibernate.classic.Session session = sessionFactory
		  .getCurrentSession();
		  System.out.println("from vehicledetails dao");
		  Criteria criteria = session.createCriteria(Twowheeler.class);
		  //criteria.add(Restrictions.between("date",startdate,enddate));
		  criteria.add(Restrictions.ge("date",fromdate));
		  criteria.add(Restrictions.le("date",todate));
		  criteria.add(Expression.eq("vehicletype",vehicletype));
		  //criteria.add(Expression.le("date",enddate));
		  criteria.addOrder(Order.asc("vehicletype"));
		  System.out.println("from vehicledetails dao before return");
		  return criteria.list();
		  
		 }

	
	public void saveReg(PassRegister passregister) {
	
		System.out.println("from passregisterdao");
		org.hibernate.classic.Session session = sessionFactory .getCurrentSession();
		session.save(passregister);
	}

public List<PassRegister> getPassRegister() {
	org.hibernate.classic.Session session = sessionFactory.getCurrentSession();
	  String hql="from PassRegister";
	  List<PassRegister> list=session.createQuery(hql).list();
	  System.out.println("List size In PassRegister"+list.size());
	  return list;
}


public List<PassRegister> getEmail(String name, String email_id) {

	org.hibernate.classic.Session session = sessionFactory.getCurrentSession();
	String hql = "Select email_id from PassRegister Where name='"+name+"'";
	System.out.println("in emaildao:"+email_id);
	 List<PassRegister> list=session.createQuery(hql).list();
	return list;
}


public PassRegister getEmail(int id) {

	org.hibernate.classic.Session session = sessionFactory
	.getCurrentSession();
	PassRegister pass= (PassRegister) session.get(PassRegister.class, id);
	
	return pass;
}


public List<Twowheeler> getAllWheelers(String type, String fromdate,
		String todate) {
	
	org.hibernate.classic.Session session = sessionFactory.getCurrentSession();
	String hql = "from Twowheeler  where date between '"+fromdate+"' and '"+todate+"'";
	System.out.println("in Vreportdao");
	 List<Twowheeler> list=session.createQuery(hql).list();
	return list;
}


public List<AgencyDto> getDtoDetails(int emp_id, String fromDate, String toDate) {
	
	org.hibernate.classic.Session session = sessionFactory
	.getCurrentSession();
	
	String hql="select NEW com.security.dto.AgencyDto(t.id, t.emp_id, t.g4s_securitypost, t.g4s_shift, t.g4s_rank, t.g4s_date,e.empname) from G4SSecurity t, EmployeeForm e where e.empid=t.emp_id and e.empid="+emp_id+" and t.g4s_date between '"+fromDate+"' and '"+toDate+"'";
	List<AgencyDto> list = session.createQuery(hql).list();
	System.out.println("in getDtoDetails");
	System.out.println(list.size());
	
	return list;
	
} 
public List<InHosueDto> getDtoDetails5(int emp_id, String fromDate, String toDate) {
	
	org.hibernate.classic.Session session = sessionFactory
	.getCurrentSession();
	
	String hql="select NEW com.security.dto.InHosueDto(t.id, t.emp_id, t.inhouse_securitypost, t.inhouse_shift, t.inhouse_rank, t.inhouse_date, e.empname) from InhouseSecurity t, EmployeeForm e where e.empid=t.emp_id and e.empid="+emp_id+" and t.inhouse_date between '"+fromDate+"' and '"+toDate+"'";
	List<InHosueDto> list = session.createQuery(hql).list();
	System.out.println("in getDtoDetails");
	System.out.println(list.size());
	
	return list;
	
} 
	

}

