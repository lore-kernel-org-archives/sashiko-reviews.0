Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A0E44C65F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118326; cv=none; b=PWoe7aBfWNGeqMl7dqbsdrMC+swjfW8RXOdJ0eKHELfHSeBz1EzTcbdOfbM1n7olD4bQMiCmGsyr15xpUKYaoGs0X7EI6goYVeTItA8NR8HC3pfLo6f2iJqgPkxEyZhjXDuFUw+PVP0AfykStXs5qhC+RjpP5B4MV298mfRo4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118326; c=relaxed/simple;
	bh=LemhIJNoxz1ueRDJoKpSFvwPciOjqddo6VJZFndA1jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbPyrxeW5AaSG6QiOBjW2nCaoYFr8zxhuL0TTJTu9j/IToPiUpDLvTT91arBDJp7n7oSQN8ds7+ee1m2S0FLnSF45Sj/rKaVEOvIITTcYddQLAKjIYzXsCEgRXT4oBsTnROShq+/e+B7FAZ7Tne1GpP+fBHRy30UG5A5C6lmfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsfasX80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7DHgiTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsfasX80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7DHgiTk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcux63629121
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=; b=NsfasX80ru7B4YHv
	8uib49PEwXRTI90eTMTO63SWRjQ2S8oCDAkM/nu02ZMbuiaLSxvPTNCOtDZRU/dK
	c/CbVqsfRwybM3kLno79KtnrI7mlpC8kNzuaULE0BTE3cyyOcWHZODhiAHpsOikA
	YYo7tLpjhTlkKve5c6SwEJVjl5bpLWL3w+oo4T0seYs2rHQsct2C1luZ/AhMqRPj
	Yhudlp3Z2M7IgdKE/X4Ywsf9lY24zQBHB7Ty6oDQJ1blOzupdK40wl5QWkyaY5FP
	KLeqvwMrg2wLqUcaInd+R6TDgHRE/8N5g0+91SnsyWTr7x0L7o/BYfWCK86uxoyC
	FXY2Tg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kun67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:25:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccafc5e82cso25613025ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118322; x=1784723122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=;
        b=i7DHgiTk96Zh7d3CjZ9fuJdoXGR2re6yYESGvsntZ5Vn5dewnzAIs/VzIpTU4ddamF
         o+0tW3SmC35oIBa4pPuuVlGwxtKn/uBdPuQlEBM9Uk71LkPzvG4YsK+wXVmE8x9YaKlV
         LWGxmEMWhHN8Sfz3alAxzzqNlbjnH8GffkQDpUQrXXBKOp77ohkhTgJyei7xGv75Md3I
         B4OFypxnBj2w+c1uzJ7qytxm4VZkMK9P6gHAKW57YxKVULDfWHqh35FHmBb35ZmrqyTu
         H7uYvLl6hhi/gGLCfK08SCFaVXdiS4ATJdbBKot3SChpP2lx/Ad76U9L1nRqnNQkH3i4
         3XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118322; x=1784723122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwU6AfJQ14gS30JYZ/HeTNqrS6D8pmjen3Sdckg1osQ=;
        b=LDSVRg0NCFP6d3uJUiulp+xPHnT9IRnjfndgWvhenhiAHSdTYzFRKdbG9GPDW1tug6
         Fvu42GA8DDuV+hhLwBlcklWa0E0WhZajBLRhTWtlia2+k3C7/Wajd7SA9/HCL3L5ggHt
         pKWEYyAac+ZZYH982iwQOM3PLzHNKEaOD0LhClGJ1FxwO4RgibtSeh7nBj0UjPHsdMDc
         A43BJekbM9st0WAcp4Fn+iPfF4PJlG2MRogLjz/W1sbpZ/thInssm6Q7VTD2GEs0T1dM
         jhBMJJ7iKVZlPipiaouvvEE4UCpkrkIt++Ooh8zNf3ib5Syfj1nyANRIpa1Z4+rej6zn
         Gi/Q==
X-Gm-Message-State: AOJu0YyJrEowG26RKpChIThVhBXmG8cLHXoJRRHZIPabyXC8XSVB3786
	5d7Ax/W1vr7fYr3SpYxeAAal1HfJWVgDI2idhYjs1ZXT63t90TH3Akeq1ZOuqsJLLIvxh+2hesm
	CKb1iJDuOOC1nQnuc4KthjWvCBg3alGxfPKnpWg612trBBQnwYLsZAzl13GCM0FUXIXFnnJhUW1
	HF8oA=
X-Gm-Gg: AfdE7ckN2ENSkSFulzYCrW93Nx06q1r2DJ+VRkqru987JZmE6rIKBZbdlUM4weWiRBC
	dr3kjJ06JS5Ulid8ml31qAxuCpcpoqE/Dwjnv+NQuROkMeOMzwhnfCj+mbkQxl/OhNncYBq3JUh
	WM9RPx4yJ7XKSi6aKKzvkEg7HOzENRWwyatm+kyT6TK5fAIEnH3YEMTil/QyON9R1KcSicjO9VQ
	LfwzpkgMUrJzqs7DEj0klvI80Ej77Gt19ZhBIUEEzlh8VDkUS2NuKU0e2L0ZyUqiCX80ZXQhk/e
	Hob9TBgUyKzNom4NGqbkhlFgj38qJUnToMvuuglhDjmcNPBh2iv9PYMrsSWDl7c43a6hJzyXkmN
	Q3SEgZw9T3bulcM5MXY/45wKcvo6p+PCrlA4V6zmQa0mLlA==
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr165508165ad.3.1784118322497;
        Wed, 15 Jul 2026 05:25:22 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2ce9e5a3c11mr165507855ad.3.1784118321992;
        Wed, 15 Jul 2026 05:25:21 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4365b0dsm1729961c88.15.2026.07.15.05.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:25:21 -0700 (PDT)
Message-ID: <afe3c1aa-081d-4eda-ac61-5b9be10f1990@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:55:18 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
 <20260714172443.080241F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260714172443.080241F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a577c33 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yevAzQFRF-SW-JHV9rgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: MYadusEtWGDQSRUpitqrUxhG6P3IGBPq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMyBTYWx0ZWRfX08fIUPfObbhe
 Gjo3RaBCeVyS1ISq1YpGIddjiMIGa975VTz+58WVYOEwtbG6y/zkVo53sCixwYKhAbTxpSwLTp/
 JSsJcq1nCK2BONQqE2+IVUbTFw6bGIw=
X-Proofpoint-GUID: MYadusEtWGDQSRUpitqrUxhG6P3IGBPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMyBTYWx0ZWRfX5r8zYrT1VS8x
 Q9475IS23IMh217GdXyNMGIARxvJRpgFHDM9a6i2rI41X39AZjeyej1m8frL8bLnkdgIcHZ3MBB
 y7AiMhc1wWgYiI/virU8O5zvVRt1Q5ZoWOU095TC4gtI4lErCzVyvgsKD9ChjNhm5B7L0X4EINs
 zXNyxJxXM857P+tps9HS/10XxeBgC2cEugfE51wa1xfCRYT/xSMZyDY/ijaGmLad/lXuqvkPO9I
 jk9VFqDgu7O9Ou6HKm/YcR313XUc0axFIl53IkUq3N/mo4wfrUSRSwC2Q6MI+3G3uuOvPMfTwtc
 y/ZjoBYa3rJpxxdgUOkd+UTRBQFguOEjkPiR1fA2hn+DYnkp2ziK14RUIveysUnMx0RzwmqgMWv
 PYAq4oxrQExsP0vPW4yZ4ho7Wcp/QOBXAMiWn351OnqIFRTS47QrIQZbf6thCMhCjj6jSalWrFo
 fs+FxUcY366NJ6i3UWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150123



On 14-07-2026 22:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The probe function `psci_mfd_probe` ignores the return value of `devm_mfd_add_devices()` for the `psci_reboot_mode_cell` child device, violating the MFD subsystem guideline requiring probe failures to be propagated and unwound.
> --
> 
> --- Patch [9]: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell ---
> commit 73724460c58fad980d9dd8ef39b9485acffad30e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: psci-mfd: Add psci-reboot-mode child cell
> 
> This commit adds the psci-reboot-mode child cell to the psci-mfd driver.
> It retrieves the reboot-mode firmware node and registers the new cell
> using devm_mfd_add_devices if the node is present.
> 
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd8..8c6b78ac471bf 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
> 
> [ ... ]
> 
>> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
>>   	},
>>   };
>>   
>> +static const struct mfd_cell psci_reboot_mode_cell[] = {
>> +	{
>> +		.name = "psci-reboot-mode",
>> +		.named_fwnode = "reboot-mode",
>> +	},
>> +};
>> +
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
>> +	if (!fwnode)
>> +		return 0;
>> +
>> +	fwnode_handle_put(fwnode);
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret)
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>> +
>> +	return 0;
> 
> [Severity: High]
> Should this propagate the error code instead of returning 0?
> 
> The MFD subsystem guidelines specify that if a child device fails to register
> during probe, the entire probe must fail and unwind previously registered
> children. By returning 0 here, the MFD device is left in a partially
> initialized state if the psci-reboot-mode cell fails to register.

the cpu-idle-domain is a mandatory driver. We do not want to fail 
psci-mfd for any probe failures in reboot-mode probe and unwind the 
cpu-idle-domain driver. Have documented in commit text.

thanks,
Shivendra
