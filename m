Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C523242D6E8
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934410; cv=none; b=jbEt65n1QFlL0+b0mgZJxDGfv0TOIBDlwFbHHdnIbbI0jbdaDE8Lqbxcvh3wEPM8djhNesSEHx433v9vugyla/J9jqqhGybqDfBE8TPqc0JwdOYkMNINNEobvLBjkxAK50+CjHjusF/PIRKPBm+6LEJTnCCPbKqZnj51y9obFNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934410; c=relaxed/simple;
	bh=a23jdrqBWq6EO2LiBZ0pax66Ab0boOC/BeNF5PRbalA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVnHvGAOUfQcJxtz7syPCN27Ybm2U7V052LmWjXGpW1sK8bA/Jucg6/CmrlbfNjjAqriWLoFIDBXFeuf5VEhVfZ3qwBZWZFNPanU1Lj6FMlHngXvCfo63WGuwuuF/nBLWTbUtnckyKrsME1LHTB5ByPXyHPOGYlGIp5gaR1d/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnaQZCpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4YboCgY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnaQZCpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4YboCgY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661IsFlG2046534
	for <sashiko-reviews@lists.linux.dev>; Wed, 1 Jul 2026 19:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=; b=QnaQZCpBjNZW20uK
	qlVocGGU1nDOdgpkoTumOHuHrgHZhhKS5ppy2HiC9wIEzDt7Vi+tJgxDeagHUxqG
	NcWH4fawO4LGohDQxmGXHr+/qUKVFXigcehoLRF3TNjlf8/0PcjyfNg+/DY7aRlf
	1ws1s2HPa3TjPYXvVaswVxWpCKc0JhcwwfJzFC46ovkVEol1gueB5zQ0iia4tw39
	BuBKLFUAwnSyNAjwZnDmUL6KdfAHIv9WCPfh2MQBVMHClGx2t9hvCmKiZ7tWU4l/
	1D5acq7GAWZpdwNE8h0WMCnO7IR5gGceqIclrRLceafp6wQbPDvX90vHdfyUlz/7
	uFY+kg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k385hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 19:33:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso98566085a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 12:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934403; x=1783539203; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=;
        b=X4YboCgYGGLTnYKetQHYMANZd2LI9GM8L+0q7LmxowbW1dXpw8LI9W4ahboE+ePucL
         U0Axqn1UHDREmhr9asK9E6LSxJj0sySRFKHpaRO49loR7e1bwJ90AwP9X7spHAXV/9i7
         POy4bQI4c4nZimIxCS/UFjMuNJeJd8vuRTUB/q7lSoMA3dYW+aoDidfToadP7lF+bNBL
         J+sZU6DvzYfTuNFC4ZGm3ZRR8MqwikEZ2BCeEGSuageq3C1CBjsqwS8HJ9TAJO1LLkw0
         2bzVu06xpqd8HUvPVeRwWibL8M2ZhnMb1UcKeKHQCA6nUT+qmrqoIPZLF6A13Tp5Vemk
         5PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934403; x=1783539203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVQF4e9EW8E2bpX2p4bPCu08t6dKiQPvFzboMOSJ3kM=;
        b=sJhQdxE8lTOTD6xcxkCimW6sWcULceKi/OEuR5BVAthuyus/vT0pgIivLmBrxKEZzN
         r4ts6zwEAla+jkDtOxa+Vq93aHMT+d2qXPbUTnse6rJ+lDwEc+9kwFIIjscLiNf0Ni3f
         wvpog3zyDlU5PuM4JK3KBJ9aCVrf/v5T6/bQ7BWPFUCyVoUh57aFbUDvOb8nAWyovUMj
         49leBU0aBMCtS1hKitBpdrZDCbZmR433GPGuvZjx47dTfyGWVfAM7WBZMluB8jXG5t9+
         2xa+l8RBqdr0V7uMwHugESPLkWtltARg52VJ9kIqb1TpyxzDuPASzJoZ48z38vxE9/Df
         qq6A==
X-Gm-Message-State: AOJu0Yy60b4ueLhMUgg7bVtz+kNHDQZ+S0yzkJIOqpMcdg1ke4F5Og1k
	cYtri54ljIXlVb0khlzquKctIbxSsvTClLfPKxqFFZa+/xSFbRiB0aU7Upq3A+iBp6BEFawUWbO
	LJqC8x8BmI1ter2MZ5sgPlmSywYcy8PHMF+xTYDIvPVxuPbJwhKh+Ud0M4wpQ5ZKWerVGslqep2
	j2dsk=
X-Gm-Gg: AfdE7cmpEzukhIUePDqOI6dtgiwGPBslhxr4H3waBDYpMAsxW5C6CfwIOJYGn7bWJld
	lYib0TXKuLC+t/TXmRmSfUTmFj81h1a8NppVFZ9E09OriO+P4fnUXNsoXSlhT2Yu0Dr+BJBrZjI
	TJQY2DDIpN9a/HgWJjVvCQ47wl0tBpCpAWNluVm/MQo0OpX868ZIB3ZQ9HHoVKvalp/zlqvaNm6
	tZFfB1Xpg3Q9XDtZsc6IA3y1NDfG1lg9QaRC03uBh/bKrz/gkPQAaUJf2N5CKwEDh4pITLo8cDY
	I50s1TWWER/mAchZZgOg75Sk7ZraZzrLzOVBy/nzCcL8hCb2iQ+twK/XdggFPkUf6c22R0uBj8d
	4HPZBm6UL7YWkRHSIzyAj5GhES5894QeYOnTdfw==
X-Received: by 2002:a05:620a:1a29:b0:92b:6805:91a5 with SMTP id af79cd13be357-92e784fb79cmr473067485a.61.1782934402518;
        Wed, 01 Jul 2026 12:33:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:92b:6805:91a5 with SMTP id af79cd13be357-92e784fb79cmr473059585a.61.1782934401681;
        Wed, 01 Jul 2026 12:33:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493be4d8f5asm146844455e9.8.2026.07.01.12.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 12:33:20 -0700 (PDT)
Message-ID: <1f6a06ca-119c-4085-a3c5-ccabda7ab9f7@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 20:33:20 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260701164345.938751F000E9@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260701164345.938751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOSBTYWx0ZWRfXxEghS8yjIqJ1
 1bOsFYKDSDO6L6HyD2iYCljtcaYIKHmQCKVDL65W/hbI3VUyWdN7CW+QVRYsgfA/OPb0iNZDiOC
 eI62zo7cFrkzANp0WRIvCp70FXqezDIU8JmFOTWdvbnC1cV/WUavxrXghnvpmCkHMdEp231s20a
 LGiRhilHtd0RFDoKxA+Qcm73l/A5amka4zAe762WXA7evtenG3/GHERMnsgqEfAW6M1zx7Jh93d
 q2ItAlutqItbDcYNOza/cxc9Ptnuoa2XwboN890vtKDXB5kU2foAjWkTeWi8bsYg15G4jsD7kun
 VZPvGSS2PT793+dcZGFIQ3vJ5podvzrcV7XMlD3cFWcKLFQu/fh00BReN4c8MGWwIrmOSnmwoXX
 TedC9+PiEHj0A9m9IX613ixok1qgEvlKwdfY0OD8B9wkVsA1EjkR4LkK3GHAKdwvbjvYSUTQm8m
 SJ2vApd6qCsQm598YlA==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a456b84 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nIT9tT2v_Lirlcak3YQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOSBTYWx0ZWRfX6/kx/xsO/GK0
 Fq0CY0uSNxPzx+I1NMXLgK8OKx7Yz5rsPzh5zfODT74SG8vOwy3Yj6rug4Dkp7Dis6aOkReVFyK
 lu022ryS0MlZ41j2vTs2lL1OEaibd+A=
X-Proofpoint-ORIG-GUID: DumXqusaNkk2CXqjJWKgGNAcgLAdacW0
X-Proofpoint-GUID: DumXqusaNkk2CXqjJWKgGNAcgLAdacW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010209

On 7/1/26 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incorrect search size in find_first_zero_bit prevents -EBUSY on port exhaustion and causes silent double-allocation of the highest port.
> - [High] The dt-bindings now allow up to 17 SoundWire data ports, but the corresponding driver internal structures have a hardcoded limit of 15 DAIs, leading to a buffer overflow.

These issues are addressed in this series:

https://lore.kernel.org/linux-arm-msm/20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com/T/#t

--srini
> --
> 
> commit bfff7ab83551c0958297b1c39b25931747061203
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> dt-bindings: soundwire: qcom: Increase max data ports to 17
> 
> Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
> accommodate SoundWire controllers v3.1.0 with 17 data ports.
> 
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f371b56..8e6973fa229c9 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -90,7 +90,7 @@ properties:
>>        or applicable for the respective data port.
>>        More info in MIPI Alliance SoundWire 1.0 Specifications.
>>      minItems: 3
>> -    maxItems: 16
>> +    maxItems: 17
> 
> [Severity: High]
> This is a pre-existing issue, but does increasing the number of ports to 17
> expose an out-of-bounds write in the qcom soundwire driver?
> 
> In drivers/soundwire/qcom.c, SWRM_MAX_DAIS is hardcoded to 15:
> 
> #define SWRM_MAX_DAIS						0xF
> 
> Which bounds the sruntime array in struct qcom_swrm_ctrl:
> 
> 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
> 
> If a device is configured with 17 ports, will this lead to an out-of-bounds
> write when setting up streams on the 16th or 17th port?
> 
> drivers/soundwire/qcom.c:qcom_swrm_set_sdw_stream() {
> 	...
> 	ctrl->sruntime[dai->id] = stream;
> 	...
> }
> 
> [Severity: High]
> This is a pre-existing issue, but the port exhaustion check in the driver
> appears to have a logic error that could be impacted by changing port counts.
> 
> In drivers/soundwire/qcom.c:qcom_swrm_stream_alloc_ports():
> 
> 	pn = find_first_zero_bit(port_mask, maxport);
> 
> 	if (pn > maxport) {
> 		dev_err(ctrl->dev, "All ports busy\n");
> 		return -EBUSY;
> 	}
> 	set_bit(pn, port_mask);
> 
> Since find_first_zero_bit() returns the size parameter (maxport) if no zero
> bits are found, the check if (pn > maxport) will be false when all ports
> are busy.
> 
> Will this cause the driver to bypass the -EBUSY check and repeatedly assign
> the highest port instead of handling resource exhaustion properly?
> 

