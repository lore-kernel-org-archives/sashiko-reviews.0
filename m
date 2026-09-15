Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5325345CC9
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480961; cv=none; b=S5MbudlfMZuqwo9O9TBZc4PajCdxBwA1hC+KhZenlXe4THh8Wx4EQYRs3PelI92aFGngNJLOzkZy8ctqYiYsvQV/Jow0umvzOW+I6xMkdo7mOPG27l2bSBzHub61Y/K9yQ+oCGtDcYH4WRRkR0nmnTgIo8Id2w/CGwGIA8f0Wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480961; c=relaxed/simple;
	bh=m1ZCIdhEkGSNduyzeC0b60Lirr9R+b9XNCmxgkDimZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re3A7ywzZESJX5bCc8FAfMOAZ3Bp6btjmjCIhhGPBaRiamdJHgGo8vyb6mTSO7a921mQpJ6PGdgil3nxzRj1/dqaBqoUYcqXsMxLO0dej6LjQvwctNuY0/r/IZ4v/Xnl9KvmLKBjvZQYf/zdV6KRZsQsOUJv2VskJUalbpJzeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJY+Hx2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKVgGa01; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJY+Hx2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKVgGa01"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Zeg3756893
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=; b=CJY+Hx2oRYr80Rhc
	KiYdvbVTWdty+PzZgmTfAa9Dh/Q/ROzCfBFAUgeAv1JBOZFxEaBRNURyRGRHZV+K
	WJ302fRmEiFE2j4h7oZSq8vHSlREXf1eZGvHncBXLCM//JPJltGROPuXMzribKt1
	Be8xgSDVhxb6AqIAsvLAufhU6qChEqDtxRzypJA6GtU5Liz8z7KLsNze6KA919OU
	5pfxXuPmiXwtYIB5ikyt7+dl/BJB7HhhFmkpsDyojJMxsbEXLi9jFLk+1AGN0uEO
	gLyPJ8IcxCYewVsLRdbZ2oZtNSos5DIU4WDcE/l9krUNTgs7qIxjnsMSU0yIYw18
	Slek4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e1775-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:02:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so10525460a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480957; x=1790085757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=VKVgGa01l0U0oj4yMkNFul7tOCPDeh4YLmwUZofU1E6LsivKYzRnqsRkw8w7UgcYN0
         CmRXkPF6jqqPKMcbCUhEfV4/kXGMIEVqfS+0RvZMQcjsQB0dktbEqibhSJnH3+lMUFWh
         WisFj3EloJDVNSC/KKKduBdIq+GOCSMmCcKznHveDUZqPOXtMbe0PZKvWCDkHFSsDpz2
         V/A6J4D1g1HJY9OWTu+uBlRmDasBH79OLbET9MTMYpIzn+u6x6AspFOAx77pK/7zkYH+
         X7TlIO6uqkAaoxL7uJTX4J8tSFOVPy3HSu+F2KY5opmld2DE7WpIIPXwr/I1X6+8/QY4
         Ylsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480957; x=1790085757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsHb5iUgXuTAwcEpDAmebqdJ/8KokXjuvf8o0kgvjyY=;
        b=ZZ74aKww+lmzGcstVEgpHYD/2RxiQEvnpS1KrskQfLRLNhcmUT96VCc9GsMaF9DOvZ
         eqMa+hZWLPzKKWqZ3ofXWegpQ7/Prcf16ZhSntsWtqanc4ztp2iCEU0Xq/2qsMa715tC
         qMDoidtbYAZ007YRPKLmrpMDOZhFbmxfCYAM4BAw2CBt5484Wujcha0N13ixYlzqtG/Z
         7x5QHozna/FeO1C+c1+FMibw3Ns97covoJjRUVFYtxh+kZuuJ1PRPGvtQLEKixL9W2Ed
         TE+HljoUgTXkzLLKX3QshjO3TArlEkaXlE+VqfI6mgiL8ubJXD+uw7Jky7YW4w5/RhdD
         P/WQ==
X-Gm-Message-State: AFuF++lfURj148tJabjuqzGS90QN3Pyd0j4B9acWH/Tvluy6bJoHI1cx
	GMB/w3cu7bnpe3ab+f8qrvsYfVRk3ZqAIN3h+C5A1wyINn4otGP6Jp4gHBdTTlFPfrHSNX7JI+N
	1vilisiRGKmxkSd21sRZBkVHoUBTSUIAHjCt/ZCaGy5t9blDjZ/sevtT4AKOJTSP5/J+nfx6Gl3
	yDo44=
X-Gm-Gg: AYBFou3vtU/yl6Z14IFxa/2e0ybPsNpWNBgBO4/WYF2T+1tH/SjWN4Us7K8bprofqv6
	DvXFsZG06f7632ejqokZNqtZyDHw2DP88AGWFN/NQZdSy9C2aiqP7N3T+XP+Ca7o709C6AyvhNW
	TVEtzRCb069uraYZVOf8q/ew4NldipjcUNkxIXTenVHh5UpZdh+BOWuSzHRyec3IM46BZbJHVom
	S131JaVlnW8nnW5Prq7HBS78IKotOriX5ulTg/jjM7j8QjaqiE+syhNNja9B+fOyhZ66KmkDiX0
	MfxZv6LNMVrXFU/82V6L21otc1w2cuLA4RpeUIICTrRpBEOLoBRgY2ft2tJpgBv9nEcSPKjaMLG
	V8d3yS5U33PZ7xn4qZ5ag0dq0eWaOj/CJ
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919277a91.12.1789480955878;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e1104906bmr1919233a91.12.1789480955433;
        Tue, 15 Sep 2026 07:02:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd561e2af6sm46699235ad.70.2026.09.15.07.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:02:34 -0700 (PDT)
Message-ID: <0f5a8bf1-9ac4-4b0e-98cc-5bd833896413@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:32:30 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 03/10] firmware: psci: Introduce command-based resets
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
        robh@kernel.org, mfd@lists.linux.dev
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-3-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260914151400.D99051F0089A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PlTHVHsxsJusbnq8p2nf4_mqfhnyniUM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfX20wa+gSpE2/O
 kpixn3epvXjcLq4gBHY5KDSVsyHR8Xm66mUWuDQChRAgx6aftDfSXIC3px0XtlcKu4VxnvYDlKq
 RHGhtQfJw20bveUq6USjpWzoFCDmaPs=
X-Proofpoint-ORIG-GUID: PlTHVHsxsJusbnq8p2nf4_mqfhnyniUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwNCBTYWx0ZWRfXyoXYtf39isCK
 k4cO4AdnAqkzvDsd/zkKENiz2WkIYgsatZjlJ9FFS8ckRMA+1oU6Ai+X88UlK4xJa84DA+c9O8a
 p5beDoSTzN90vs4T0OQirIBesTvNWkEpQhgTNd7vqjrStKqj8svoyT5kxtUKaF7YXRvm9zdpp6h
 qDnkxSt/xQhhUDUUh1huIJYP2INGJhJF9ADC1C4o3xf9O5cwkzG0EBk9sDt8/ICQRSdUYbYbtYB
 EIQ49NHzz+ozn/FrNoysS9QGlynyWUry2/dgG9G7XhEUpvbLW1EW/2Uf7HzCY0RJLUASI0dY62X
 Yb4Uxxx22QOje28AYOQFGO6oZPQ8uJvbEZcNCO6KHXpIn2roH+YvWkBWthFx/lnfopiXIFmqdgq
 ALAEz6f/QUazCCu/6VbkWk0IW2hA0Jcdb45FvMM6N5k5TWfhJB479cDoRpqoD4ciaz+j55sg+4C
 FWN39tvqB/jcQNyfYiw==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa94ffe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zKE4ULxP5i7x29BA47AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150204



On 9/14/2026 8:44 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The restart handler `psci_sys_reset()` unintentionally skips configured reset commands for standard reboots due to checking if `data` is non-NULL.
> --
> 
> commit 15791809d0deec27e24e64483b3317dacb5842a5
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> firmware: psci: Introduce command-based resets
> 
> This commit introduces a command-based reset mechanism allowing reboot-mode
> drivers to specify custom PSCI reset commands like vendor-specific
> SYSTEM_RESET2. It defaults to the existing reboot_mode flow unless a valid
> reset command is configured.
> 
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index e73bae6cb23a3..d489ba5d147ce 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
> 
> [ ... ]
> 
>> @@ -320,6 +409,30 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> 
> [ ... ]
> 
>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> +			  void *data)
>> +{
>> +	const struct psci_system_reset_cmd *cmd;
>> +
>> +	/* The function psci_handle_reboot_mode follows reboot_mode based
>> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
>> +	 *
>> +	 * The reset_cmd is configured at the reboot_notifier phase.
>> +	 * If panic() or emergency_restart() occurs between the reboot_notifier
>> +	 * and this final reset, skip command-based reset and let reboot_mode drive
>> +	 * the reset flow.
>> +	 *
>> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
>> +	 * calls to reset the device. If it returns, either the reset failed, or the
>> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
>> +	 */
>> +	cmd = smp_load_acquire(&reset_cmd);
>> +	if (data && cmd && !panic_in_progress())
>> +		psci_handle_reset_cmd(cmd);
> 
> [Severity: High]
> Will this check unintentionally skip custom reset commands during a standard
> reboot?

By design - Normal reboot with NULL command should go through regular 
reboot flow of psci_sys_reset.

> 
> When a standard userspace reboot is triggered via the reboot syscall with
> LINUX_REBOOT_CMD_RESTART, the reboot sequence ultimately calls
> kernel_restart(NULL).
> 
> This propagates down to the atomic restart notifier chain in
> do_kernel_restart(NULL), which passes a NULL command pointer to the notifier
> handlers.
> 
> In psci_sys_reset(), the data parameter receives this NULL pointer. Because
> of the check for a non-NULL data variable, the condition evaluates to false,
> causing the handler to skip psci_handle_reset_cmd(). 

Yes, do_kernel_restart(NULL) should take regular reboot flow and ignore 
any pre-set commands.

> It then incorrectly
> falls back to psci_handle_reboot_mode(), even if a valid command was
> successfully configured by a reboot-mode driver.
> 
> Is the data check acting contrary to the commit message's goal of ignoring
> reset commands during panic and emergency_restart?
> 

If the commit message is not clear, i can add a line to it, stating the 
same.

thanks,
Shivendra
