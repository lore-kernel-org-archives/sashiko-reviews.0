Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C268380FD3
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351964; cv=none; b=K6js6a9kzympv4GIwFUGDI5Rqf1XN6ABaDu1IeIvkXkE/ojdgBmxtEKkIGuPuVEjUxSyB5DFW49N7MklTxkwjJJ/KsschIevxBHn7oQeKEt+mLF/2kQCyDex1exYUdXcosVNO5UCLCdbWiq+u6YJ1j+7Io1Xvdj6vfxK7o2KSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351964; c=relaxed/simple;
	bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYD/QFwYwBRoltTOwcSs+sCcjhTSeC9RBIjTRV6GFr0ZBmCm0UzjlGhgi0ZTlUQ2lrD4kBEJ6ca1OyScWxBoVIL0y1n9i39X7Wc/MLtl2rPczVlCU86EH8s6zyv/IR1tNyCsRNfAYvTtTIMg3mI71deMWlgWntfGeh2IJAt2LKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INEcnOlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qv7pluBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INEcnOlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qv7pluBi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFKEE901129
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 15:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=; b=INEcnOlVF3jXbCaa
	O2J/03KnaQ8Sv3yDn9EyDudqogZRB+L4VS8I9REjx5edDyxi9gCIjT2dfNJMkSy4
	NuRg3MuKjbTDKV2GCzts/KMEz9xjRipIVzPeN2/kJojWykHTrGhiDgom5Qkfieg0
	L8e/Viu3qdZ8rwC3rMEBvR7jfixkCgxTXLwdFVZO+VtqqCDTHCqlVhHMc/uhhYmz
	KBPhNDx96nPdqkSNR3Zu+7Q4LkBoxF4nYmIcCoyzDU/RW6e+iYXfgCUceIARBBu9
	60R3yhtxQQ++El+5biDoulHJgLT/jxaUV6LjklJXWG9GbS8ujGei9IfZTwzkYOez
	h6dsTQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j4wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 15:32:42 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448bb8bcf38so2533882fac.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783351962; x=1783956762; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
        b=Qv7pluBiT0bGXoLQrke/NrezOB7TXiwQ21CwDl3XPbxKt0WOH8u7/6r6ERH9BvPDln
         z1OfhPYlyxfaPMdxlLGLTTSLuEMU6TRyM5gqw9kEsFPhgx0U65RqU5254F/qdFAfCvbN
         8nWsn9Ja6gfrpBvJPkT3oh6aV2waKRANGbwWYhlBpgSFR4A0Csb8ddGoI+O6jBZRWgcU
         ZzWW5+8UD7acNERXDIE/K5HrAGe0axncBNXt14UsCD2XxczTPU8a9bpFU3p9YAfzzPJJ
         ZqAP8EaVuJ44041Iwh+3hEWWQQ/aAjeBiK58njrBILWS5boCuutGz4Il896aNawka3S5
         quNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351962; x=1783956762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
        b=gtucnEbjGmOHqH3s95a4JPKYpjjOhp1M17VLq1Svnwaz82CK8uqspLmQElOB1egCS4
         9YJXEK2iWtOSrv+TFG5YkLCfIA7qD/sCXCT4kXovg4TgZ875xWuXbIKY4E8Xhl1ghrJt
         cgTCJQ1NSI3nNrYGCNZjAC4s4MOWkGbPixBuCckNbw5Q3MHVgSElt0ttawhvs0ebOQXm
         Adatu5ft3XDzygAy1atgpcnuWKy1RqKvW9n3WtedLbbynZhBumVC06BOzY/FgZN6jmEv
         r8rvD8M9+zquDPc6QDtXaU5dtE3XVkKNcU/s+6c0+N7YokHXFp5IWt7xQ47yD5Qm1H+I
         preA==
X-Gm-Message-State: AOJu0YwxWD+FzjGTcAFMdPb1P8nPCUebvrtiov1hqWYEZpxYEWYM50OM
	ETNkP3T3wCvrH8/lyFm7TVSLd7Id0Q+O8nkbbuM6cKSKErAGqO4mQjCCV6rZUx4J4xwSADMOTuM
	PMmkDqkT4EvDUpLPn+T7T6nWg9sw4hdlCHtS8+i0hupzild6qNREQOL7UNxv+noRwSszRltHJk6
	pZT0Y=
X-Gm-Gg: AfdE7cn2Om1JgwHDFrAM7RwZ6wMz6qhdu6GoEBbuTtGsHWpklDSixTifRIbRwsw7z+f
	BZD7ZbOcnYJ03+BANCKPpt21sBrN6pHsyWjJeFgf8WSTbOByTchc9/g4uEDeYI+AzAQE/KLaad1
	/yCazS0lpl3xIbPtYryFk1qSNL38EIjYYeDoZoQkgu10KVMVSNM/dGvp4mf3DRegE1DEC2aKNTg
	4AguNn4WqDpyMjX+daZRGNdCJu8cOcMeXWCIO6TjVyBDvmM/347vqJGjBvNMc/6ujdzFJhWYPBa
	urDXY3JxWE4pV2wata1rfT1shMO5XTDzluM5mz9g284yyOLiUhiLPEDea8+u8LjpeV+VKajGhfu
	KwRUkyZZG/2j5vU9f8RX1xUBzhXzlGoX9leVM0Xmb
X-Received: by 2002:a05:6820:2008:b0:68d:dfd2:8da9 with SMTP id 006d021491bc7-6a3553a1edemr552099eaf.1.1783351961662;
        Mon, 06 Jul 2026 08:32:41 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:68d:dfd2:8da9 with SMTP id 006d021491bc7-6a3553a1edemr552085eaf.1.1783351961208;
        Mon, 06 Jul 2026 08:32:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493df7010aasm10635e9.0.2026.07.06.08.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:32:40 -0700 (PDT)
Message-ID: <674128dd-632e-4473-9763-706d5c0432f3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:32:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706103110.31D891F00A3D@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706103110.31D891F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX9M+wL3TG6cn7
 cmbLn9usRHJXCAtZLB8f65EeEGpMZnxEmxfRbbymoq1MChxHpK6GtxWZS8IYU6OEF5sH6y0mIYd
 b0sI3D08MRmoci4E52S5Opkq7uHZVQzaP0EPh6J6BD1+cZq8mynQ5i7l7LNQnVLrhLE04YGDqgb
 uQP3g7KNbi1LVtuOdnnmgqbLJOGQzCuozh0fhMV5ueteRvBqhhLjntxZD/FG5Lh2Uc4GkbOhqQV
 U5wxBx6vgFfg+PElek3RI+7aKhLyCZnEc6UwTJyeIQ4ccpZjtYAp0XjbR5qgtdFbI7EcjqtRs47
 inxs/OheVuT7FMaq8O584U0qLepDmMAlBYvT5vX9K32T09GYXgmFOWuUOMUpIVji5lmD7rTOTLa
 wU2BcwwSKnxQnqC2+ymdWRYVfeaKoIA5ZSxcl8z+2fqz7z/FFBJnVOYn90nFWLbfVCqqK5MMZmf
 cPALcVAJ7RLL6XPKuUw==
X-Proofpoint-ORIG-GUID: MLqNFs2lvdLZbst_s5ynaMPH9xwtCS3i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX9Gpt/wtnndg7
 dnoBmr70ubQOLREv7ZoQPX5s5Z+P0LH28g6oCModNWRlq/a4JdK6CPDsHeN5a0n7Ga6VFRlnquo
 UJ4KsdBhUOglr6/hcD0HKM/LVN8Bj+Q=
X-Proofpoint-GUID: MLqNFs2lvdLZbst_s5ynaMPH9xwtCS3i
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bca9a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=dMVfIYNq6ILUI3pARTsA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060157

On 06/07/2026 12:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The use of `re.match()` instead of `re.search()` or the `in` operator causes the script to only detect a space followed by a tab if it occurs at the very beginning of the indentation string.
> --

Ack. I have also few more fixes, so v3.

Best regards,
Krzysztof
