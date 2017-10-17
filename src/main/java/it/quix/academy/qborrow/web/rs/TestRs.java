package it.quix.academy.qborrow.web.rs;


import it.quix.academy.qborrow.core.manager.QborrowException;
import it.quix.academy.qborrow.core.manager.QborrowManager;
import it.quix.academy.qborrow.core.model.Oggetti;
import it.quix.academy.qborrow.core.search.OggettiSearch;
import it.quix.framework.core.exception.DAOCreateException;
import it.quix.framework.core.validation.exception.ValidationException;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.context.ApplicationContext;




@Path("/oggetti")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)

public class TestRs {
	@Resource(name = "qborrowManager")
	protected QborrowManager qborrowManager;
	
	@GET
	public Response getOggetti(){
		List<Oggetti> array = new ArrayList<Oggetti>();
		array = qborrowManager.getOggettiList(null);
		return Response.ok(array, MediaType.APPLICATION_JSON).build();
	}
	
	@POST
	public Oggetti PostOggetto(Oggetti oggetto) throws QborrowException, ValidationException{
		Oggetti ogg = new Oggetti();
		ogg.setId(88);
		ogg.setTitolo("PROVA");
		return ogg;
	}
	
	@PUT
	public Oggetti putOggetto(Oggetti oggetto){
		//UPDATE DB
		return oggetto;
	}
	
	@DELETE
	@Path("/id")
	public Response deleteOggetti(@PathParam("id") Integer id){
		return Response.status(Response.Status.NOT_FOUND).build();
	}
}
