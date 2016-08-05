package pe.com.rimac.sat.portal.util;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import javax.naming.ldap.StartTlsRequest;
import javax.naming.ldap.StartTlsResponse;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import static javax.naming.directory.SearchControls.SUBTREE_SCOPE;

public class TestLDAP {

	private static String[] userAttributes = {
	        "distinguishedName","cn","name","uid",
	        "sn","givenname","memberOf","samaccountname",
	        "userPrincipalName"
	    };
	
	public static void main(String[] args) {
		
		try {
			Hashtable env = new Hashtable();			
	        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
	        env.put(Context.PROVIDER_URL, "ldap://172.24.1.10:389");
	        env.put(Context.SECURITY_AUTHENTICATION, "simple");
	        env.put(Context.SECURITY_PRINCIPAL, "xt0180@rimac.com.pe");
	        env.put(Context.SECURITY_CREDENTIALS, "Rimac2016/");
//	        env.put(Context.REFERRAL, "follow");  
       
            DirContext ctx = new InitialDirContext(env);
            LdapContext ldapctx = new InitialLdapContext(env, null);
            System.out.println("Logeo exitoso en LDAP");
            
            for(User user : getUsers(ldapctx)){
            	System.out.println(user.getCommonName() + " " + user.getUserPrincipal());
            }
        } catch (NamingException e) {
        	e.printStackTrace();        	
        } catch(Exception e){
        	e.printStackTrace();
        }
		
	}
	
	 private static String toDC(String domainName) {
	        StringBuilder buf = new StringBuilder();
	        for (String token : domainName.split("\\.")) {
	            if(token.length()==0)   continue;   // defensive check
	            if(buf.length()>0)  buf.append(",");
	            buf.append("DC=").append(token);
	        }
	        return buf.toString();
	    }
	
	public static User[] getUsers(LdapContext context) throws NamingException {
		 
        java.util.ArrayList<User> users = new java.util.ArrayList<User>();
        String authenticatedUser = (String) context.getEnvironment().get(Context.SECURITY_PRINCIPAL);
        if (authenticatedUser.contains("@")){
            String domainName = authenticatedUser.substring(authenticatedUser.indexOf("@")+1);
            SearchControls controls = new SearchControls();
            controls.setSearchScope(SUBTREE_SCOPE);
            controls.setReturningAttributes(userAttributes);
            NamingEnumeration answer = context.search( toDC(domainName), "(objectClass=user)", controls);
            try{
                while(answer.hasMore()) {
                    Attributes attr = ((SearchResult) answer.next()).getAttributes();
                    Attribute user = attr.get("userPrincipalName");
                    if (user!=null){
                        users.add(new User(attr));
                    }
                }
            }
            catch(Exception e){}
        }
        return users.toArray(new User[users.size()]);
    }
	
	  //**************************************************************************
	  //** User Class
	  //*************************************************************************/
	  /** Used to represent a User in Active Directory
	   */
	    public static class User {
	        private String distinguishedName;
	        private String userPrincipal;
	        private String commonName;
	        public User(Attributes attr) throws javax.naming.NamingException {
	            userPrincipal = (String) attr.get("userPrincipalName").get();
	            commonName = (String) attr.get("cn").get();
	            distinguishedName = (String) attr.get("distinguishedName").get();
	 
	        }
	 
	        public String getUserPrincipal(){
	            return userPrincipal;
	        }
	 
	        public String getCommonName(){
	            return commonName;
	        }
	 
	        public String getDistinguishedName(){
	            return distinguishedName;
	        }
	 
	        public String toString(){
	            return getDistinguishedName();
	        }
	 
	      /** Used to change the user password. Throws an IOException if the Domain
	       *  Controller is not LDAPS enabled.
	       *  @param trustAllCerts If true, bypasses all certificate and host name
	       *  validation. If false, ensure that the LDAPS certificate has been
	       *  imported into a trust store and sourced before calling this method.
	       *  Example:
	          String keystore = "/usr/java/jdk1.5.0_01/jre/lib/security/cacerts";
	          System.setProperty("javax.net.ssl.trustStore",keystore);
	       */
	        public void changePassword(String oldPass, String newPass, boolean trustAllCerts, LdapContext context) 
	        throws java.io.IOException, NamingException {
	            String dn = getDistinguishedName();
	 
	 
	          //Switch to SSL/TLS
	            StartTlsResponse tls = null;
	            try{
	                tls = (StartTlsResponse) context.extendedOperation(new StartTlsRequest());
	            }
	            catch(Exception e){
	                //"Problem creating object: javax.naming.ServiceUnavailableException: [LDAP: error code 52 - 00000000: LdapErr: DSID-0C090E09, comment: Error initializing SSL/TLS, data 0, v1db0"
	                throw new java.io.IOException("Failed to establish SSL connection to the Domain Controller. Is LDAPS enabled?");
	            }
	 
	 
	          //Exchange certificates
	            if (trustAllCerts){
	                tls.setHostnameVerifier(DO_NOT_VERIFY);
	                SSLSocketFactory sf = null;
	                try {
	                    SSLContext sc = SSLContext.getInstance("TLS");
	                    sc.init(null, TRUST_ALL_CERTS, null);
	                    sf = sc.getSocketFactory();
	                }
	                catch(java.security.NoSuchAlgorithmException e) {}
	                catch(java.security.KeyManagementException e) {}
	                tls.negotiate(sf);
	            }
	            else{
	                tls.negotiate();
	            }
	 
	 
	          //Change password
	            try {
	                //ModificationItem[] modificationItems = new ModificationItem[1];
	                //modificationItems[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE, new BasicAttribute("unicodePwd", getPassword(newPass)));
	 
	                ModificationItem[] modificationItems = new ModificationItem[2];
	                modificationItems[0] = new ModificationItem(DirContext.REMOVE_ATTRIBUTE, new BasicAttribute("unicodePwd", getPassword(oldPass)) );
	                modificationItems[1] = new ModificationItem(DirContext.ADD_ATTRIBUTE, new BasicAttribute("unicodePwd", getPassword(newPass)) );
	                context.modifyAttributes(dn, modificationItems);
	            }
	            catch(javax.naming.directory.InvalidAttributeValueException e){
	                String error = e.getMessage().trim();
	                if (error.startsWith("[") && error.endsWith("]")){
	                    error = error.substring(1, error.length()-1);
	                }
	                System.err.println(error);
	                //e.printStackTrace();
	                tls.close();
	                throw new NamingException(
	                    "New password does not meet Active Directory requirements. " +
	                    "Please ensure that the new password meets password complexity, " +
	                    "length, minimum password age, and password history requirements."
	                );
	            }
	            catch(NamingException e) {
	                tls.close();
	                throw e;
	            }
	 
	          //Close the TLS/SSL session
	            tls.close();
	        }
	 
	        private static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
	            public boolean verify(String hostname, SSLSession session) {
	                return true;
	            }
	        };
	 
	        private static TrustManager[] TRUST_ALL_CERTS = new TrustManager[]{
	        new X509TrustManager() {
	            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	                return null;
	            }
	            public void checkClientTrusted(
	                java.security.cert.X509Certificate[] certs, String authType) {
	            }
	            public void checkServerTrusted(
	                java.security.cert.X509Certificate[] certs, String authType) {
	            }
	        }
	        };
	 
	 
	        private byte[] getPassword(String newPass){
	            String quotedPassword = "\"" + newPass + "\"";
	            //return quotedPassword.getBytes("UTF-16LE");
	            char unicodePwd[] = quotedPassword.toCharArray();
	            byte pwdArray[] = new byte[unicodePwd.length * 2];
	            for (int i=0; i<unicodePwd.length; i++) {
	                pwdArray[i*2 + 1] = (byte) (unicodePwd[i] >>> 8);
	                pwdArray[i*2 + 0] = (byte) (unicodePwd[i] & 0xff);
	            }
	            return pwdArray;
	        }
	    }

}
