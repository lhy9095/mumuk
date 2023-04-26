package service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import model.Restaurant;
public class CategoryAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "category";
	}
}
