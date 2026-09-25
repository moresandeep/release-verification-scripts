# release-test-configs
Configurations to verify Apache Knox release candidates.

These configurartions are intended to be used in conjunction with the tests in the release-verification-scripts repository.  

**common-conf** is meant for configuration artifacts shared by multiple tests.  
|--> shared-providers is meant for provider configurations to be referenced by multiple test descriptors  

**ClientCredentials**  
|--> conf                  Test-specific configuration  
&nbsp;&nbsp;&nbsp;&nbsp;|--> descriptors       Test-specific descriptors  
&nbsp;&nbsp;&nbsp;&nbsp;|--> shared-providers  Test-specific provider configurations  

**APIKey**  
|--> conf                  Test-specific configuration  
&nbsp;&nbsp;&nbsp;&nbsp;|--> descriptors       Test-specific descriptors  
&nbsp;&nbsp;&nbsp;&nbsp;|--> shared-providers  Test-specific provider configurations  

  
  



