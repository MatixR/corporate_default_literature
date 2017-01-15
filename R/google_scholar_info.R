get_google_scholar_info <- with(new.env(), {
  require(stringr)
  require(rvest)
  
  last_call <- Sys.time()
  
  function(name = "", journal = ""){
    # Try to open the url
    url_ <- paste0('https://scholar.google.com/scholar?as_q=&as_epq="', 
                   gsub("\\ ", "+", name), '"&as_publication=', 
                   gsub("\\ ", "+", journal), "&hl=en")
    
    # Dont want issues with google searches blooking us out
    # cat("\nBefore:", 1 - as.numeric(Sys.time()) + as.numeric(last_call))
    Sys.sleep(max(1e-8, 1 + runif(1, max = 30) - as.numeric(Sys.time()) + as.numeric(last_call)))
    last_call <<- Sys.time()
    # cat("\nAfter: ", 1 - as.numeric(Sys.time()) + as.numeric(last_call))
    
    did_fail <- FALSE
    tryCatch({
      site <- site <- read_html(GET(url_))
    }, error = function(e){
      warning("Failed with url ", url_, ". Errors is", "\n")
      warning(str(e))
      did_fail <<- TRUE
    })
    
    if(did_fail){
      return(list(journal_url = NA, year = NA, n_citations = NA, abstract = NA))
    }
    
    # Extract the html nodes with the results
    res_node <- html_nodes(
      site, xpath = "//div[@id = 'gs_ccl_results']/div/div[contains(@class, 'gs_ri')]")
    
    # Only return something if we found exactly one result
    if(length(res_node) > 1){
      warning("Found multiple matches for ", name, " in ", journal, ". Url is '", url_,  "'. Taking the first\n")
      res_node <- res_node[1]
    } else if(length(res_node) == 0){
      warning("Did not find any matches for ", name, " in ", journal, ". Url is '", url_, "'\n")
      return(list(journal_url = NA, year = NA, n_citations = NA, abstract = NA))
    }
    
    # Get the journal url and number of citations and return
    journal_url <- html_text(html_nodes(
      res_node, xpath = "./h3[contains(@class, 'gs_rt')]/a/@href"))
    
    n_citations <- html_text(html_nodes(
      res_node, xpath = "(./div[contains(@class, 'gs_fl')]/a)[1]/text()"))
    if(grepl("^Cite$", n_citations) || grepl("^Related articles$", n_citations))
      n_citations <- 0 else
        n_citations <-  as.numeric(gsub("^Cited by ", "", n_citations))
    
    related_articles <- html_text(html_nodes(
      res_node, xpath = "./div[contains(@class, 'gs_fl')]/a[text() = 'Related articles']/@href"))
    if(length(related_articles) == 1){
      related_articles <- paste0("https://scholar.google.com", related_articles)
    } else
      related_articles <- NA
      
    
    year <- html_text(html_nodes(
      res_node, xpath = "./div[contains(@class, 'gs_a')]/text()"))
    year <- as.numeric(str_extract(tail(year, 1), "\\d{4}"))
    
    abstract <- html_text(html_nodes(
      res_node, xpath = "./div[contains(@class, 'gs_rs')]/text()"))
    abstract <- paste0(abstract, collapse = " ")
    
    # We could also get the google "cite" info by something like
    # paste0("https://scholar.google.com/scholar?q=info:", id, ":scholar.google.com/&output=cite&scirp=1&hl=en")
    # The id has to be found <a> tag. Though, I figure google would not be too
    # pleased with this
    
    list(journal_url = journal_url, year = year, n_citations = n_citations, 
         abstract = abstract, related_articles = related_articles)
  }
})

# get_google_scholar_info("Design and natural science research on information technology",
#                         "Decision support systems")
            
