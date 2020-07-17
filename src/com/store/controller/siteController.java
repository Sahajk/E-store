package com.store.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.store.entity.Cart;
import com.store.entity.MainCategory;
import com.store.entity.Order;
import com.store.entity.Product;
import com.store.entity.Seller;
import com.store.entity.User;
import com.store.model.CartModel;
import com.store.model.MainCategoryModel;
import com.store.model.OrderModel;
import com.store.model.ProductModel;
import com.store.model.SellerModel;
import com.store.model.UserModel;

/**
 * Servlet implementation class siteController
 */
@WebServlet("/site")
public class siteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public siteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Resource(name="jdbc/estore")
   	private DataSource dataSource;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String page = request.getParameter("page");
	    page = page.toLowerCase();
		
		switch (page) {
		case "home":
			if(session.getAttribute("uid")==null) {
				response.sendRedirect("userSignupLogin.jsp");
			}
			else {
			request.setAttribute("title", "Homepage");
			home(request, response,session);}
			break;
		
		
		case "about":
			request.setAttribute("title", "About Us");
			about(request, response);
			break;
			
		case "contact":
			request.setAttribute("title", "Contact Us");
			contact(request, response);
			break;
			
		case "beaseller":
			request.setAttribute("title", "Be A Seller");
			beaseller(request, response);
			break;
			
		case "userprofile":
			request.setAttribute("title", "User Profile");
			userProfile(request, response,session.getAttribute("uid").toString());
			break;
			
		case "userorder":
			request.setAttribute("title", "User Orders");
			userOrder(request, response,session.getAttribute("uid").toString());
			break;
			
		case "logout":
			logout(request,response);
			break;
			
		case "productsbysid":
			request.setAttribute("title", "Product List");
			ProductBySid(request,response,request.getParameter("sid"));
			break;
			
		case "productsbysidmid":
			request.setAttribute("title", "Product List");
			ProductBySidMid(request,response,request.getParameter("sid"),Integer.parseInt(request.getParameter("mid")));
			break;
			
		case "usersellerlist":
			request.setAttribute("title", "Seller List");
			AllSellerList(request,response);
			break;
			
		case "productdetail":
			request.setAttribute("title", "Product Details");
			productDetail(request,response,Integer.parseInt(request.getParameter("pid")));
			break;
		case "usersignlog":
			loginsignuppage(request,response);
			break;
			
		
		case "cart":
			request.setAttribute("title", "Cart");
			cart(request,response,session.getAttribute("uid").toString());
			break;
			
		case "deleteitem":
			Cart deletedItem = new Cart();
			int s_no=Integer.parseInt(request.getParameter("cartsno"));
			deletedItem.setS_no(s_no);
			deleteItemOperation(dataSource, deletedItem);
			request.setAttribute("title", "Cart");
			cart(request,response,session.getAttribute("uid").toString());
			break;
			
		case "orderedproductdetail":
			int oid=Integer.parseInt(request.getParameter("oid"));
			request.setAttribute("title", "Order Details");
			orderProductDetail(request,response,oid);
			break;
		}
		
		
	}
	private void orderProductDetail(HttpServletRequest request, HttpServletResponse response, int oid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> pList = new ArrayList<>();
		pList=new OrderModel().getOrderProducts(dataSource,oid);
		request.setAttribute("pList", pList);
		request.getRequestDispatcher("userOrderDetail.jsp").forward(request, response);
	}
	private void deleteItemOperation(DataSource dataSource, Cart deletedItem) {
		// TODO Auto-generated method stub
		new CartModel().deleteItem(dataSource,deletedItem);
	}

	private void cart(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Cart> cartproducts = new ArrayList<>();
		cartproducts=new CartModel().cartproducts(dataSource,uid);
		request.setAttribute("cartproducts", cartproducts);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}


	private void loginsignuppage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("userSignupLogin.jsp").forward(request, response);
	}



	private void userOrder(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Order> oList = new ArrayList<>();
		oList=new OrderModel().getOrderListUser(dataSource,uid);
		request.setAttribute("oList", oList);
		request.getRequestDispatcher("userOrderList.jsp").forward(request, response);
	}



	private void userProfile(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<User> userDetail = new ArrayList<>();
		userDetail=new UserModel().userDetail(dataSource,uid);
		request.setAttribute("userDetail", userDetail);
		request.getRequestDispatcher("userProfile.jsp").forward(request, response);
	}



	private void ProductBySidMid(HttpServletRequest request, HttpServletResponse response, String sid,
			int mid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		mainCatergoryList(request,response);
		ProductBySelleridMid(request,response,sid,mid);
	}



	private void ProductBySelleridMid(HttpServletRequest request, HttpServletResponse response, String sid, int mid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> productListMS = new ArrayList<>();
		productListMS=new ProductModel().productListMS(dataSource,sid,mid);
		request.setAttribute("productList", productListMS);
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}



	private void ProductBySid(HttpServletRequest request, HttpServletResponse response, String sid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		mainCatergoryList(request,response);
		ProductBySellerid(request,response,sid);
	}



	private void mainCatergoryList(HttpServletRequest request, HttpServletResponse response) {
		List<MainCategory> mList = new ArrayList<>();
		mList=new MainCategoryModel().mList(dataSource);
		request.setAttribute("mList", mList);
		
	}







	private void productDetail(HttpServletRequest request, HttpServletResponse response, int pid) throws ServletException, IOException {
		List<Product> productDetailList = new ArrayList<>();
		productDetailList=new ProductModel().productDetailList(dataSource,pid);
		request.setAttribute("productDetailList", productDetailList);
		request.getRequestDispatcher("productdetail.jsp").forward(request, response);
		
	}



	private void AllSellerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Seller> allsellerList = new ArrayList<>();
		allsellerList=new SellerModel().allsellerList(dataSource);
		request.setAttribute("allsellerList", allsellerList);
		request.getRequestDispatcher("userSellerList.jsp").forward(request, response);
	}



	private void ProductBySellerid(HttpServletRequest request, HttpServletResponse response, String sid) throws ServletException, IOException {
		List<Product> productList = new ArrayList<>();
		productList=new ProductModel().productList(dataSource,sid);
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("product.jsp").forward(request, response);
		
	}



	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		session.removeAttribute("uid");
		session.removeAttribute("uname");
		session.removeAttribute("city");
		session.invalidate();
		request.getRequestDispatcher("userSignupLogin.jsp").forward(request, response);
		return;
	}

	

	private void beaseller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("beSeller.jsp").forward(request, response);
	}

	private void contact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("contact.jsp").forward(request, response);
	}

	private void about(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("about.jsp").forward(request, response);
	}

	

	private void home(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SellerList(request,response,session.getAttribute("city").toString());
		ProductList(request,response);
		
	}

	private void ProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			List<Product> upList = new ArrayList<>();
			upList=new ProductModel().upList(dataSource);
			request.setAttribute("upList", upList);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	
	private void SellerList(HttpServletRequest request, HttpServletResponse response, String city)  {
		// TODO Auto-generated method stub
		List<Seller> sellerList = new ArrayList<>();
		sellerList=new SellerModel().sellerList(dataSource,city);
		request.setAttribute("sellerList", sellerList);
		
	}
	



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
}}
