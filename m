Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09083AFD1D
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683954; cv=none; b=grArvkbQ0RW+a+9tJOor97j2vAV/crKtLjcwrQ3vNdxCnGbOuHl9TxxgSH7V/Rt33tnW+t0974ug/bKg4YvajyLgUq3NIvL23C3f61B+KftvZMK7NY5DQvluShees/BpgXqrHWLm9D4DL+8I+A4CJ/3Enzf6ifyjIp/6kiWKPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683954; c=relaxed/simple;
	bh=iStqqgKaDOp8m1KWZdx/6hHxM8ne6J1JQXJJy3Fb+f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUelQDSzgotvkG+ZLJpx8tfpSSOH59OEkEvynPCTnBnp0oeJW66ZUXt7ZvhftCF8AUmoBqF9DONZS4HoX2ZzxeNlQiJSC9B6NgXLIflfpyMOrTHskQL8aAqKdSVgWFSL+ytWPKf8qK+TQ0vcjYRLGTcwX0jc1Du2anXrxyX3J4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgnZ1aFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOUZhYz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgnZ1aFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOUZhYz9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdSj72446397
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 18:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=; b=VgnZ1aFO7Vkvlw7x
	FV5+s9eAreScu2NIupxB7T+CSpbKghHNmOLqzk52Y+kyVWTEM652X0jMdMCfbwKF
	OwORz2RmZQyOAWcHDmuXWMZq+AsEAoKY5kY2AuoX7zHpxu/w8AJNBCxcS7pp1/s7
	mxFXIr2ZWpVI7I7hK/zbxPtCTL0olpNbGceOtzDyuk87DccVHt7EOSXaabsH89ps
	tCjW91wir5mChY73YjK0d+ew8g17qQLEcBLjGFk6I96ZaL9ruMNcuq3+gL6IS6sa
	7Zxvc0QN0okRH8g6SJOnMpj+V3snjDNKZ0PUkgMpDGOg820mrmp4yA3L5EH5ShYD
	NBxAgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcercky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 18:52:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de05de414so1740951cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683949; x=1788288749; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=;
        b=GOUZhYz9P6D6q3MfiYgZ6rKRmXo+r8/NWk/OeDRhbcBWHnlFvbTDRV4cv1n24jbmV9
         GiPzTUatW5KnCv1merbWjdWuoTeY65EtCah+zz80Rua+9N6OrBIhuwzQa+0A80f7d9Pi
         iSFBekKgfQjRVfiQ2DQCNemzRZMOdJqbbNn2k5EDkhzplUwYif5c+Z3d/ixhWauj5Sni
         AJ5OzQHnDPf54KdBqhpfgQKt2thh22/hTFGq0Qe4z17y4OWiOhLzEediC+lnZcforRnw
         JYghXRlc+GxdAo0a3ztMtohinsnU2GOEDDkqANQXWDsxzBR/Z1jIErrCZM/9mJndGRFx
         Ga+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683949; x=1788288749;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfBd5iljf3sWm63em7lw8B2SG/E3mmlz2ll4N9yEOmU=;
        b=UrdMAAo6SVr1WFRBqLbyKnHc3VLhsEKaorZZjSXWgl07LMbySPWtLXxcaUx6rQVl96
         T+5MxMcBkRtAnJHjVOl1xXi+/IyZQV1R5Nz1mUULQHozHLlT1IQYo+2J8wdax6RLf41K
         K44JbW6LUrAhutjtxZOhHf4wIrRJf0Ep2byQnj4y/AIUDeOwjWD4WJfid+m8GbzPAuZV
         UyqcAk6CBCZqom9Igl1aiKNLSZM7m4HXrj6VUCiFg8hNvuRjjkmsw7mw/EuSgQ0bi+/x
         seVJ8D6T8C47tg0qjWPmrQTHu2TEP3cGIUidqlnODJbEhgyhlg8+wccEvwpUqaDcCvX9
         92Gg==
X-Gm-Message-State: AFuF++nn87WVfvabmZErkaza6HrjcA5FzF4mFVKE4eFIOAusj7rZXo5Z
	E9UE5rpdHvQ5IX9p5QH0BL7aixp9Oi2OKWUvQ6EyBkKZN6fY1whnNhkgUcfZ2aXaFFsiak1Imav
	2COGqcWQdMBXEqjMUXViIgPR6hbOi8jO0VBn/yS1mwhryNyaxbbmiTsHlmszsPXWRal99mkvUvn
	H933Q=
X-Gm-Gg: AR+sD13L+h3gbCRvh++BPo7KcLpU86BkppFXfVPQWI7/NOH5BeFuxWz+wOG3aT36bYK
	Q8e9naR8HHIAftFwSTlFTKLiSQQeQqF9MTa7dutX+urdUiYT7xUSkjvJaGFk6RCFeoRhr1GF9PX
	LInBFiaZ5+BLDEgsg4eCobFj/0+oT+c4avap/MEoJ0caKzsC0V1Ca6AAyZH7GIn8RTwPDwSpCWg
	hFspWpho6pLXhdXNgbCfulVRjuF0KJUZ0R6esjFc2RE9yDLO1L38RWeBxLD4KDVlPM1+yujmbal
	AOvWOwZCnHhuiy4S+mdjUhdLXpNm0ZqLnAiwZodNJc8xpvWWOzibEKIbjx6u7+XzrFhjen8jXGi
	gH9KYHsVa7FlXpIlXfkg5QjA3XGyg
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e4222de12mr12288141cf.3.1787683949354;
        Tue, 25 Aug 2026 11:52:29 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e4222de12mr12287631cf.3.1787683948886;
        Tue, 25 Aug 2026 11:52:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac46sm102859966b.29.2026.08.25.11.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 11:52:27 -0700 (PDT)
Message-ID: <f2705937-0966-4161-96df-88541762f147@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 20:52:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in
 overlays
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-3-6c9776928cea@oss.qualcomm.com>
 <20260803091808.99C0C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803091808.99C0C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8de46e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rrq01w7Obhnz-bXyAW4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MCBTYWx0ZWRfX29U8cszyFH/N
 BatSfCrXTN/GGRIPSBt8en5Mr+VAfZw3zlcDJMJlS9C1rstrvFczt/vAVi70YL/YQXIwpNuul6j
 4rgVh1U/B2JgCdRayeChe9DYGdiW5K4=
X-Proofpoint-ORIG-GUID: M-Y9hyG_WA5HuyTv9Lqt26EyxG8Cnj4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MCBTYWx0ZWRfXxiaI4YK64xt7
 i2FjP5XEJ6CCwsY6aB1/2kFkp7BUINvTfenzxjF1670gsaD7itCM1Go7qenAgbHuCHTAWaTfqYU
 TzKRGo1BUfR2mkZgN7dhcDAlgQPmLZlaIXdg2dWBUeAniDnKA86csc+cN7FX+91VMW/y4HF6C6e
 gsQpPIQqFyXloiu7zDPVjFBodvs74Z3+dl5N5+RGuU7DcbAlLW/jt+A7esoBSP/+FCIxsLPUsbQ
 y5PN4N2D9HBtUtgvK4AkFXf4/DmVpgTUsHFHKmPqOvq4JMQmyYc1pe68ChFAKOIhFHtFvQu2UpG
 5iaPYPlF2ipxeAtuTRxR09FT2wuyPhUdQ+TtJy4wJgcfmNXWe8N/QAo1wvgVdHHqvwGyqFnkcmT
 2jzudY5DIFCvbwAE/shRz0ekCAdRBNDYOVD1BnYa/9re6JnlfCDGmebGohvXv/IWLAeHQSGHUfK
 n6VDHZNPR1osKcLiO9Q==
X-Proofpoint-GUID: M-Y9hyG_WA5HuyTv9Lqt26EyxG8Cnj4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250160

On 03/08/2026 11:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch fails to address the issue claimed in the commit message, introduces dead logic for overlay root nodes, and causes a regression for standard unspaced root nodes.
> --
> 
> --- Patch [3]: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in overlays ---
> commit 099936d5537a0ed41e9b6886979ab1b9de2421d1
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Handle root node in overlays
> 
> This patch aims to handle root nodes in overlays correctly by detecting
> them and storing an is_root attribute in DtsLine, intending to fix false
> positives for property order.
> 
>> This fixes false positives for property order for root nodes in overlays.
> 
> [Severity: Medium]
> Does this patch actually update check_property_order()? 
> 
> The diff modifies check_child_name_order() instead, leaving the
> check_property_order() function completely unchanged.

False positive

> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 96deffc0d8a7c..d9f76d6d9179e 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> [ ... ]
>> @@ -228,7 +229,10 @@ def classify_lines(text):
>>              continue
>>  
>>          if code.endswith('{'):
>> -            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
>> +            is_root = False
>> +            if code == '&{/} {' or re.search(r'^/\s+\{$', code):
>> +                is_root = True
>> +            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
> 
> [Severity: Medium]
> Will this regex handle standard unspaced root nodes like "/{"?

Ack

> 
> The regex pattern ^/\s+\{$ strictly requires whitespace. Valid unspaced
> root nodes or labelled root nodes might bypass this logic and incorrectly
> evaluate to is_root = False.
> 
> [ ... ]
>> @@ -550,7 +554,9 @@ def check_child_name_order(ctx):
>>          for c in children:
>>              if c.node_addr is not None:
>>                  continue
>> -            if c.node_name in (None, '/'):
>> +            if c.node_name is None:
>> +                continue
>> +            if c.is_root:
>>                  continue
> 
> [Severity: Medium]
> Is the c.is_root check reachable for overlay root nodes?

Seems this change is not needed.

Best regards,
Krzysztof
