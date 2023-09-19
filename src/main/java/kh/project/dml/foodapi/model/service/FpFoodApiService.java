package kh.project.dml.foodapi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.foodapi.model.dao.FpFoodApiDao;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;


public interface FpFoodApiService {
	public List<FpFoodApiVo> selectList();
	public FpFoodApiVo selectOne(String foodCd);
	public int insert(FpFoodApiVo vo);
	public int update(FpFoodApiVo vo);
	public int delete(String foodCd);
}
