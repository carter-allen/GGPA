\name{GGPA}
\alias{GGPA}
\title{
Fit graph-GPA model
}
\description{
Fit graph-GPA model.
}
\usage{
GGPA( gwasPval, pgraph=NULL, nBurnin=10000, nMain=40000, lbPval=1e-10, verbose=1 )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{gwasPval}{p-value matrix from GWAS data,
		where row and column correspond to SNP and phenotype, respectively.}
    \item{pgraph}{A binary matrix representing the prior phenotype graph,
		where its rows and columns match the columns of \code{gwasPval}.}
    \item{nBurnin}{Number of burn-in iterations. Default is 10000.}
    \item{nMain}{Number of main MCMC iterations. Default is 40000.}
    \item{lbPval}{Lower bound for GWAS p-value. 
  		Any GWAS p-values smaller than \code{lbPval} are set to \code{lbPval}.
  		Default is 1e-10.}  
    \item{verbose}{Amount of progress report during the fitting procedure. 
  		Possible values are 0 (minimal output), 1, 2, or 3 (maximal output).
  		Default is 1.} 
}
\details{
\code{GGPA} fits the graph-GPA model. It requires to provide GWAS p-value to \code{gwasPval}. If a phenotype graph is provided in \code{pgraph}, it is utilized to guide the phenotype graph estimation. Based on this GGPA fit, \code{assoc} implements association mapping and \code{plot} provides a phenotype graph.
}
\value{
Construct \code{GGPA} class object.
}
\references{
Chung D, Kim H, and Zhao H (2016), 
"graph-GPA: A graphical model for prioritizing GWAS results and investigating pleiotropic architecture," 13(2): e1005388

Kim H, Yu Z, Lawson A, Zhao H, and Chung D (2018), "Improving SNP prioritization and pleiotropic architecture estimation by incorporating prior knowledge using graph-GPA," Bioinformatics, bty061.
}
\author{
Hang J. Kim and Dongjun Chung
}
\seealso{
\code{\link{assoc}}, \code{\linkS4class{GGPA}}.
}
\examples{

# Load the included simulation data
data(simulation)

# fit GGPA model with 200 iterations and a burn-in of 200 iterations
# Note that we recommend more than 200 iterations in practice
fit <- GGPA( simulation$pmat, nMain = 200, nBurnin = 200)


# Association mapping with FDR of 0.1 and global control
head(assoc( fit, FDR=0.1, fdrControl="global" ))

# We may specift i = 1 and j = 2 if we are interested in that specific phenotype
head(assoc( fit, FDR=0.1, fdrControl="global", i=1, j=2 )) 

# plot the GGPA model fit
plot(fit)

}
\keyword{models}
\keyword{methods}
