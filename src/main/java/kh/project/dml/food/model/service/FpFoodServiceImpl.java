package kh.project.dml.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.FpFoodVo;
import kh.project.dml.food.model.dao.FpFoodDao;

@Service("fpFoodServiceImpl")
public class FpFoodServiceImpl implements FpFoodService  {
	@Autowired
	private FpFoodDao fpFoodDao;
	@Autowired
	private FpDietDao fpDietDao;
	
	@Override
	public List<FpFoodVo> selectList()  {
		return fpFoodDao.selectList();
	}
	@Override
	public FpFoodVo selectOne(String foodCd)  {
		return fpFoodDao.selectOne(foodCd);
	}
	@Override
	@Transactional
	public int insert(FpDietVo vo)  {
		System.out.println(vo.getFoodlist().size());
		for(int i=0; i<vo.getFoodlist().size(); i++) {
			FpFoodVo food = vo.getFoodlist().get(i);
			
			//
			String foodtime = "";
			
			System.out.println("=====================================================");
			System.out.println(food.getFoodTime());
			System.out.println("=====================================================");
			
			switch(food.getFoodTime()) {
			case "아침":
				foodtime = "A";
				break;
			case "점심":
				foodtime = "B";
				break;
			case "저녁":
				foodtime = "C";
				break;
			case "간식":
				foodtime = "Z";
				break;
			default:
				foodtime = "ALL";
				break;
			}
			vo.setMealCode(vo.getFoodDate()+vo.getMemberId()+food.getFoodCd()+foodtime);
			
			
		    System.out.println("======================================================");
			System.out.println("meal_code 확인 : " + vo.getMealCode());
			System.out.println("======================================================");
			
			food.setMealCode(vo.getMealCode());
			vo.setFoodTime(foodtime);
			System.out.println(fpFoodDao.mealCodeCheck(vo.getMealCode()));
			if(fpFoodDao.mealCodeCheck(vo.getMealCode()) == null) {
				int check =fpDietDao.insert(vo);
				
				if(check > 0) 
				{
					fpFoodDao.insert(food);	
				}
				
			} else {				
				int check =	fpDietDao.update(vo);
				
				if(check > 0) 
				{
					fpFoodDao.update(food);
				}
			
			}
		}
		return 1;
	}
	
	@Override
	public int update(FpFoodVo vo) {
		return fpFoodDao.update(vo);
	}
	@Override
	public int delete(String foodCd)  {
		return fpFoodDao.delete(foodCd);
	}
}

