= Preliminaries

== Ransomware

#figure(
  image("/assets/images/ransomware-lifecycle.png"),
  caption: "Ransomware Lifecycle",
)

Malwares (malicious software) are software developed to perform harmful actions, such as gaining unauthorized access to a system or stealing sensitive information. Although it is often associated with illegal or criminal activity, it is also used by ethical hackers to evaluate the security profile of an organization. Ransomware is a type of malware that blocks access to a victim's files and demands a ransom to restore access to the data @zhassulan_zhussupov_2024. In general, ransomware can be classified into two types: crypto-ransomware, which uses cryptographic algorithms to encrypt the victim's files, and locker-ransomware, which uses privilege escalation techniques to restrict the user's access to system resources. Ransomware generally follows a similar pattern, illustrated in Figure 1. Detailed explanation of these stages is outlined in the following five phases @reshmi_2021 @zakaria_abdollah_mohd_yassin_ariffin_2022.

During the infection stage, ransomware employs various techniques to infiltrate the target system. Common methods include malicious advertisements, compromised websites, social engineering, and drive-by downloads @dargahi_dehghantanha_bahrami_conti_bianchi_benedetto_2019 @javaheri_hosseinzadeh_rahmani_2018. This process may target files stored locally or remotely. Some modern ransomware variants even adopt a fileless approach, where the attack is executed without creating an executable file on storage @sudhakar_kumar_2020, making it more difficult to detect through either static or dynamic analysis.

Once executed, ransomware will either generate an encryption key locally or retrieve it remotely from a command-and-control (C&C) server. If the key is obtained from a C&C server, the connection is typically made using a static or dynamic IP address or domain name.

Ransomware that uses symmetric encryption algorithms can store the encryption key locally without contacting a C&C server. In contrast, ransomware employing asymmetric encryption will store a public key locally and must contact the C&C server to obtain the corresponding private key. Many ransomware families combine both approaches: symmetric encryption is used to encrypt important data, and asymmetric encryption is used to secure the symmetric key @zhassulan_zhussupov_2024.

== Windows

The Windows operating system is developed by Microsoft, with the latest version at the time of writing this document being Windows 11 version 24H2. Windows is the most widely used operating system for personal devices, making it the primary target for most ransomware attacks @reshmi_2021.

=== Windows OS Design

#figure(
  image("/assets/images/windows-internal-components.png"),
  caption: "Windows Internal Components",
)

The Windows operating system consists of two distinct modes: user mode and kernel mode. These two modes operate separately, managed by the processor through context switching depending on the type of code being executed. Applications that directly interact with the user run in user mode, whereas the core components of the operating system run in kernel mode @alexey_kleymenov_thabet_2022. The internal components of Windows are illustrated in Figure 2.

=== Windows API

The Win32 API (Windows API) is a collection of functions created by Microsoft for native C/C++ Windows applications that require direct access to the Windows operating system and hardware (Stevewhims). The provided APIs can be categorized into five distinct groups: access to kernel objects, sharing objects between processes, process management, inter-process communication, and memory management @silberschatz_galvin_gagne_2018. Several of these APIs are also used to abstract calls to other user-level functions.

== Cryptograhy

Cryptography is a method of concealing the contents of a message using various mathematical algorithms. This is done to prevent unauthorized parties from accessing the confidential message. The security level of a cryptographic system depends on the best-known attack methods, meaning that the security of any cryptographic system will inevitably degrade over time. Cryptographic algorithms can be divided into symmetric key cryptography, asymmetric key cryptography, digital signature, and hash functions @hoffstein_2016.

Symmetric cryptography is a type of cryptography in which both parties share a secret key, where it is used for both encryption and decryption. Meanwhile, asymmetric cryptography is a type of cryptography that uses a pair of keys: a public key and a private key. The public key can be known by anyone, while the private key is only held by its owner. A hash function is a function that takes an input of variable length and produces a fixed-length output. Hash functions are used in various scenarios, such as verifying data integrity and creating digital signatures.

In crypto-ransomware, various cryptographic algorithms are employed for multiple purposes. Symmetric and asymmetric cryptography algorithms are used to encrypt important data and to facilitate communication with the command-and-control (C2) server. These algorithms are also used to encrypt and obfuscate the ransomware's code to evade detection @zhassulan_zhussupov_2024. Hash functions are also utilized, particularly for evasion techniques, such as comparing the hash values of two variables instead of directly comparing the variables themselves.

== Malware Detection Techniques

Each security software uses different detection techniques to identify and prevent malicious programs from achieving their goals. In general, these techniques can be categorized into three types: static signature-based detection, dynamic behavior-based detection, and hybrid detection @maniriho_mahmood_chowdhury_2024.

Static signature-based detection generally relies on a database containing signatures of known malware @carlin_okane_sezer_2019. This technique works by searching for signatures of suspected malicious programs within the database. Common types of signatures include opcodes (operation codes), hash values, and information found in the executable file header, such as strings and function calls. Examples of tools used in this approach include IDA Pro, PeExplorer, Pestudio, and FileAlyzer. Because this method does not require high computational resources, many antivirus programs rely on it to block attacks early on, with service providers continuously updating their signature databases. However, this method is less effective at detecting new malware variants not yet listed in the database. Furthermore, simple evasion techniques commonly used in malware development—such as polymorphism, obfuscation, metamorphism, and packing—can easily bypass this detection method @catalano_chezzi_angelelli_tommasi_2022.

In contrast to signature-based approaches, behavior-based detection techniques are designed to identify both known malware and new, previously unseen variants (zero-day attacks). This method works by monitoring a program's behavior patterns, such as file deletion, creation, or modification, as well as changes to network configurations like IP addresses or DNS settings. Examples of tools used for this purpose include Cuckoo Sandbox, Wireshark, ProcMon, and FakeDNS. By flagging any activity that appears suspicious compared to normal conditions, this approach can detect new malware variants @abbasi_al-sahaf_mansoori_welch_2022 @li_lv_li_wang_sun_qiao_2022. While effective for identifying novel threats, it is prone to higher false positive rates and typically requires longer training times compared to static detection methods.

Hybrid detection combines the capabilities of multiple detection techniques to identify malware. For example, the AHMDS system developed by @susanto_munawar_2016 uses both signature-based and behavior-based methods for detection. Another example is the deep learning-based approach proposed by @paola_gaglio_re_morana_2018 in a cloud environment. While hybrid techniques often outperform standalone methods, they generally require more computational resources.

== Related Works

@maniriho_mahmood_chowdhury_2022 conducted a comprehensive study on malware detection and analysis techniques from a behavioral perspective, identifying various approaches including static analysis, code analysis, dynamic analysis, memory analysis, and hybrid analysis techniques. The study found that machine learning and deep learning methods have attracted significant attention from researchers due to their ability to detect both known and unknown malware.

@voronin_morozov_2021 explored the use of advanced neural networks and behavioral analysis to monitor malware behavior. Their research highlighted that analyzing a program’s behavior is challenging because there is no fixed sequence during execution, which can lead to misidentification. They also noted that malware can employ evasion techniques to avoid behavioral detection. Furthermore, identifying malware classes is difficult because different malware often use similar methods. The main contribution of their work was the application of Natural Language Processing (NLP) methods, such as word embedding and Latent Dirichlet Allocation (LDA), to analyze API call sequences. The results demonstrated the potential for identifying key behavioral features of malicious programs, which could then be used to detect other malicious software using machine learning.

@ayub_siraj_2023 conducted an in-depth analysis of ransomware behavior by examining Input/Output Request Packets (IRPs) from 383 ransomware samples spanning 21 different ransomware classes. Their findings showed that using one-class classification algorithms—such as One-Class SVM, Isolation Forests, and Local Outlier Factor (LOF)—successfully identified IRP sequences capable of detecting new ransomware variants.
