#import "@preview/cetz:0.4.1"
#import "@preview/cetz-plot:0.1.2"

#import "lib/config.typ": config
#import "lib/header.typ": header
#import "lib/abstract.typ": preview

/***************************************************/
/*                    Constants                    */
/***************************************************/

#let title = "Analysis of Antivirus Resilience and Efficiency Against Crypto Ransomware Attacks"
#let authors = (
  (
    name: "Frankie Huang",
    department: "School of Electrical Engineering and Informatics",
    organization: "Bandung Institute of Technology",
    location: "Bandung, Indonesia",
    email: "13521092@std.stei.itb.ac.id",
  ),
  (
    name: "Robithoh Annur, S.T., M.Eng., Ph.D.",
    department: "School of Electrical Engineering and Informatics",
    organization: "Bandung Institute of Technology",
    location: "Bandung, Indonesia",
    email: "TODO",
  ),
  (
    name: "Prof. Dr. Suhardi, M.T.",
    department: "School of Electrical Engineering and Informatics",
    organization: "Bandung Institute of Technology",
    location: "Bandung, Indonesia",
    email: "TODO",
  ),
)

#let paper-size = "us-letter"

#let abstract = [
  The number of ransomware attack continues to increase due to their ability to encrypt critical data, forcing victims to pay the required ransom to recover them. Antivirus programs serve as one of the primary lines of defense for users, however their effectiveness against new ransomware variants has not been comprehensively measured. This research aims to analyze the resilience of several commonly used antivirus programs against crypto-ransomware attacks.

  We propose developing a crypto-ransomware program with various selectable data encryption techniques, such as encryptor thread count (1, 2, 4, 8, 16), file I/O methods (full read, stream-based, memory-mapped), encryption coverage (up to 100%), and encryption algorithm used (manually implemented AES vs CryptoAPI). Testing was conducted on five different antivirus programs, namely Windows Defender, Norton AntiVirus Plus, McAfee Antivirus, Malwarebytes Premium Security, and Avast Premium Security, in virtual machines running Windows 11 Pro containing 128 target files of 977.6 MB. Evaluation metrics include antivirus detection rate, number of encrypted files, and program execution time.

  Testing results show that Windows Defender and McAfee Antivirus failed to stop the program, while Norton was able to protect the files only if the directory is included in the protected directory list. Meanwhile, Malwarebytes only detected malicious activities after 4-6 files were successfully encrypted. Lastly, Avast demonstrated the best performance as it was able to completely prevent ransomware execution.
]

#let index-terms = ("ransomware", "antivirus", "crypto ransomware", "encryption", "cyber security")

/***************************************************/
/*                      Render                     */
/***************************************************/

#show: config.with(
  title: title,
  authors: authors.map(author => author.name),
  paper-size: paper-size,
)

#header(
  title: title,
  authors: authors,
)

#preview(
  abstract: abstract,
  index-terms: index-terms,
)

#include "src/introduction.typ"
#include "src/preliminaries.typ"
#include "src/proposed-methodology.typ"
#include "src/experimental-design.typ"
#include "src/result-and-analysis.typ"
#include "src/conclusion-and-future-works.typ"
