Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777603E7640
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316743; cv=none; b=hQbvnXNEpAA+XWNBMahtNcPwmLJu8KM3EGADBx9UvGYLeCDa4DV+z4EQCpZQGUAOdkb14LhmGAL8UK4o989otyrkoG8hjF/G7NLbN0vB0qvO9afO6mHPR8YuuPSt3MP1VZKa20iW95RDOtj6uO2SpxNTC1zMtyf00xnFQp9Lk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316743; c=relaxed/simple;
	bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZYxp/h7cE2Mzv5pjpTckgZRi7GvKOpFHuNegx8rVP74lX2X/49Dig7QOWLWN72VlSaMhvzsvVrHvka1jroOi74vbnu2yMw8mb4akr/LEQH9vr5uJnkO6eazD9hLRbAeZYoXA+0OOorqxF2MJci3vjeDHWbQuUYxN9agoImfFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLlENdb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEXna4u7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLlENdb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEXna4u7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YnUI3532398
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=; b=HLlENdb2HreD8MxM
	xVFAgNT5zKLMqfiqNt4A1Lp3gs3aDZ+M+MECdG/pY13hoMR66CmowHZh+PFj8tRc
	Mpo89OABJifDZZRofSykmaYK9BGumZpHbqs+j4AzCtuFlMsFXaq0IrOYig+zmJlI
	ov/O8kWejnbGJ7+TkTcPgrDY+ghj1S5rBMjMJ/UsjQoDzo7Rx7YPOh9ffMQ06k3l
	KfUlzdXCMpbn4P4eJRZV+eWjq5wW1lWBmBWB1FNwztfu1C08LfcC5aWlpwEgJ+Oo
	KKmo33tTziC5uCnoIQaroVeCbAhvaGlHWuMKyXTZVJ9jrS7EGwkd/Ovyegll/Niv
	jEHvog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94k9yu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:12:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so891431eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316741; x=1790921541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
        b=HEXna4u7Ph+ql9jDK6G24RYKYg2Jn4m6jWT7doZT/k3mkwyAeczhub6TxkwEYZy3kD
         RbvzsKfuf1l+d37waq7buIG56gbJByZie8BOgv9550siWQrV78bnWWzQuCZbawhQuZgP
         1Dywz9mKyEmMYlEond8L+thabhOVq9R2HxnSL2Ki4VD+XculkyzTtBoJJf52Mv9U1dkx
         jngkWM8zeMNO22+evR5gkWcq9/Vxu0I73MZhKKo1+VSwazfANwmV4jokzT5+prsyW4k+
         sxrlsgJ6j1DINYB1CbmjnygzBd7oPxVOoxvkqtXLFAtGm4GH7Z6/lSvUAh1Fovp+2vRa
         tnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316741; x=1790921541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fciIkNekBS3q2iFKXDGY0NwusmNL5IXf3wGh4hTvcDE=;
        b=DFV5EE9NM1qheXpvfZ+sFtQFv54+X5/xgs9lJfvdYnnH8qE/vqELm80olXsrUg9fq9
         z/qHwzDGESA6lz4cgO4tjqAZO+yakF27tVtBseuut49BJZ4PgpIb3uFX9mVoa9jyXw8m
         mTDjcfakc7oHneGL1bMkRe/riOR3lPOVtJAilbRf8V5MbEdBPna/uT+1rIFZ44mGyEen
         zb6TT/jMp59hfLO2dQuXvycYi+7bMPfN/QQJ7/KYU+cAi2IT4XSuDBYjDu5Ybm5Uq10W
         vc2A29ofWx0PzIVqr0dMb8oDLG/7OqcWhnBe8CjuMm3D2FDo0S02Q+TVR1/OjnxK7OaR
         hRMg==
X-Gm-Message-State: AFuF++muDA66+XN3yT58O0bp6z+foyYnAVzkqHd3e+1o0LljIr3h47bL
	5SN+fBXrC6vLDFhyt7z1IkNRFTv59b67dIxQPKeDXVVIeGOcZ4q6AknkW9NZUQkwcxv6BgHE4Dv
	5RckTr16FvrDo/DWQ8+TQRyfwH/bGF3y7JQi5cqfc1it75vKNHfylz/IX8Jp9YcgHwNV9saoku+
	hBCFg=
X-Gm-Gg: AYBFou0eei7MIECeQnp4avGmmeiDr3tecUKHNQYraJ4VMS849cNZWfCONtEOA08Gbcb
	Q+ePPAvWi6OJitD4zLslkfVRyJkjZygqyKjp5YSQgHHnjlGWX35ZaRbWyJgAnDQrOLNyvwfumXY
	18SFDT5EiqyOfKz/9EKj9wqiM/owwygXqMPpZnt0HG6Fb2XbU22cr9a0kfu+9oggmw+r2wcTBPv
	m/+Ju9cImrXzVRLghSvn92OfGnpAJNZB1H0ldqynofjnywFR0B9fOxBukTMFvhiTNnlNjMvtPNW
	gnQEe8RWnH1I9TLXKV52gc6mk3tTWSyBNcB4ROCTeg0QF2CimqxE9ve992frEUFDsZLa27AoAz3
	2e/BQRRQTOzZGDgn5LDpXzrxR5GA=
X-Received: by 2002:a05:701b:20ce:20b0:143:50a0:56d6 with SMTP id a92af1059eb24-14504030beamr3566057c88.7.1790316740641;
        Thu, 24 Sep 2026 23:12:20 -0700 (PDT)
X-Received: by 2002:a05:701b:20ce:20b0:143:50a0:56d6 with SMTP id a92af1059eb24-14504030beamr3566013c88.7.1790316739758;
        Thu, 24 Sep 2026 23:12:19 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm4787055c88.14.2026.09.24.23.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:12:19 -0700 (PDT)
Message-ID: <8f341b4f-fdbe-4206-a5a1-23aad375da57@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:42:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
 <20260925055837.EEBB61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260925055837.EEBB61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab610c5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=JhJJWNIH0-zBFtMT4mAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 9X0e2GqgTQsuc9HvxicaE7LO6lhJDUDd
X-Proofpoint-ORIG-GUID: 9X0e2GqgTQsuc9HvxicaE7LO6lhJDUDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX+j1AslkLWEGy
 BhVII/SVrWmhvT09EnbYG0+NhI0+8ZxRkmp0d3ufSsllB6RAC0qMiZX6YrUtxn8DYl1foiExkE2
 7X7qvIhk9lJvgoWfzBAe1N1Ju39d8E4UwuN1iEA/vf22PyU2UjlP2XcezoVJ+NRw5wY9a7RjhoQ
 rXvszGBt03WP81jsM+cp5I6LUVm9y/4Tt/mOPZLKhTa8rftut6sAH7RshjJgXG77w7nUNOFs2ZC
 zhecrDJSPsnhHa/Ev3FgArldmuFpDYTaItMIeez094249WE+yfy9rhrHAVw2l1eIub+xXRZqRcw
 Kt9WrkyNIFYSf9GL9w0+wPhK7mCZTutA3KTP5iTpaQ5lyiKg6HR1JblG0lodAPleToW9cRxOpwH
 cI49iH3YxN+W9PQmYMtB/n69gk9WCMzmug2HlmnjQBu8SG27bSGQvq6bwE3G7pP0tpqZXsWVdk1
 g4al4Gg+gIgWTLFFFKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX7/cTbmPo/2ls
 Obv76IikeQ1AQU/mw2buGQ0sR0HhpfevSXNnTpxl6H860Whc9UOgZo27oeIjpE1qc1blMytg2Jn
 m5veiEe/zCkPN5zodqNMNs9sRTv8qv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250024



On 25-09-2026 11:28, sashiko-bot@kernel.org wrote:
>> +
>> +additionalProperties: false
> [Severity: Medium]
> The commit message mentions that Glymur uses the new PHY API via standalone
> phy@ child nodes. Since additionalProperties is set to false here, and there
> are no definitions for phy@ child nodes or their associated properties like
> #address-cells, #size-cells, or ranges, will this cause dt-validate to reject
> device trees that implement these child nodes?

The phy@ nodes are standalone nodes— not children of the CAMSS node.
CAMSS connects to them via the graph framework (ports/endpoints/remote-endpoint).

The ports property is defined via $ref:/schemas/graph.yaml#/properties/ports,
so additionalProperties: false is correct and won't cause dt-validate failures.


--
Regards,
Nihal Kumar Gupta

