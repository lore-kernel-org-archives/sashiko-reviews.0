Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348F42FCD8
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532423; cv=none; b=WCZFSex7hSTRwV3PiJmazh8Dlc7odopW9MWmDfLKYvC4mDu9Dw6rjSLlzGrSQtVX5AR4V1eNt5ands3DItaL5kuOIem4iw3iv3m+fzPpAy/YvnAN418PYI+FNYOIYrJRqH3BKNJ+p0RnbP/dHl5oPYSKGw/SgXitoZXMwb94e/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532423; c=relaxed/simple;
	bh=7Fo6r36FUHOo03XM7mJuG/3KNscapNn48SHiyBaY9/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZlJeKu5GbZ8oa5HC6NFUb0swuOP8rxsx9xspYI1VYMdRiFAPGW/sW/MSSf1VYdxJhnZfn0Yv4CVCdi4nxLtrV8mStQiGMGf3InpWXNDezsxcie4SUxGetNz1KNglLfozNGRlgKNv/CNe2TljRqw+geJHY35nRaN+1KC50I3pgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqnWdQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UurPnHUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqnWdQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UurPnHUd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fb2Y384795
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=; b=FfqnWdQYncWPzL56
	Ec7PoJC0MUvbjBkZWj2QdWn1i9md9iLe3Qbhn/Nq7zidf+Gq3IpAuaA3N4Ta3oLc
	LMWHqbCyaWST+Oi7Xmnua+QhHWT83DHt/pPY1Ghb5m41pI4uKepjAGKUkUda+QKp
	OmwTM+00U06fKfJygNI4d8+pWZSs50HhFE6VwtMyqZw9Icpu46wedoZReZYtKzAU
	JAzGhZFNv5AppXjnKXtny+ZmnIYnOO9jYT4WKGACscoFhTO/81NvTO8o1OLOlbIE
	2bgcDwuaK8lvdPiXavveyJrzT8W7eLrQ/3bn5rwTMYlEvZZeELf2k1vczYpfQPOS
	oVgJxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut8epx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 11:00:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1028280a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786532420; x=1787137220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=UurPnHUdxcgBm1jmtQdKvY8X1TEQmoZRDmdSNStX//qSNzeQSGSb1nrpXVNTrGLWCq
         UnmrPc7PWr7XFhpZP1TwEzdZOdYoaNoqzPckcN41m6CRmI2gXddM834XvduQptwSVVrB
         HAsqITB1QPx1BFlM+4mZUZxo9ZUyEPqF1fkDRHIcuZQdIEFonIoAq2xqUoNA0Dovy0UT
         OJZHmLNmrNuyxoJ65yPClRCP5hO0ICetj2q6sy5yEuz2l9lWQTP6P6XeB5jwfMM2a5mJ
         PrR+sB+pQdDX+8DiCgKioUitcX7zx3h0FwqtGNnwRpDEMq6Pj9+0u6I2xD9B6hMvmi+/
         yuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532420; x=1787137220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PCeatloIVvaGd9faSaSqF2c9A3TOKj4hIv65HDDNK0=;
        b=RXXwt/vKe1sgZicCJK5IC9Fs2xWI+wH5q/VxYcT3xrF08qiRGvaLMJfNur5y6Qhxv8
         4sSWw9AI8boDoxVwKGohywQk5h5g5NFr1RjRC22Xnt2yuntVL5c0sG20SidmO38eDxX/
         snC+CghE6Rju+B7b2TmqXxEOLbIlQCOlCORQgDAX8jvzm/MSVj3sB+FtXhYUHdoBoRFU
         YlctZL0eblJFw6obUyOlxM5FKWNzjzhJ22pe86o4iyKmlXJikagIgyw1te3aqcdQZeTi
         W4S1QITbbTC6khUh2z/JPdFIVBNCaJjxNDuagyxMnRbV25dko0TRmYg0Ipsh3f3p9GqW
         Gxvg==
X-Forwarded-Encrypted: i=1; AHgh+RoUnoo8r0dh/ANI0HqtlJOo9dx5UmYqafUl8A+YJFnmikMaQFAYKMywf4Mg3kzYNt7SoXS7/RW8R8AuSI2QTt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmZMYc8R1xOAfoToMeHOsWyydBVkgiKvxAVNQtO5IfAALB+tTJ
	MNgTafMMDVCEhIMPuTgZG5wMpmvKAUdo7nem4ikssyFyjRJdfw8KZyjE+CtH1pKXfIBD2u4brHm
	NTmgKGXUB2VFNTWilUttEaQZ7X5ItHyon8tQg357WGDbq6eA8iih3AAQ+4QTX2C9T+ydNhY8=
X-Gm-Gg: AR+sD13xb0l3ny5Zjk+YpzMc0c4ryqaSZ98rntgFjKxVN7keeiwOQnGHvPt2nOVwdj6
	jofO2lDEIR88jYxg0hG7uhcbygLp30zK0tturaKNwdcQvXvE57hb0LR46dWp4jkEpp5WLNLlOmz
	7dafrPGcnU1VlGJJ518MHqxRWurqGH4GrTT1ctZqgF5YM9BvQK32LZKkfpeYPvGE9ZVvzlGNZC/
	9uKNmRQqNftZyE3bDQOMHp0LLtsxnfsiU15NJrodLmHoiANM36dUZp3N/Q59GsKFeoN+t/Duk20
	pieXX4jRMq0hsXXUBmSRqD6ncvmSltDyzQxHRbXXvFSKOB8WVOmsL+7wvTVvsQxkE1oJ+1OLURV
	3k5wKmjOreIwtsbWPgc1/IbglUEfYamsTRg==
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455505a91.13.1786532417035;
        Wed, 12 Aug 2026 04:00:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39301490cefmr4455414a91.13.1786532416553;
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f73csm3181551a91.6.2026.08.12.04.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:00:16 -0700 (PDT)
Message-ID: <c4a5b03d-a4ed-4e4b-8e45-8c9431c23c0c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260803100023.7AA1C1F00A3A@smtp.kernel.org>
 <20260812081521.GE1072730@google.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260812081521.GE1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfXwCoUprVExW8j
 0TNoq+b2NY0BtgPgsSUs1sBpEW+0AWXcDgq2HmIKcnEboK2GbOI4d1cZK3idlo6VOqTuIVKhzNn
 g+4yBc0D1zWY55kZbDhC5q45OPuilH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4OCBTYWx0ZWRfXz9PZNWgEmdnz
 bASKDWKAKQP7JoVmchfV2WuxWcBHs1Bni5mpr+73P43jseo2PnyuxcW6PoI7k7kvg4Hg1mpQQdp
 +2oj+yiKcaNiVON6aI0mdk+4tUyd+UHu6GK6a2hmo9PQA3W1qoJEtyn9K7bOuIyXQPV/zrKObGc
 MZWZv0BRI5MxZX4xtlOrqbTg0bBZQ7BmHQcy2AHTW75mzGW4Jjd2q/wBniBZwwHoe5flcOqJhjB
 FgkvkN3pvUAwWxyDY01Gl/UwhcRWXvE+ofz4B0TTg+SilKOe7a9ciMFSGYj7I3kkZwQ/GPMgIdx
 S+0QDSMSyv5f5nN6bvYySEVVuLeM3AtJa1dh16rnw/mF9xfDApMR6i7LoOPnTDowJRLhPHTQZCy
 p0bkpLVFILLZCEnwfI//WpaF2+xqRDfLLVJ5jraVNp6KV09QNNKJmfB+nIve5rE03PAY9FEY47m
 8YvNe8HJRpmX5RK6yDQ==
X-Proofpoint-ORIG-GUID: TKCR8SIsZDKMrGhWxLKed7SHVxo0LCij
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c5244 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84XDBkMBUWCNCre_yW8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TKCR8SIsZDKMrGhWxLKed7SHVxo0LCij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120088



On 8/12/2026 1:45 PM, Lee Jones wrote:
> On Mon, 03 Aug 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Medium] The new `psci-mfd` driver lacks a `.remove` callback and does not set `.suppress_bind_attrs = true`, allowing manual unbinding via sysfs which leads to resource leaks.
>> - [Low] The newly introduced MFD driver, its file, and its structures include the string 'mfd' in their names, violating subsystem conventions.
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.

Already replied to Sashiko's review comments on other patches.

> 
>> --
>>
>> --- Patch [4]: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell ---
>> commit 26907aee3ff3e0a5d7112a9be25ebbebb10e94c7
>> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>
>> mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
>>
>> This commit introduces a new PSCI MFD driver to manage multiple consumers of
>> the PSCI device node. It registers the cpuidle-psci-domain as a child cell
>> and updates the cpuidle driver to probe as an MFD child.
>>
>>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>>> new file mode 100644
>>> index 0000000000000..7affd6bb09dd8
>>> --- /dev/null
>>> +++ b/drivers/mfd/psci-mfd.c
>> [ ... ]
>>> +static struct platform_driver psci_mfd_driver = {
>>> +	.probe = psci_mfd_probe,
>>> +	.driver = {
>>> +		.name = "psci-mfd",
>>
>> [Severity: Low]
>> This isn't a bug, but does naming the driver and struct with the "mfd"
>> string violate the MFD subsystem guidelines?

sure. will remove the string "mfd" as per guidelines.

>>
>> The MFD guidelines state not to hard-code implementation details in driver,
>> struct, or device names, and to specifically avoid including the string
>> "mfd" or the driver's own filename in names.
>>
>> [Severity: Medium]
>> Since there is no .remove callback provided in psci_mfd_driver, does this
>> allow manual sysfs unbinding that could leak resources?
>>
>> If a user unbinds the driver via sysfs, devres will destroy the child
>> devices. Because the child driver (psci-cpuidle-domain) lacks proper
>> cleanup for non-devm resources like generic PM domains, those resources
>> might leak or leave dangling pointers on this administrative path.
>>
>> Should .suppress_bind_attrs = true be set in the driver struct to prevent
>> unsupported sysfs unbinding?

Ack. will set .suppress_bind_attrs = true. for psci-mfd and 
cpuidle-psci-domain.

thanks,
Shivendra
