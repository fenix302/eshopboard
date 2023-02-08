package work.product;

import java.io.Serializable;

public class ProductBean implements Serializable{
	private String productCode;        //제품코두
	private String productImage;       //제품이미지
	private String productName;        //제품이름
 	private int productUnitPrice;      //제품단가
	private int productCount;          //제품수량
	private String productCategoryCd;  //제품분류
	private String productRegDate;     //제품등록일

	public ProductBean() {
		super();
	}

	public ProductBean(String productCode, String productImage,
			String productName, int productUnitPrice, int productCount,
			String productCategoryCd, String productRegDate) {
		super();
		this.productCode = productCode;
		this.productImage = productImage;
		this.productName = productName;
		this.productUnitPrice = productUnitPrice;
		this.productCount = productCount;
		this.productCategoryCd = productCategoryCd;
		this.productRegDate = productRegDate;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductUnitPrice() {
		return productUnitPrice;
	}

	public void setProductUnitPrice(int productUnitPrice) {
		this.productUnitPrice = productUnitPrice;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductCategoryCd() {
		return productCategoryCd;
	}

	public void setProductCategoryCd(String productCategoryCd) {
		this.productCategoryCd = productCategoryCd;
	}

	public String getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(String productRegDate) {
		this.productRegDate = productRegDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductBean [productCode=");
		builder.append(productCode);
		builder.append(", productImage=");
		builder.append(productImage);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", productUnitPrice=");
		builder.append(productUnitPrice);
		builder.append(", productCount=");
		builder.append(productCount);
		builder.append(", productCategoryCd=");
		builder.append(productCategoryCd);
		builder.append(", productRegDate=");
		builder.append(productRegDate);
		builder.append("]");
		return builder.toString();
	}
}
