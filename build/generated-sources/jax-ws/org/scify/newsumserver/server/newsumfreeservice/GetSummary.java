
package org.scify.newsumserver.server.newsumfreeservice;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for getSummary complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="getSummary">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sTopicID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="sUserSources" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getSummary", propOrder = {
    "sTopicID",
    "sUserSources"
})
public class GetSummary {

    protected String sTopicID;
    protected String sUserSources;

    /**
     * Gets the value of the sTopicID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSTopicID() {
        return sTopicID;
    }

    /**
     * Sets the value of the sTopicID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSTopicID(String value) {
        this.sTopicID = value;
    }

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

}
