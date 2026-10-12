Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23D1E8332
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792687; cv=none; b=qq8UnXyBlvHHk53Fe8d0C7EgA0ijPPSY0inti4CnreI/JaDaaPxWVPneysUaLG6uoe1KSykwF0E0RmdaJc+mqCD59lIZwAbEXJOyJm7TnSyabEC77W1oAG92AKc/w9Vpx4B/UYdeZ0qPRlmbvBuYSpeUorhnJ3nhTRzBHcmJPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792687; c=relaxed/simple;
	bh=jW9DgEryKOln5zmCem85gMK6wwxZlbIDKdqO5U60gmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pD7F3V8KDtGc+uPPstz37fijjGhBWvR67Cspmoo+U2dH0WcJvuL/YvukQWaNymHTMF3X8s11Wjjkn/mcJ4a1zCCOjZdKK8D25Go6uZ5nUXOC5Goy6fQHz1cMkLqIebKRvb62v+Iv61YaFPciGK76OYAegJhLeY15bfJMNT3vrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCRau5XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsD89tK/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCRau5XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsD89tK/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PXms1786966
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=; b=XCRau5XUe7UTWjmu
	alwQbGyvSWVhDQHkPFjQo00rBL5omZziZ4L0IeNNrEEmPzoQDizFpeItwt3jUUOg
	JVaEB4pCL4kQtw4jqQ2H/8iVdIp9Tb8vqIb3GwpdW6F9rPAMici8IfhVENVsZQP4
	iHSKh9KofwUb3tPtTr4pSfHqALJQiS/3OVrX8EdC0pZnLXAUTuUU7uu/qI33BAmh
	awZI5giaKjpyBr0QtM8wpCt4IutQjpnsZDcAVF9JCe/BLIFOC8HNCmFFLyPBzCNX
	Oy3H8m+HXYVDUdLfFn8uYJTEiUOLDWQYd+QbUqmghoVt7txwscXNBg6KTTw2YU93
	YuI0zQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rph4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:11:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1615020a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792684; x=1792397484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=;
        b=dsD89tK/nkc8Ac4294vKpg1yDd3FyI6XlnHW4qTQGjiW/tUniyKSh3eN9k2a2dO2kH
         zG9oXWZTMFEnI2QfKIqHOPcGkdc/lgNDF/s1AsGnKVsVcjWc4kA/YDwzzjMutl3hCdQE
         eFWymiSa5M4sK5FTTaZ4fElCmwLXptyCNpGZgH2SMEaJFCgul605557YW6RHaD/BZ3YN
         Mry7pl40KBJgfQUl4VNn3LT9PFbZcfylsLvL2iMLPFYyVaemlcIaZul6JJqvsc8PlYR4
         ytver05FqmbisCAOjpSAWI4FS3GDFacCP0iSDbNd7gAdieux0ipiFjsZcWDbo5CSQxo6
         jCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792684; x=1792397484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hca6gRjmlZ1Oqo6fJ0KrK0zMcVO4xzz9HK6VBcQrJeY=;
        b=cltuMLxTgsvmCEzjSd0SJvp+BeUQJOT1AtO3hGPi5wXvtVphu12thfeMRQhDwr87pJ
         3FbZ0of47cd2xA0Tcxp/R3HvEhF2UkxE8BSE06ZBYUZ7X7ler3as9VXWct8DNMgFXseE
         SB4xRpgfS27SbAfj3dyp6vn2oX+Zq7ComUYuPjNpwTt8bs/IhM4Pauq8pvMdfy1zkwM5
         ahnitTUZevUs7FXP74p/iUXdDNGyOzBxoHVVwxI3fvsCaItdDf1uXm4dUxOUusoTclnq
         XsqNZockGbwwJdFX5Q9KTTClB4hzDlG8/dlNkesJEY9NVOGp+QO46e320Yzidktbizoo
         cH2A==
X-Gm-Message-State: AFq9FYLgEBG3kezIdX+9r1z6wiZyC9UHFubFiTWHdkPZFtlhme5FQYcG
	ls14lWJwS8AdZ9FsucNSJwIAgwKzkqOfCOizr+JnUwBp+GQlIr/JHfUZUfkhViPt9w18mMFZTQl
	WMaUTudgqNNfDU5y/JKvrQstaRoxBAWv+Ac4z5J2miwKB3yrhDWu+GY1/vazxHbzkH7+XbH+iAp
	cd75w=
X-Gm-Gg: AYBFou1VmMGrF+bGmjlvro9fn/XlTAOpi55PQ0TaWmWXjuQt3nfJg6+CyFdjeJy/eQ6
	9PIrQh3FK+XaUmLjQqnIw7Wj/6h4f5W5Z6VwpSaSdodwQdBsvZBjGPOQvdLOYPObmB9oYW0rmm6
	dImNor01tZv6eBeq8v9cXgqsuISCrJJvvNuvlgkNnHZRM06XcxJbxPB4H0H1H5BZNCSnhueyhNO
	1VoIsMQnIpcF2OhsuP+SuMW5V+1MGgnYEzYyXChNvIOIfjeOH0KUDD5WAg7GgLaPZD5IdlmDY+A
	SJwDVt8f26Yu80nzCecxAL5x1vkvNhPw+4EiUq5Rm0b0oj0/ZJo/Y5dSD2AwwaowVMfDkzmPSI9
	WXqPh7ChMBLRF9y3PHigW5wW60aI=
X-Received: by 2002:a17:90b:3d48:b0:3ab:22db:1c0c with SMTP id 98e67ed59e1d1-3ab3a7a1531mr7404336a91.31.1791792684185;
        Mon, 12 Oct 2026 01:11:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:3ab:22db:1c0c with SMTP id 98e67ed59e1d1-3ab3a7a1531mr7404316a91.31.1791792683627;
        Mon, 12 Oct 2026 01:11:23 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dc37c2c1sm2903194a12.6.2026.10.12.01.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:11:23 -0700 (PDT)
Message-ID: <0421269d-1e38-401c-b735-4304d3daeb06@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:11:20 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: maili: Add base MTP board
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-5-965688646c4b@oss.qualcomm.com>
 <20260930064017.E5FE61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260930064017.E5FE61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gwjOD9kxkI4NN9C_n-IaucHBUlTXlL3S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX6vSldcsxyWpc
 QzHM0kH9cdhSeTYLwGkCfkyeUBoPm71YqnoaGOZhofKWvBh04xGQK5A4bO/8nBB3ScWjJwyhOPA
 M2tuw4rzB/ZeWa8pugIbwger70p2EVc=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc962d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EdlM0BD0ab1hFOwXSe0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: gwjOD9kxkI4NN9C_n-IaucHBUlTXlL3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMiBTYWx0ZWRfX/2+FFbRiJrH1
 Vtf4fMMW8FTDTdWZlUssvCsRypu2Rrk1dQ6cbV7xdXM+yaWdkzQtfuOrGhlqCRl2NKe9q9d9xAT
 B/Ffjjo/df/5Cvakgu0Qh476ofZpD0dgmJKRrQvfBkLFWCBRqPJn6dW3J31YYd7NmOuGgWNiSAT
 oaa/+PuRro7FeAoQXc/8cboJlBIhNTUOcMnHeoLjbT4ydgEQFhUrbdL1XCaMdOi2AkXkS4Y6B61
 KIPE2smRXWhjhx3gIh4DCfaWERg3hBaBANUz74JHc5I+RxpKJF5kHbY5ERCUkM51Gar2jiJGOy8
 gfPyWR6EyrlKYlyV0ZBoF5MQkzaFcrrFkWCMO8mBkG1oJAG8yERfmVIh0MvMKTgVL9Ev7UASUcB
 C5Ll3XSjVGB59WScZv11X3JfM5CnWFvB2X2qwGGiPTuYROgPyurvHdjoisct8LcnIOxD/AcyAIw
 SvZVnKBpVTIpcrDa/Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120032



On 9/30/2026 2:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: qcom: maili: Swapped vdda-phy and vdda-pll supplies for usb_dp_qmpphy
> --
> 
> commit 52dffe9df955d99886bd7c5b77879c715dff5003
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: maili: Add base MTP board
> 
> This commit adds initial device tree support for the Qualcomm Maili MTP board.
> It enables booting to shell with UART console and configures features such as
> UFS, remoteprocs, USB, PCIe, SD Card, and PMICs.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> new file mode 100644
>> index 0000000000000..1fdc91e03271c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> 
> [ ... ]
> 
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3g_1p2>;
>> +	vdda-pll-supply = <&vreg_l3i_0p9>;
> 
> [Severity: High]
> Are the regulator assignments for vdda-phy-supply and vdda-pll-supply inverted
> here?
> 
> The vdda-phy-supply is assigned a 1.2V regulator (vreg_l3g_1p2), and the
> vdda-pll-supply is assigned a 0.9V regulator (vreg_l3i_0p9). Providing 1.2V
> to the core PHY logic might cause over-voltage hardware stress or damage.
> Conversely, providing 0.9V to the PLL could result in an under-voltage
> condition that prevents the PLL from locking during initialization.
> 
> Could you confirm if these regulators should be swapped to supply 0.9V to the
> PHY and 1.2V to the PLL?
> 

will fix

>> +
>> +	status = "okay";
>> +};
> 
> [ ... ]
> 

