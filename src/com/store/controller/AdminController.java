package com.store.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.store.entity.MainCategory;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.Seller;
import com.store.entity.Subcategory;

import com.store.model.MainCategoryModel;
import com.store.model.OrderModel;
import com.store.model.ProductModel;
import com.store.model.SellerModel;
import com.store.model.SubCategoryModel;
import com.store.model.getCount;


/**
 * Servlet implementation class AdminController
 */
@MultipartConfig
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 @Resource(name="jdbc/estore")
	   	private DataSource dataSource;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = request.getParameter("page");
		page = page.toLowerCase();
		HttpSession session=request.getSession();
		switch (page) {
		case "adminhome":
			request.setAttribute("title", "Admin Home");
			adminhome(request,response);
			break;
			
		case "adminaddproduct":
			request.setAttribute("title", "Add Product");
			adminAddProduct(request,response);
			break;
			
		case "adminorder":
			request.setAttribute("title", "Admin Order");
			adminOrderList(request,response,session.getAttribute("sid").toString());
			break;
			
		case "adminproducts":
			request.setAttribute("title", "Admin Products");
			adminProducts(request,response,session.getAttribute("sid").toString());
			break;
			
		case "adminlogout":
			adminLogout(request,response);
			break;
			
		case "subcatlist":
			request.setAttribute("title", "SubCategory");
			subCategoryPage(request,response,Integer.parseInt(request.getParameter("mcId")));
			break;
			
		case "adminproductdetail":
			request.setAttribute("title", "Product Details");
			adminProductDetail(request,response);
			break;
			
		case "adminprofile":
			request.setAttribute("title", "Admin Profile");
			adminProfile(request,response,session.getAttribute("sid").toString());
			break;
			
		case "adminupdateproduct":
			request.setAttribute("title", "Update Product");
			adminUpdateFormLoader(request,response,Integer.parseInt(request.getParameter("pid")));
			break;
		
		case "productsbysidmid":
			request.setAttribute("title", "Admin Product");
			ProductBySelleridMid(request,response,request.getParameter("sid"),Integer.parseInt(request.getParameter("mid")));
			break;
			
		case "orderedproductdetail":
			request.setAttribute("title", "Received order Details");
			int oid=Integer.parseInt(request.getParameter("oid"));
			orderProductDetail(request,response,oid);
			break;
		}
		}
	
	private void orderProductDetail(HttpServletRequest request, HttpServletResponse response, int oid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> pList = new ArrayList<>();
		pList=new OrderModel().getOrderProducts(dataSource,oid);
		request.setAttribute("pList", pList);
		request.getRequestDispatcher("adminOrderDetail.jsp").forward(request, response);
	}

	private void ProductBySelleridMid(HttpServletRequest request, HttpServletResponse response, String sid, int mid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		adminProductListcol(request,response);
		List<Product> productListMS = new ArrayList<>();
		productListMS=new ProductModel().productListMS(dataSource,sid,mid);
		request.setAttribute("pList", productListMS);
		request.getRequestDispatcher("adminProductList.jsp").forward(request, response);
	}

	private void adminUpdateFormLoader(HttpServletRequest request, HttpServletResponse response, int pid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> productDetailList = new ArrayList<>();
		productDetailList=new ProductModel().productDetailList(dataSource,pid);
		request.setAttribute("productDetailList", productDetailList);
		request.getRequestDispatcher("adminUpdateProduct.jsp").forward(request, response);
	}

	private void adminProfile(HttpServletRequest request, HttpServletResponse response, String sid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Seller> sellerDetail = new ArrayList<>();
		sellerDetail=new SellerModel().sellerDetail(dataSource,sid);
		request.setAttribute("sellerDetail", sellerDetail);
		request.getRequestDispatcher("adminProfile.jsp").forward(request, response);
	}

	private void adminProducts(HttpServletRequest request, HttpServletResponse response, String sId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		adminProductListcol(request,response);
		adminProductList(request,response,sId);
	}

	private void adminProductDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("adminProductDetail.jsp").forward(request, response);
	}

	private void subCategoryPage(HttpServletRequest request, HttpServletResponse response, int mcId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Subcategory> subList = new ArrayList<>();
		subList=new SubCategoryModel().subList(dataSource ,mcId);
		request.setAttribute("subList", subList);
		request.getRequestDispatcher("adminSubCategory.jsp").forward(request, response);
	}

	private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		session.removeAttribute("sid");
		session.removeAttribute("sname");
		session.invalidate();
		request.getRequestDispatcher("userSignupLogin.jsp").forward(request, response);
		
		return;
	}

	private void adminProductList(HttpServletRequest request, HttpServletResponse response, String sId) throws ServletException, IOException {
		// TODO Auto-generated method stub
		adminProductListcol(request,response);
		List<Product> pList = new ArrayList<>();
		pList=new ProductModel().pList(dataSource,sId);
		request.setAttribute("pList", pList);
		request.getRequestDispatcher("adminProductList.jsp").forward(request, response);
	}

	private void adminOrderList(HttpServletRequest request, HttpServletResponse response, String sid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Order> oList = new ArrayList<>();
		oList=new OrderModel().getOrderListSeller(dataSource,sid);
		request.setAttribute("oList", oList);
		request.getRequestDispatcher("adminOrderList.jsp").forward(request, response);
	}

	private void adminProductListcol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MainCategory> mList = new ArrayList<>();
		mList=new MainCategoryModel().mList(dataSource);
		request.setAttribute("mList", mList);
		
	}
	
	private void adminAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MainCategory> mList = new ArrayList<>();
		mList=new MainCategoryModel().mList(dataSource);
		request.setAttribute("mList", mList);
		request.getRequestDispatcher("adminMainCategory.jsp").forward(request, response);
	}

	private void adminhome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String,Long> cList = new HashMap<>();
	
		cList=new getCount().cList(dataSource);
	
		request.setAttribute("cList", cList);
		request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("form");
		operation = operation.toLowerCase();
		HttpSession session=request.getSession();
		switch (operation) {
		case "signupadminoperation":
			Seller newSeller = new Seller(request.getParameter("sid"), request.getParameter("name"), request.getParameter("address"), request.getParameter("city"), request.getParameter("password"),"none.jpg");
			if(signupSellerOperation(newSeller)) {
				
				session.setAttribute("sid", request.getParameter("sid"));
				session.setAttribute("sname", request.getParameter("name"));
				request.setAttribute("title", "Admin Home");
				adminhome(request,response);
				return;
				}
			else {
				session.invalidate();
				getServletContext().getRequestDispatcher("/beSeller.jsp").forward(request, response);
				return;
			}
			
		case "loginadminoperation":
			Seller getSeller = new Seller(request.getParameter("sellerid"),request.getParameter("spass"));
			
			if(loginAdminOperation(getSeller)) {
				session.setAttribute("sid", getSeller.getSid());
				request.setAttribute("title", "Admin Home");
				adminhome(request,response);
				return;
			}
			else {
				session.invalidate();
				request.getRequestDispatcher("/beSeller.jsp").forward(request, response);
				return;
			}
			
		case "addproductoperation":
			int scId=Integer.parseInt(request.getParameter("scid"));
			String sId=request.getParameter("sellerid");
			String Pname=request.getParameter("pname");
			String Ptype=request.getParameter("ptype");
			int Pmrp=Integer.parseInt(request.getParameter("pmrp"));
			String Pdes=request.getParameter("pdes");
			int mcId=Integer.parseInt(request.getParameter("mcid"));
			Part part=request.getPart("pimage");
			String path="E:/eclipse-workspace/E-Store/WebContent/images/product/"+part.getSubmittedFileName();
			
			//uploading code
			
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is=part.getInputStream();
			
			//reading
			
			byte[ ]data=new byte[is.available()];
			is.read(data);
			 
			//writing
			
			fos.write(data);
			fos.close();
			Product product=new Product(Pname,Pdes,Pmrp,scId,Ptype,part.getSubmittedFileName(),sId,mcId);
			addProductOperation(product);
			adminProductList(request,response,sId);
			 break; 
			
		case "updateproductimageoperation":
			Part partImage=request.getPart("pimage");
			int pid=Integer.parseInt(request.getParameter("pid"));
			String path2="E:/eclipse-workspace/E-Store/WebContent/images/product/"+partImage.getSubmittedFileName();
			//uploading code
			
			FileOutputStream fos1=new FileOutputStream(path2);
			InputStream is1=partImage.getInputStream();
			
			//reading
			
			byte[ ]data2=new byte[is1.available()];
			is1.read(data2);
			 
			//writing
			
			fos1.write(data2);
			fos1.close();
			Product image=new Product(partImage.getSubmittedFileName());
			updateProductImage(image,pid);
			adminUpdateFormLoader(request,response,pid);
			break;
			
		case "updateproductdetailsoperation":
		
			String uPname=request.getParameter("pname");
			String uPtype=request.getParameter("ptype");
			int uPmrp=Integer.parseInt(request.getParameter("pmrp"));
			String uPdes=request.getParameter("pdes");
			int upid=Integer.parseInt(request.getParameter("pid"));
			Product updateDetail=new Product(upid,uPname,uPdes,uPmrp,uPtype);
			
			updateProductOperation(dataSource, updateDetail,upid);
			adminUpdateFormLoader(request,response,upid);
			
			break;
			
		case"updateadminoperation":
			
			String sname=request.getParameter("name");
			String saddress=request.getParameter("address");
			String scity=request.getParameter("city");
			String spass=request.getParameter("password");
			int sno=Integer.parseInt(request.getParameter("sno"));
			String sid1=request.getParameter("sid");
			Seller updateSeller=new Seller(sno,sid1,sname,saddress,scity,spass);
			updateSellerOperation(dataSource, updateSeller,session.getAttribute("sid").toString());
			adminProfile(request,response,session.getAttribute("sid").toString());
			return;
			
		case"updateadminimageoperation":	
			Part part3=request.getPart("simage");
			String path3="E:/eclipse-workspace/E-Store/WebContent/images/seller/"+part3.getSubmittedFileName();	
			//uploading code
			FileOutputStream fos3=new FileOutputStream(path3);
			InputStream is3=part3.getInputStream();
			//reading
			byte[ ]data3=new byte[is3.available()];
			is3.read(data3);
			//writing
			fos3.write(data3);
			fos3.close();
			
			Seller sellerimage=new Seller(part3.getSubmittedFileName());
			updateSellerImage(sellerimage,session.getAttribute("sid").toString());
			adminProfile(request,response,session.getAttribute("sid").toString());
			break;
  }

}

	private boolean updateSellerImage(Seller sellerimage, String sid) {
		// TODO Auto-generated method stub
		return new SellerModel().updateImage(dataSource, sellerimage,sid);
	}

	private boolean updateSellerOperation(DataSource dataSource, Seller updateSeller, String sid) {
		// TODO Auto-generated method stub
		return new SellerModel().updateSeller(dataSource,updateSeller,sid);
	}

	private void updateProductOperation(DataSource dataSource, Product updateDetail, int upid) {
		// TODO Auto-generated method stub
		new ProductModel().updateProduct(dataSource,updateDetail,upid);
		return;
	}

	private boolean updateProductImage(Product image, int pid) {
		// TODO Auto-generated method stub
		return new ProductModel().updateImage(dataSource, image,pid);
	}

	private boolean addProductOperation(Product product) {
		// TODO Auto-generated method stub
		return new ProductModel().addProduct(dataSource, product);
	}

	private boolean loginAdminOperation(Seller getSeller) {
		// TODO Auto-generated method stub
		return new SellerModel().loginSeller(dataSource, getSeller);
	}

	private boolean signupSellerOperation(Seller newSeller) {
		// TODO Auto-generated method stub
		return new SellerModel().signupSeller(dataSource, newSeller);
	}
	}
