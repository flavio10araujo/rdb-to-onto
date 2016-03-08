package br.ufpr.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t013_datatype_property")
public class DatatypeProperty implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c013_datatype_property_id", nullable = false, unique = true)
	private Long id;
	
	@Column(name = "c013_datatype_property_description")
	private String description;

	@ManyToOne
	@JoinColumn(name = "c016_ontology_id")
	private Ontology ontology;
	
	@ManyToOne
	@JoinColumn(name = "c018_datatype_id")
	private DatatypeOnto datatypeOnto;
	
	@ManyToOne
	@JoinColumn(name = "c003_column_id")
	private Column column;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Ontology getOntology() {
		return ontology;
	}

	public void setOntology(Ontology ontology) {
		this.ontology = ontology;
	}

	public DatatypeOnto getDatatypeOnto() {
		return datatypeOnto;
	}

	public void setDatatypeOnto(DatatypeOnto datatypeOnto) {
		this.datatypeOnto = datatypeOnto;
	}

	public Column getColumn() {
		return column;
	}

	public void setColumn(Column column) {
		this.column = column;
	}
}