Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F0381E9A
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785990599; cv=none; b=QNKX74cXPlqVNzuJ2uhphNmXl/Nl44gRxtmeffMpgPeyx04QKsRkrMiuUBwC94wwsrto3Z/bjaA4y4WwFNIPk8ROv5cqfvrucSGh0nVHNpVzgax4BXXplCaOwUcG1aLYTy3W7Y3/JfXgEbU+GzQvxHbgSRsHQVEsuMP6hMmn+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785990599; c=relaxed/simple;
	bh=Du4Hbj28uQ8JJYIXnXrB+2yxbx8ntIi8t57UVqDBFe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfvQLDVrXF8yS/Xknc/j6PH07hfBzdlhYYt8KsW2QEalc/XpFv+wZqn2fVPfaCfwEG9BOaPNVbYtAuZFwFBzcvx3f/eHLTB5cMpr2M70NL8gVDw2K+ZHdr6spWlKK93gSp1ZtqCRWff37QsT2BzE4cRF2Z4pweMVE9Dw0qzo1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuzhkvvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EreOuJ5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuzhkvvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EreOuJ5B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb0tB266900
	for <sashiko-reviews@lists.linux.dev>; Thu, 6 Aug 2026 04:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=; b=VuzhkvvNyy4VH/OY
	uWLpUR+1qYHaqf0+zQbM9t27Z2NzBfEFIRqdEe32vAPbTIuy8PYoeD9SGVOGMwKf
	4BGTaR3pn0KIaOfudSWnjXztsNVvJBg3VZKDTSNglbTOFGxCSGhSxFv5vx3iCE6z
	b5c+RBKdNWzOvlOVT1PWOtspDlhNRDjWYNU0NJtWqYxki7GYq7OsMvTgrWDvjr+6
	mqbRTam+h2VtKMlDyK9TfI07KGbYegijszvwdnO3k9WjghYtD/081ihq/ZSc2t/K
	/u0vt301nBkjlbQiTX5REmxD9vJhNeglISOMeXoFpk+trCg5qQFAZSHGLHWeGIG5
	Avk6Sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv3w6c1st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 04:29:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1370494a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 21:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785990596; x=1786595396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=;
        b=EreOuJ5BRjyjD2sPda7b4OUsolbFrVQ+ZR56+a4B02L1YyhUYpScyexJ1e/06UmDRL
         LdZSS/PMi2tooj121dEW3mQjzFXxUXWx5bLst6Z162HFjmKNXJPpcASSPZYDwYI0IzfZ
         eqUlXI8K+dZwKsibfpql2GMs+IJqgD2tzC3z7plKlKYojtT/oZ+a6uZNOMeiDr/wxhRr
         MrSHOUpZIF9WXzeGNtdnG1Km8f6M0u+i3cNfKrNBZ9Xhu5bOzXNP6GczoGXuJxfmIOCz
         uu0EGKkhjgUAihqlRy/S995ocX4Lj559IEc/rFKi6Y6bE7mkNYBOoEjqktKkq+kD/zyY
         dI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785990596; x=1786595396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=;
        b=fs1CzOaRT64aXC+cUXSZ8FrZCY7eSG2un1VoSc/TZPYpZtROsr6R9a1rTVh5z8Sxc8
         zRcByljvgIZR/IECNPItvilaQZtMvLUxjb27G53x65nXIFXoYMccgLcf4PbM3DiTgpWD
         sK8pgppSOkOjjyXIdqK7es02ax9xN6iCCOKbo4OmxhuvQMY+Ek+GrCXzSgJOlx45iuVx
         ClwzEANl5fYlCs+VxBpuZUHNCsnu+8h03L47ARpaAQNBGaQEY++hggT6YLOWXXuzG9kN
         8bOUt9Lw7603Aq/y6qxEAGKrpeR8H99Gw7tJG1OpYXqcsqgyVptqeAn92lCMwT13Ikq2
         PkXw==
X-Gm-Message-State: AOJu0YyLU0uAl+092UlGAnlVIKwyjaFSHFciFkP4wL7tpdmBha0b1dqh
	FIM60IGDvZM0UbuohtKFF60chQBQdHifUtMQXrOI8uYErqcL0w+L8fXmMNz5JQHgs1sunibmzpd
	pdwye57BG9ce9VvaT8FinRiVEiMc6onptJfrA0hZWfrlqTrfDAZsZxBey3fV82TsGWvum9V7lvW
	W3zII=
X-Gm-Gg: AR+sD10IVwc8s6OywPJqpyv6f5+kV9TzswFhcV7QFKzUbcTFztvdkS725j8kviYi80k
	A/KP+5un9lvGpuQ6IuFu2IkMpiXKP1wH1VY+fKzNPGaH16DtcP7uJ8aLd/6r5/85VPa5RgLpl4s
	G3fcSrJLWvzT5jvhBdb/mUcISE7TCScINnfyK2J2K7BV7CDP2fQLLGmWzw9NQsBtaloJvjO7pjT
	TghCx+skcMp8l0RG8tgstnCLCr2YaKoYyhNc3gLQ63aLpECOKty0dUZI7Mkq8Ef5US2CCQxjtdy
	XGWzBazXMGqNJQLG3IW6B5rrsBqMBpy8DfRAqN/8bemyTIpfBUB4rXAonAewZbTEIS1gj9Rt4J+
	vbEDcgGrTB6/MkuY3PBTHWGXpVgsc5X3OBgbT5FsDusXZcOcNAfsxXpEJB9zvPgCSHSnJ6RikEK
	FximeCSkroZ/i9
X-Received: by 2002:a05:6a20:2589:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3cb85e9415cmr13011391637.22.1785990596231;
        Wed, 05 Aug 2026 21:29:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3cb85e9415cmr13011371637.22.1785990595745;
        Wed, 05 Aug 2026 21:29:55 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673bb38sm24013042eec.14.2026.08.05.21.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 21:29:54 -0700 (PDT)
Message-ID: <f7ef45d6-c530-410b-a66a-22411d5d9815@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 09:59:51 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC
 fan thermal management
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
 <20260728182653.8F6841F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728182653.8F6841F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YABLh3SpLx5Dc7YR1j05G5UqGJF7SmZc
X-Proofpoint-ORIG-GUID: YABLh3SpLx5Dc7YR1j05G5UqGJF7SmZc
X-Authority-Analysis: v=2.4 cv=a48AM0SF c=1 sm=1 tr=0 ts=6a740dc5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wO-kaS73QcRLlypTDvoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMCBTYWx0ZWRfX6cs1XEuiiaFb
 A4OlfZyXtImdCKb7pptvZXFN4+1TYgC/A5+ElWiaGnwKpcxofBqE4rcWrDLXTFWduZnH+AxmAAX
 TAlzt+rRX3ZPZlibFhpa4gXZTujr0Q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMCBTYWx0ZWRfXwlo11UJBOsV/
 H6XNjlCgE7WydcWEu9bxCfpB+TSd7GPltSUIojTdEZDvyrKF8G7jhB+4Ik1G73z+xLVsSYDNXVZ
 HYbpQ1AQwqTf3lmQKOpyzjrw38q8nXSVgQMQgYpDI7xYYROD+wA41qGJJV7gWdEUGE+Esl2m+ps
 9Leo+ft3/VYGyYb22P4EtR1rWAxRfKefxf5QYE6yENCn0rwRANby0EmQe5Iqb5VkI0cmDsf5lAz
 X1lpfUn7ZvxjxazPWxQbQd1NEiopspuLprWa+C16bVTkkJZ7JdUUyTqcc676GgEYe5Vh0Cb1f5Y
 CT6x/BthTMF68U+sPgak5nHsD+avDckofh0VtySD8CEC2AbpwKXzMGOKAdO/o8jcbdjbZHW/dGQ
 d1mS5ntdLYHgN7aubiANO2YBOBfZ2stkAyKjy4s0ftnj7ZEUTXAaZuOvoCvRfhIFUJMqVnNKarW
 ouPJfzcDgcqwNF8207g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060030



On 7/28/2026 11:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `embedded-controller@76` node is instantiated in `x1p42100-crd.dts` without essential base properties (`compatible`, `reg`, `interrupts`), resulting in devicetree compiler warnings and driver binding failure.
> --
> 
> --- Patch [7]: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management ---
> commit 6a0028e3f0e9078f36aed5052ae5c17e337676ff
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management
> 
> This commit adds the qcom,tsens property to the embedded-controller node in
> the x1p42100-crd device tree for fan thermal management.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>> index 7ed4116b95904..b46b67c5e4366 100644
>> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> 
> [ ... ]
> 
>> +&i2c5 {
>> +	embedded-controller@76 {
>> +		qcom,tsens = <&tsens2 11>;
>> +	};
>> +};
> 
> [Severity: High]
> Does declaring the embedded-controller@76 node here create a new, incomplete
> node?
> 
> Since this node isn't defined in the included base files, it appears to be
> missing the required "compatible" and "reg" properties. Will this lead to a
> devicetree compiler warning about a unit name without a reg property, and
> prevent the qcom-hamoa-ec driver from binding?
>

No that node's already fully defined with compatible and reg in
x1-crd.dtsi, which this file includes, looks like the bot just didn't
pick up on that. Anyhow, I'll switch this to use the ec label instead of
redeclaring the node under &i2c5.

-- 
Best Regards,
Anvesh

