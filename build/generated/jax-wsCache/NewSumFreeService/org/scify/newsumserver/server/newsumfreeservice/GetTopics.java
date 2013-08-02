
package org.scify.newsumserver.server.newsumfreeservice;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for getTopics complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="getTopics">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sUserSources" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="sCategory" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getTopics", propOrder = {
    "sUserSources",
    "sCategory"
})
public class GetTopics {

    protected String sUserSources;
    protected String sCategory;

    /**
     * Gets the value of the sUserSources property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSUserSources() {
        return sUserSources;
    }

    /**
     * Sets the value of the sUserSources property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSUserSources(String value) {
        this.sUserSources = value;
    }

    /**
     * Gets the value of the sCategory property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSCategory() {
        return sCategory;
    }

    /**
     * Sets the value of the sCategory property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSCategory(String value) {
        this.sCategory = value;
    }

}
