Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADACF38836A
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177265; cv=none; b=aTzib5Za6HGVpDeGCCQUfLVmLs7YKzANqJrmTjaUZ667UEMo4xR0UFG8B2omZ7ceRaOrAnnvlZ3Nc8WNoi73Do7EAx9J1+ak0Jx+oCnNa0NHZlMWa6D/riICC+4/42Yg0EWUQYvS06cJj7HbobnHxwJreeHio8hsY6W8XgKaf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177265; c=relaxed/simple;
	bh=QFBqivRSK+b5b8lZbMDWE3tGj8nAPLHHfK8uo0AM2ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0+V+9iEeG3+lzmmk/uBkTZddTM74gifoGwfH+SRW6uuK3lNgH8UCErNL0wh7wRtXHGjyzvL8YvQZ34JeYVMNskyOUCdnTVOcdSp4stP6/1Ujmc+8V2VEy6UIv/S8jRDCUjDOVmDg5uZCOXjRYto8IfgA0jMsEJ8eCDdFnOZNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3PIFbZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5bKsnnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3PIFbZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5bKsnnF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wDMQ1666685
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 04:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=; b=N3PIFbZ/3CUCcwxl
	16MI+DEbGh0CUVyBKXpVPhXje0AmXZsbyURZrdMZMvvPXLOa0oKQTHQ6sOj4yPX9
	QK89Fh6lCjN0tHEhbEbfhIEPsWd91NGwDcOO1BaWyWhaBkZ0KJ+RZAU43W9ctM5x
	tj6YIbtPz5JCI3CXXmPglPYgK8UQvmLukdW8AvtTFHyzJ0owR2C2P3TOrk4QWbUc
	9jw2Chi5E4YehjMoiDcHy4zWpFRSwi7XmCsB9sz7sUEn+1aWBGyMntCzCOVZfae4
	egGvzB2Qc0QRMt2giRDLXrO642d5xa4hYu8ogBWzKhBcWpXljCdCI1bxyvag5CCn
	QUKTqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w8p4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 04:47:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2831471a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784177262; x=1784782062; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=;
        b=C5bKsnnFwvwrus39rayLb2c2ouenFt6mvCD6H9EpbdgovBtF2c7q26ZXLvI7bKKD8B
         tka/5BYH/n2nmdwoLeLfL+qyPDD9ugqBm7f0vA205RN7lNhipLFuHE+3VC1LXy3W73b5
         Gt2B4seH36X04vp9/6qSWjRIh4ChhYqoD9OelAWlzVj8lppIujyXwmoD6K2Z1bDOXPHV
         CUvekwOKs1HwRixnhl5MwbwLlg/xVD5ZKu5ceZfrEz8XQsz5977zKgZwl9nwgsVbVeSy
         lXu46uqPE2cboPVwH64U+RHSSD++Xg4Wu6T1qb7i5hCdNj6cxJsPey7nM5DR7n8OXC4x
         Gwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177262; x=1784782062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=loOpCzqjsjnFx7HiodnSeQ/4o9fRjT1O9t6PSz8WUG0=;
        b=aY1PMNpJYr0MfeN/opSjp+acneKhWdT+ydYCBgK/3BGyJ/H4ODGBmxmM7iYT9DVbOM
         hdBGjtA+ap7nQlX05paBgMg2UzQVuWd2ylUrBiUxRaMHlc/YH63dfH0qBxIOYKQyVaQo
         G37zZ6HhCpSGtpDdSg7lP+kb3cqvLUqL/qH4asZqs9aXuQk9poIcG6d/M6UllwMRghSI
         B9YPYWd3kx3xAkv28w5T9MPHYX2kJ+l5gk0ND6/QtPyL7ra8zRHZHeIByVibp3FEa9I2
         knk84Dho+82rHogSMC2gyFkfI+ErbcwLJqZK9/2kolhQDm9snktGY1KCh+mvqbGA0iEn
         6Png==
X-Gm-Message-State: AOJu0Yz9RclGKrDW3ZLDizGd0q7tmsPfWQe/+NREi2V5se/VGt1WaEJQ
	cecyuDARDmA7ElBXQKSh0DUOh4xj59XOGRWHpIY2M3HBCUbc4MqSpPdLPMS3WwKXC+f6VMsF22F
	qi2fMGA/HBR8VgJbB2DgX6korHS899NEK/WY1DoNAzIstsoZb9hU2dj9BO5Rb9cyRKfR+p4MvHx
	+svbU=
X-Gm-Gg: AfdE7cm+2lcl9rE8BGxRdJne6AO0t0DE23q/3+8ib8KMBe+vHiZyq8NWiOil4CGNjhj
	e2JVxeUIvBMfO5Y6jS6xjKT1z2xq3nUfqngzxrXtfuHcmAgxgxsqLcrGtHXIWft4eysuBbDWP7O
	Z20ux6bQKkuWgrZcGBnkTT4QtVY6jiZeEjRehYB6/QRDfKZ/knORYmXov0fJVeEuhEJKGt+U7Ey
	v45MNZUF1Tmfycrs+qaMreTPh9A4mOYiRQf+Iv4QIT99sieTrXPSb3diE7np8U7WZN1X2qNHqzi
	Xata1dEICgupjvv/7fqncpQiXN4RicGknUC8vbZAaB16zafrNQTtArFsHYjjQo+mLCdbbcxZQcx
	ugtCKP1aRm2b1juh4O2wLBLXh0yisID/B
X-Received: by 2002:a05:6300:218b:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c110a74745mr21950047637.40.1784177261907;
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
X-Received: by 2002:a05:6300:218b:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c110a74745mr21950022637.40.1784177261458;
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd403a7f7sm6422098c88.0.2026.07.15.21.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:47:41 -0700 (PDT)
Message-ID: <5526ee46-d31c-4f01-ab9a-71bd831d0193@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:17:37 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
 <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
 <20260716041531.83FED1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260716041531.83FED1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58626e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hYeTZUUZs7jKy9qBROMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vLbfRo_AWmThDgSB7R9jn-1rbUfDlUMO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA0NiBTYWx0ZWRfX6NA1eoqX1flJ
 Fl/+rO8k3/fXstrPSEHxuOvSvPEJ7HRxR8d7fM0uBuWDTzVV4MP+oHfUBMs6LIlMTxHjgXMpWaU
 n1TPBCGNW5CbjwRgfy7boBzyP0/2LBk=
X-Proofpoint-ORIG-GUID: vLbfRo_AWmThDgSB7R9jn-1rbUfDlUMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA0NiBTYWx0ZWRfXwNC/PNH8Z7GT
 JxB7Bqx+vVZGVaUSLJJVgQyAf7wNAu2qp8m/ktSeszvgg4cH0d01Hq9oS0ig/cs78RIb/KS2v3x
 8T26dJLgnTwrzpW9uGvVOYuQgXkfINJ8Cx9HuOSvF34tiYhQ0wiUI3HHPpItBSefYPDB1cl2Y2r
 J/MFi8H4Ya10yYQGscZUpioHQ0hlfoQUTEm0U0BYHM/7L2L2EGFxEU9txrDOEXk4bAkZFvnRmVo
 hktRhPmFZ0WC8q8sk34drWoxTToL2dcnIlYsU3y3WPur+LP/0A0nMALAG7pd0vby2mnNS3aqiFP
 r6E2OTTLPaMSMDBPdra7WIeIERFYELYIEenOc8cViLyr3r2670waR4UakY2T2xMsbJFssX/68Hz
 z9e4nrAYBcYbFIpp3bk26th3OLMSgmQ7hnG1mw9hS45nwvyVGrjX42hQEg9fpYDzkQ18KfIf+b6
 R1D1iMUFY+GUobsanbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160046



On 7/16/2026 9:45 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Spaces are used instead of tabs for macro value alignment.
> --
> 
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller ---
> commit 1f9a58072beaf3de6334360055c245542fde73e1
> Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
>     
> This commit adds device tree bindings for the video clock controller on
> the Qualcomm Maili SoC.
> 
>> diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
>> new file mode 100644
>> index 0000000000000..ae52686639db3
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,maili-videocc.h
> 
> [ ... ]
> 
>> +/* VIDEO_CC resets */
>> +#define VIDEO_CC_INTERFACE_BCR					0
>> +#define VIDEO_CC_MVS0_BCR					1
>> +#define VIDEO_CC_MVS0_CLK_ARES					2
>> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
>> +#define VIDEO_CC_MVS0_VPP0_BCR					4
>> +#define VIDEO_CC_MVS0C_BCR					5
>> +#define VIDEO_CC_MVS0C_CLK_ARES					6
>> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
> 
> [Severity: Low]
> Could we use tabs to align the value for VIDEO_CC_MVS0C_FREERUN_CLK_ARES
> instead of spaces?
> 

Will fix this in next series.

Thanks,
Jagadeesh

>> +#define VIDEO_CC_XO_CLK_ARES					8
>> +
>> +#endif
> 

