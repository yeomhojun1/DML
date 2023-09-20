package kh.project.dml.chickenproduct.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.chickenproduct.model.dao.FpChickenproductDao;
import kh.project.dml.chickenproduct.model.vo.FpChickenproductVo;



public interface FpChickenproductService {

	
	
	
	public List<FpChickenproductVo> selectList();
	
	public FpChickenproductVo selectOne(int chickenNo);
	
	public int insert(FpChickenproductVo vo);
	
	public int update(FpChickenproductVo vo);
	
	public int delete(int chickenNo);
}
