package service.restaurant;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import model.Restaurant;

public class ResAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		RestaurantDao restaurantDao = RestaurantDao.getInstance();
		
		String arrFinish = request.getParameter("arrFinish");
		
		List<Restaurant> list = restaurantDao.rnoList(arrFinish);
		if(list.isEmpty()) {
			list = restaurantDao.rnoList2(arrFinish);
		} 		
		
		List<Integer> hiList = new ArrayList<Integer>();
		for(Restaurant restaurant : list) {
				hiList.add(restaurant.getRno());
		}
		int[] resList = new int[hiList.size()];
		int i=0;
		for(int str : hiList) {
			resList[i] = str;
			i++;
		}
		int resLength = resList.length;
		
		List<String> hiList2 = new ArrayList<String>();
		for(Restaurant restaurant : list) {
				hiList2.add(restaurant.getRname());
		}
		String[] resName = new String[hiList2.size()];
		i=0;
		for(String str2 : hiList2) {
			resName[i] = str2;
			i++;
		}
		
		List<String> hiList3 = new ArrayList<String>();
		for(Restaurant restaurant : list) {
				hiList3.add(restaurant.getImg1());
		}
		String[] img1 = new String[hiList3.size()];
		i=0;
		for(String str3 : hiList3) {
			img1[i] = str3;
			i++;
		}

		request.setAttribute("resList", resList);
		request.setAttribute("resLength", resLength);
		request.setAttribute("resName", resName);
		request.setAttribute("img1", img1);
		
		 return "menuRestaurant";
	}
	
}
