Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40691A5B9D
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606236; cv=none; b=rP5jQmpWRUd/7/nzn+3bNYCUpW/+15USkdhHOOIe8snJVbZgZn4bxe2marF5fr3Nm/oEn+h59lvuRMsc5TNXq5lzq7dw7twxBptZM8x/BH40mnt0Ooxflu5TPH4vUH9+BJQHMOGu0rFW4++x96EcmUWpE9qUxtO/A+6xfVKSKmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606236; c=relaxed/simple;
	bh=PY8InaJHRFcc63/hbEXQx/vDtjSu+8gUmL+v1GZgJHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxQhjiCKliLegFwr3oqRl3eLLsK6usp2WUym2f6SXvBpLY9rNJXA+sNCTg8rdWN2RdniXqLrx5f/IU4SC+VQ1vyOuuU9PnFPoIBBRNqPltYbXGqXy9EkeN3LgI0yg/Ko2SVCzkwUQH0tU4EQUPJCZn7a1b9BiOIcCC/dPtfta/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG7zWnqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3jyXXwM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG7zWnqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3jyXXwM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FalTD3148255
	for <sashiko-reviews@lists.linux.dev>; Sat, 1 Aug 2026 17:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=; b=mG7zWnqdeBcxklQA
	Uw/OB8PAFimi1Xb8kr4TNLGAVZqPkyWUEGOAZCgtp4bq6+aOiB+Ygw56gNgKXGYW
	EJcFkMSQ+IYWCxP2t1qJCGAQIwoZNtaxzgK2+UpQPsuOgVo/ROb078FUd2zhjHMy
	CiKjKIODcuHoEA6WRZ2O/3z+6iBqGGcVnvR6OvvVJHFn2D89R5OT1TeITW2LY377
	N8VWkRVUbf8HLvnbCa4gzTf/3n9s3dHtpkBtmOrR4MILHbQKExTu0YaXQhGRj8Bs
	6CwBF8f5B2J21KkcBX4odkyfPa1TVXg50bWDAfvjlcYLRwi15mpJJjgsjXTdo626
	cZA0hQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9669bej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 17:43:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso35108761cf.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785606233; x=1786211033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=;
        b=I3jyXXwMTvwt88DA9czw1aFce048J/awXqmE+vJcQJfNglh6Rmai70Xab2zH8E47G8
         YqbWfjl8M6UPu2QyWk6OGiKA3a3GM5iQ8pB4wK+QMg0i0YFjPDILKxg5g0u8BYzu+gfW
         f7v6hFGUwvoH9aAvRUYyq9FT0Nnp/Tbl0mspglUkTX7EmyyIwezo2fiybekL3JquRD1q
         eF+nH489yBI2GM39AHLAnhChNmv/WFMSy7pn6dfNKX6YS7EX7DY7Kygf8j8WaRzuqWgn
         ns45qEnG0xyQL/AsasOMeUet6xgvDZkyck4+wRjTAb5QqJZTFVw98lL+LvvDPdnky0Fq
         ZFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606233; x=1786211033;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mde5ZJQsvXdc9zC8pk4PCiIyObIUlstkfgcsMyw9rgI=;
        b=H1Y+d7uGzXm5HFzdS8epsOdYbmcSWJSe/S3yuqit2T/7g50fbmbqwmERWt0mnBUpT9
         O/UeqBbINRVbnb1oxphit6zdkXjc0+2lBEOKBEChbcdcvt4+71oTcPHWsNx+UEZ+qfDg
         xmxE1vsMqq4QrexzAf0hpTKnbJPmlu05/okyNipaTcsTmcHA2vk8IZAqMFNpxPk8z2my
         vbGh7evmWSMnVzgiwt6VvtdEdwfaUcL6f/swG6r63nhIqd+TmhlQrr9R9t8q8XcUcLoa
         hZbtN07o6F4fGWCurOE57caUJ1tGKlqboCVQJBGBF3vSTEgi84fUtAanlPfdJjBea0rc
         lcqg==
X-Gm-Message-State: AOJu0YyxZG9Y6tjfes99eeibg+H6TfRlPSZidjgP/LJzXmqRHy9kR/CQ
	HiZz0BGc0LMCvxVy4l9BDkhXZQzby4FFbuLMGb+xz/9VguxNColTT/dhAYpX48xUw145AtEmUjB
	QgzlEYzfZLO0lRWjOUdyGOcCZ6Q5sMFhTNW2kbVTVNUiT6VcWwgr0ZqNDXUM3rLVDmXzAEc7poe
	kmJSg=
X-Gm-Gg: AR+sD10BsUDY92/ZU40WXjqFnshok/CDIlQSYdFfFygywKQTCKySy/x9fzSoLghndHy
	XZqn4ekQAvXHrsc3YpieMxjbk151R6vQQX/3xsGGPegLg3Y5bkNHuCdmXRFoSVszj39rVnZ+wn9
	TDLgmHmqrbEC7VQHS+J1B3A+lXlXtJkNtESVB1y81WrE27RovjmdEEPHCa5LPjBoOLZP26EI/Rg
	ec+qpsTwvpHbxp7FCobIrGtTp7RhIU08sM+mlw/grBcQF+60YOHeNEL7qZiS99ivyKIKqIVYkMN
	8ViQwp+158u7USrDV3qznsFDHcbtWSaEMJnZsnvU6poz6rYUe9pqEOInRxfsioGlVjuLtdN1eM/
	Bqzalfv7S4nST4zxUU9Pm/49J3MlAKA==
X-Received: by 2002:a05:622a:44b:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b567915e7mr73366041cf.36.1785606232960;
        Sat, 01 Aug 2026 10:43:52 -0700 (PDT)
X-Received: by 2002:a05:622a:44b:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b567915e7mr73365801cf.36.1785606232535;
        Sat, 01 Aug 2026 10:43:52 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm18039276f8f.11.2026.08.01.10.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 10:43:51 -0700 (PDT)
Message-ID: <98d13cfe-b94e-40bf-bee7-541db92ac12b@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 19:43:50 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
 <20260726160058.229B71F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726160058.229B71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xnafKEjIkMXgoJDoNkR7ZnRMPbDYdnoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfX4zSrOnxq6+Tl
 v1ljPN5Bhg6Aii34tDAyNAqwgREzT3frgxGeQX4SROhKkkhGaeGSjS8T5M1TvEaU+jqYGFhkoqF
 FlcsolN0vgkfL00T7V6940nA6AG++J/Xo/7PgM2HV3N2lNOjOPOgLlYWgptkceBsKWq37jr7PYA
 0Y2qeCkW8q6959lqgXB17filfwVCRDSfWshx67iXPhCkvERcNvrhXKjqbcu/jJSuGpUxFPH3ABo
 86JYOP7rV1pb5paOh2X6JTJxsW4nyo3HBmysPP8Q2wJiFz3+mGBtFYiwnWlEHWxYPe56kiVOX6q
 bL8btcvvQPuhAT7HGKhXoHzPD0qlw4+tTPOJZygHzB6ARtGKpViujTmwnocgPzNfJ/rEkG++R8Z
 zPREStWdIq/vVFRQ0BuJ32R1p/ltnt60lMx8yTvvaIKwiJnr+F0Qoz7GkzfiM/CFHvPpfyL93Gp
 EJjmzPRSFFHZMxcF4RQ==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e3059 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=BdnB_ZxoBvXoPZvaknkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xnafKEjIkMXgoJDoNkR7ZnRMPbDYdnoy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MiBTYWx0ZWRfXyc3i3JbbFltA
 xB4bYVxQeKuTcwD/fhCOeQrt6oDcgLhqrPEniV9y8Td2fY3GpHXEhHOR38hg41hbg/FMSDYXfIt
 pLlBGjRnvUv+6WwLjA3QVCi3LSci0m0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010142

On 26/07/2026 18:00, sashiko-bot@kernel.org wrote:
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>              continue
>>  
>>          if code.endswith('{'):
>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>> +            is_root = False
>> +            if code == '&{/} {' or code == '/ {':
> 
> [Severity: Medium]
> Will this exact string match handle valid alternative spacings or labels?
> For example, if the code contains a label like "label: / {" or extra

We don't label root node, but I will add a test for that.

> whitespace like "/  {", it seems this would fail to set is_root to True.

I'll add a test for that.

> 
>> +                is_root = True
>> +            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
>>              parse_node_header(dl)
>>              out.append(dl)
>>              depth += 1
> 
> [ ... ]
> 
>> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>>          for c in children:
>>              if c.node_addr is not None:
>>                  continue
>> -            if c.node_name in (None, '/'):
>> +            if c.node_name is None:
>> +                continue
>> +            if c.is_root:
> 
> [Severity: Medium]
> Since this replaces the previous check for c.node_name in (None, '/'), could
> it cause valid root nodes that were missed by the exact string match in
> classify_lines() to incorrectly bypass this skip logic and trigger false
> positives?

is_root is added, so false positive.

Best regards,
Krzysztof
