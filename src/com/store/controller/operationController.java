package com.store.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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



import com.store.entity.Cart;
import com.store.entity.Order;
import com.store.entity.OrderDetails;
import com.store.entity.Product;
import com.store.entity.Seller;
import com.store.entity.User;
import com.store.model.CartModel;
import com.store.model.OrderModel;
import com.store.model.ProductModel;
import com.store.model.SellerModel;
import com.store.model.UserModel;

/**
 * Servlet implementation class operationController
 */
@MultipartConfig
@WebServlet("/operation")
public class operationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public operationController() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Resource(name="jdbc/estore")
   	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("form");
		operation = operation.toLowerCase();
		System.out.println(operation+"-----");
		HttpSession session=request.getSession();
		switch (operation) {
		case "signupuseroperation":
			User newUser = new User(request.getParameter("uid"), request.getParameter("name"), request.getParameter("address"), request.getParameter("city"), request.getParameter("pincode"), request.getParameter("password"));
			if(signupUserOperation(newUser)) {
				
				session.setAttribute("uid", request.getParameter("uid"));
				session.setAttribute("uname", request.getParameter("name"));
				session.setAttribute("city",newUser.getCity());
				SellerList(request,response,newUser.getCity());
				ProductList(request,response);
				
				return;
				}
			else {
				session.invalidate();
				getServletContext().getRequestDispatcher("/userSignupLogin.jsp").forward(request, response);
				return;
			}
			
		case "loginuseroperation":
			User getUser = new User(request.getParameter("uid"),request.getParameter("pass"));
			User myUser = loginUserOperation(getUser);
			if(myUser != null) {
				session.setAttribute("uid", getUser.getUid());
				session.setAttribute("uname", myUser.getName());
				session.setAttribute("city", myUser.getCity());
				
				SellerList(request,response,session.getAttribute("city").toString());
				ProductList(request,response);
				return;
			}
			else {
				session.invalidate();
				request.getRequestDispatcher("/userSignupLogin.jsp").forward(request, response);
				return;
			}
			
		case "updateuseroperation":
			User updateUser = new User(Integer.parseInt(request.getParameter("sno")),request.getParameter("uid"), request.getParameter("name"), request.getParameter("address"), request.getParameter("city"), request.getParameter("pincode"), request.getParameter("password"));
			if(updateUserOperation(dataSource, updateUser,session.getAttribute("uid").toString())) {
				session.setAttribute("uname", updateUser.getName());
				session.setAttribute("city", updateUser.getCity());
				
			}
			userProfile(request,response,session.getAttribute("uid").toString());
			return;
			
		case"updateuserimageoperation":
		
			Part part=request.getPart("uimage");
			String path="E:/eclipse-workspace/E-Store/WebContent/images/user/"+part.getSubmittedFileName();	
			//uploading code
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is=part.getInputStream();
			//reading
			byte[ ]data=new byte[is.available()];
			is.read(data);
			//writing
			fos.write(data);
			fos.close();
			
			User userimage=new User(part.getSubmittedFileName());
			updateUserImage(userimage,session.getAttribute("uid").toString());
			userProfile(request,response,session.getAttribute("uid").toString());
			break;
			
		case "addtocart":
			int pid=Integer.parseInt(request.getParameter("pid"));
			System.out.println(pid);
			String sid =request.getParameter("sid");
			int qty=Integer.parseInt(request.getParameter("qty").trim());
			String uid=session.getAttribute("uid").toString();
			
			Cart cartproduct = new Cart(pid,sid,qty,uid);
			int reslt = addCartOperation(cartproduct);
			if(reslt==1) {
				response.getWriter().print("Remove");
			}
			break;
			
		
			
		case "updatecartinc":
			int cartno=Integer.parseInt(request.getParameter("sno"));
			int incqty=Integer.parseInt(request.getParameter("qty"));
			System.out.println(cartno+incqty);
			Cart updatecart = new Cart(cartno,incqty);
			int reslt1 = updateCartOperationInc(updatecart);
			if(reslt1==1) {
				cart(request,response,session.getAttribute("uid").toString());
			}
			break;
			
		case "updatecartdec":
			int cartnoi=Integer.parseInt(request.getParameter("sno"));
			int incqtyi=Integer.parseInt(request.getParameter("qty"));
			Cart updatecarti = new Cart(cartnoi,incqtyi);
			int reslt1i = updateCartOperationDec(updatecarti);
			if(reslt1i==1) {
				cart(request,response,session.getAttribute("uid").toString());
			}
			break;
			
		case "checkout":
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String phn=request.getParameter("phone");
			String paymethod=request.getParameter("optradio");
			OrderDetails odetails=new OrderDetails();
			odetails.setUsername(name);
			odetails.setAddress(address);
			odetails.setContact(phn);
			odetails.setPaymode(paymethod);
			odetails.setUid(request.getSession().getAttribute("uid").toString());
			placeOrderOperation(odetails);
			userOrder(request,response,request.getSession().getAttribute("uid").toString());
	}
	}

	private void cart(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Cart> cartproducts = new ArrayList<>();
		cartproducts=new CartModel().cartproducts(dataSource,uid);
		request.setAttribute("cartproducts", cartproducts);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}



	private int placeOrderOperation(OrderDetails odetails) {
		// TODO Auto-generated method stub
		return new OrderModel().addOrder(dataSource, odetails);
	}



	private void userOrder(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Order> oList = new ArrayList<>();
		oList=new OrderModel().getOrderListUser(dataSource,uid);
		request.setAttribute("oList", oList);
		request.getRequestDispatcher("userOrderList.jsp").forward(request, response);
	}



	private int updateCartOperationInc(Cart updatecart) {
		// TODO Auto-generated method stub
		return new CartModel().updateCartInc(dataSource, updatecart);
	}
	
	private int updateCartOperationDec(Cart updatecart) {
		// TODO Auto-generated method stub
		return new CartModel().updateCartDec(dataSource, updatecart);
	}

	private int addCartOperation(Cart cartproduct) {
		// TODO Auto-generated method stub
		return new CartModel().addCart(dataSource, cartproduct);
	}

	private boolean updateUserImage(User userimage, String uid) {
		return new UserModel().updateImage(dataSource, userimage,uid);
	}

	private void userProfile(HttpServletRequest request, HttpServletResponse response, String uid) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<User> userDetail = new ArrayList<>();
		userDetail=new UserModel().userDetail(dataSource,uid);
		request.setAttribute("userDetail", userDetail);
		request.getRequestDispatcher("userProfile.jsp").forward(request, response);
	}
	private boolean updateUserOperation(DataSource dataSource, User updateUser, String userid) {
		// TODO Auto-generated method stub
		return new UserModel().updateUser(dataSource,updateUser,userid);
		
	}

	

	private void SellerList(HttpServletRequest request, HttpServletResponse response, String city) {
		// TODO Auto-generated method stub
		List<Seller> sellerList = new ArrayList<>();
		sellerList=new SellerModel().sellerList(dataSource,city);
		request.setAttribute("sellerList",sellerList);
		
	}

	private User loginUserOperation(User getUser) {
		// TODO Auto-generated method stub
		return new UserModel().loginCheck(dataSource, getUser);
	}

	private boolean signupUserOperation(User newUser) {
		// TODO Auto-generated method stub
		return new UserModel().signupUser(dataSource, newUser);
	}

	private void ProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			List<Product> upList = new ArrayList<>();
			upList=new ProductModel().upList(dataSource);
			request.setAttribute("upList", upList);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	
}
