get_google_scholar_info <- with(new.env()){
  last_call <- Sys.time()
  
  function(name, journal){
    require(rvest)
    # Try to open the url
    url_ <- paste0("https://scholar.google.ch/scholar?as_q=&as_epq=", 
                   gsub("\\ ", "+", name), "&as_publication=", 
                   gsub("\\ ", "+", journal), "&hl=en")
    
    # Dont want issues with google searches blooking us out
    sleep(max(1e-8, .21 - Sys.time() + last_call))
    last_call <<- Sys.time()
    
    tryCatch({
      site <- read_html(url_)
    }, error = function(e){
      warning("Failed with url ", url_, ". Errors is")
      print(e)
      return(invisible())
    })
    
    # Extract the html nodes with the results
    res_node <- html_nodes(
      site, xpath = "//div[@id = 'gs_ccl_results']/div/div[contains(@class, 'gs_ri')]")
    
    # Only return something if we found exactly one result
    if(length(res_node) > 1){
      warning("Found multiple matches for ", name, " in ", journal)
      return(invisible())
    } else if(length(res_node) == 0){
      warning("Did not find any matches for ", name, " in ", journal)
      return(invisible())
    }
    
    # Get the journal url and number of citations and return
    journal_url <- html_text(html_nodes(
      res_node, xpath = "./h3[contains(@class, 'gs_rt')]/a/@href"))
    n_citations <- html_text(html_nodes(
      res_node, xpath = "(./div[contains(@class, 'gs_fl')]/a)[1]/text()"))
    n_citations <-  as.numeric(gsub("^Cited by ", "", n_citations))
    
    list(journal_url = journal_url, n_citations = n_citations)
  }
}
            
