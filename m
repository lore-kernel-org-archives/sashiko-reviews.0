Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9A4EA369
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618744; cv=none; b=NOT08me8rG2KZ+GPuVgQjeuEn/hLLx6ne3402Ka/bP1E9PBcUyHP1ZebKpmeigaoKO76CS60iJzgWDFl3cfDyHKmGTaMr+kk+3DVGf+MrPg3g3OpBtYK0vxB00PX1MHFvHyvkn5+eYIMkyKZJOOBjN1O/HvDIjpDc0R8vGYV7mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618744; c=relaxed/simple;
	bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkLhgc7djhqyTx3YD/xus7UtqkZ8FAzp4wAkq41GZxq+Dd7S0kILE8cy3DjtXwQE8Yuh2UjHwS7kmYf4HBh9twq3N29eG6uEpuxikim3FW5dj17Wi4FQ1NMgCw11f4YrWQKI39go0q4fzADpn47knvolpHQ8+YkdonHeHRbHbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z50z3HOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUu7H9ty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z50z3HOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUu7H9ty"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWqME2563406
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 17:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=; b=Z50z3HOzRF+l/Qhv
	VislqZdjWmSwV0v8IQmNdsfoT+h4BV6lQVYsrWP1GJKAJlvPARMYO1ql4mCelWru
	axrQ5hzC/jFjFtgv+kzHWCcA7bP+cfRJy6qpsl9bkQewqBD3+C1UBc/NPEI380py
	DnSqC5+PhKPs+Iue6ypb0nt81UD1NI2mHH/YLdW9Jm7dWI5NoPeCpSuBeryd9nFA
	uOa2wZOuK/r+M3fkoioVA0l2ngpkiiH3I3iSK/HC7u1rrg5++amXa40bHt37K6uO
	k0TkT9VmKLHAWP7uooC/yTy5ROtiwdyOCQktEzu5sFb3jglejG+vVhXBtOEjKfDx
	AFZBIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gna0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:39:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso436031cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618741; x=1784223541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
        b=BUu7H9ty+H+XWszlCyWpnuyPcqgCzHaQfLh0D75W213KcR/oZU+xEHlDnBTPremljm
         1Qnmz0Kf/QTOP1iMKDxAjL4K4cZq3YTgvrZiwA/6DMAI7UdkBJz8WFJeOhQMfsidPDhL
         c5klZ15bBu2p49PmdHXMxtOq0zOvjRQFKMowqhxOYxUX0+YRg5Y9b8pCKWgfiNgejbVv
         GPQAffGGFxnfFQiJ4XS+/ZY6KTCqhWrbjvHHYzJdlNky6Z30sY8cXrSY39Bzq50GvZ+5
         6c7m0b7qpyAmOJ8MaI3lEPk1CQgCGjscFN7zSDHZve2DF1am7P75sgEApUzAIepS+jwI
         TRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618741; x=1784223541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuXlhN9dPr+D9+tCKUy0eiu9+qslbGdbS0eCmtIrkhI=;
        b=NAWj40L6kYu7dDvFdKUplAYhN8VJ5Bt4MgmFECr2I+HDOio34qq7cVWV6go1uH6M2s
         jAjUZAIOTWFXokZGAewFWTXhlOnTfZ0dVF/IF+semtqmhXygPc+tWcOHYRHWe3FVOsXt
         IXrDwbEZ6lZBBvEBFKBawnL558tshdjsbYnN4yl0O6PLbj+0QApa3AsZBrOt8t1G96Qp
         tbIyJcaQGjIE0NsY+N7ILaJdEaf7f8y0xK9rU0mwJ2vUb48qevL+u0KVnxr5HAnr7QwK
         iTAuV2T6+lra2MrU+emrWeDVIfrWiwRE/CsG5QWjlTHnYK8or9j2STJPSlLWIMayi9oj
         qg6Q==
X-Gm-Message-State: AOJu0Yyo64+gGKClWvkVF+pNs2i7agzRuXM1QCAX8H6C90+HHEJn+6sb
	ZRZaZIRjqjTRLFPpnNKp7AV1V3P4P5RLmK9r4YzuUu57Bu+nH9Q8sdwu+ueB+UP/nDs0rMPzY9r
	0GfL14qP4EPGi93K8dAt73dan+4UwaWFyN9Fa58ctYnOtBDbK91RWYxFPAHxcemdudopqUyUjW8
	Dwi0s=
X-Gm-Gg: AfdE7cmCGQxFfr1EmMB/rfqccIODYEOl0hTeE2+BydkgJtn13StiSVRdixTXVhDa2uI
	vOTssOwSfNhTVC09uRBDbsQFXSEx0Gwxu0xIqJkjw37kpVOexV0zdSXZ+oMcR1RO5a3hQUhS15G
	5v4e4/QBocYt1ueF2z9ouuNRihByI5H5LadSdLHiKXI1w5WaAaUnCk0LgtYiRQkG5WJ7y9XzQQi
	j66o3c+03dCy6VBhjdtZf24BHrETrpCYiE6S46T2/9cGfEDZXFTAsskFukdEtBrw15l+5MBtkT9
	oECGKbKWUyn7sfLoRumKN2rdT3p3soYsFFVVpME7lGsFSsWJnEjGFMVPugQgixqwuIl3dQcwxh3
	hcPy4yC73rg4db6oawP2jitwIUhXXJIeBthAhbOc=
X-Received: by 2002:a05:622a:1448:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-51c8b422b0cmr82706921cf.79.1783618741157;
        Thu, 09 Jul 2026 10:39:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:51c:7b12:5fe3 with SMTP id d75a77b69052e-51c8b422b0cmr82706571cf.79.1783618740750;
        Thu, 09 Jul 2026 10:39:00 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm50653065f8f.23.2026.07.09.10.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:59 -0700 (PDT)
Message-ID: <a9dee8cb-d4b3-4267-af83-48dc888356e1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:32:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Add more DTS test cases
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-7-c175e6401150@oss.qualcomm.com>
 <20260708145857.840DC1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145857.840DC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX/7gcyuqKslXV
 Ls6pkfwdZcYroYyCOt/J2tUuyoU4S6xC7u3+VfNi3RCVowsZ1jfZC6E+CDL4ZOLkFvG2auPMD6P
 NrO2prGudZT7no+yOb/HZgukgAru5VpxYhh88Ce/cfgLDVCWMyaBl+vslXTAPuz0VYNHzbQABLL
 wcK4A1ipShX1JEJSUHwlXGrY9ZrdGrli0ezaTBT/jX7mI2ibgUcQlS7XwpFz6JMGE8GNeYUDy11
 OaWNt0rrZ9w84HZ8BbmKs/8yMqETek7e6LyEuo6meV3iXcFe5L/olFdcTt2md6tijG48fNFXdIa
 GdRWwQ8nic+K8SyWXmgwaWJmsy8Nuy7t5eoekwtzpEIJGbzSB0r4SKoUQ9sf8A9YAbKWFvZBj/j
 HmUMX67XSbVfwwWBsNW+cU4TOY5L+56Rnqm2R+vyIss6Oxf+PO7p9xI0wfQ/1hiKpLt9jyzn00p
 4qJ1wZGGb14rIeo7jwg==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4fdcb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX7r4gUv8HAcp5
 m6T05aKkY/qkT9MrAGF1dhgOkA2ECgeBGryvb4643zBxOWEsw4Dvk7pD5ssBpA4GfgCdzTesyfz
 0v5YPYfC+/IgHHwj4kP8rj9yD2uj9xs=
X-Proofpoint-GUID: L9NOXKO9hANYTKt3qBPX2JTG5lrj8iU0
X-Proofpoint-ORIG-GUID: L9NOXKO9hANYTKt3qBPX2JTG5lrj8iU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing semicolons at the end of node definitions in multiple newly added Device Tree Source (DTS) test cases.
> --

ack

Best regards,
Krzysztof
