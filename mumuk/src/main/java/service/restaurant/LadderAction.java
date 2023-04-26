package service.restaurant;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import model.Restaurant;

public class LadderAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		RestaurantDao restaurantDao = RestaurantDao.getInstance();
		List<Restaurant> list = restaurantDao.sepList();
		Set<String> hiList = new HashSet<String>();
		for(Restaurant restaurant : list) {
			if(restaurant.getSep_3() != null) {
				hiList.add(restaurant.getSep_3());
			} else hiList.add(restaurant.getSep_2());
			
		}
		String[] arrList = new String[hiList.size()];
		int i=0;
		for(String str : hiList) {
			arrList[i] = str;
			i++;
		}
		int arrLength = arrList.length;
		int num = (int)Math.floor(Math.random()*(arrLength+1));
		String arrFinish = arrList[num];
		
		request.setAttribute("arrList", arrList);
		request.setAttribute("arrLength", arrLength);
		request.setAttribute("arrFinish", arrFinish);
		
		 return "ladder";
	}
	
}
