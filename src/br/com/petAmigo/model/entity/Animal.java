package br.com.petAmigo.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Animal {

	private Long id;
	private String nome;
	private String raca;
	private int idade;
	private String sexo;
	private String pelagem;
	private String porte;
	private String informações;
	private MyFile foto;
	private StatusAnimal statusAnimal;
	private boolean status;
	private Usuario usuario;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getPelagem() {
		return pelagem;
	}

	public void setPelagem(String pelagem) {
		this.pelagem = pelagem;
	}

	public String getPorte() {
		return porte;
	}

	public void setPorte(String porte) {
		this.porte = porte;
	}

	public String getInformações() {
		return informações;
	}

	public void setInformações(String informações) {
		this.informações = informações;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToOne
	@JoinColumn(name = "id_foto")
	public MyFile getFoto() {
		return foto;
	}

	public void setFoto(MyFile foto) {
		this.foto = foto;
	}

	@OneToOne
	public StatusAnimal getStatusAnimal() {
		return statusAnimal;
	}

	public void setStatusAnimal(StatusAnimal statusAnimal) {
		this.statusAnimal = statusAnimal;
	}

	@ManyToOne
	@JoinColumn(name = "usuario_id")
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
