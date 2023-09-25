package kh.project.dml.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.food.model.dao.FpFoodDao;
import kh.project.dml.food.model.vo.FpFoodVo;

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
		
		for(int i=0; i<vo.getFoodlist().size(); i++) {
			FpFoodVo food = vo.getFoodlist().get(i);
			
			//
			String foodtime = "";
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
				foodtime = "D";
				break;
			default:
				foodtime = "E";
				break;
			}
			vo.setMealCode(vo.getFoodDate()+vo.getMemberId()+food.getFoodCd()+foodtime);
			food.setMealCode(vo.getMealCode());
			vo.setFoodTime(foodtime);
			if(fpFoodDao.mealCodeCheck(vo.getMealCode()) == null) {				
				fpDietDao.insert(vo);
				fpFoodDao.insert(food);
			} else {				
				fpDietDao.update(vo);
				fpFoodDao.update(food);
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

