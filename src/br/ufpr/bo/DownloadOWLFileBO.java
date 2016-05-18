package br.ufpr.bo;

import java.sql.SQLException;
import java.util.List;

import br.ufpr.bean.DatatypeProperty;
import br.ufpr.bean.Hierarchy;
import br.ufpr.dao.ClassDao;
import br.ufpr.dao.DatatypePropertyDao;
import br.ufpr.dao.HierarchyDao;

public class DownloadOWLFileBO {

	ClassDao classDao = new ClassDao();
	HierarchyDao hierarchyDao = new HierarchyDao();
	DatatypePropertyDao datatypePropertyDao = new DatatypePropertyDao();

	/**
	 * Função utilizada para gerar o arquivo OWL.
	 * 
	 * @return
	 * @throws SQLException
	 */
	public StringBuffer downloadOWLFile() throws SQLException {
		StringBuffer file = createOWLHeader();
		file.append(setDeclaration());
		file.append(setSubClassOf());
		//file.append(setDisjointClasses());
		//file.append(setDataPropertyDomain());
		
		return file.append(createOWLFooter());
	}
	
	public StringBuffer createOWLHeader() {
		StringBuffer header = new StringBuffer();
		
		header.append("<?xml version=\"1.0\"?>"
				+ "<!DOCTYPE rdf:RDF ["
				+ "<!ENTITY owl \"http://www.w3.org/2002/07/owl#\" >"
				+ "<!ENTITY xsd \"http://www.w3.org/2001/XMLSchema#\" >"
				+ "<!ENTITY rdfs \"http://www.w3.org/2000/01/rdf-schema#\" >"
				+ "<!ENTITY rdf \"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" >"
				+ "<!ENTITY untitled-ontology-131 \"http://www.semanticweb.org/alex/ontologies/2015/3/untitled-ontology-131#\" >"
				+ "]>"
				+ "<rdf:RDF xmlns=\"http://www.semanticweb.org/alex/ontologies/2015/3/untitled-ontology-131#\" "
				+ "xml:base=\"http://www.semanticweb.org/alex/ontologies/2015/3/untitled-ontology-131\" "
				+ "xmlns:untitled-ontology-131=\"http://www.semanticweb.org/alex/ontologies/2015/3/untitled-ontology-131#\" "
				+ "xmlns:rdfs=\"http://www.w3.org/2000/01/rdf-schema#\" "
				+ "xmlns:owl=\"http://www.w3.org/2002/07/owl#\" "
				+ "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema#\" "
				+ "xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">");
		
		return header;
	}
	
	public StringBuffer createOWLFooter() {
		StringBuffer footer = new StringBuffer();
		footer.append("</rdf:RDF>");
		return footer;
	}
	
	public StringBuffer setDeclaration() {
		StringBuffer file = new StringBuffer();
		
		// Deve ser gerada uma Classe para todos os registros da T011.		
		//file.append("<Declaration><Class IRI=\"#universityStudent\" /></Declaration>");
		List<br.ufpr.bean.Class> classList = classDao.listAll();
		
		for (br.ufpr.bean.Class clazz : classList) {
			file.append("<Declaration><Class IRI=\"#");
			file.append(clazz.getName());
			file.append("\" /></Declaration>");
		}
		
		return file;
	}
	
	public StringBuffer setSubClassOf() {
		StringBuffer file = new StringBuffer();
		
		// Para cada classe gerada, é preciso informar de quem esta classe é uma subclasse.
		// Para isso, deve ser identificado na T012 todos os C011_SUPER_CLASS_ID, pesquisando pelo código desta classe na coluna C011_SUB_CLASS_ID.
		//file.append("<SubClassOf><Class IRI=\"#universityStudent\"/><Class IRI=\"#student\"/></SubClassOf>");
		List<Hierarchy> hierarchyList = hierarchyDao.listAll();
		
		for (Hierarchy hierarchy : hierarchyList) {
			file.append("<SubClassOf>");
			file.append("<Class IRI=\"#");file.append(hierarchy.getSuperClass().getName());file.append("\" />");
			file.append("<Class IRI=\"#");file.append(hierarchy.getSubClass().getName());file.append("\" />");
			file.append("</SubClassOf>");
		}
		
		return file;
	}
	
	public StringBuffer setDisjointClasses() {
		StringBuffer file = new StringBuffer();
		
		/*
		 DISJOIUNT CLASS:
		Ainda compondo a definição de uma classe, podemos também informar as classes disjuntas, ou seja, que não fazem parte do domínio da classe representada. A Tag para classe disjunta segue o modelo abaixo.
		    <DisjointClasses>
		        <Class IRI="#Aluno"/>
		        <Class IRI="#Matematica"/>
		        <Class IRI="#Portugues"/>
		        <Class IRI="#Professor"/>
		    </DisjointClasses>
		
		Isso quer dizer que estas classes não são equivalentes. Cada uma representada na lista indica que um aluno não é matemática, nem português...etc.
		DESENVOLVER:
		Para produzir uma tag de classes disjuntas é necessário gerar uma tag para cada classe diferente da classe que está gerando a tag. Dados da T011.
		 */
		
		return file;
	}
	
	public StringBuffer setDataPropertyDomain() {
		StringBuffer file = new StringBuffer();
		file.append(setDataPropertyDomain01()); 
		file.append(setDataPropertyDomain02());
		file.append(setDataPropertyDomain03());
		return file;
	}
	
	public StringBuffer setDataPropertyDomain01() {
		StringBuffer file = new StringBuffer();
		
		// Para gerar o data property deve ser processado todos os registros da T013, em que (C013_IND_COMMON_CONCEPT = 0 AND C013_IND_DESCRIPTION = 0). 
		//file.append("<DataPropertyDomain><DataProperty IRI=\"#matricula_aluno\" /><Class IRI=\"#Aluno\" /></DataPropertyDomain>");
    	List<DatatypeProperty> datatypePropertyList = datatypePropertyDao.getByIndCommonConceptAndIndDescription(false, false);
    	
    	for (DatatypeProperty datatypeProperty : datatypePropertyList) {
    		file.append("<DataPropertyDomain>");
    		file.append("<DataProperty IRI=\"#");file.append(datatypeProperty.getDescription());file.append("\" />");
    		file.append("<Class IRI=\"#");file.append("Aluno");file.append("\" />");
    		file.append("</DataPropertyDomain>");
    	}
		
		return file;
	}
	
	public StringBuffer setDataPropertyDomain02() {
		StringBuffer file = new StringBuffer();
		
		// Para os registros da T013, em que (C013_IND_COMMON_CONCEPT = 1), o resultado da pesquisa na T014 retorne mais que 1 resultado.
		file.append("<DataPropertyDomain><DataProperty IRI=\"#primeiro_nome\" /><ObjectUnionOf><Class IRI=\"#Pessoa\" /><Class IRI=\"#Portugues\" /></ObjectUnionOf></DataPropertyDomain>");

		return file;
	}
	
	public StringBuffer setDataPropertyDomain03() {
		StringBuffer file = new StringBuffer();
		
		// Para os registros da T013, em que (C013_IND_DESCRIPTION = 1).
		file.append("<DataPropertyDomain><DataProperty IRI=\"#descricao\" /><Class IRI=\"#Thing\" /></DataPropertyDomain>");
		
		return file;
	}
}