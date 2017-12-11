package br.com.petAmigo.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Context;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import br.com.petAmigo.model.dao.impl.AnimalDAO;
import br.com.petAmigo.model.dao.impl.MyFileDAO;
import br.com.petAmigo.model.dao.impl.StatusAnimalDAO;
import br.com.petAmigo.model.dao.impl.UsuarioDAO;
import br.com.petAmigo.model.entity.Animal;
import br.com.petAmigo.model.entity.MyFile;
import br.com.petAmigo.model.entity.StatusAnimal;
import br.com.petAmigo.model.entity.Usuario;
import br.com.petAmigo.model.jpa.impl.JPAUtil;
import br.com.petAmigo.util.Constants;
import br.com.petAmigo.util.JSONUtil;
import br.com.petAmigo.util.MyDateGenerator;
import java.io.InputStream;
import org.apache.tomcat.util.codec.binary.Base64;

public class AnimalController {

	private AnimalDAO animalDAO;
	private UsuarioDAO usuarioDAO;
	private StatusAnimalDAO statusAnimalDAO;
	private JPAUtil simpleEntityManager;

	@Context
	private HttpServletRequest myHttpServletRequest;

	@Context
	private HttpServletResponse myHttpServletResponse;

	public boolean create(@Context HttpServletRequest request) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());
		this.usuarioDAO = new UsuarioDAO(simpleEntityManager.getEntityManager());
		this.statusAnimalDAO = new StatusAnimalDAO(simpleEntityManager.getEntityManager());

		MyFileDAO myFileDAO = new MyFileDAO(this.simpleEntityManager.getEntityManager());

		MyFile foto = new MyFile();
		File f = null;
		Animal animal = null;
		FileOutputStream fos = null;
		byte[] media = null;
		String mediaName = String.valueOf(System.currentTimeMillis());

		try {

			this.simpleEntityManager.beginTransaction();
			if (!ServletFileUpload.isMultipartContent(request)) {
				System.err.println("Não é um Conteúdo multipart/form-data");
			} else {
				List<FileItem> fields = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				HashMap<String, String> parameters = new HashMap<>();

				for (int i = 0; i < fields.size(); i++) {
					if (fields.get(i).isFormField()) {
						parameters.put(fields.get(i).getFieldName(), fields.get(i).getString());
					} else {
						parameters.put(fields.get(i).getFieldName(), fields.get(i).getName());
                                                
						f = new File(System.getProperty(Constants.CATALINA_BASE) + Constants.UPLOAD_PATH + mediaName + Constants.MEDIA_JPG);
                                                media = fields.get(i).get();

						foto.setName(mediaName + Constants.MEDIA_JPG);
						foto.setDate(
								MyDateGenerator.dateStringToSql(new SimpleDateFormat("dd/mm/yyyy").format(new Date())));
						foto.setStatus(Constants.ACTIVE_ENTITY);

						if (media != null) {
							fos = new FileOutputStream(f);

							fos.write(media);
							fos.flush();
							fos.close();
						}
					}
				}

				myFileDAO.save(foto);

				Long idUser = Long.parseLong(parameters.get("id"));
				String nome = parameters.get("nome");
				String raca = parameters.get("raca");
				String info = parameters.get("info");
				int idade = Integer.parseInt(parameters.get("idade"));
				String sexo = parameters.get("sexo");
				String pelagem = parameters.get("pelagem");
				String porte = parameters.get("porte");
				Long idStatusAnimal = Long.parseLong(parameters.get("statusAnimal"));

				Usuario usuario = this.usuarioDAO.getById(idUser);
				StatusAnimal statusAnimal = this.statusAnimalDAO.getById(idStatusAnimal);

				if (usuario != null || statusAnimal != null) {

					animal = new Animal();

					animal.setNome(nome);
					animal.setRaca(raca);
					animal.setInformacoes(info);
					animal.setIdade(idade);
					animal.setSexo(sexo);
					animal.setPelagem(pelagem);
					animal.setPorte(porte);
					animal.setFoto(foto);
					animal.setStatusAnimal(statusAnimal);
					animal.setUsuario(usuario);
					animal.setStatus(Constants.ACTIVE_ENTITY);

					animalDAO.save(animal);
					this.simpleEntityManager.commit();

				} else {

					System.out.println("usuario ou statusAnimal NULO");
					return false;
				}
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {
			this.simpleEntityManager.close();
		}
		return true;
	}

	public boolean update(Long id, String nome, String raca, int idade, String sexo, String pelagem, String porte,
			Long statusAnimal) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());
		this.statusAnimalDAO = new StatusAnimalDAO(simpleEntityManager.getEntityManager());

		try {
			this.simpleEntityManager.beginTransaction();

			Animal animal = this.animalDAO.getById(id);
			StatusAnimal statusAnimalObj = this.statusAnimalDAO.getById(statusAnimal);

			animal.setNome(nome);
			animal.setRaca(raca);
			animal.setIdade(idade);
			animal.setSexo(sexo);
			animal.setPelagem(pelagem);
			animal.setPorte(porte);
			animal.setStatusAnimal(statusAnimalObj);

			this.animalDAO.update(animal);
			this.simpleEntityManager.commit();

		} catch (

		Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {
			this.simpleEntityManager.close();
		}
		return true;
	}

	public boolean delete(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		try {
			this.simpleEntityManager.beginTransaction();

			Animal animal = this.animalDAO.getById(id);

			animal.setStatus(Constants.INACTIVE_ENTITY);

			this.simpleEntityManager.commit();

		} catch (

		Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {
			this.simpleEntityManager.close();
		}
		return true;
	}

	public ArrayList<Animal> getAnimaisById(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByUser(id);

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}
		return animais;
	}

	public String getAnimaisByIdJson(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByUser(id);

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}
		return JSONUtil.objectToJSON(animais);

	}

	public Animal getAnimalById(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		Animal animal = new Animal();

		try {
			this.simpleEntityManager.beginTransaction();

			animal = this.animalDAO.getById(id);

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}
		return animal;

	}

	public String getAnimalByIdJson(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		Animal animal = new Animal();

		try {
			this.simpleEntityManager.beginTransaction();

			animal = this.animalDAO.getById(id);

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}
		return JSONUtil.objectToJSON(animal);

	}

	public List<Animal> listAnimaisDoacao() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByDoacao();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return animais;

	}
	
	public String listAnimaisDoacaoJson() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByDoacao();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return JSONUtil.objectToJSON(animais);

	}

	public ArrayList<Animal> listAnimaisAdocao() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByAdocao();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return animais;

	}

	public String listAnimaisAdocaoJson() {

            	this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByAdocao();

			for (Animal animal : animals) {

				animais.add(animal);

			}
                        
		} catch (Exception e) {
			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
                    this.simpleEntityManager.close();
		}
                
		return JSONUtil.objectToJSON(animais);
                
	}

	public ArrayList<Animal> listAnimaisPerdido() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByPerdido();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return animais;

	}

	public String listAnimaisPerdidoJson() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByPerdido();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return JSONUtil.objectToJSON(animais);

	}

	public ArrayList<Animal> listAnimaisCruzar() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByCruzar();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return animais;

	}

	public String listAnimaisCruzarJson() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

		ArrayList<Animal> animais = new ArrayList<Animal>();

		try {
			this.simpleEntityManager.beginTransaction();

			List<Animal> animals = this.animalDAO.findByCruzar();

			for (Animal animal : animals) {

				animais.add(animal);

			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {
			this.simpleEntityManager.close();
		}

		return JSONUtil.objectToJSON(animais);

	}

	public void getFile(String fileName, @Context HttpServletResponse myHttpServletResponse) {

		try {

			myHttpServletResponse.setContentType("image/jpg");

			ServletOutputStream out = myHttpServletResponse.getOutputStream();

			FileInputStream fin = new FileInputStream(
					System.getProperty(Constants.CATALINA_BASE) + Constants.UPLOAD_PATH + fileName);

			BufferedInputStream bin = new BufferedInputStream(fin);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			int ch = 0;
			while ((ch = bin.read()) != -1) {
				bout.write(ch);
			}

			bin.close();
			fin.close();
			bout.close();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
        
        public String getFileBASE64(String fileName) {

            String imageStr = "data:image/jpg;base64,";
            
		try {
                    String nameFile = System.getProperty(Constants.CATALINA_BASE) + Constants.UPLOAD_PATH + fileName;
                    
                    File fin = new File(nameFile);
                    InputStream finput = new FileInputStream(fin);
 
                   byte[] imageBytes = new byte[(int)fin.length()];
                    finput.read(imageBytes, 0, imageBytes.length);
                    finput.close();
                    imageStr += Base64.encodeBase64String(imageBytes);

		} catch (IOException e) {
                    e.printStackTrace();
		}
                
            return imageStr;
	}

        public String listAnimaisDoacaoGson() { // realizando parametros do json - recupera os anmais e transforma no json

            this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
            this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

            ArrayList<Animal> animais = new ArrayList<Animal>();

                try {
                    this.simpleEntityManager.beginTransaction();

                    List<Animal> animals = this.animalDAO.findByDoacao();

                    for (Animal animal : animals) {
			animal.setUsuario(null);
                        
			System.out.println(animal);
                        
                        animal.getFoto().setName(getFileBASE64(animal.getFoto().getName()));
			animais.add(animal);
                    }

		} catch (Exception e) {
                    this.simpleEntityManager.rollBack();
                    e.printStackTrace();

		} finally {
                    this.simpleEntityManager.close();
		}
            return JSONUtil.objectToJSON(animais).replace("\\u003d", "");
	}
        
        public String listAnimaisAdocaoGson() { // realizando parametros do json - recupera os anmais e transforma no json

            this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
            this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

            ArrayList<Animal> animais = new ArrayList<Animal>();

                try {
                    this.simpleEntityManager.beginTransaction();

                    List<Animal> animals = this.animalDAO.findByAdocao();

                    for (Animal animal : animals) {
			animal.setUsuario(null);
                        
			System.out.println(animal);
                        
                        animal.getFoto().setName(getFileBASE64(animal.getFoto().getName()));
			animais.add(animal);
                    }

		} catch (Exception e) {
                    this.simpleEntityManager.rollBack();
                    e.printStackTrace();

		} finally {
                    this.simpleEntityManager.close();
		}
            return JSONUtil.objectToJSON(animais).replace("\\u003d", "");
	}
        
	public String listAnimaisPerdidosGson() { // realizando parametros do json - recupera os anmais e transforma no json

            this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
            this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

            ArrayList<Animal> animais = new ArrayList<Animal>();

                try {
                    this.simpleEntityManager.beginTransaction();

                    List<Animal> animals = this.animalDAO.findByPerdido();

                    for (Animal animal : animals) {
			animal.setUsuario(null);
                        
			System.out.println(animal);
                        
                        animal.getFoto().setName(getFileBASE64(animal.getFoto().getName()));
			animais.add(animal);
                    }

		} catch (Exception e) {
                    this.simpleEntityManager.rollBack();
                    e.printStackTrace();

		} finally {
                    this.simpleEntityManager.close();
		}
            return JSONUtil.objectToJSON(animais).replace("\\u003d", "");
	}
        
        public String listAnimaisCruzarGson() { // realizando parametros do json - recupera os anmais e transforma no json

            this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
            this.animalDAO = new AnimalDAO(simpleEntityManager.getEntityManager());

            ArrayList<Animal> animais = new ArrayList<Animal>();

                try {
                    this.simpleEntityManager.beginTransaction();

                    List<Animal> animals = this.animalDAO.findByCruzar();

                    for (Animal animal : animals) {
			animal.setUsuario(null);
                        
			System.out.println(animal);
                        
                        animal.getFoto().setName(getFileBASE64(animal.getFoto().getName()));
			animais.add(animal);
                    }

		} catch (Exception e) {
                    this.simpleEntityManager.rollBack();
                    e.printStackTrace();

		} finally {
                    this.simpleEntityManager.close();
		}
            return JSONUtil.objectToJSON(animais).replace("\\u003d", "");
	}

}
