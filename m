Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4213EE1F2
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182192; cv=none; b=Q3csJevkQoPgnKRwpOi7NBK9sRMkXelG5yfQdgSiJwUW7zDOL1S5JsBoJUPKqV7HfXNChK+xRPPp2tBNg2HBaAG4tRWBWomzKRtrVobRAuxXkkzUt9SHsHujpOqfACY2ilrD9rUUGEmaBkLkjGB+gUywYwZwxV8OwRs06DrKHq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182192; c=relaxed/simple;
	bh=meiWCPHyURF5vDzlM799sll2lsGfBrKbnf/hnAW+oXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmjxPzXawjhZ2JX0a17UhGctaO/QsfAIODje5DW77EGMg47/oz7wV9sDwNUD41IlrcalwCV6BfvShKmuX1wfHXV3daRce0v91oq60pXd6txHGPa2vGuAJ2n2vkB8h6wHUIQ0okCrqdJus4Ffmr1soQQJao+lMRshEhWbbtqUc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV79AhLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi6RbXSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV79AhLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi6RbXSM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aH4e867200
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=; b=WV79AhLxQEqsZMv+
	a//NZ6xbPX86W69ez5T5GUi3ZkdWx2qDNblu0txR/sCQBTTr9nqJuy+Xo4UvXyHH
	LZu6G1dOi1o1L0QAUwCB95kgJwKxkJfc4f2BmtZG4EsB/EA0xnnjEaWVIVUaEHm/
	7KznTSE8BHljEbOn6QS4Z4gXx/9wnF/y7Vz0aNTrBihtnSod5hKSV0CRVrg1fioO
	EpWPV5IYNppyYgDsb4h0CAq8tPzKkqbvAmeEruArsWqfvF/s7H3aIVu3eyTclb5F
	U7JGKh6eaDquuTHuaQTR8WjViwHCbX2IX4Bf7AGx50xDRNTlh/9utVt2YVgl3OQs
	z56ybA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gxyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:16:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso2132130b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779182188; x=1779786988; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=;
        b=Vi6RbXSM5+M5Rua+0uCQabi42gUlidfZcQiGECcUQlp1fR2yCUi2EH6kSf/am4raRj
         CuJMAZ2M46AJTPK09NyBMEV2oJ2fcbqtH4NQtJI1vkSpJgJJXmx1dI1VWv8x3By+4wKr
         lLkeQr6LbN073wgGQFNBfyzx8ro5qsuN2M+Yc52lME3YJk6nQpfF3+i96lUsIOBS//La
         gr0V+6Ky/FlLlVg5IP9+QIS5hSh3HGdPkmsIJ79Cxnxdv5QKlpmONjxgWq9mR8GN9rVR
         ZjLwrmiUyhwdg7EAwiL6BK+oNzabj3H6JwQEacrJsFrZpxKiRWI4MtuE/9FD4yMOhbmX
         nAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182188; x=1779786988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4jAbOofP9LU2wzeFyGIgRya0ftzPYY+XoOJTSUa8Gk=;
        b=bePglaveC7Mi6ot/crlWXsjzaum7G/7e8kXm9zwdRqX0s1ABERJh3xD45BWB/+GjTA
         x4SisjnDLaQcwrZqs55mO+iBNg+1dpgR2hf13M7fPCSXxHmmFPF9vfZFU7xwJT6Ljdza
         rKF7aTEmSoahbA+l89Rj/P/GoyxYtALWu64fgCAo35UZH9d14PmSHiW7QbmefNOiIaP5
         +DDPWpte5SI41avSEIw2BDrp9Sz8PzUOV5hRAIgjne5yC2QYHJyckjbC8uyZ35Bey0Ns
         1kI9pVxMU0pHTabqArZ1kcbPXS5ts4MdKp9o1YOc70B56mCMA0VDymBxf8jpB5D97Z5A
         yKpg==
X-Gm-Message-State: AOJu0YzNQJkJKYq2G4euE/eE5QWbr78xSklZv9llcBOF4ekDR709+hw6
	3APzEKU1mo6HDk7IrQixsexPgl/PPez/EkgkNGqNU+w8JdH9pQDgSojjFCxuC1mp6N3NjiI4JlT
	3euXF2Wd3I/RV/kzM5kwwkyT+D4uasWpfWEjNo8mdATDazezmCnxGYkMhRVZrx/R9h3JtpPO5RE
	1ilSc=
X-Gm-Gg: Acq92OGcoznSWl0cnJ05GevKVWLNym0WnC9kUJlL/RkFErZVLYepS2rWeZqsq9XfrbT
	gm0I7urpJ9TqIf2dJko1a4njGHoPl1sVcSJMobBYU6eljA/7KlJOBMK32THMWbSKxa1AaN8d6CP
	7z/H/N5OaSLXclvN5GKMJbr1A1fo2s+NpE0dPYq6QKt9l+Ysqi803O+UNvjtrJyA8BH1PKD5r71
	t2iRAeFKHtcVKYmDxTR0jVG43bAx26adKP/RQBufRn3U2wv3FnZZVFkmfmFihiyTCHb9Q6lNp9P
	RBLrfPxo0IZErUb/ZjyvGrgt90u3UoOkXqnAFZm9vP7+mTPbMNXujdagqcSfXvDLtABxkOEwze2
	XgofA3ZKVEpo9WuSBsWjiGx8nBLENLNhSXPWUkPD8gVymZVkw
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr18248172b3a.29.1779182188312;
        Tue, 19 May 2026 02:16:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:83f:2568:d456 with SMTP id d2e1a72fcca58-83f33d277e9mr18248149b3a.29.1779182187809;
        Tue, 19 May 2026 02:16:27 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197815cesm21166287b3a.24.2026.05.19.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:16:27 -0700 (PDT)
Message-ID: <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
 <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5MCBTYWx0ZWRfX78td3ScSa4P4
 Fsxj62ISXbGjvgZkG0+3qMxPXdzpqzY/a2JcYmxzq3AFYCeiREg+aOTrecSd8GgdmFndBZHeSK8
 P1uJaFd6Yy9T3HqJUy4sw+e5NfikCNIYV2/oytFC11rf+a8o697ow1lO4sDNghmzJyANwgiLZSr
 sqdaEXVYpL0jbnsOoqoYt8lyPu5/aAcAUTm450BN1vpbsUXMaAOFODTBjo3TFD8la3RQjK9boy7
 xDL8IQ8LtEd41V17TC2Vf6uRgtFywEdnU8AXAzZfi4ZvPNJCX1P51DgxuUcuvcUyxzE8mvLNlD3
 zrLLTJrk59xHVoSGs5O2hV3Bi9mAws5my3k0m7ckeECFPlGSi0DrxRiIAhQHk02MzCMiBMNq28D
 VzQPyB1FY8X02Smg8MWiGXjq//FCsSl2oYBGhpbxjSwXOULHM3DqZ8+7kje/IM5FrHw7s9Rk4r4
 8YHNFHzl0mDOzDpuy5g==
X-Proofpoint-GUID: -VLHE10Al1wIpkl1czv5OAiD_wE5uHRV
X-Proofpoint-ORIG-GUID: -VLHE10Al1wIpkl1czv5OAiD_wE5uHRV
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c2a6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s87QuijNsyLxGFwhyOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190090


On 5/14/2026 3:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree binding example provides two interconnect paths, violating the `maxItems: 1` constraint inherited from `qcom,pas-common.yaml`.
> --
>
> commit 6b248da80633195199f478d98724a0590dfdff63
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs
>
> This commit documents the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> [ ... ]
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> [ ... ]
>
>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +        clock-names = "xo";
>> +
>> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>> +                        <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> Will this cause a validation failure during make dt_binding_check?
>
> The qcom,pas-common.yaml schema, which is included earlier in this file
> via a $ref, restricts the interconnects property to a maximum of 1 item.
> However, the example block here provides two interconnect paths.

This seems correct — interconnects constraint in qcom,pas-common.yaml is 
currently set to maxItems: 1. I willl update it to maxItems: 2 to 
accommodate SoCs that require two interconnect paths.

Thanks
Komal

>
>> +
>> +        power-domains = <&rpmpd RPMHPD_CX>;
>> +        power-domain-names = "cx";

