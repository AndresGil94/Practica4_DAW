package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Formatter;
import javax.servlet.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Libro;
import model.LibroItem;
import model.Pedido;
import model.UseCaseHandlerAutor;
import model.UseCaseHandlerEditorial;
import model.UseCaseHandlerLibro;
import model.UseCaseHandlerPedido;
import model.UseCaseHandlerUsuario;
import model.Usuario;

@WebServlet("/shopping")
public class MainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// Recupera la sesión actual o crea una nueva si no existe
		HttpSession session = request.getSession(true);
		String username = request.getParameter("user");
		String password = request.getParameter("password");

		if (username != null || password != null) {
			session.setAttribute("user", request.getParameter("user"));
			session.setAttribute("password", request.getParameter("password"));
		}

		UseCaseHandlerUsuario uchu = new UseCaseHandlerUsuario();

		// Recupera el carrito de la sesión actual
		@SuppressWarnings("unchecked")
		ArrayList<LibroItem> carrito = (ArrayList<LibroItem>) session.getAttribute("carrito");

		// Determina a qué página jsp se redirigirá
		String nextPage = "";
		String todo = request.getParameter("todo");

		if (todo == null) {
			// Primer acceso, redirigir a order.jsp
			nextPage = "/order.jsp";
		} else if (todo.equals("add")) {
			// Mandado por order.jsp con los parámetros idLibro y cantidad
			// Creamos un elementoPedido y lo añadimos al carrito
			if (request.getParameter("idLibro") != null) {
				LibroItem libroItem = new LibroItem(Integer.parseInt(request.getParameter("idLibro")),
						Integer.parseInt(request.getParameter("cantidad")));

				if (carrito == null) {
					// El carrito está vacío
					carrito = new ArrayList<>();
					carrito.add(libroItem);
					// Enlazar el carrito con la sesión
					session.setAttribute("carrito", carrito);
				} else {
					// Comprueba si el libro está ya en el carrito
					// Si lo está, actualizamos la cantidad
					// Si no está, lo añadimos
					if (carrito.contains(libroItem)) {
						for (int i = 0; i < carrito.size(); i++) {
							LibroItem aux = carrito.get(i);
							if (aux == libroItem) {
								aux.setCantidad(aux.getCantidad() + libroItem.getCantidad());
							}
						}
					} else {
						carrito.add(libroItem);
					}
				}

			}
			// Volvemos a order.jps para seguir con la compra
			nextPage = "/order.jsp";
		} else if (todo.equals("remove")) {
			// Enviado por order.jsp con el parámetro indiceElemento
			// Borra el elemento indiceElemento del carrito
			int indiceCarrito = Integer.parseInt(request.getParameter("indiceElemento"));
			carrito.remove(indiceCarrito);
			// Vuelve a order.jsp para seguir con la compra
			nextPage = "/order.jsp";
		} else if (todo.equals("checkout")) {
			// Enviado por order.jsp
			// Calcula el precio total de todos los elementos del carrito
			double precioTotal = 0;
			int cantidadTotalOrdenada = 0;
			for (LibroItem item : carrito) {
				double precio = item.getLibro().getPrecio();
				int cantidadOrdenada = item.getCantidad();
				precioTotal += precio * cantidadOrdenada;
				cantidadTotalOrdenada += cantidadOrdenada;
			}
			// Da formato al precio con dos decimales
			StringBuilder sb = new StringBuilder();
			Formatter formatter = new Formatter(sb);
			formatter.format("%.2f", precioTotal);
			formatter.close();
			// Coloca el precioTotal y la cantidadtotal en el request
			request.setAttribute("precioTotal", sb.toString());
			request.setAttribute("cantidadTotal", cantidadTotalOrdenada + "");
			// Redirige a checkout.jsp
			nextPage = "/checkout.jsp";
			Pedido p = new Pedido(precioTotal, uchu.read(
					new Usuario(session.getAttribute("user").toString(), session.getAttribute("password").toString())));
			UseCaseHandlerPedido uchp = new UseCaseHandlerPedido();
			if (uchp.create(p)) {
				System.out.println(uchp.readLast());
				uchp.createPedidoLibro(uchp.readLast(), carrito);
			}

		} else if (todo.equals("removePedido")) {

			UseCaseHandlerPedido uchp = new UseCaseHandlerPedido();
			uchp.delete(Integer.parseInt(request.getParameter("indiceElemento")));
			nextPage = "/Pedidos.jsp";
		} else if (todo.equals("update")) {
			UseCaseHandlerLibro uchl = new UseCaseHandlerLibro();

			UseCaseHandlerAutor ucha = new UseCaseHandlerAutor();
			UseCaseHandlerEditorial uche = new UseCaseHandlerEditorial();

			Libro original = uchl.read(request.getParameter("titulo"));
			Libro modificado = new Libro(request.getParameter("titulo"),
					ucha.read(Integer.parseInt(request.getParameter("autor"))),
					uche.read(Integer.parseInt(request.getParameter("editorial"))),
					Double.parseDouble(request.getParameter("precio")));

			uchl.update(modificado, original.getId());

			nextPage = "/Libros.jsp";
		} else if (todo.equals("anadir")) {
			UseCaseHandlerLibro uchl = new UseCaseHandlerLibro();
			UseCaseHandlerAutor ucha = new UseCaseHandlerAutor();
			UseCaseHandlerEditorial uche = new UseCaseHandlerEditorial();

			Libro libro = new Libro(request.getParameter("titulo"),
					ucha.read(Integer.parseInt(request.getParameter("autor"))),
					uche.read(Integer.parseInt(request.getParameter("editorial"))),
					Double.parseDouble(request.getParameter("precio")));

			uchl.create(libro);
			nextPage = "/Libros.jsp";
		}
		ServletContext servletContext = getServletContext();
		RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(nextPage);
		requestDispatcher.forward(request, response);
	}
}
