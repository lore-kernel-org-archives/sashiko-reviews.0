Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BBA3E3DAB
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742757; cv=none; b=ouyCyqnJhADJZruGdw/Zh845flfHWOdA3DaPMJ9haA9esOB5ukYa6cQfg1xeH6irt20k5xfq29+X6ybr0bXiGwb8kp7piINFbFzGDRnGwyLlvZRTQiAT/Dm0cmonNRmW2REoY/9EJHczwvqvsB4v34WjjHE89H4M6BjRx9C0A/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742757; c=relaxed/simple;
	bh=Wlu+ktKfRlou/B+/Pe7oGWaibbylJ/3djIOC7b6aGAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzDE05/nDOC5ZUUii5s4XjCc6n0fFUETLoZNBrYZ0Jk0zj/pR6tfjoo+jv+Ok7I/JyJrmk3u1U8itlskxWflEM5MBGduKxPqAzoGGh1JHWcMalUR7Mexu9br2OeUn2ugHQ5x42syQWZYCdGPg+Fr8xHiCcZLN8O+paW/xjEBkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WilAeGba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJmG9997; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WilAeGba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJmG9997"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGrvh647182
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=; b=WilAeGba5L9P9aKy
	9oYkJGOaOwrfMJWhBYfHi1Sbr17NlfqzOrxwPUJxtgU4KkBXSLx6DxZUXSAxQXub
	kMkexbkKWvWfXxg4liIbCltM5Wz1K5yRkKF+c9f3UO8cUBX3j4yptG/7Ki4pm4I9
	ioSrl7JmEeq/2W7gQqRC9A23ZYdVUT4SxoV5ntjQ2wTmYaJqA3xY2qvi/1OuwhLL
	Nqf5HRyXAdkm0YaFf6w4yvPgZS9bfBnG6/XWF/mK2RXDg2rpr5ymgWqxPtU4+t3+
	ZG974099xDyUpjns+nL0xXPwXqEDAICOQcsvqbl7UED+SMctIBZY8YNeCNwBB012
	AGVtAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4muc42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:12:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso5434481cf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742744; x=1788347544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=;
        b=EJmG9997kGeBE+KjXRxMnCrR0mfMDHRvii98H2ZsvGELjzzRcUoGDruK4GNdAHLrKd
         A8FypPiXtUHA0buvuikfsQ5haosx4G+kbDL7ZzB6Amm1o9HhTWiahPUqQnd1BLp1GKUH
         AnrtgyJuZN+VaP9mtdyG1he1O3yhFas2XxlIT/E2Ei/RjCRBBfClM++o/fI70DsLJt1t
         E5tVj0Hv/oe+xmLNafxZJLrQ2+DUfTR1sOs0gY3TQXviWWju2GYa30vTxUwj2bBYqu+p
         ylt8boivvmvOpEdk/C2qeFXwW235tTOsE1tqenj5nxXsdr8rc+47h/Irzz307nKSraUK
         G1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742744; x=1788347544;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUS/etacm3c3KN3n5IqkXsQQm6CQm1jZW8/qgl2uVoY=;
        b=r5B9FLP+xK6IFtmbsa1hWOIWqAOsMQ40ApKkCQXj0NLChG9AWBnnbtMKyQMpsGK+kp
         yXeefAkghG3JGoc8vRVa6Iuuh1jAAr48ztdKNy+IEpccCv+Zdla4VFJOCdBhShpSDDQr
         MN7Takci0W/lvoF301S/NEwgmXfhcJLIVw2DeuerFcmirVQUlOklKptT8XLj7U3aM446
         XsZ7Sy5YWz9YfZFKzggftG8LEbVZ7XmC7fEWnoHTLQjyiwlBEtC+mLCQKBSKGwLHQZ14
         fcQTZIg5wXIWEE9/Em8c7MheV8ruqAgHIt+C1v7vUHWA7qNc1/7wX5E3t3ndnCA91ZO3
         seOw==
X-Gm-Message-State: AFuF++lU7mr4aTGV1L/5Ve9cKHDsgwzK0LokU1umZVcsVsupd3z9NOez
	Gkh2B36gLpJIPTOf/5SyFuYOU2evp7qNpyMVzDodiRuk2uJAH7XZ5TDFG6UC467sIbml4KwHFR2
	+TsdXtG9u0H0pymfKX9KvvX4tRmfvrYgDXQIF//Bd7Y06Ux4O7f5Fys82w4qDlQMna/J5RUdfqp
	a+43s=
X-Gm-Gg: AR+sD10suaW5AY6098uHg+bvFqvIm3a70UsETLoLKLK/P22zp8rcCCyNfH1d3F2u86z
	yA5x91Q/zG/36hhwnJM7yr6SJj5estdGVi+C7uPcesp4w9UCiwFWsxK/2GhCbnRtQ7rp4v1Lv9c
	W9TTamqXeZB+Z3IB7g+SDFb1eBsl7GGoJvX/XrkoYQd2NaLMrnNqT0qk0cldwuQupzJpJOP0jne
	sgc2fqorEMwebqODJ5sM796BV7MiadveG8WFLJR6aTMTIfrONJEK82CGVtC71MVL6j+dOG0Ad36
	Doqnb6TnDEiu5LOJTTYmSj0YCGjDxa9JA6nwkezU/G53zrbQowanj778XxYXQkuk0t97KaX6JTD
	YEaaPIAmkOAQ50CZw42d9+qVAT8gh
X-Received: by 2002:ac8:58c9:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52e42213198mr49541041cf.6.1787742743986;
        Wed, 26 Aug 2026 04:12:23 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52e42213198mr49540681cf.6.1787742743575;
        Wed, 26 Aug 2026 04:12:23 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4561670a12.13.2026.08.26.04.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:12:22 -0700 (PDT)
Message-ID: <ab6d51e0-3877-4703-b5e8-092bdfd12ca0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:12:21 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-9-fdd16ca6e771@oss.qualcomm.com>
 <20260826103319.BC26A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103319.BC26A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX5yuJJUUFg55H
 M9S8k+GT3Z1SSA0WAik9QdIeZYuZdZOSyEFYKtURHtejnFGOHRiQQp4Uj1ofEzodRvB6Yz0hcFn
 87vdEsakejIJk4zmzgqPZj/3x84K6Ig=
X-Proofpoint-ORIG-GUID: BD21N4tBv2mUWOEGaagFnoKJXXBaJtG0
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8eca18 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qyT_vzTtd-Zm1bSrVmAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX+ozOqz72u9iS
 /eaNUDys1tHakJqcd+v4aBIGzkMqOjZ4bz3UDXEvQEsJ/hUCfGyybS1YBiV+oPz+Jlqk6Gu8A9K
 xNmTvLiBanHFi66OP0hbDAyxKMBHfq0N+Bl9oFuYmUJMb2Ed0xCe5ZIElNQZGdqlrjyx82szXAn
 mN0481fszzpMvqOV5mFMeasJKUB7NEA7eFHFgsmsSBCfQBFl8DsFgwyqJ6erJxMPYjgmaY147lm
 g6K1My2G0lmNnLt0Bg2bnKqEfNQAycE+qIiv0AudA4VznDWrVMd1fslr7DZgbuzYvy0tx68BW8/
 hYirwk/i6wfIckeEKVO99TgttPvjqE0MVp1e99+iq+S31oEvThnYH05fV+EWOadpQFLu960+zX1
 pseBX0YGO1g6Iko2qFMHC7YxMicHL1dkdaCD6HXPkXdpIu0sFR2okreUgTnDR6vryNteZhSt5Xd
 4MlsGh7hcNo99dBaG2g==
X-Proofpoint-GUID: BD21N4tBv2mUWOEGaagFnoKJXXBaJtG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

On 26/08/2026 12:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The patch adds an undocumented check for redundant whitespace after ':', creating a meaningful commit message and code mismatch.
> - [Low] The newly added `check_redundant_whitespace_strict` function fails to inspect continuation lines.
> --
> 
> commit 57a0fd97078063900e6ed8376ac59fb6edea822d
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Add warning for redundant white-spaces
> 
> Show warnings of too many spaces around '=', before '{' and ';'
> characters, or using tabs for these.  Both in-tree DTS and DT bindings
> have many warnings for the first case (too mant spaces around '='), thus
> keep this one only for 'strict' mode.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index da7edd5ea079d..a60891d76137f 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
>> @@ -349,6 +349,42 @@ def check_trailing_whitespace(ctx):
>>              yield (dl.lineno, 'trailing whitespace')
>>  
>>  
>> +def _check_redundant_whitespace(dl):
>> +    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
>> +                        LineType.COMMENT_END, LineType.COMMENT_START,
>> +                        LineType.PREPROCESSOR):
>> +        return
>> +    if re.search(r'(\s\s+|\t)\{', dl.code):
>> +        yield (dl.lineno, 'extra whitespace before {')
>> +    if re.search(r':(\s\s+|\t)', dl.code):
>> +        yield (dl.lineno, 'extra whitespace after :')
> 
> [Severity: Medium]
> The commit message states: "Show warnings of too many spaces around '=',
> before '{' and ';' characters, or using tabs for these."
> 
> Does this undocumented check for redundant whitespace after ':' in
> _check_redundant_whitespace() create a meaningful mismatch between the
> commit message and the code?

That's a nit, updated commit msg. Commit msg does not to repeat every
thing what the code is doing.


> 
>> +    if re.search(r'\s+;', dl.code):
>> +        yield (dl.lineno, 'extra whitespace before ;')
>> +
>> +
>> +def check_redundant_whitespace(ctx):
>> +    """No whitespace between brackets or other code elements.
>> +    See also check_value_whitespace() for more checks."""
>> +    for dl in ctx.lines:
>> +        yield from _check_redundant_whitespace(dl)
>> +        for cont in dl.continuations:
>> +            yield from _check_redundant_whitespace(cont)
>> +
>> +
>> +def check_redundant_whitespace_strict(ctx):
>> +    """No whitespace between brackets or other code elements.
>> +    See also check_value_whitespace() for more checks."""
>> +    for dl in ctx.lines:
>> +        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
>> +                           LineType.COMMENT_END, LineType.COMMENT_START,
>> +                           LineType.PREPROCESSOR):
>> +            continue
>> +        if re.search(r'(\s\s+|\t)=', dl.code):
>> +            yield (dl.lineno, 'extra whitespace before =')
>> +        if re.search(r'=(\s\s+|\t)', dl.code):
>> +            yield (dl.lineno, 'extra whitespace after =')
> 
> [Severity: Low]
> This function fails to inspect continuation lines in
> check_redundant_whitespace_strict().

Cannot happen, false positive.


Best regards,
Krzysztof
