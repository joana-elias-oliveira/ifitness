package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import java.io.IOException;
import java.util.Optional;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.UserDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public LoginServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		String url;
		
		UserDao userDao = new UserDao(DataSourceSearcher.getInstance().getDataSource());
		
		Optional<User> optional = userDao.getUserByEmailAndPassword(email, password);
		if(optional.isPresent()) {
			User user = optional.get();
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(600);
			session.setAttribute("user", user);
			url = "/homeServlet";
		}else {
			req.setAttribute("result", "loginError");
			url = "/login.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

}





