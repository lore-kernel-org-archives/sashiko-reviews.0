Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209C3F5BE2
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563721; cv=none; b=gBo7kkiWzrQhcAUBN2Gji2IV/CQ4Hysny+7OUlefBbAdw58d+O2hjkEdryLefrCuHHio8S5LIpWF/E/ghRHv9aGMLjIm9fAwJ9SB1mwBd7A4kCoRDphPMeJy5AQkv0M8QW94mm1ivSqyoDn2t8L0Zpuou4uwLHsPBN5KXD0rzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563721; c=relaxed/simple;
	bh=uPk6FtmVWMI7jTXHIH/rPB8H7e/eCSP33+M3NBqIOF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVjJcZNShPI0PaFMXghLdtEnin51dv8I5ZA0po8swdaUOMiTaxcEfIjiEs7NhRom+OrMs2LrgZ2QOBYaSCVidbt8R4rZr6X/bCTcPlittH4ojTYSOM/ushSHH8EBwWmB8tOy/t5wJOwOhtL02HQENEexghTrJBWjjEQRuYIk4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3a6ujdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAxjMbm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3a6ujdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAxjMbm1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65471IGT1476743
	for <sashiko-reviews@lists.linux.dev>; Thu, 4 Jun 2026 09:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=; b=p3a6ujdWj/i6PMLX
	EJ4CI54NxwYkTB6FNwKcs5sxZcdjmW2pUME8VlRMWLl5zj756B/2Exc1j9xWYf5f
	/rwUvH4II0SDerry2erIY9rJgNOPkvpmVVHGCwiI5rLarZ+/dPRHfPAsdEiiqu3b
	ig6JOetF3CSgm5P6nEtyo2S44rV+QSJIB7qDRzubHGuC3hP2kZt/ZmRTP6l9crSu
	y7tXNx9eb6WcvsplETvE9KCh76Yy5Ckak9ia+LGkPazqR5p0O1gl1LvS2EJ/EV+0
	un4ip97ZLOqRYpjSLpv/pI21q2wvQkgeigd2PVtqWQ6vWybBZrRj8U8pqN06oDd1
	2zU3Mw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nuwm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 09:01:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c3315d31so6515115ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563719; x=1781168519; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=;
        b=bAxjMbm1hAc/080BX+36TRj7rNRt7RIhKXB3l9iFH0sUc/aqs/ips8aHNhLHI/nT1y
         i2Kh8uAmr+rYMPUUzFUWJcm19AglX7bf+de+Ou9gpIq00JaCPANFRExoDOWeunLb5/Pd
         qwA8b4T2B0eQM1cTnhFcK18bZJJebJPm3kNaDQUDpgcSHfHQvTGeE6vgBNNHFhYDWHak
         DXuQoGZdgnoRnIQsFER8PiasDYAskK66I5e8l0B3gMTfsct6ltjVzUp9gPeRApjgF8J2
         JZJlYUinGziG46k+8pgVTlfVvStNVSNPxd+4LUrg4uZwaL0rCnyl0Cp5w06uCE5cp7MT
         q6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563719; x=1781168519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmVGnrCXAkShVpVSqIoifGKYR2VrcsjStPpiVothuy8=;
        b=Hh05bPqFBNXqC2SxGNvKgVPJjuPUSre7tm+or5gnDZj2IA4lXBcrGdvwQn5Z70qhuZ
         Fdwn+Wi4cw8+Ugx9CQnilKyBqYNG2EEqZCGKH6VVPiHkczhTz8VyU9Up/654mH5RVKl8
         Og7jKcR9z/DI9RpNWcG/826cL9VYIqEASguSsT+fKA8Yzi1FkPeqJh7ysMf0FsV9lkFa
         nYDNYBMCdI34pH53VwXn8VBaGwcl/MqpfTKdvPUIn7KoS9/2icZGslvkKJp3bqKPCDmm
         fvV9vGORpS/pixUJK7WVjq5+txcNm8UO1KH3G8ZLUOah97cPxcjOxNh15qjWdHcgIo/l
         I6EA==
X-Gm-Message-State: AOJu0YxPPso2SGLf+owGky0miNcZE/RVVQVUEzqryS5OjYaaz0zBS86D
	Xa+ptMUZLFg8p/M2aikPnM0xO/XdojJpmSFbbPgbWoCDUGblk2H4/BfOs3nwLWSWLFJw3aR3YMA
	bQ/sbEZFyO694D+vYcU4XB66Ec5YuahfzeXb3vxStWDhZQKqaI2jUWJ8GybKo6n+BXh5MUws+0b
	78gzk=
X-Gm-Gg: Acq92OEM2Da+/MkWsJ2rK0uSslAjpdiw01ahPzous7Odd3C69XtBOQj+GrJxWtEG60h
	hg3Cv42lhuwRmDpntVfVGClOJFRhAQSp8wFU4VDgdklJPU+LvTpscdx76RrXZcLRjA0vgnoYt+O
	cSJ2ggSJB33fzhxvd3x/jruuPneTo36uVciw/kjsO7Z8bBMTZVH4L+1BbNx9GXI/2jFi0/ofOYR
	CGHrGXbSUpFN7iz6CO6jhy2KiVJ8pb4f2L4ZK15+Y8fA9fOLbwCx+ISG4zYr4wJ5vrKAc01eOHP
	apIndZ+37vZCrirQBJX961vjKI17eJyDJeXgbNuWOI5TIWG2xg8svS2lc9H728fgrjy5re4ffcv
	JQNxudkJL4MmCAwmmNcSAvo2TtlU+POc0twoSyvnv3MkaPYgydXEzHrRY2Dwbpqh3Ahp1XDR3sF
	E0
X-Received: by 2002:a17:903:41c6:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1644d1700mr75453415ad.36.1780563719033;
        Thu, 04 Jun 2026 02:01:59 -0700 (PDT)
X-Received: by 2002:a17:903:41c6:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c1644d1700mr75453015ad.36.1780563718551;
        Thu, 04 Jun 2026 02:01:58 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cd24sm66003285ad.57.2026.06.04.02.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:01:58 -0700 (PDT)
Message-ID: <af6a1de0-47f6-4ede-aacc-d5411f295e5c@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:31:55 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to
 Root Port node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260602-move_perst_to_rp-v1-2-8ee5b80316da@oss.qualcomm.com>
 <20260602165241.5D8821F00898@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602165241.5D8821F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gM5LU19qEVqT9lkAbK70sTLS-vFYc5M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NiBTYWx0ZWRfXxzr/HuaptxyQ
 cgVRg8lFd6LtzYLyLSQHl8Rnj7r1QgS2ZsNtiPZRaYvhBDkawgZd/OamkVZP5+Gx2IE8kGGGsYZ
 8de9FOmEZSFxFlyaH9manInMZkfiZ7h3mamTFUVnNyTlG8QHtd0fKPXMrzRwHIW2MpTpeLW5x7f
 vDgvg4gyFrHUUuayHmyIQeOiIqbqmEKRrHBPlRykGVs5NJ/1E94f9BoPNvn5JSh62yVz5Gk8Fw/
 4CZwh2P+oFlE9gO6mubUqifCyZnUIyY0SqSFeRuI77hB0a1kgBTPV6LXOoP2WxI9yXzIj4E1A03
 j9fv+47XH1PcTXVUYKFEesoG3+dSH54R6CHdrkBB2nHEw5OzuxSFlpgITujWc8RN3oYDEYXsF1Q
 CExnQqgQmQuwRHFlxGiqoQVUUpE9gsCo9s+MNVdSZnazdY5tOtUiX5urJ8ZDWEt+MbQzT4tCk1w
 2HlXo80kZlWIL499tNQ==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a213f07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yqHa0Pl9yY5Qe_7Dn7UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: gM5LU19qEVqT9lkAbK70sTLS-vFYc5M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040086


On 6/2/2026 10:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Legacy device trees fail to probe with -EBUSY because the 'perst' GPIO descriptor is requested twice without being released.
> --
>
> commit f286f42842ba6bb45e869489bbe2830fdd9be93c
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node
>
> This commit updates the device tree to define PHYs and the PERST#
> (reset-gpios) under the PCIe Root Port node instead of the main controller
> node. This aligns with the new binding style.
>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> index de71b72ae6dcc..be8657239c46b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>> @@ -86,8 +86,6 @@ &pcie2 {
>>   	pinctrl-0 = <&pcie2_default_state>;
>>   	pinctrl-names = "default";
>>   
>> -	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>> -
> [Severity: Critical]
> This is a pre-existing issue, but does moving these properties expose a
> probe failure on legacy device trees?

Along with this change, "phys" property also moved to Root Port node. So 
qcom_pcie_parse_legacy_binding() will not be called for this platform.

>
> When parsing a legacy DT, qcom_pcie_parse_ports() successfully requests the
> "perst" GPIO:
>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_ports() {
> ...
> 	pcie->reset = devm_gpiod_get_optional(dev, "perst",
> 					      GPIOD_OUT_HIGH);
> 	if (IS_ERR(pcie->reset))
> 		return PTR_ERR(pcie->reset);
> ...
> }
>
> But it then returns -ENODEV due to the lack of a "phys" property on the child
> node. The probe function then falls back to qcom_pcie_parse_legacy_binding(),
> which attempts to request the same "perst" GPIO again:
>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_legacy_binding() {
> ...
> 	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> 	if (IS_ERR(reset))
> 		return PTR_ERR(reset);
> ...
> }
>
> Because the first request was never released using devm_gpiod_put(), will
> the second devm_gpiod_get_optional() fail with -EBUSY and fatally abort the
> probe, breaking backwards compatibility for older platforms?

This is already fixed with[1] which is not available in linux-next yet.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-qcom&id=1a23bcb452d95f099e530414504c0d99ee076b3f

>
> [ ... ]
>
