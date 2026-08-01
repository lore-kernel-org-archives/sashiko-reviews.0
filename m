Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC4A380FF1
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606325; cv=none; b=CO/y1gm7L4DGeHK+Yi9mH++f6taLANNYoEMEXYJFeblzNFf5eYrZBcQzyGOer0fB+F+ZGeeFAZGERGvPndL2FPRHDZ+RldtytVCrIp6/lBkhjuCr51gEdtGsRTPzlgZA6abtWWBajMm+DyFCqzI/32irHvXOxUnDnQIUJrPbZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606325; c=relaxed/simple;
	bh=hPQbJvA7gMVD50CKXon7gKfap7mU9lt5Y4S4dZwveAo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gLJy5toXdX2qGbXWatOYamY/FoIWoFMed0UsqLaN9o1KDXAOUDBF+bUO7OzUIJig8yxPoFN49DEXrgM+xxUsbPdnFdFP5L0KCf1cF8XCITmCnxi4KXpZimsWnAuiA324pzecAJccnL7G0ZK1MSV6HGgnAVJ/3/HaEhSUS4HDQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIaeiz1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OA6orKhx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIaeiz1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OA6orKhx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Fal2L3491290
	for <sashiko-reviews@lists.linux.dev>; Sat, 1 Aug 2026 17:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=; b=mIaeiz1F6dg3Q03q
	j+3t5smYYUMy/wD4Mnn6JJfv/X9obTWjUKda7ifgFMXcQuaWINhnR5RCGHNAwQdt
	bt1tEq2Byf+KPyNPn95ZE+iiOaTTrwUePG1p9aWBPnynLQW/3dOPxyfC9YZbQpU1
	Ip8f6oiTN/CiCc/LaGxuVPT1ULGNce7EgapB+XgQbYcOgDl+SCjs2IcZw3x2fCQU
	PkJgjZIAPA2TdOZ1FcsMYe3b8IRM9cjDdDbbGQAiYZC/6ekdCZPE1A+/Cw8/QoOq
	JYAqVu4/vmy0mHZy1pVfY7O9kSaR8k45MaTp6nQTvujSBM0GD1BL/7ZbBxTLGe2q
	1az7Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119c1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 17:45:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so21313251cf.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785606319; x=1786211119; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=;
        b=OA6orKhxkLEdySQSEkkBqNpYGW72p5UFlMZEeLmz5COiQY2CpSHQVWx6+vB8u33Ji6
         t9EC4CYDU694FFPQCrhxztVPpE7VLKPl99rxk90Xs0HqGZkuWbLuucvQSMKuZ3zGVrtM
         q2wEs3LF3eVftm6OehAMhtlr46ROkU40eWvT3qnzdF3pFCJeVi5+wN7uPWGpuQhImyCY
         tNJn5uwEyiyQ5MthCKrmFvXgiRhF4kTuhPV63tonWjJuGiFu5TLCqCAY+BU6jxdU51f6
         L3DqJvSnzwz8qbvTE3EkjQ0WJvfjljTgLJf6LVk/meIEhIMmTfSl56rW/NVHip9zuYqR
         VjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606319; x=1786211119;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGjjO5dar3w2Av1GvDHB4MrSJNjoKJ09PTImAv5jOrU=;
        b=UcXXHMQ8vafiSz/FmRSI6Z506wLJsnhqgjZM+byRpQUiygLZLXojQaEclAyZsEu8Nr
         6D8p5Zp3v0dvnDh9U8fnzNRo9LbjOMgLo8Xo1lqiWHFtnVs9QAa3HmxtzodR+JwqwFFZ
         TarYSRZ34wDOO6jvGqg9nIwZBHAdcl9r1wuJliB6j0hZUxjyuEiIxiorChBbP0dZLMfO
         jppt61wAyfIRn/YU6Rc/lTKw4+w1dGE1nQwH7VGKUjhd571SGkJhZn5RZQxm2XDHPCD0
         oBglBwbR7WBygO9LyKt/tYcnygz+VKq5jcPR5JtQzC+56Ecnk8SmTZExpHXFCQNahsK3
         Htbg==
X-Gm-Message-State: AOJu0YwvwSjFYtr/+/IW9dP0nAeseLneUtbkflfprQUisU7zx3F8kMtT
	jFfmcF39gw/Ve+OgS2JOJnH2e/L7TuSeBSaJZ97uKQ/Yk+hjaq9CHvrdq7eLRrYY5un3ppwM5cX
	luN4zqN7Oi8aTQ943oe1+zeN6iRJ97Nr93kqU4A34Ld3mlLqTeArEACYFG4vNy5Tf7/fpAbbbPG
	Rz6/w=
X-Gm-Gg: AR+sD130heKdllEAPY0sxvzmjd85YmPCiuHlaeLCfidKOn+4nLSVmkmwv3cO/HtSFVM
	GzBZITbqsTawX5ujPHMGUXUAK4OswMvlYrHgbIiTUarHa17YK3D0Ze5ucN+7g2X625HOIZaR5YD
	0EgzFhQEbQweWez0qEpiktHk6Ua3ENxK8d0eEJoA9Mxafxtcx12kL5Y9pqan8g5AEbYfX3LOd8E
	4G2r28f8lw5wuqdUYLig50PhM/UUiueGimY0CgTzkiiUGeb9Vdp75mTRV9xB3tVVZ3uS/CRe2Zr
	e1xUHwuxKCSK1HQ3p/H1QE7umANfkWI1+j14JBPPHWYx1zCyJA80rB1SVf0WlSWwqOoR29s+JsG
	FFE9p1YKjZ/RubSCmZ6U/mFbQ6HIqSQ==
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr83295181cf.40.1785606319382;
        Sat, 01 Aug 2026 10:45:19 -0700 (PDT)
X-Received: by 2002:ac8:574d:0:b0:519:89b6:78b4 with SMTP id d75a77b69052e-52b567dab59mr83294761cf.40.1785606318926;
        Sat, 01 Aug 2026 10:45:18 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm17416391f8f.28.2026.08.01.10.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 10:45:18 -0700 (PDT)
Message-ID: <0521a961-0468-41a1-8dc7-6eb25635dcc1@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 19:45:16 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
 <20260726160058.229B71F000E9@smtp.kernel.org>
 <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX+HosZSE3hcxd
 8OHL3Qa9ulmgGN8Sk2PUszBzEndD2Y6ddrkZWbmMiYqlv20/r1i5JSIcAJbGeRfHQ+nIsFiuN9X
 Nhe6QBMi+TZC3q5F8tjzPlXAAHpsV5Q=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e30b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=dTbKHLgmssTIFSNd2vEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HeN6LC_7ojJc9nj7upPaAiCs0JvzvBxH
X-Proofpoint-ORIG-GUID: HeN6LC_7ojJc9nj7upPaAiCs0JvzvBxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX6UcaHTfhn4CD
 mrBDw9kOVFnhfGZFh9sKOtx33872vqo+romPSrFOVhMP7Jum6XVIHit6y4tbc2W20Nz9Zc99mpu
 gPOAKBiFMRCncm7zA1orw7hEWEeLXEQj2olpq/MCiSClFYLsX5KNtAvt8fd8w30ay3c2UdLvcMC
 b0fs3rv1z09ciwTP5/fdXAfg87Qfpd0kgUYstfqPuz35skYqA1TGyR/Pg8J8muxdqioYIOpuecm
 ySnZgyBeng7jBOC+norqiDk5O55SgUi2LBs1f7RZoXhhwRzD0fQJ5IaG3sftSYKxTSInjCVlixM
 8bdVtK0KkjXnAscsDb5hTq6691TcQEZ0cmn+aY70PVQRgS0GYheOAn5JqJHh+oLe2fXqHMacyOB
 TVH7twTROZ0QvmbjWhUKQn+TRhgdqPb005BU/4ng6SAEc183gD9NlLG8mGhVkWcBS4KqR3Qh67x
 CUwgs6Gb6antCpRayyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010142

On 01/08/2026 19:43, Krzysztof Kozlowski wrote:
> On 26/07/2026 18:00, sashiko-bot@kernel.org wrote:
>>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>>> --- a/scripts/dtc/dt-check-style
>>> +++ b/scripts/dtc/dt-check-style
>>
>> [ ... ]
>>
>>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>>              continue
>>>  
>>>          if code.endswith('{'):
>>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>>> +            is_root = False
>>> +            if code == '&{/} {' or code == '/ {':
>>
>> [Severity: Medium]
>> Will this exact string match handle valid alternative spacings or labels?
>> For example, if the code contains a label like "label: / {" or extra
> 
> We don't label root node, but I will add a test for that.
> 

Root node cannot have label, so no need.

Best regards,
Krzysztof
