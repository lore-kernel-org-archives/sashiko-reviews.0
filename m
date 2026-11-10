Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293021;
	b=cdUlH2hrX9NScBMfZCcekWlg9HUoO93DwnUWq/VplBF9NhFEM4dg6T5ngidWQa80TcxV
	 rTvqWOfBrnNQwt5pmW89QCKyhcFjlCCaZkbbvZKfBmn5S5+Pjq+1niMmEWB+dT/JQhMfx
	 5Dc1ZYUuu4gzdZhQHCWW+xAp8+hE9RcWmVXrIQdCUGDRFj3JhbCzHa7SlxUwR4FIj7ExI
	 ozbI48CulD+1ji7ODk0lcJpPBCBt44t/Q+iEHJ7ZgcpBNoX5uPtZvSfkHLB3jMsFf1yxN
	 QfnGFR3mvUaLQA/SLRcZas6lpVJce5YTg5iHz/cEZxO1F4/aCPkPe8Z+KKc9f2G00ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
	b=F+u+3uw1Qlx+eTtonMFDqrlwq7/YHbKGW96nJ3gupGpMtkz9FrpLN0cLVVYbLmUTEP06
	 jaBh5t6euzdvXZIaurtPvdza2Pk/n5D7hjjgFUoVzZ0NAbnIqCurfE3YKgY2MTxN/l57i
	 NiLc0eu/Ao8MnqsnBM8mgMPGaEIuOthms5R4tfW9jJs2QSgiZ0SmZfAjZ/yg3SmgD8TOn
	 jrwiQyGzn1Zu6LIkh9PuJcYDNt4fgUJujXn4SVgzT2pFYvw208m/vFE6IDoNPKhCj52tQ
	 Y9suQhWB3UdOymyaPFWwQwoRkK3+lSY+LdXwO6wlW1QFZ6lDmQhjgOX/jIp/ehWymgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZ8JyNG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9pJUKoY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF5606B1C3
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 06:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33AF5606B1C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZ8JyNG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9pJUKoY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA6gVxb2287200
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=; b=lZ8JyNG1vBZwwYua
	aFo0km1sUjWyZwlpQP4jwiT3BHLTIZ3B8JnbqY6SSu6S+6tDzG7gVdxtapOnLmpt
	AZBuZNVElPunatHbcdr+SAOJsz+cwkmlpLRViq9tXg8ayjRs6tfKkpa2VtJpy8My
	/mgbyMr+fURqbjaVTbHha6UNvj5CqjCOcCvd5zjwzKNQIcGDtIS5UoC4kppiWwzb
	D4Zgtzju/+LMCpapFfMBmkAQFMoii8Qq7aWUwrZEyrQ2lIzkDQFWkKXMAeRf0QZL
	m2HB0GNXlwjyyh8URISRDQG6dltBouocMOIg37JNC05av6mbJYC+uODkTqn1hRXT
	sB0G3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84805u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 06:43:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1728144eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 22:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293019; x=1794897819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
        b=F9pJUKoYSyMu0inE4sRrdLHswHvh2BQlB5Bs4wQLb+QESVfbezR/zt0BmnKoGcLfbE
         lvYYJx4uuHw1iXzzubUwjEA8YxyH5zghmnUOysiz9RQVBKxtEk/VnxO3x8pFUj4Wr3Zk
         5vzsRV4Ya+r3ZnGOYdaAfFAHTh7yf1hLQi4gHDqBzd6nWd/ZC/81vaZJEERXQVegTJ2g
         bS/eV5LWnWK5g41QeAEYd6VQ+ZMr81E06TNacwVenfkVdaX6v7BKZjt4IGnd3vk/s0RA
         z/2xESKle6OeQItiZJbCrXkQy29EMqc4pE0tzES0/g1vYXuSBYihoa33HXazSlSghd0O
         jAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293019; x=1794897819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
        b=N8kg6e4XSnDRIU4zYtVjXkNW7bZ02ZXVv8T/2VXqkRAw3veeFeOtzHR6DZfRA7D+Gz
         757ruF4kkjIc6vz59P6hyLXz53igEiAIczbkCi6sXLwZ9lUmBqyKWYA5Ab/tKo1IFhh0
         hEWY16HO2U0E/Voqa3utxvvH1+4mi2jJwLwMlyLp+ja45yBMBAqIjv8x1wbZh8iOe43b
         EvxoYVXknNGrs67UCq7ck1DTGxQTyyTNyh4Gz7O3pkc0d+uOg55meC8f/20P2Z3KmwwD
         qdWDw3PXiz7A+h2IzGpNc+KoWGRW3+bDIL0zsPodCEqXKKd0wAa7JL6oUNoSEFL/QTwY
         Q5Fw==
X-Gm-Message-State: APuU4Z9EJvvoyCCv4erX0/NjXuf1h5FH5iNw7jkYGzSIccCbEFX6uAqC
	rtZQeqvz3lf7c7pVHnV2qMjakzCDGfWK4RhsWS9hdi+hXLJFp2nzr8s2rr+nsgSQC/XAhBi4j5x
	YsJGd59CHuMbJwlvI3hdaW5rxIvJeQFrOHLBncwsPDFccyix7MuHkUaxbIrEg2G/Ws/jzI8I5/K
	VGi4c=
X-Gm-Gg: AYBFou07prjuUqk8A/iNMpHpgkjy26xVioZc8NpYcDg/oX5JUqsq16PCiPJPGsiwMLn
	Jb8xpTBubnnWiCOIVkiElMgIDtg4lTw6Yt1fTLEmN0pNmd9jpHvsCikXXH51cDe8zJErkZsoI8j
	kv9xcXSOX5GU8wGOz7nJpXvQBcRdbsc/9PTS0OQVTSga7hcZEtaaOm3D6Mnm63/V9hHoVqjUCQC
	eA83MuLdXopSrRcTvNyuiVHAJ91T45YNi8yl5QOd8UVuQYBhEFc/80VUmHWJY34iKqRuz/qYOvU
	BNYlmclksaz6xNlc1ZT6zKA0A6E3EFOHQSpxKna26Xof3jtxpPmUkXx+nb5Ybv+DPm9/LCaBNs+
	ITBYXAtMcRISa6RkOOZS1DPq1yrSb35eHifK/yM7ErLuEx87+BrscaSxgjwd1JqlQQQds5RXexZ
	J0
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr2336496eec.32.1794293018739;
        Mon, 09 Nov 2026 22:43:38 -0800 (PST)
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr2336466eec.32.1794293018083;
        Mon, 09 Nov 2026 22:43:38 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm4267706eec.5.2026.11.09.22.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:43:37 -0800 (PST)
Message-ID: <a7a66343-6bea-42a9-a288-44978bfe865d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:13:34 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
 <sashiko-outbox-197408@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-197408@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX4jOv2LPm6lQ3
 KIxfG7PYkrEbi+SZ2OVAnICCFIuk1VtX3IpKRY6oIvAzQIE+A7Pmsktt1y1gkwjRPulo95FBzCI
 dZ4DrLzOnEMgtbMEhYxkV/nbkC/B07ec/KICZ3qKTcj47iGazqh4ekIqZtcwgxpgl8WWKrVADAS
 qsicpy5Fg1oHnuW111mv88IIMv9W0pWJe6CcckvbfHM/YUSqaQiXx1WekZZEDYpxDVHrbLwNjAO
 2XTy8ICsTCSA9MT9BrWMhRjr8csahTU8IYwVMDB/AsokZRJ56ggBbN/Ky/vZ4PhYwVPN0w7Ckpv
 zmU3HKVCT0pqw0GVLtBb7O6Pqmb/hPvsMk1GFs+OwnUagiKLuSInkcLHsBopBxpgMvgQIK8ONX8
 Ok3+8aurVd1d+OS6yk5s9zEeYjts/FPNcwKsZP9cHu+uyxz1rbvCLBPyJvzhEQ0EurnPMzPilOb
 NQywDSV/dG6v+UmhVTg==
X-Proofpoint-GUID: tVBRFFKvdo-XqierhNx89od0LMqFwtOG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXw5PyRKgb2DXb
 IEm/5u1O1iQENgy/NdL65bCY+AUfoZc6GdbmIrqXTa61QRVwaDLlNh4x5rfHDrZ5jN0eYsj85WT
 5A5nz4e+BQWRvuRRWqj66ngF2KDUoYo=
X-Proofpoint-ORIG-GUID: tVBRFFKvdo-XqierhNx89od0LMqFwtOG
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2bd1b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L3DyAVMOO9YV_QvAdvQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026

On 11/4/2026 7:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: remoteproc: shikra-pas: iommus applied to mpss-pas in allOf
> --
>
> commit 53aa8f92faa854bf45005817e5eaa528a79c90a8
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>
> This commit adds iommus property constraints to the Shikra PAS remoteproc
> binding schema for booting at EL2 without a hypervisor.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e93616..8c8a7616d4787 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -112,6 +112,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +136,9 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          minItems: 3
>> +          maxItems: 3
> [Severity: Medium]
> The commit message states that iommus constraints are added for
> qcom,shikra-cdsp-pas and qcom,shikra-lpaicp-pas. However, in the allOf
> section of Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml,
> the first conditional block matches both qcom,shikra-cdsp-pas and
> qcom,shikra-mpss-pas:
>
>    - if:
>        properties:
>          compatible:
>            enum:
>              - qcom,shikra-cdsp-pas
>              - qcom,shikra-mpss-pas
>      then:
>        properties:
>          ...
>          iommus:
>            maxItems: 1
>
> Does placing iommus in this shared conditional block unintentionally allow
> iommus on qcom,shikra-mpss-pas?
>
> Also, since commit 95697c560209 ("dt-bindings: remoteproc: qcom,pas-common:
> Drop iommus") removed iommus from qcom,pas-common.yaml, iommus is no longer
> declared in top-level properties. Should iommus be defined with its broadest
> constraints (minItems: 1, maxItems: 3) in the top-level properties block and
> then constrained per compatible in allOf (with maxItems: 1 for
> qcom,shikra-cdsp-pas, minItems: 3 for qcom,shikra-lpaicp-pas, and
> iommus: false for qcom,shikra-mpss-pas)?

Right, the shared block shouldn't carry iommus. I will move it into a 
separate conditional for qcom,shikra-cdsp-pas only.
iommus is not applicable to qcom,shikra-mpss-pas, so I'd prefer not to 
declare it at top level. I will keep iommus only in per-compatible 
blocks: maxItems: 1 for cdsp and 3 entries for lpaicp.

Thanks
Komal

