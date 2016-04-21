package gapp.web.controller;

import gapp.model.Application;
import gapp.model.ApplicationAdditionalFields;
import gapp.model.ApplicationStatus;
import gapp.model.Degree;
import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.Users;
import gapp.model.dao.AdditionalFieldDao;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.ApplicationStatusDao;
import gapp.model.dao.DegreeDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.UsersDao;
import gapp.web.validator.UserValidator;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes(value = { "dept", "pgm", "addinfo" })
public class ApplicationController {

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private DepartmentDao departmentDao;

	@Autowired
	private ProgramsDao programDao;

	@Autowired
	private AdditionalFieldDao additonalFieldDao;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private DegreeDao degreeDao;

	@Autowired
	private ApplicationStatusDao applicationStatusDao;

	private static final ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping({ "/index.html", "/home.html" })
	public String home() {
		return "home";
	}

	// Registration
	@RequestMapping(value = "/userRegistration.html", method = RequestMethod.GET)
	public String userRegistration(ModelMap models) {
		models.put("users", new Users());

		return "userRegistration";
	}

	@RequestMapping(value = "/userRegistration.html", method = RequestMethod.POST)
	public String userRegistration(@RequestParam String email,
			@RequestParam String password, @RequestParam String last_name,
			@RequestParam String first_name, ModelMap models,
			HttpServletRequest request) {
		Users register = new Users();

		List<Users> email1 = usersDao.getEmails(email);

		String gender = request.getParameter("gender");
		String phonenumber = request.getParameter("phonenumber");
		String dob = request.getParameter("dob");
		String citizenship = request.getParameter("citizenship");
		String typeOfUser = request.getParameter("typeOfUser");
		if (email1.size() > 0) {
			models.put("mail", 1);
			models.put("email", email);
			models.put("password", password);
			models.put("lastname", last_name);
			models.put("firstname", first_name);
			return "userRegistration";
		}
		register.setEmail(email);
		register.setPassword(password);
		register.setFirst_name(first_name);
		register.setLast_name(last_name);
		register.setGender(gender);
		register.setPhoneNumber(phonenumber);
		register.setDob(dob);
		register.setCitizenship(citizenship);
		register.setTypeOfUser(typeOfUser);

		register = usersDao.register(register);
		models.put("login", 1);
		return "login";

	}

	// Login
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(ModelMap models, HttpServletRequest request) {
		models.put("users", new Users());
		models.put("login", 0);
		HttpSession session = request.getSession();
		if (session == null)
			return "login";
		return "login";
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login(@RequestParam String email,
			@RequestParam String password, ModelMap models,
			HttpServletRequest request) {
		List<Users> details = usersDao.getUser();
		HttpSession session = request.getSession();
		for (Users u : details) {

			if (u.getEmail().equalsIgnoreCase(email)
					&& u.getPassword().equalsIgnoreCase(password)) {
				if (u.getTypeOfUser().equalsIgnoreCase("admin")) {

					session.setAttribute("loginSession", u);
					return "redirect:admin.html";
				} else if (u.getTypeOfUser().equalsIgnoreCase("student")) {
					session.setAttribute("loginSession", u);

					models.put("id", u.getUser_id());
					return "redirect:student.html";
				} else if (u.getTypeOfUser().equalsIgnoreCase("staff")) {
					session.setAttribute("loginSession", u);
					return "redirect:staff.html";
				} else {
					models.put("login", 2);
					models.put("email", email);
					models.put("password", password);
					return "login";
				}
			}
		}
		return "login";

	}

	@RequestMapping("/student.html")
	public String student(ModelMap models, @RequestParam Integer id) {

		List<Users> apps = usersDao.getUser(id);
		models.put("id", id);
		models.put("applist", apps);
		return "student";
	}

	@RequestMapping("/staff.html")
	public String staff() {
		return "staff";
	}

	@RequestMapping("/admin.html")
	public String admin(ModelMap models, HttpServletRequest request) {
		List<Departments> list = departmentDao.getDepartments();
		models.put("list", list);
		HttpSession session = request.getSession();
		models.put("name", session.getAttribute("loginSession"));

		return "admin";
	}

	// Add Department
	@RequestMapping(value = "/addDepartment.html", method = RequestMethod.GET)
	public String addDepartment(ModelMap models) {

		return "addDepartment";
	}

	@RequestMapping(value = "/addDepartment.html", method = RequestMethod.POST)
	public String addDepartment(@RequestParam String deptName,
			HttpServletRequest request) {

		Departments department = new Departments();
		department.setDepartment(deptName);
		Programs programs = new Programs();
		ApplicationAdditionalFields appfield = new ApplicationAdditionalFields();

		department = departmentDao.addDepartment(department);
		
		String program = request.getParameter("program");
		programs.setProgram(program);
		programs.setDepartment(department);
		programDao.setPrograms(programs);

		String programcount = request.getParameter("programcount");
		if (Integer.parseInt(programcount) > 0) {
			for (int i = 1; i <= Integer.parseInt(programcount); i++) {
				Programs newProgram = new Programs();
				String additionalProgram = request.getParameter("program" + i);
				newProgram.setProgram(additionalProgram);
				newProgram.setDepartment(department);
				programDao.setPrograms(newProgram);
			}
		}

		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String req = request.getParameter("required");

		appfield.setField_name(name);
		appfield.setField_type(type);
		appfield.setField_status(req);
		appfield.setDepartment(department);

		additonalFieldDao.addField(appfield);

		String fieldcount = request.getParameter("fieldcount");
		if (Integer.parseInt(fieldcount) > 0) {
			for (int i = 1; i <= Integer.parseInt(fieldcount); i++) {
				String fname = request.getParameter("name" + i);
				String ftype = request.getParameter("type" + i);
				String freq = request.getParameter("required" + i);

				ApplicationAdditionalFields f = new ApplicationAdditionalFields();

				f.setField_name(fname);
				f.setField_type(ftype);
				f.setField_status(freq);
				f.setDepartment(department);

				additonalFieldDao.addField(f);
			}
		}
		return "redirect:admin.html";
	}

	// view
	@RequestMapping("/view.html")
	public String view(ModelMap models, @RequestParam Integer id) {

		Departments department = departmentDao.getDepartment(id);

		models.put("department", department);
		return "view";
	}

	// Edit
	@RequestMapping(value = "/edit.html", method = RequestMethod.GET)
	public String edit(ModelMap models, @RequestParam Integer id) {
		models.put("dept", departmentDao.getDepartment(id));

		return "edit";
	}

	@RequestMapping(value = "/edit.html", method = RequestMethod.POST)
	public String edit(ModelMap models, @RequestParam Integer id,
			@RequestParam String deptName, HttpServletRequest request) {

		Departments department = departmentDao.getDepartment(id);
		department.setDepartment(deptName);

		List<Programs> pl = new ArrayList<Programs>();
		List<ApplicationAdditionalFields> al = new ArrayList<ApplicationAdditionalFields>();

		department = departmentDao.addDepartment(department);
		List<Programs> pgm = programDao.getDepartments(department);
		List<ApplicationAdditionalFields> field = additonalFieldDao
				.getDepartments(department);

		if (!request.getParameter("newProgramCount").equalsIgnoreCase("")
				&& request.getParameter("newProgramCount") != null) {
			Integer z = Integer.parseInt(request
					.getParameter("newProgramCount"));
			if (z != 0)
				for (int i = 1; i <= z; i++) {
					String newProgram = request.getParameter("newProgram" + i);
					Programs pgms = new Programs();
					pgms.setProgram(newProgram);
					pgms.setDepartment(department);
					pl.add(programDao.setPrograms(pgms));
				}
		}

		String pgmcount = request.getParameter("pgmcount");
		String rmvpgm = (request.getParameter("rmvpgm"));
		Integer pc = Integer.parseInt(pgmcount);
		String[] arr = rmvpgm.split(",");
		if (pc > 0) {
			for (int i = 0; i < pc; i++) {
				Programs p = programDao.getProgram(Integer.parseInt(arr[i]));
				List<Application> ap = applicationDao.getAppPgm(p);
				for (Application l : ap) {
					Programs bp = null;
					l.setProgram(bp);
					applicationDao.newApplication(l);
				}
				programDao.removeProgram(Integer.parseInt(arr[i]));
			}
		}

		String fieldcount = request.getParameter("fieldcount");

		String rmvfield = request.getParameter("rmvfield");
		Integer fc = Integer.parseInt(fieldcount);
		String[] farr = rmvfield.split(",");
		if (fc != 0) {
			for (int i = 0; i < fc; i++) {
				additonalFieldDao.removefield(Integer.parseInt(farr[i]));
			}
		}

		if (!request.getParameter("newFieldCount").equalsIgnoreCase("")
				&& request.getParameter("newFieldCount") != null) {
			Integer y = Integer.parseInt(request.getParameter("newFieldCount"));
			if (y != 0)
				for (int i = 1; i <= y; i++) {
					String newField = request
							.getParameter("newAdditionalRequirements" + i);
					ApplicationAdditionalFields appfield = new ApplicationAdditionalFields();
					appfield.setField_name(newField);
					appfield.setDepartment(department);
					al.add(additonalFieldDao.addField(appfield));
				}
		}

		ApplicationAdditionalFields appfield1 = new ApplicationAdditionalFields();

		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String req = request.getParameter("required");
		if (name != null && !name.equalsIgnoreCase("")) {
			appfield1.setField_name(name);
			appfield1.setField_type(type);
			appfield1.setField_status(req);
			appfield1.setDepartment(department);

			al.add(additonalFieldDao.addField(appfield1));
		}

		String fieldcount1 = request.getParameter("fieldcount");
		if (Integer.parseInt(fieldcount1) > 0) {
			for (int i = 1; i <= Integer.parseInt(fieldcount1); i++) {
				String fname = request.getParameter("name" + i);
				String ftype = request.getParameter("type" + i);
				String freq = request.getParameter("required" + i);

				ApplicationAdditionalFields f = new ApplicationAdditionalFields();
				if (fname != null && !fname.equalsIgnoreCase("")) {
					f.setField_name(fname);
					f.setField_type(ftype);
					f.setField_status(freq);
					f.setDepartment(department);

					al.add(additonalFieldDao.addField(f));
				}
			}
		}

		department.setPrograms(pl);
		department.setAddField(al);
		departmentDao.addDepartment(department);

		return "redirect:admin.html";
	}

	@RequestMapping("/logout.html")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";

	}

	// View Application Details
	@RequestMapping("/viewApplication.html")
	public String viewApplication(ModelMap models, @RequestParam Integer id,
			@RequestParam Integer sid) {

		models.put("sid", usersDao.getUsers(sid));
		models.put("aid", applicationDao.getApplication(id));

		return "viewApplication";
	}

	// New Application
	@RequestMapping(value = "/addApplication.html", method = RequestMethod.GET)
	public String addApplication(ModelMap models, @RequestParam Integer sid) {
		List<Departments> dept = departmentDao.getDepartments();
		models.put("user", usersDao.getUsers(sid));
		models.put("deptList", dept);
		models.put("pgmList", programDao.getPrograms());
		return "addApplication";
	}

	@Autowired
	private WebApplicationContext webApplicationContext;

	private File getFileDirectory(String sid, String aid) {

		String path = webApplicationContext.getServletContext().getRealPath(
				"/WEB-INF/files/transcript");

		File file = new File(path + "/" + sid);
		if (!file.exists()) {
			file.mkdir();
			File file1 = new File(path + "/" + sid + "/" + aid);
			if (!file1.exists()) {
				file1.mkdir();
			}
		} else {
			File file1 = new File(path + "/" + sid + "/" + aid);
			if (!file1.exists()) {
				file1.mkdir();
			}
		}
		return new File(path + "/" + sid + "/" + aid);
	}

	@Autowired
	private WebApplicationContext webAppContext;

	private File getFileDr(String sid, String aid) {

		String path = webAppContext.getServletContext().getRealPath(
				"/WEB-INF/files/additionaldocs");

		File file = new File(path + "/" + sid);
		if (!file.exists()) {
			file.mkdir();
			File file1 = new File(path + "/" + sid + "/" + aid);
			if (!file1.exists()) {
				file1.mkdir();
			}
		} else {
			File file1 = new File(path + "/" + sid + "/" + aid);
			if (!file1.exists()) {
				file1.mkdir();
			}
		}
		return new File(path + "/" + sid + "/" + aid);
	}

	// Add Application
	@RequestMapping(value = "/addApplication.html", method = RequestMethod.POST)
	public String addApplication(ModelMap models, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) MultipartFile file1,
			@RequestParam(required = false) MultipartFile[] file2)
			throws IllegalStateException, IOException {

		String sid = request.getParameter("sid");

		String department = request.getParameter("department");
		String program = request.getParameter("program");
		String term = request.getParameter("term");

		String toefl = request.getParameter("toefl");
		String gre = request.getParameter("gre");
		String gpa = request.getParameter("gpa");

		String college = request.getParameter("college");
		String time = request.getParameter("time");
		String degree = request.getParameter("degreeEarned");
		String major = request.getParameter("major");

		String submit = request.getParameter("submit");

		Integer department_id = Integer.parseInt(department);
		Integer student_id = Integer.parseInt(sid);

		Application app = new Application();

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		app.setFirstname(firstname);
		app.setLastname(lastname);
		app.setEmail(email);

		app.setUser(usersDao.getUsers(student_id));

		Departments d = departmentDao.getDepartment(department_id);
		app.setDepartment(d);

		Programs pr = programDao.getProgram(Integer.parseInt(program));
		app.setProgram(pr);

		app.setTerm(term);
		app.setToefl(toefl);
		app.setGre(gre);
		app.setGpa(gpa);

		if (submit.equalsIgnoreCase("submit")) {
			ApplicationStatus status = new ApplicationStatus();
			status.setStatus("New");
			status.setTime(new Date());
			status.setApplication(app);
			applicationStatusDao.newStatus(status);
			app.setDate(new Date());
			app.setApplicationStatus("New");
		} else if (submit.equalsIgnoreCase("save")) {
			app.setApplicationStatus("Not Submitted");
		}

		Application appObject = applicationDao.newApplication(app);

		Degree deg = new Degree();

		deg.setUniversity(college);
		deg.setTime_period(time);
		deg.setDegree(degree);
		deg.setMajor(major);
		deg.setApplication(appObject);

		degreeDao.newDegree(deg);

		String educount = request.getParameter("educount");
		Integer ec = Integer.parseInt(educount);

		if (ec > 0) {
			for (int i = 1; i <= ec; i++) {
				String coll = request.getParameter("college" + i);
				String tm = request.getParameter("time" + i);
				String degr = request.getParameter("degreeEarned" + i);
				String maj = request.getParameter("major" + i);

				Degree degre = new Degree();
				degre.setUniversity(coll);
				degre.setTime_period(tm);
				degre.setDegree(degr);
				degre.setMajor(maj);
				degre.setApplication(appObject);

				degreeDao.newDegree(degre);
			}
		}

		String name = request.getParameter("name");
		String score = request.getParameter("score");
		if (name != null && score != null) {
			ApplicationAdditionalFields fields = new ApplicationAdditionalFields();
			fields.setField_name(name);
			fields.setField_type(score);
			fields.setApplication(appObject);
			additonalFieldDao.addField(fields);
		}

		ApplicationAdditionalFields fld = new ApplicationAdditionalFields();
		String fupload = request.getParameter("fupload");
		if (fupload != null && !fupload.equalsIgnoreCase("")) {
			fld.setField_name(fupload);
			fld.setApplication(appObject);
			additonalFieldDao.addField(fld);
			// fld.setField_status(file1.getName());
			file1.transferTo(new File(getFileDr(sid,
					Integer.toString(appObject.getApplication_id())), file1
					.getOriginalFilename()));

		}

		String nhidden = request.getParameter("nhidden");
		if (Integer.parseInt(nhidden) > 0) {
			for (int i = 1; i <= Integer.parseInt(nhidden); i++) {
				String name1 = request.getParameter("name" + i);
				String score1 = request.getParameter("score" + i);

				ApplicationAdditionalFields fields1 = new ApplicationAdditionalFields();
				fields1.setField_name(name1);
				fields1.setField_type(score1);
				fields1.setApplication(appObject);
				additonalFieldDao.addField(fields1);
			}
		}

		String fhidden = request.getParameter("fhidden");
		if (Integer.parseInt(fhidden) > 0) {
			for (int j = 0; j < Integer.parseInt(fhidden); j++) {
				String fupload1 = request.getParameter("fupload" + j);
				ApplicationAdditionalFields fld1 = new ApplicationAdditionalFields();
				fld1.setField_name(fupload1);
				// fld1.setField_type(file2[j].getName());
				fld1.setApplication(appObject);

				file2[j].transferTo(new File(getFileDr(sid,
						Integer.toString(appObject.getApplication_id())),
						file2[j].getOriginalFilename()));

				additonalFieldDao.addField(fld1);
			}
		}

		file.transferTo(new File(getFileDirectory(sid,
				Integer.toString(appObject.getApplication_id())), file
				.getOriginalFilename()));

		return "redirect:student.html?id=" + student_id;
	}

	@RequestMapping(value = "/getdepartment.html", method = RequestMethod.GET)
	public void getdepartment(ModelMap models, @RequestParam Integer id,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		List<Programs> plist = programDao.getPrograms(departmentDao
				.getDepartment(id));

		PrintWriter writer = response.getWriter();
		String option = "";
		for (Programs p : plist) {
			option += "<option value=" + p.getProgram_id() + ">"
					+ p.getProgram() + "</option>";
		}

		writer.print(option);
	}

	@RequestMapping(value = "/getdept.html", method = RequestMethod.GET)
	public void getdept(ModelMap models, @RequestParam Integer id,
			@RequestParam String pgm, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		List<Programs> plist = programDao.getPrograms(departmentDao
				.getDepartment(id));

		PrintWriter writer = response.getWriter();
		String option = "";
		for (Programs p : plist) {
			if (!p.getProgram().equalsIgnoreCase(pgm)) {

				option += "<option value=" + p.getProgram_id() + ">"
						+ p.getProgram() + "</option>";
			}

		}
		writer.print(option);
	}

	// Download File
	@RequestMapping("/download.html")
	public String download(HttpServletResponse response,
			@RequestParam Integer sid, @RequestParam Integer aid)
			throws IOException {

		File file = getFileDirectory(Integer.toString(sid),
				Integer.toString(aid));
		// InputStream inputStream = new FileInputStream(file);
		String[] fileName = file.list();
		for (int i = 0; i < fileName.length; i++) {

			response.setContentType("");
			response.setHeader("Content-Disposition", "inline:" + fileName[i]);

			FileInputStream in = new FileInputStream(new File(getFileDirectory(
					Integer.toString(sid), Integer.toString(aid)), fileName[i]));
			OutputStream out = response.getOutputStream();

			byte buffer[] = new byte[2048];
			int bytesRead;
			while ((bytesRead = in.read(buffer)) > 0)
				out.write(buffer, 0, bytesRead);

			in.close();
		}
		return null;
	}

	@RequestMapping("/download1.html")
	public String download1(HttpServletResponse response,
			@RequestParam Integer sid, @RequestParam Integer aid)
			throws IOException {

		File file = getFileDr(Integer.toString(sid), Integer.toString(aid));
		// InputStream inputStream = new FileInputStream(file);
		String[] fileName = file.list();
		for (int i = 0; i < fileName.length; i++) {

			response.setContentType("");
			response.setHeader("Content-Disposition", "inline:" + fileName[i]);

			FileInputStream in = new FileInputStream(new File(getFileDr(
					Integer.toString(sid), Integer.toString(aid)), fileName[i]));
			OutputStream out = response.getOutputStream();

			byte buffer[] = new byte[2048];
			int bytesRead;
			while ((bytesRead = in.read(buffer)) > 0)
				out.write(buffer, 0, bytesRead);

			in.close();
		}
		return null;
	}

	// Edit Application
	@RequestMapping(value = "/editApplication.html", method = RequestMethod.GET)
	public String editApplication(ModelMap models, @RequestParam Integer id,
			@RequestParam Integer sid) {

		models.put("app", applicationDao.getApplication(id));
		return "editApplication";
	}

	@RequestMapping(value = "/editApplication.html", method = RequestMethod.POST)
	public String editApplication(ModelMap models, HttpServletRequest request,
			@RequestParam String app,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam Integer sid) throws IllegalStateException,
			IOException {

		String pgm = request.getParameter("program");
		Integer a = Integer.parseInt(app);
		Application ap = applicationDao.getApplication(a);
		Programs pr = programDao.getProgram(Integer.parseInt(pgm));
		ap.setProgram(pr);

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		ap.setFirstname(firstname);
		ap.setLastname(lastname);
		ap.setEmail(email);

		String term = request.getParameter("term");
		ap.setTerm(term);

		String toefl = request.getParameter("toefl");
		String gre = request.getParameter("gre");
		String gpa = request.getParameter("gpa");

		ap.setToefl(toefl);
		ap.setGpa(gpa);
		ap.setGre(gre);

		String submit = request.getParameter("submit");
		if (submit.equalsIgnoreCase("submit")) {
			ap.setApplicationStatus("New");
			ap.setDate(new Date());
			ApplicationStatus status = new ApplicationStatus();
			status.setStatus("New");
			status.setTime(new Date());
			status.setApplication(ap);
			applicationStatusDao.newStatus(status);
		} else if (submit.equalsIgnoreCase("save")) {
			ap.setApplicationStatus("Not Submitted");
		}


		String educount = request.getParameter("educount");
		if (Integer.parseInt(educount) > 0) {
			for (int i = 1; i <= Integer.parseInt(educount); i++) {
				String college = request.getParameter("college" + i);
				String time = request.getParameter("time" + i);
				String degree = request.getParameter("degreeEarned" + i);
				String major = request.getParameter("major" + i);

				Degree newdegree = new Degree();

				newdegree.setUniversity(college);
				newdegree.setDegree(degree);
				newdegree.setTime_period(time);
				newdegree.setMajor(major);
				newdegree.setApplication(ap);

				degreeDao.newDegree(newdegree);

			}
		}

		applicationDao.newApplication(ap);

		if (file != null && !file.isEmpty()) {
			File f = getFileDirectory(Integer.toString(sid), (app));
			File[] fl = f.listFiles();
			for (File i : fl) {
				i.delete();
			}
			file.transferTo(new File(getFileDirectory(Integer.toString(sid),
					Integer.toString(ap.getApplication_id())), file
					.getOriginalFilename()));

		}

		String educount1 = request.getParameter("educount1");
		String eduarr = request.getParameter("eduarr");

		String[] arr = eduarr.split(",");

		if (Integer.parseInt(educount1) > 0) {
			for (int i = 0; i < Integer.parseInt(educount1); i++) {
				degreeDao.delDegree(Integer.parseInt(arr[i]));
			}
		}
		return "redirect:student.html?id=" + sid;
	}
}