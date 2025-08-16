= Introduction

The number of cyber attacks is currently experiencing a significant increase, with ransomware attacks being one of the most prevalent type due to its behaviour that offers far greater financial benefits compared to other types of malware. Furthermore, the rapid digitalization of industries worldwide, particularly as a result of the COVID-19 pandemic, has led to an increase of digital systems usage as part of these industries' daily operations @alexey_kleymenov_thabet_2022. The Asia-Pacific (APAC) region itself experienced the highest number of attacks, accounting for 34% of all attacks worldwide in 2024 @ibm_2024.

Ransomware does not exclusively target large corporations directly, but can also originate from individual endpoint users. Several ransomware variants are specifically designed to exploit vulnerabilities in personal devices, as the weakest security link is often the individual user. Corporate ransomware incidents that infiltrate networks through endpoint users such as desktop devices are not uncommon. Once ransomware compromises a personal device, some variants are capable of performing lateral movement to target higher-value assets, such as corporate servers @maurya_kumar_agrawal_khan_2018.

According to @amr_2024, in the year 2024, 303,298 users were affected by ransomware, including 98,203 from corporate environments and 14,517 from small and medium-sized enterprises. If such attacks successfully penetrate a system, they can result in substantial losses. @ibm_2025 reports that the average cost of a data breach in 2025 reached USD 4.44 million per incident. This highlights the severe financial impact that ransomware attacks can inflict on organizations across various sectors, which makes desktop endpoints one of the most critical link that must be secured.

This motivates the central question of this paper, which is: how effective and resilient are antivirus programs in dealing with a zero-day crypto-ransomware attack?

To answer this, we propose simulating zero-day crypto-ransomware attacks on personal devices to assess the detection and mitigation capabilities of various antivirus solutions. This is achieved by developing a crypto-ransomware that realistically replicates malicious behavior within a controlled environment, enabling a thorough evaluation of how different antivirus products identify and neutralize previously unknown (zero-day) threats. The proposed crypto-ransomware incorporates a range of data encryption techniques to support this evaluation.

In this study, the development of ransomware is limited to its crypto-ransomware component. The overall testing process is conducted under the assumption that the initial access and execution phase happens through social engineering techniques, therefore it is regarded to be beyond the scope of this research. All testing is carried out on the Windows 11 Pro operating system.

The structure of this paper is organized as follows.

Chapter II presents the theoretical foundations relevant to this research, which discusses the concept of ransomware along with the typical stages of an attack, the architecture of the Windows operating system and how malicious programs utilize the Windows API, the fundamental principles of cryptography including the types of algorithms commonly employed, as well as malware analysis techniques, which consist of static analysis, dynamic analysis, and hybrid analysis.

Chapter III introduces the proposed solution, which involves the development of a crypto-ransomware employing various combinations of data encryption techniques to evaluate the resilience of antivirus programs.

Chapter IV explains the experimental design, which includes the configuration of the testing environment and the setup of the virtual machines used to run the experiments. This chapter also describes the controlled execution of the developed crypto-ransomware, the procedures for monitoring system behavior, and the steps taken to ensure reproducibility and safety during testing.

Chapter V introduces the evaluation metrics and presents the test results, followed by an analysis of the findings. This analysis focuses on the effectiveness and resilience of each antivirus program against ransomware attacks, as well as the impact of different data encryption techniques.

Chapter VI concludes this paper by summarizing the key research findings and offering recommendations for future work in the field of cybersecurity, particularly in improving the effectiveness of detection and mitigation strategies against emerging ransomware variants.
