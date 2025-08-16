= Conclusion and Future Works

The configuration of different data encryption techniques did not directly affect the detection capability of the antivirus programs; instead, the results depended more on the type of antivirus being used. The effectiveness of the ransomware's data encryption process varied across antivirus programs. The crypto-ransomware successfully encrypted all files without being detected at all by Windows Defender and McAfee Antivirus. In the case of Norton AntiVirus Plus, the ransomware was able to encrypt files located in directories not being monitored, indicating that Norton AntiVirus Plus primarily relies on file monitoring. Meanwhile, on Malwarebytes Premium Security, the ransomware managed to encrypt 4-6 files before being detected, suggesting that Malwarebytes Premium Security employs a rule-based detection approach. Finally, the ransomware could not be executed on Avast Premium Security, as the program was flagged as malicious before execution, indicating that Avast Premium Security uses a dynamic detection technique.

Based on the findings above, the following suggestions are proposed for future research:

+ Evaluate other encryption algorithms, such as ChaCha20 or the Tiny Encryption Algorithm (TEA), to compare their ability to evade detection and their efficiency in terms of execution time.

+ Investigate alternative file access methods, such as asynchronous I/O, to see whether they can improve the performance of the encryption process.

+ Replicate the experiments on hardware with limited resources to assess how antivirus programs perform in lower-capacity system environments.
