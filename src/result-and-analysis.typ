= Result and Analysis

#block[
  #set text(hyphenate: false, size: 8pt)
  #figure(
    table(
      fill: (_, y) => if y == 0 { luma(180) },
      columns: 6,
      inset: 4pt,
      align: center,
      table.header("Configuration", "Thread Count", "File I/O", "Coverage", "Algorithm", "Delay"),
      [baseline], [1], [ReadFile], [100%], [CryptoAPI], [-],
      [stealthy], [1], [Streaming], [10%], [AES], [500 ms],
      [destructive], [16], [Memory mapped], [100%], [CryptoAPI], [-],
    ),
    caption: [Antivirus Resilience and Efficiency Testing Result],
  )
]

In this experiment, the crypto-ransomware program was executed across five different antivirus solutions. The evaluation metrics consisted of the number of files successfully encrypted and the program's execution time. The testing was divided into two stages: configuration testing—consisting of baseline, stealthy, and destructive configurations—and one-dimensional testing of four encryption technique categories. Further details on the three configurations used are presented in Table I.

#block[
  #set text(hyphenate: false, size: 8pt)
  #figure(
    table(
      fill: (_, y) => if y == 0 { luma(180) },
      columns: 5,
      inset: 4pt,
      align: center,
      table.header("Antivirus", "Detection Rate", "Encrypted File Count", "Avg Exec Time (ms)", "Std Dev (Pooled)"),
      [Windows Defender], [100%], [128], [18918], [280],
      [Norton], [0%], [16], [31537], [8926],
      [McAfee], [100%], [128], [17188], [97],
      [Malwarebytes], [0%], [4.42], [11606], [5057],
      [Avast], [0%], [0], [-], [-]
    ),
    caption: [Antivirus Resilience and Efficiency Testing Result],
  )
]

The summary of the encryption process effectiveness is presented in Table II. Overall, the results of the three configurations, along with variations in encryption techniques, suggest that configuration choice had little impact on antivirus performance, with outcomes being more dependent on the specific antivirus program used.

Moving on to antivirus testing, the results showed that both Windows Defender and McAfee Antivirus failed to detect the ransomware, allowing it to encrypt all files. The average execution time on McAfee (17,188 ms) was slightly faster than on Windows Defender (18,918 ms), with reasonably small standard deviations across multiple different configurations. In contrast, testing on three other antivirus products—Norton AntiVirus Plus, Malwarebytes Premium Security, and Avast Premium Security—successfully detected the ransomware.

Norton AntiVirus Plus only detected ransomware activity after 16 files had been encrypted, all of which were located in the Downloads folder. When all target files were placed in Downloads, Norton failed to detect the ransomware entirely until encryption was complete. However, when files were moved to other folders, Norton was able to block the ransomware before any encryption occurred. This suggests that Norton's detection relies less on behavioral monitoring and more on directory-specific file monitoring. It should be noted, however, that Norton allows users to manually add additional directories for protection. On average, the execution time needed for the antivirus to detect the attack is 31537 ms, which is significantly longer than other antiviruses. This happens because Norton will asks for user input to quarantine the program if it is detected as malicious. Disregarding this popup will give an average runtime at around 4 seconds.

Testing with Malwarebytes Premium Security showed that the ransomware could encrypt only 4 files before being detected, with occasional variation up to 5 or 6 files. Introducing a 5-second delay between encryptions did not alter the outcome, as Malwarebytes consistently flagged the activity after 4 files were encrypted. This indicates that Malwarebytes likely uses a rule-based approach, with a threshold number of encrypted files before classifying a process as malicious. Files that were already encrypted could not be restored, though Malwarebytes does offer a backup feature that is disabled by default.

Finally, testing on Avast Premium Security showed that the ransomware failed to execute. The program stalled after a significant delay and eventually terminated with an “Access is Denied” error. This suggests that Avast applies dynamic analysis techniques, monitoring and evaluating program behavior in real time before allowing execution to continue.
