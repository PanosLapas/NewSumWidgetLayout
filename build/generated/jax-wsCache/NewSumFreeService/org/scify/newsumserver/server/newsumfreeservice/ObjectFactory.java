
package org.scify.newsumserver.server.newsumfreeservice;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the org.scify.newsumserver.server.newsumfreeservice package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetCategories_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getCategories");
    private final static QName _GetTopicsByKeywordResponse_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getTopicsByKeywordResponse");
    private final static QName _Exception_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "Exception");
    private final static QName _GetTopicsResponse_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getTopicsResponse");
    private final static QName _GetCategoriesResponse_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getCategoriesResponse");
    private final static QName _GetLinkLabels_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getLinkLabels");
    private final static QName _GetLinkLabelsResponse_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getLinkLabelsResponse");
    private final static QName _GetTopicsByKeyword_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getTopicsByKeyword");
    private final static QName _GetSummary_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getSummary");
    private final static QName _GetSummaryResponse_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getSummaryResponse");
    private final static QName _GetTopics_QNAME = new QName("http://NewSumFreeService.Server.NewSumServer.scify.org/", "getTopics");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: org.scify.newsumserver.server.newsumfreeservice
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetTopicsByKeywordResponse }
     * 
     */
    public GetTopicsByKeywordResponse createGetTopicsByKeywordResponse() {
        return new GetTopicsByKeywordResponse();
    }

    /**
     * Create an instance of {@link Exception }
     * 
     */
    public Exception createException() {
        return new Exception();
    }

    /**
     * Create an instance of {@link GetCategories }
     * 
     */
    public GetCategories createGetCategories() {
        return new GetCategories();
    }

    /**
     * Create an instance of {@link GetLinkLabels }
     * 
     */
    public GetLinkLabels createGetLinkLabels() {
        return new GetLinkLabels();
    }

    /**
     * Create an instance of {@link GetCategoriesResponse }
     * 
     */
    public GetCategoriesResponse createGetCategoriesResponse() {
        return new GetCategoriesResponse();
    }

    /**
     * Create an instance of {@link GetTopicsResponse }
     * 
     */
    public GetTopicsResponse createGetTopicsResponse() {
        return new GetTopicsResponse();
    }

    /**
     * Create an instance of {@link GetSummary }
     * 
     */
    public GetSummary createGetSummary() {
        return new GetSummary();
    }

    /**
     * Create an instance of {@link GetTopicsByKeyword }
     * 
     */
    public GetTopicsByKeyword createGetTopicsByKeyword() {
        return new GetTopicsByKeyword();
    }

    /**
     * Create an instance of {@link GetLinkLabelsResponse }
     * 
     */
    public GetLinkLabelsResponse createGetLinkLabelsResponse() {
        return new GetLinkLabelsResponse();
    }

    /**
     * Create an instance of {@link GetTopics }
     * 
     */
    public GetTopics createGetTopics() {
        return new GetTopics();
    }

    /**
     * Create an instance of {@link GetSummaryResponse }
     * 
     */
    public GetSummaryResponse createGetSummaryResponse() {
        return new GetSummaryResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCategories }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getCategories")
    public JAXBElement<GetCategories> createGetCategories(GetCategories value) {
        return new JAXBElement<GetCategories>(_GetCategories_QNAME, GetCategories.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTopicsByKeywordResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getTopicsByKeywordResponse")
    public JAXBElement<GetTopicsByKeywordResponse> createGetTopicsByKeywordResponse(GetTopicsByKeywordResponse value) {
        return new JAXBElement<GetTopicsByKeywordResponse>(_GetTopicsByKeywordResponse_QNAME, GetTopicsByKeywordResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Exception }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "Exception")
    public JAXBElement<Exception> createException(Exception value) {
        return new JAXBElement<Exception>(_Exception_QNAME, Exception.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTopicsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getTopicsResponse")
    public JAXBElement<GetTopicsResponse> createGetTopicsResponse(GetTopicsResponse value) {
        return new JAXBElement<GetTopicsResponse>(_GetTopicsResponse_QNAME, GetTopicsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetCategoriesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getCategoriesResponse")
    public JAXBElement<GetCategoriesResponse> createGetCategoriesResponse(GetCategoriesResponse value) {
        return new JAXBElement<GetCategoriesResponse>(_GetCategoriesResponse_QNAME, GetCategoriesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetLinkLabels }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getLinkLabels")
    public JAXBElement<GetLinkLabels> createGetLinkLabels(GetLinkLabels value) {
        return new JAXBElement<GetLinkLabels>(_GetLinkLabels_QNAME, GetLinkLabels.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetLinkLabelsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getLinkLabelsResponse")
    public JAXBElement<GetLinkLabelsResponse> createGetLinkLabelsResponse(GetLinkLabelsResponse value) {
        return new JAXBElement<GetLinkLabelsResponse>(_GetLinkLabelsResponse_QNAME, GetLinkLabelsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTopicsByKeyword }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getTopicsByKeyword")
    public JAXBElement<GetTopicsByKeyword> createGetTopicsByKeyword(GetTopicsByKeyword value) {
        return new JAXBElement<GetTopicsByKeyword>(_GetTopicsByKeyword_QNAME, GetTopicsByKeyword.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSummary }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getSummary")
    public JAXBElement<GetSummary> createGetSummary(GetSummary value) {
        return new JAXBElement<GetSummary>(_GetSummary_QNAME, GetSummary.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSummaryResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getSummaryResponse")
    public JAXBElement<GetSummaryResponse> createGetSummaryResponse(GetSummaryResponse value) {
        return new JAXBElement<GetSummaryResponse>(_GetSummaryResponse_QNAME, GetSummaryResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetTopics }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://NewSumFreeService.Server.NewSumServer.scify.org/", name = "getTopics")
    public JAXBElement<GetTopics> createGetTopics(GetTopics value) {
        return new JAXBElement<GetTopics>(_GetTopics_QNAME, GetTopics.class, null, value);
    }

}
