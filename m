Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667132FC037
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212263; cv=none; b=olo86LD3L0vOVVnsuaVu8rb5PakWwzIPz0hURW/02XUfG3Jj8qpfLjx5gm+frF3aMkA3GGcKQ6RRVCobjNsf4LPLZ0IYbkbtoZ4UwBRr20l2MYi5KGy+o8n+2l8vgxoD7hM+J50ChfJ48qkfq2G15nSY5JroRXOG9dKZL7CilZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212263; c=relaxed/simple;
	bh=MdhhEcrXg3G74Z44irDwxpefSRGB6k/TIOfVj6GF/eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJ1WB4qmfKJplqjhyasG6LHzZ240bXExE06DhbqS8AAmUypd0iW5xSYNAiYlB6HfIR6gCJ2pyIjS1UXijt0Yat2U8FK9hPjDF+gfLyBRKLmMvQ9bdFUb3TCins8aqPfCRRXHuXp/ARyqWu82BFUGG4+8KGOPCkABtQALPDv3O9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQNP8j4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vs6ohrZy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQNP8j4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vs6ohrZy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJjk33988145
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=; b=UQNP8j4NqPcCh9pv
	lGheiLg4OuV/RJ/j5K/KeoOOhvQIpGRT4LC6OClis1rLs+MW4sUhArqB/rNlAPG+
	FDM7RtPj0gBfb4I3VHy0pygPf4ZXzdAOadm6ZNy/50tm3CuYXqOyG9+9qO+Xa1Zg
	O5uW86+vQU4ywa2eD3Zk/a0sH88M1NtY91dvq5UsLJcl+0ICBy2zkp8oh109jVCk
	JthKockqmPNr0Gj7PX+lpcy6qAYLoTwoQgFt8VRMEb6p3TidPNZRf7KhyAr0tace
	vHjCarkh6h7b21VXylapkczZp5ffYJNE8IMhZxDV87GExewTrAU5fMEP1eX3lKcW
	I7Qy8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pjq5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:31:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso12342095ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212261; x=1784817061; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=;
        b=Vs6ohrZyKMc7tTs5QmLi7S9F6hGHAB6ObKxm3ouTF52SOTTg/Iqmwaw7D++9d3QG8l
         Nqn2x/CSXRYvhrjMCdx1LqHXFMXoiqlkY0tQCRNyLozCtsRaIVGLjrEmFIET/rRlf74n
         fLGIayL3ALhSQnXPAhmkVJDGJp7qifTIMDbiUi1AYAENxYp68G5+dlpz7VU8sNpBHYQe
         /3ZFUbMCFv1XOigTU5aA6BiNen50r8Xl9HX/L6AgC4TL9BtD5KywxcdmI1xeOqelqE7/
         AqP2GvYSA73n9pP/1NOLYwZCtccrC8YIdTHb2ehCntpla4bq7+rMfOHwl9XZbZEGAUoq
         h3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212261; x=1784817061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=;
        b=J/GDjYm2PanIx7y2zlHn4cLJ4dGWggueqQ7Lh5tdenvDN55h9SBOICMHHPtgOBUt0P
         KzZYt668KoZvf87Y7hqLaH0AzlZmjXjtYkVbPLp76PxpMT9lzVgK32w9JKJazjVr2Koz
         925uHJzqpOODIFNnvGrI9mp4XdDdamx8yK6BiV7ac2TCgAR04sCyTV/vI8QBv1dMHiGM
         yjdRNZoXhC0BDsVD1HZd4obs5q/CM9iM17tqMd1tqaUEEAwU9FKhx8ojQq4pT5mxpio4
         DGGAJiKPao3SLLZQNvjqUhF2hwiGeUwS2PwEY7O8YSnFbxSwD7JZHUAmID21jNEG4KBh
         jn8w==
X-Gm-Message-State: AOJu0YzvLnqHq07g6g2++y2VxLAkRuPT6oFLnvDnAvlG/enT8kyXu1Gq
	QW7ABpm5vXpwFgrVoyUokwKmJgpeYCecVAD1EWsNHJ/65JFL+fFsl2aTGtTCTsChhjC6caY7gPW
	YNWUuXvOo+l5Xy9rGJswEX88pReEdNGMqb9Xk+BsB6RWKfrCUU4la7+5bu3TGl2N72goUtTAOUk
	dPNxU=
X-Gm-Gg: AfdE7cn9bJQ4OzXsaZogvnX0IitoSjZM/2d6fURz/Dk/Rilav1Hqzf8UTUQwW3Hu5Pu
	sseQCYQkcMg/6nvYnf7X587bimnjxsFUETA06x2sGJ5s3pSKqFPqjt8tLln4DF+9DiVKPrHPaLK
	+Dj77jCAdf9PC85HBI9dpAwwUnSyJBq3Q2BXcIcbHQBE8Xxt92P+O4NVMDG+nADxJOgddyphXyN
	6ZsozVNL0etnmRi5xOcudmkCOUGSMpP4qeu6xcBJRxqN8lQj4rOiWnO/wRSfURYOTpPa26XYBh3
	dBpk0s+1/BaQ0fyMmA+u/AHPzJzeB3ziiaCnWSOUB+mikGOEgr3/Q9iX8dnpEi4ElUyDT5GWhni
	Li1MkU96neAumirj1KOXpcivBqBzKprva
X-Received: by 2002:a17:903:1a0c:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2cf1f280732mr27106405ad.3.1784212260549;
        Thu, 16 Jul 2026 07:31:00 -0700 (PDT)
X-Received: by 2002:a17:903:1a0c:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2cf1f280732mr27105825ad.3.1784212259862;
        Thu, 16 Jul 2026 07:30:59 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e395csm21109125ad.17.2026.07.16.07.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:30:59 -0700 (PDT)
Message-ID: <2126bf8d-6e57-4954-8ad0-6916909b78a9@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:00:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-3-monish.chunara@oss.qualcomm.com>
 <20260701083148.0F8341F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701083148.0F8341F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A3OZi6zLzj5A5SVKPLrQrd4xP5apCFrc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX0LxxrmhvBE+K
 0UpQLTj8q5Q5fDaLAFKKVLYfvj45rIu7HduBayNunuVw4jvi6PK6bMJiGY2rMDWHj+twM5nRHX0
 XkvthvWC8dof18AyQiB+CC9n+M+k8UM=
X-Proofpoint-GUID: A3OZi6zLzj5A5SVKPLrQrd4xP5apCFrc
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58eb25 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JAdZSI-3jRdRqOvazjMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX/YKhqOQ0tqSu
 XseorL00SANXNbtYP1lBO2EGkbGTRRe5ip9PRtiT0yPDYxpX5mDzq8B/WR61D4fQWsfwwrAwoYo
 6TBgGoKlH0Br8o35xFlo4jAAR8tHKj91gt2DsQJUPOVjtUhTzVOkFB0Hia2LyRCceQFrQOY+bIo
 BU/xRRttTlS6rmfLC+m9iMxMlKMQUWLqxQBj6rO4v9fSKB4mT9R6rne9c/AxnNEnB/TkLUYtH1f
 W72jnKbjxU0/jFZ6qfpIpzNkoQnYVC+ppNZjZ8gzqcClKGPyM0s8xA1FCvSekAn+ZHrfhiTM8eN
 6n56tEeiSK2lMFy9Iae80bivp8VEhFq7cJMSQ9ak/uBZhMRUS4MjCGpm7AqRIhWHNRsTKYdu84P
 MFbPKEq4dVZHEsFzm5ujeoluda23sBDYTxY559c+z6zOqIvhfDXUV3hNzRHH9BV8UD5VHWJkkVf
 ZAN6MXJUWbZPCim5E/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160149



On 7/1/2026 2:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The SD card overlay fails to remove conflicting eMMC properties (`no-sd` and `non-removable`) inherited from the base device tree, rendering the SD controller non-functional.
> - [Medium] The overlay configures 1.8V regulator states and high-speed OPPs for UHS-I, but explicitly disables 1.8V support via `no-1-8-v`, rendering the high-speed configurations unreachable.
> --
> 
> Note: The format of this review is altered to provide a free-form summary
> of the findings rather than inline quotes due to recitation restrictions.
> 
> commit 8700d2dd7b89a43576ae3f5ad283ea9e832db05a
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> 
> The monaco EVK board supports either eMMC or SD-card, but only one
> can be active at a time. This enables the SDHCI for SD Card support
> via a device tree overlay.
> 
> [Severity: High]
> In arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso, the overlay modifies
> the &sdhc_1 node by adding no-mmc and cd-gpios, but it doesn't explicitly
> delete the conflicting properties inherited from the base device tree.
> 
> Since device tree overlays merge nodes and do not implicitly overwrite
> boolean properties, does this resulting merged node contain both no-sd
> (from the base) and no-mmc (from the overlay)?
> 
> If both properties are present, will the MMC subsystem set both
> MMC_CAP2_NO_SD and MMC_CAP2_NO_MMC flags and refuse to initialize any
> card? Additionally, won't leaving the non-removable property from the
> base tree intact cause mmc_of_parse() to bypass requesting the newly
> added cd-gpios?
> 
> Should this overlay explicitly use /delete-property/ no-sd; and 
> /delete-property/ non-removable; to clear the base configuration?
> 
> [Severity: Medium]
> Also in arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso, the &sdhc_1
> node is configured with the no-1-8-v property. However, the overlay
> configures vreg_sdc with a 1.8V state (states = <1800000 1>) and sets up
> sdhc1_opp_table with opp-100000000 and opp-202000000, which correspond
> to SDR50 and SDR104 modes requiring 1.8V.
> 
> Does setting no-1-8-v force the MMC core to disable UHS capabilities and
> artificially restrict the SD card to 50MHz?
> 
> If the board genuinely supports 1.8V, should the no-1-8-v property be
> removed? Alternatively, if the board cannot support 1.8V, should the
> unused 1.8V regulator configurations and high-speed OPP additions be
> dropped to avoid contradictory configurations?
> 

ACK and addressed in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Thanks,
Monish
