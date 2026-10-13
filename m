Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A64052D1
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884638; cv=none; b=pkrJT/tMMdz7vLKoKGt6iOOjnHO/z48RpG8jqWTvaO+qptKp7xs+soeghInR/8vW1fxrLzx/UF17EZRzQ6Qxi4hPkw6iJaWEMQNz5o0tVfvbHC5cR28O99bHfgvAthTlkpPr+KgPbaRSuTRxURlVZfKRXiKf6y5jz5jWAaipOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884638; c=relaxed/simple;
	bh=TOkaBPJGZ6k+RpuWd1YHXgbXIAitOqBX0ASIhXLKUoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKGvzAFZJ+UBY1CL2QjCD1EOaet412zcj9mg1zfrx8j8RuVP9+Bil/R6xxAyI1wci/30AJ2tKRDy80xqQTyXTtizyq+Y9KM3rgUpzmsWQ75Gteb9zAuLCpl/n/dlMysywNvFetdKFQbWwzCHZ4mKNhp7lY3Otbkk2GV1zIoO3W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYf02b0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7uN8Jn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYf02b0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7uN8Jn4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Ur0T922843
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=; b=OYf02b0b2CIiu0ST
	cx1kIbIH4y6BaLlVOWaTCLSQ37e1A9VMz/JDYK764JeIDdT31OXJ6i9GztVVNVxV
	ZY2P01e8CfVlCWuUfxAfZCfHTILKVnAeT2JYgLDJKvgswfwjC7Q58jhdt+7ZxEj8
	LkmY7DFj/YEbH1Mcvb+BRZvOJ8wkJtr9Pu0VMDVhcsjoRfZ2jSpMAo46zDLz6TQ3
	dXt4T27WzpNWAund1pVdhDpcyzke4fCAKdvN0JzeSP3AQkMaAca7Glffs2nj0Oos
	/JMR9VgZGQu0aKxaLLDLGdLKp6xxjkotenlliDdaU+Qzzk3oTGWWK8Gj/6P02JG+
	EFGE0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t8yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:43:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so1256323eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884636; x=1792489436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=;
        b=G7uN8Jn4xDLD1Yp+DrzAhip6CCvN85SIMep0XnYDQtOoSdUpWOSjBAjg58cLMeLHZE
         UP/Zo1qltxcQDEM+URBxzgN77PgH2fyDVS5v2/OqPxryxckMidtkri1U+x2jdOGHuvZw
         ioNb2Xcra3P30xMqP2mdSgE22ybCGbojLsZNL84wgAuC7uIpUCHxMYKut0Jc3liyV3Dg
         ZeaE8d2rbw/kfT3lsSDdWLtr868sR0KN/l/zRSFkkotQRaRdMOfcuwn7Ik35TcFnrREJ
         uoUMVw2cZ7zrDhlKhfLIbyGpjZOoqiVKrkOUVouEIsf4BzBL7BW52e+JyxmoIkX8AsT6
         d9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884636; x=1792489436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8ADsXAYZc4S4FkFK5wXmP+eCYJ+8svqK7ktd+hCbCU=;
        b=GDSPkG5NYa8v1q3pe1J1Zhp7FwhbOk1jGxz0PSYZskAb6MtUFlqZAvRc6ivyQrUZRO
         LVBZ5VUHiyfgjgnXDElyRkLazrRdsrD+leGFf9zhjZ9M8YIy3kXhyN8ndPAg67wDLHzI
         j0Efp5KW5TJoae8F5fxatkfu/7XHB5v9QeH8D2k7/sFvlg0OZABGuQVhCgQ00B3byZXa
         YranPRh1BujoZSXXq0vCJTJGbsd6v82YvUnB7Bt9HhCI+3VjZ9ph7d24T1p5PBPq7wPX
         l5Tm8sBLqqzMO3OsP7Iqq0+gGrKqd/3lM1sOvnq4iDkWpnJ+ckbzV/2M1Nh0BmoOWAYj
         D/dQ==
X-Gm-Message-State: AFq9FYIBPmQjtyE3Mh1mcgLR5AiX7AQCoC32c8kboai1Ou12pOWkATI3
	OME8UEc1NQk9c4mBRlXDWWcnxDSg1KFSNUv6jLFckiDTTFnzVA9nHT/VEtgP3/OMet/N7xicgkK
	BBByPH3j1aQB6WsRSp+zARzXiHf4dis046gV9qae4YR20V0uzxQedTSaZXbw36FSBB0XC3xdUAN
	gOr3U=
X-Gm-Gg: AYBFou3RJPVhwPlQ5EryDhGZJ0sKQOjJBlgWkF+3Ig5iFVKp5GdQ9lccXOo4Q/PsF20
	N2qNjiiK6XqokMPqtHIQ+WbHAF3oeux8Cf31P1Tsc1RdL8MGSjfptnCyLmFG74gcutcmuXva3W7
	cRPR1YXHo3MG4OiyIngPmI4Qzu6t+GJQdrtRq6ZksqKO6XKOes3TzhsuFNZAF4NVsRi0AXTisY5
	BZUNVCpEpvEoi50o8Dr2yN4JYPe7TPGKuorUhGAj9oia+1CtmVbtUVccUK8+TKqOFaXt8LCHprq
	lPkYGW8EbQ2INX5Ekj/UPKZXO9yc+9BvoJRn35rkgL/lpp6o0S+hcPHsBvifhSRROkxv3fj769c
	6OkFQq8t1NAEDrC61TA+kRfLh/X49
X-Received: by 2002:a05:7300:fe4a:b0:35c:11e2:cf11 with SMTP id 5a478bee46e88-35c11e2d21dmr3178253eec.2.1791884635928;
        Tue, 13 Oct 2026 02:43:55 -0700 (PDT)
X-Received: by 2002:a05:7300:fe4a:b0:35c:11e2:cf11 with SMTP id 5a478bee46e88-35c11e2d21dmr3178220eec.2.1791884635245;
        Tue, 13 Oct 2026 02:43:55 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm39101861eec.6.2026.10.13.02.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:43:54 -0700 (PDT)
Message-ID: <14bbea09-81b8-4fec-ba3c-5c87bc78aa15@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:13:52 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-4-258ba9612da8@oss.qualcomm.com>
 <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261001130511.C511F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdfd5c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=zSlhVJGgIM5b3PJuKxcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KPF3_N_VbTyUW_Eu_skNnL_4LBYyyykb
X-Proofpoint-ORIG-GUID: KPF3_N_VbTyUW_Eu_skNnL_4LBYyyykb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfXxLxRSfbV1RHo
 qYT8fI4Eo54SoBnLvFRiW+csLfj+KNio7H8t8rPrxbYuNl5IDzGOOIwPoXa/RInl6FO+QyzWAQO
 ulBnLvcqCFwtTwrSVhCZeemseAsk8L0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX3MXOzfNvcEtO
 cFpKrV1P8mdv0M9vOEK58Qsx2aZsK9ggnpTtltCizV1GQC4sr2RKf1lKazdNRAnGwUlMMhsq8L5
 iYfutft5v7ONM8qHZIrzCysmrTEF6NmLcWSDENXl8B3MIZHgTb9sKnwDGuPPD9iIpPfZ4Yeiqax
 A1JGxhpshLzfKYK0kkbVImhNIdKXWxixHBmwhPrXBBSXgfiNub9zvimyjy12i+BaImHuSNIIPC/
 bSLcrgFuMBcEVHoYXKPJZmWCoX78AVM6Ur80O2PXwj70fcd4DkcizRqZqMO00EULebTMOZNnzaR
 H0q5cOO+ho4Bf/W3OogqiWkxqsuZyRs83XgS0YtffNaXmCex264Bf0NZnxan3nlelBx9fTY3864
 yzXpVgl9eMkDv/o4Xw8FLMTe+9TaxZxB/FHfg2agaJ3VoLgIfUjQZ4NCaAR5PXNKy5Z5TLs6h1N
 AFbCpMNTG18I5F7rNBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

On 10/1/2026 6:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] regulator: qcom-rpmh: Use-After-Free due to devres LIFO ordering
> - [High] regulator: qcom-rpmh: Data race in worker thread bypassing regulator_lock
> - [High] regulator: qcom-rpmh: NULL pointer dereference if delayed disable fires before init completes
> - [Medium] regulator: qcom-rpmh: State desynchronization on driver removal drops pending disable
> --
> 

All the issues mentioned here seem genuine, I'll make fixes for them
in the next version of this series.

Thanks,
Jishnu

