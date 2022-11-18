package kr.swcore.sderp.product.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class ProductdataDTO {
	private int productDataNo;		// 상품 번호
	private int compNo;				// 회사 구분 번호
	private int custNo;				// 거래처 번호
	private int productNo;			// 카테고리 번호
	private String productModel;	// 상품 모델명
	private String productPrice;	// 상품 가격
	private String productType;		// 상품 가격 데이터 타입
	private int regUser;			// 등록/수정 유저
	private Date regDatetime;		// 등록/수정 시간
	private String attrib;			// 속성
	
	// 확장
	private List<ProductdataDTO> productdataDTO;
	private int parrentId;
	private String display;
	private Integer overwrite;
	private String mode;

	public ProductdataDTO() {
		super();
	}	
	
}
