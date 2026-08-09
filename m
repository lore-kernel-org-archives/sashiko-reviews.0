Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D622F12CE
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278445; cv=none; b=n6uFpvapN0LCOx7fhS1R4U0RPj4nbeHhO59NCoxHhhQLg9nonUT0+2n1sAH02+1WA5WymMS8rOBpvPAIMqWWbV9Tc2jqh1skvV0xAORXi7gBgLmCWIQ0T2zQNvmE6LzSPn1YhwX5RJ99/n9Sg1rV7Q9GIJM2Mcki+TOaHM60LxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278445; c=relaxed/simple;
	bh=Y7fgl7Rf8At7zMZoDfYsNFsxXJnIgKZYtPdNKvusOrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpM1NRtTscm3Imok1vnsPtZilNPrWRMiNo8zxSprnO+6EsNGI75xvJc1B2xHEhor0+efzrbls4qp6pyvV2p6T0E2KHD0UjkRfYforgcqkVT7v9VDzQFVZ85GPC/GNktplpGL4xAYAMIoT/PtyG+aeDPxBJh6zeE+g8bE1SjVlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jr3QDrwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5a8owrN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jr3QDrwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5a8owrN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1NM23838385
	for <sashiko-reviews@lists.linux.dev>; Sun, 9 Aug 2026 12:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=; b=jr3QDrwFw8K+BBNI
	YMSmBfgh7ZiV6UnwESJ7sKgRyLCCnadqXaI/xvRUwqYCSZqu0vANzJaCzq2WeMWH
	FBygX94Zb6e1HderXEuOPljnp7nZN93V42f0NKXdpyU71fcxzvTFgVmt2vmwggM9
	ZXx3RCheR2N4WRF75ETFFtb3Z0AQUuM/daQZw5dNdOGNL0q34VkyA6Ow63n6e6tY
	+whnyaQ8ZhfOHuh9Cwp8cFDZ9d6GSUFbOhdng5DqSNS03VRH8TO7KFDYVbcvN3uv
	elkklqJjcPuDZmyNnYJ2BHYiOa4MuS35j8lyNMDkXjRDsb/qUgP96S50SNYTH6xN
	BNYe0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gk2qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 12:27:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso16246925ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278443; x=1786883243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=;
        b=Z5a8owrNZY/vwq+ubG67avADVF81hbmR8vChnYV26d5lplXrNUeiYLX1kqMsBlfV17
         ypcSzUxuvA5SqnO1Kq6WHZLFud6J1M17gUAH6Jnw2HZwAPLP5eZORKskXJlVAZ/Quo3W
         EmjwL5HTIO5zaeXshzmVOKnE2GPx9AmzzazqPVqxbxucB5bci/9emjtjRUKRZjTtfn+J
         nDbqEY+iF/2MBnTSvSEmkinFc9obwrkUVVnyFuFsQSKJb++eOvy7njSDkmx8jkvCu+vC
         U4XdhvLey9oEFSWVlp8woZ1FE3CQqJr6fJAmVyvuaxvpN+j2np8DpUHPhwNBG4slmOsX
         dC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278443; x=1786883243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lr2wlWEu7ytvAfSPRDTq9nfH4lSgYTuGaNzTWqrbUQQ=;
        b=hFxVCGOCNgzoZMGGYSjwLiyYLk0w5i1OMz+xtKkcnRsb6GShTbkSBEMC71JbfheQGt
         4YDteEP6B+yyWE/iLbGKhNzl7mKQkHmOBu4Ygn/ZegdlHrmEY/wfNfuZzH7DAK9xGgBv
         vIHH+C8fl5HSbjDFt+AqMhu97ibEh0H3v8+gqy/18kXHSLuIveUPuArDFeSwxN5oXbbI
         3qXJSM8TDr4lKV+qj8H3iyx+CYYpcATOamAud4fFQ8IJUNuRbL3P3d3gNoqfi1n7GTPC
         FUKDQ8FWPAlZzFYroEpyeSunXcGwUz6OsB919FKXNamHZnhQbSpxkeUETttizwGL9910
         cu8A==
X-Gm-Message-State: AOJu0YylU8PSjb/wonE97dH7Ulh+aaqEdgyaOKb6BfDL5+ureRCn/WBC
	pd7YXgLIKznGH+Rd+IIIr2rivbqGCHqREPRaRvCR9OggWfyKHuTlKKelLOqYj8gRtBjzCm64QM2
	BHaPdaJoMBQXjI3Ll7yD+KRPYSsBYIwTlMDfKFK0j2axOrFS4H9gPytDPK6wihi5xqkXdee1gI3
	ANl7A=
X-Gm-Gg: AR+sD1139idB84Uy2ZBgu1Rj/EMPZmmR3Pk/FClxqaoXN7ryW464waXLL+cb4iDhm+Y
	wC1YR/ZG3EEXVHraYfn1jCJxlnPjluxk3N/A2isZcvM2iAebonDhlRG2yL2GvQabf5MQMjUUO4z
	iOtHU712Kwjcq2PlpvATaMhTzhY+c5Z1RF3DnW2tWbrHNZYC1+BxufAWdt34RnuUkZDuoN+e/CD
	7yCQyTlngr5hZFI67y86RR/A0XNmyccAslzaSOf4Ogpeqv2h/sTiuZhubJGayCErMBSLLWAt4cI
	QA4+5dcloi5VqfPzYG6fxbWtBDaa/sSdbXEPjXfjZtTyKlwNfao863PDAcIiMSXlYYfzoqCKlf3
	0vCXr3zOTZlIzjE9tRKC5pWtDVFpJIhKRjyw=
X-Received: by 2002:a17:903:38cc:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d106a1a369mr289979455ad.1.1786278442890;
        Sun, 09 Aug 2026 05:27:22 -0700 (PDT)
X-Received: by 2002:a17:903:38cc:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d106a1a369mr289979025ad.1.1786278442406;
        Sun, 09 Aug 2026 05:27:22 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86f98esm30793197eec.6.2026.08.09.05.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:27:21 -0700 (PDT)
Message-ID: <e88326f0-e945-4d63-b257-308cb00df756@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 17:57:18 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-3-prasad.kumpatla@oss.qualcomm.com>
 <20260808184539.3C6601F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808184539.3C6601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a78722b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=c80W3Nm1xlcA-_PN7B4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX9CPB3F6tHM3P
 0Fy1TBWcFQCZsJLNJ9Tql+j9iyltMJ9Iv5jezlkF0BlAvgaW2/bFv0cLOStC1uDqOdc8LB9Dp1W
 uKXBubrvSnOdnK2tEaAuDukHNlpQfpM=
X-Proofpoint-ORIG-GUID: 9OzZvVSCTJXNTCRraPK2_-EzwShoaSwI
X-Proofpoint-GUID: 9OzZvVSCTJXNTCRraPK2_-EzwShoaSwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfXy7ybLjFvRLqF
 S0/YOwb/5IkZ/Dz1zM2LQcMsLYvydjDDMYpgTq8dIcx2M3gkfV5ybO51rAfHvsxUWuB9EydE+zk
 ZuZeWqviYoWMfGExN46Kvj12tn/L9tUP7SRyuXiUlcXsS000PpwuvYNyIQ+9DUWEN7c1IhJBWP1
 t7Uxm4PuYQE0COZV/g19JhfQAR+Hd5KeHQGxXkeZxKvyJzei1eLxQ8GGZKjT7ccfA+1UUeH6EAF
 ZK+JzWjBMmXcj0U8LqRnSI+2pgXFFhjgK3Dp/yFEWJUGeGT8s8gtAQo1Dc+g0vtaoHJbSmYciCF
 MtlhLLRJjSTyJoLNUpLt8QUv3PtSOx4U6ACzKxQzrx9RxgYz6zvnPquMjx8uoGKf6dNbOgq0/EB
 lUK4fMKNj37st8CYJ6dA51NTfbELy/3x5nx6STTQGtHtNqzGOFj24712cALrBF9SIkp5crYE9by
 Ldwx0r7ZktK2h9DNqbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110


On 8/9/2026 12:15 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch series breaks `git bisect` by splitting a macro rename across commits without retaining aliases, causing an intermediate build failure.
> --
>
> --- Patch [2]: [PATCH v1 2/5] ASoC: qcom: q6prm: Fix QAIF clock ID typo ---
> commit 2d0653a87462572279fa5b7912ec981aed567a40
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: qcom: q6prm: Fix QAIF clock ID typo
>
> The Audio IF QAIF clock IDs were introduced with a "LAPSS" prefix instead
> of "LPASS". This commit renames the definitions and updates their users
> accordingly.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> index f613e2aee75e6..b4f9abbe02cb0 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> @@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>>   	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
>> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
> [Severity: Low]
> Does this patch series break git bisect by splitting a macro rename across
> commits?
>
> While this regression is fixed in this commit, it appears the preceding
> dt-bindings commit removes LAPSS_CLK_ID_QAIF_IF0_IBIT and related macros
> from include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.
>
> Because q6prm_clks still references those removed macros at the preceding
> dt-bindings commit, it causes an intermediate build failure when compiling
> the kernel at that point.
>
> Should the dt-bindings commit temporarily retain the old misspelled macros as
> aliases until the driver is migrated, or should these changes be squashed?

Hi Sashiko,

Thanks for reviewing.

The series remains bisectable as the renamed clock IDs are not
referenced by any in-tree users before the corresponding Q6PRM updates.
Therefore, i think aliases or squashing the changes are not required.

Thanks,
Prasad

>
>> -	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
> [ ... ]
>
