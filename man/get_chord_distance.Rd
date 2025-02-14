% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thresholding.R
\name{get_chord_distance}
\alias{get_chord_distance}
\title{Multiple Elbows via Chord Distance (Local Maxima)}
\usage{
get_chord_distance(x, y, use.threshold = TRUE, threshold = 0)
}
\arguments{
\item{x}{Numeric vector of x-values (sorted or strictly increasing).}

\item{y}{Numeric vector of y-values of the same length as \code{x}.}

\item{use.threshold}{Logical; if \code{TRUE}, only local maxima with distance
\verb{>= threshold} are kept.}

\item{threshold}{Numeric distance threshold.}
}
\value{
A list with:
\itemize{
\item \code{inflection_indices}: Indices of local maxima in chord-distance.
\item \code{inflection_xs}: The x-values at those indices.
\item \code{inflection_ys}: The y-values at those indices.
\item \code{distances}: The full array of perpendicular distances to the chord.
}
}
\description{
\strong{Draw a chord} from the first to the last point, compute perpendicular distances
for each \eqn{(x[i], y[i])}, and find \emph{local maxima} in these distances, optionally
above a threshold, as candidate elbows.
}
\details{
\enumerate{
\item The chord is formed between \verb{(x[1], y[1])} and \verb{(x[n], y[n])}.
\item For each point, the perpendicular distance is computed.
\item Each local maximum is returned as a potential elbow.
}
}
\examples{
x_data <- seq(500)
# Exponential data
y_data <- 1 * exp(0.02 * (x_data - 1))

# Sigmoidal
y_data2 <- 1 / (1 + exp(-0.02 * (x_data - 250)))

res_chord <- get_chord_distance(x_data, y_data)
res_chord$inflection_xs
res_chord$inflection_ys

res_chord <- get_chord_distance(x_data, y_data2)
res_chord$inflection_xs
res_chord$inflection_ys
}
\author{
Jared Andrews
}
