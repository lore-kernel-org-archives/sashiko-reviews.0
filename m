Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4663368AA
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939099; cv=none; b=EeAT8RaEuyayZHqE0ugIXzXe8A6fdU5bsDPkUjmcMMuKdd/XeE31bpmVcJT0cfvw/awqYeECAZj16hXTEf7y50knSSs8I14VIR2JrTr2yPZcoe4qsxRr0N2NbN1G3and5ySqouK7bco7rnDp6yXALmKaEJ71AxuotsWGwFPH4Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939099; c=relaxed/simple;
	bh=PerGdR4tvhaCn0d3HEjuWPNzUn6dNoxrjJS2v0J3DjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdWDN33IrhaL6XTYTXyEWh8IjZT4gUWgenmzXG1FIxxC+tD4sO6TU6hEay3E+gdqH+tnrACkxcYlZW9nB+2tiFUhkvoFxa8yxQm25XDAD/6xWIHHjRgyYMl6wnF1fENM99CMGYT5k6+VJIp7vTfzJOq4hMMPJf2lmPgQchgEm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVjhM9DK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QudMIzLW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVjhM9DK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QudMIzLW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ubrK1089640
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 10:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=; b=BVjhM9DKatZ0wnO+
	ryZZGokaXoG6hwDnyjlSJt7eHV45Pa9qAEKDWENw1lnLYnOYxfD0c1XtK6mnQxmR
	uKlnM5eggD6ogYqNc60gAgeOkLFyFQZces1UDfec/dFeQzu4Aq4un/ijpyMAN0jF
	OpFNzy4eodwZhAHrq+jXXP6eN7rSUgE3AiPMXfjKaylubYJtJ8AWtQWZHOYSJHsB
	JkOFJseotLZUepv6XwMtPIIn/w+YbucKezLYGn2TUYgjBlLDgq6/dhq3uc+RNktm
	V7e7CG/f8aHQRBXXGuQuB45uzs3UAfvK27gfE4N62ti+VKpr1Wjlaw+XLJd06r8d
	PL2A6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r527-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 10:38:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38de0739ab6so1159348a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939096; x=1784543896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=QudMIzLW7rv5Sy6K9bSpOGsals/zv5JGDe+8Y9ka/Y+BpOy9CBvO/ARAT1AOyqyBnk
         ubhYXwQI35uGTXAab/Gc7qjknYi2uGpkKbRGzwOiiT67/6BpUxfB3IeU96pUkMWGkg5t
         IVDGJbzCDgfC6RMkQ2gCkw/IKhmmRPIfiVjIdDVSuf1vujF5gh3nui0iTwIlo0f7hVmn
         NDR7KAM+vyBoIw2W7Z1PNr0yO6vLhGPnEMqnYq6LeTFDAdhCfM+RETYTSf6QXYhdYmlF
         4Gh8CYb0ItcxQZpior2aOrb4SEb0QcJT/+/ONYfth81ZrxDEOFdxz4P+0RhBLZ9OlsMw
         QIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939096; x=1784543896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=euXp1hjDl/BzT/TENzlX4UlT3+K/PNxT7+M2ryBRSaLQM3qr2ZFTm+067Vqi5oGH09
         3JMIDPg9HlzzaN6AJMoo3H4h5/9BGddBL48aJQIOLFVrgml/ZBB3xvvjBYyPVSj2aWKp
         OesJqSRUpE66vY6KsKZ/OP5LAh8NFZyl+oYgWKC4R+LKV3bfD5oMS39HNR0KlTxe9rVM
         LvLMjTi1niFxgBMkh7n8FXQCf1s4KYKFcSoa20CYfi/niMlKkhqHW7p3dsx5xiPVliJo
         oXXDVmptt8QIRnazBVRhkNoD6jLy4gzacvp9HdrA3o4VbFRuX3iIQfDLmDOTrdyl2qZS
         swmg==
X-Gm-Message-State: AOJu0Yx4wTlAuv1R8Qa/AgCNX1V3M7OMaXig+6E7BeOUAQIjFjAvQUpd
	sL9PgvTDRhCjbdoS+x5R5/mplyAITZx5fB3Z1s+X6CnF/coox9EqGzOoVc/3JNGAzafT6O0g1X+
	lenip7+v6A19lbhqUX9dq+OqRho+g803Hv+gKIfGg4jtxnbJw9dzPOOqq2RNZ3hpFURoKANhXCC
	ndj+g=
X-Gm-Gg: AfdE7clmNR9zxcSOzQFbrV/Qfj7QOMw5mHyXE6AYyd1PIxWM/cqq9J3DYwj6iUvypKe
	yQ2AMu2cmwa/2u9P5SrC2SsRFhtYyu5lF5RZz/yBIYyt8Vs9ofMA5Zstgfady2uNf0Entz8lx7H
	OqWnq89Pmwx7b+xr1w6o5psFCF/vszfHVln4ZmGQriMLXo+0NkK6q/0bd/z+aKlhMSBfaR23q4p
	S5T2YrgutVPUo80CmoMzkVlSPyx8eJ0HqJcHNlMgjv8sJaQVCYBD24FNMInAmVqsCYT9SVoXmmb
	YYWuU1vBedCsvmR/jOaJlbgaPq+nzr7uLY1BLwlthn7R3RviJG/FlkXe4I3rQIf4iYIxhPoVEQ0
	TLozhUyNI7MVhWaZfu2209Wy30yTWU87KnJwyiw==
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508855a91.8.1783939096432;
        Mon, 13 Jul 2026 03:38:16 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508811a91.8.1783939095990;
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Received: from [192.168.1.8] ([103.211.19.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm64789674eec.21.2026.07.13.03.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Message-ID: <15c00c07-a5a9-4413-9ba1-261de775d3f2@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 16:08:10 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: sashiko-reviews@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@kernel.org, devicetree@vger.kernel.org
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
 <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54c019 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PqZB0zJ+pwaroKfoAs2U/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=hEZd4A0f3F9c55QM8isA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX3UgHYoB5tV83
 eSGvhUbZlNHzrHdq/E4jzAMX+c0DQ1CFgw8DVwMoWL8/QqspA1bTJNMbH9CsSna8Bj+RXllCpDN
 zxu2jshq9Fs0hkj/oPbJq9vDb1WcaQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfXzGMMpDuLgsiE
 rOMLadJINODPbjwZ+jxXoY8wNig44oLhKJMcBqtxM/+kUNLp6kiJLvX6agxfKfA+kYsJEyWAc/a
 al+WV5QKGuNEjjVF+kggTjgH0qoInez7UdvuM4cnWNwG1BYNEkFN1P031J+7qfHlJJigjVWxlpy
 D0h5oV4C4mr/fKhvCN/TYbmz4Ft0J22FfUG5e8ZtLsWsR/QiwXffEiNEM6x+uVCj7uTJPNCWd9T
 yYX4vJ74+0Mr0fjTRvI9pDgemCGhlqrBUlo5Xgf53vpPgcM25raEJFwdHPDUHxY75Susb4LLFK9
 BcW5GnB+3If3PTEQXUVP6OQI3rzA/qxIRBk6tYbJlbFHpSOpn/+1ViaOX5xRgV03W+s+tL2/UR4
 mmM2DJMQj1NNwgPkj2684orxxEYR0hXXGsWjF4V0IkbkLLtEKDj/CNsXTU8rKUXQypuuK/oLQkt
 3VSXjfAXS+YvioWIQTw==
X-Proofpoint-ORIG-GUID: c_lzUKaSDUbtMpbhtnRc_pxqfmRyrpVf
X-Proofpoint-GUID: c_lzUKaSDUbtMpbhtnRc_pxqfmRyrpVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109



On 13-07-2026 15:11, sashiko-bot@kernel.org wrote:
> This commit documents the Shikra Camera Subsystem IP, using qcm2290-camss
> as a fallback. It updates the compatible string list and changes the iommus
> property to allow either 1 or 4 items depending on whether the CDM and OPE
> blocks are present.

The oneOf was chosen to preserve backward compatibility with the existing
QCM2290 DTS. Shikra requires only the VFE SID, as discussed in v1. 

The existing QCM2290 DTS with 4 IOMMUs and the new Shikra DTS with 1 IOMMU
both validated correctly against the current schema.

Hi Bryan,

A gentle reminder to pick this patch for the 7.3 merge window.

--
Regards,
Nihal Kumar Gupta
