package work.iamport.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import work.iamport.dao.PaymentDAO;
import work.iamport.model.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	
	@Autowired
	private PaymentDAO dao;
	
	public void insertPaymentSuccess(PaymentVO vo) {

		dao.insertPaymentSuccess(vo);		
	}
}
