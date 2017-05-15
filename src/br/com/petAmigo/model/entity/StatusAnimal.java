package br.com.petAmigo.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class StatusAnimal {

	private Long id;
	private String statusAnimal;
	private boolean status;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStatusAnimal() {
		return statusAnimal;
	}

	public void setStatusAnimal(String statusAnimal) {
		this.statusAnimal = statusAnimal;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "StatusAnimal [id=" + id + ", statusAnimal=" + statusAnimal + ", status=" + status + "]";
	}

}
