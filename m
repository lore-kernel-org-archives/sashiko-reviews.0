Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA3423777
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353666; cv=none; b=JUKL451zT+2EFPwPvdNf2YBvDU+pgf5b3WnMa4BP9WbYKtlFAzOTbvQ0KDlE4pgYT46obQVbKh9NHrG5ChQZGw5uruWAL/jrTTG2+2/SqZx9XabsT1Uie+a6mF1P9O3XECEwsIY6CmvB5EOJ70UqKPQH8/BLWOnFn686UuV1/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353666; c=relaxed/simple;
	bh=q6nNbzXJtETtA6xrrhH1irWB4lBSMDLulBIzGK3K88I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FemwdpJtnuG860E7gdT1+DKbZ9EejD0cbNk13GiBk0mEg33uw9Gv4esq93cOaVLUkfzaxfsupYOaM8FLaLKb3KvvD1knXMWrXDibYsiXsn+c7vHc6G3pvPR1orSxzO3GAe8qaIVpBkgqHrVG91oddfRM6U4CYSRs6GAtfwW+yVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zt03F/XO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDvht6PM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zt03F/XO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDvht6PM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFAfq958540
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 16:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=; b=Zt03F/XOM8coNTRx
	gXiNYrhCDjfYIffoLzBJFSaF4PKsQY/1nSO2CFwo/rej+olh/Ku6yLm2H9ADLIxx
	c6hItf4vXwKC1Aeqw1hG2oT+37vK0F5j7cB/vE+lGopNmixECslQX+bJAmQjFUB4
	MwaK8P5TBHHH84V8oU+wr0f+5/KCpuv2zdPcBZ0Nxem8jVYmjcR86RAgE+IN9aA6
	44X4N92CjFG+FlDYPUp0WYaCgfiS0mqjE3tyWjMuM7cO48LwRxbAEYj8BPWYEuRv
	SFmcQEcDu7LJJBhYL9ziEzfnnpHIKOB/I40jclwKWrVNA9N3KBawJNN9hOUE6295
	dYOLJw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a4xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 16:01:03 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a18bd9c3caso4047465eaf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353663; x=1783958463; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=;
        b=GDvht6PMrhLX4Zv+/9qWvFTY3U+hJ+sv3rRlyJdrvCGX/T8GR3AeSYKSLKt/254f90
         T39Hq911TGb7ayGeDRhE49euPoluqUn4inZ5tOV/PO0HloUkwFX4le1hGqh56CtGVu1e
         nepTW8Ps4UF08Pk5A6ng9JPSOJRtfGK+qtb+UPONPa0NpP+Th/8JmTdMJKhpUDIIpMuo
         jFLWf5qE5v3+/seLdCAiKRHuoEBO5Ce5y3HMdaZXbqxvRthmHEO2ANECJFi000MvkS/u
         uCseoAUQVf1W2N7H10pCfPRrtxXapzCt0rWeqq+t3AuP8fEK/V6Sy1mPxZcXHgJelfQL
         7hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353663; x=1783958463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J238hFNtUNH+dPXx6/ncG4WP7PkZ567N2sB/Wwv0aCA=;
        b=BO8r992kZAkV+AMmUwo05F+N/IPy4PmKdkYH0ct71G63seSHWrXDm5jvwB5jlI0Lmw
         weScDjjIa+kRLKWLd5wvL9JyKnQX3RYHrQ79db2YsrMDei4M3XdRMu7sKUEvYv6I53VJ
         gPnjsgeIwc4Vsh0NYziuPz3MVAqz4YgcH7N+055xo/2gjhZDSgqpuOFJObwzEOfmBUDZ
         qdMiOZohWdXoDul4TJyPRJw66mleM+L331bZLcyFD0mUskxulzibtaDGbVD9l3D5XYhj
         2mo8MLAeCbpmCW0RHk90F2L79WKZhH9Xt+hzhUy66opeE7bj61Jesgz+wsLSPSEQYnSg
         AmvA==
X-Gm-Message-State: AOJu0YxKMWxJPg0+sfN6qYX9NeaSgoG0agt9VvUAhscLyglapd16wfrR
	xZgUPnz8udl91rL1j3M1oyk5Kqxumr7+5kJXYE+UemwJqWi8tka9NBYHIDAkwBxroRjKqMAIbq4
	PyUqjzQp6sI+fiteNU19jFPZsTrehq74tv+dbmDBVS5K2JOwjptgPBmu+DNBLhKB9CDI60/8CBs
	dpY2Q=
X-Gm-Gg: AfdE7clDX4q/9S7nOB55jkG0DPsHn6irFDyjL/puoB+i8iYLH3QIAjqM7ktgmL4We22
	Dsr2M01rGgoroBS95GpdkLq9pXnRnYElZkcQ8PAwZbKIm39MWYphiQWNiQKUw9EK9U8qP7PthxI
	bCXapCK7n9S24+vUTh0qvVNqL8EnJR+heIVTRsJhCmLBoXpsaRz5agsMCwvscBKO+goJ5alAkeT
	eJxqH6DtBFE6/78EvCUT4souQFmv0CGHlpXGRvKYmzWv/Kp9AvgFY0a1Ck9BTQIi+d6ydHPxrYl
	VvJB+R3F4YrmBWCvE+hmQA5M5Lx3UNaAem/1X9cEqjx9OvdMpMWHiougFxz8gpmx099h8+c02Cu
	SpLpa68JJUPj2+DqWRnOPYtpiDg==
X-Received: by 2002:a05:6820:190d:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a35559b66bmr638232eaf.38.1783353662554;
        Mon, 06 Jul 2026 09:01:02 -0700 (PDT)
X-Received: by 2002:a05:6820:190d:b0:6a3:9ce:5412 with SMTP id 006d021491bc7-6a35559b66bmr638190eaf.38.1783353662024;
        Mon, 06 Jul 2026 09:01:02 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm488436205e9.13.2026.07.06.09.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:01:00 -0700 (PDT)
Message-ID: <4e4b3198-ac0b-400c-a595-ceb025570e93@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:00:59 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dtc: dt-check-style: Narrow disallowing of tab in
 DTS only to YAML
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-1-03ffacff9226@oss.qualcomm.com>
 <20260706155903.9827E1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706155903.9827E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mxo9nOzjqzm2qgeLuhNb4yfuCixfY8Yx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX6VMH7w2LXbQT
 zwqqawmOhc+V4S39I953j/ZcSeUVAZfrVe+qlJlxrrrWjvycbKkcQXDRvVRJGrp1shr8jPXTU3J
 E2PjnKNNcNdGiVd5jSIPg5VoQX70vzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX0wXiOd42IMN0
 4BqNW+VgNqB6x8rQGMd0CKt3bqZ15dZECNDCfbagBgvlJ80uZhFpJM8ncuu3iaVTbeNqLo4kcV+
 CKoOvM+9mXXqWOTkhKKRgepno7BDbhcBCVX3JVJf5XzN2cHnlEDibMAIEQECl3/SlA+XMXxPFKC
 261jM76hL6eChoOxrJxHJe/4l6cpDDYRtwqAwaOOZt6Sf5YDmJdJbEiH4Lz5twxuX0sYqh2HiIS
 Sgg6OraKp1ZN94HwmcpB9KjqEw0gIfP6dZeKHZrNdAN5uRcJCRAQ4sQSSsrCBb2dWctEjLrdTsw
 2+7kDiUDtvQt27KTGpk1smOijr+oCGejWfO98MQMyVvDB0NIjgJJY5vtf34rwH1rTR29lARe4c7
 RlDg4g/THJsjv4OVCtExSXhaLFBBPN07CrPY9wtVNbhE/qB4pGjOWj1xKAWgJz5xKxaqyTSdd3A
 fsHwzzk98l/mwvfBXww==
X-Proofpoint-GUID: Mxo9nOzjqzm2qgeLuhNb4yfuCixfY8Yx
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bd13f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=wuZ5MT4SbBbAavK90vAA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060162

On 06/07/2026 17:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit renames the function `check_tab_in_dts` to `check_tab_in_yaml_example` to resolve confusion, but fails to update the user-facing rule name `'tab-in-dts'`. This introduces an inconsistency between the internal function name and the rule string.
> --
> 

Ack

Best regards,
Krzysztof
