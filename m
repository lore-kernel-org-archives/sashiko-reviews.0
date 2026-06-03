Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3410937C0FC
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477966; cv=none; b=kM3aCh5TNKjcX9lxN7X7erR5hzml6Tt79OlQVpi1drJffgQLOKtwho8w6LeSOG29IfPrZKURhrA+rKSyaaJarUog8Po8Q6AeDwuFchL83mL2fqZf7EYIh+z5IUUiOdD9MqmK54ubdXM+j4gfWJTT/eR5CRkNgJuZ//aBU8y9lPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477966; c=relaxed/simple;
	bh=YDmrMYtOA9h84SfI/2Rj0H4mkFELJAZ09YI6hSdkz3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djgyMtbFAUnIyGhVopv0/bktuzqApNIGr5gj3rLWW5geJ8QKtJKkrOBqS4YxjcOhfyGMv+3bTQ+UtsPHJri5Q8uDHT7YI6szdyZGcTcI1g6dcX7zzOliesloBWtYd5uDxVNDuSUKvnL3AehUO8vH6gAH/67aLqnnWMX/2HshuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axDQKNke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bs76A2Hp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axDQKNke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bs76A2Hp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395ul4780758
	for <sashiko-reviews@lists.linux.dev>; Wed, 3 Jun 2026 09:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=; b=axDQKNke0wH10lxZ
	FdcZ+yAYtal3Jj/MyWfS+Av1bEfPRq52W/q23gpL6vzz27LSHa1SQ77wY9Mx4/uh
	Oce1UACZ5IZkMqSN7na+uVIYll6+lr5p0p6specT1E30WIthnFZNxWKFankADtTo
	m7ByIQNQJunNRHL3orf49G9i6wRuFfA07s1s+8TNptI7Y/V/i080l500V+iVeWRG
	sTqqb4og7/oTuDAKsDwZyGgvg16ABQllOigIYTcv2tjOojHyuzopVJztj0df5cwj
	CL2dQ0GiMx1cJD12XL23Xypou7DUi5VCj0E15lWffjTN11s/m8gAJMbGZbM9stES
	Y1pGPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb011j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 09:12:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so4856812a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780477963; x=1781082763; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=;
        b=Bs76A2HpV8FYkkDd8vQK3lO7KWW9SBDZuKH9JBG7JC1QrkjX/ZxXW2U1DOvCPlMuI/
         rMEb3WOftE2eLJNc7eDeI6dOoScwuB7kZren37m5mAdL9eTuettNXqQrCeWyyN1d21QB
         0okHm+fJYRkkMajTCrUat2pEjOZ4nmwGi/CjW32Sjc4P4Dd+RrBy1Ei2dCvFCY1a/bsf
         2crVrRYpw9WwndqSn2HqBORgZ4Az1xrmuSB4wbIjV11bDuQK4cLW/UYpGIOhF8nVnPLr
         A6lV4UrrPFyjheptZjvhNVM/41gSqGbFKRuLM5N6/0jsLxl0t6RIzdl/ZXWOQo89+5P3
         lS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477963; x=1781082763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uxxv4mx/K31P2VO+fJkAKBqGk8xS3svkE3+WCEgOau8=;
        b=dKNETdjZPRadzTb0yfbxbbgHm6JYRcBWbvjn2qzZF5yNa2GbUi3fToiSVHvahVUGQ/
         ju3ZqyOq8k65v88pfUnFTl5sTy3JOLSeITT+MR8FnxLrlH09Gt4Lm1BYMGUfwdoL54wJ
         p/PQiyqvUI01vwKm7SozKWPRVd6xaFq0Vldc25VqA0DnmOOQssHXm8JZtXDNRm24NCKS
         O5LlM/CAJ5ZdCArzFFb78acIq158ywv875rwxeRfXjizSMaTZSAF9Lqd8ozGGLI1pXIQ
         KLP8vmJjUaOg+OoQMabaY5qR/gOuEZig2v1YfVsbGp5wyKY18yszbothxOK1T1Zvssbt
         yvWQ==
X-Gm-Message-State: AOJu0Yz7rosYHhVNcctyqTr2Dkij7l9OPMI/oWqnw5RDJPuWMuSqecmb
	WauQc/SatxmVeX5+OrlPyOLIY49/Rmg7jukA5Cs0tvU3qF9lP35NRBoKRP8CuIllAiOPvqs1IS1
	JjXe3wdPWE5ssrWm4uc9T0g5N10yI62NzWetqvubNLYMQtwygenN1YWDfbYbNkZ1ebzaZguvysO
	ejJ+U=
X-Gm-Gg: Acq92OFe6bhlZf4Ns90eaF0H8nNwjAXfPWdqf01gqYEsEZAlSRC1YrTZVceP6yjwuGM
	7rCFAaFGd2I4uRn8oZRFuQ/USJk4+Y2cCmHNLKFCNpys2w89DImZJ2H8w+1KDTkNWnWO1mvdWLm
	hOOn34gaIFx8pQqbqYopDXEynGxJwSOUwa8uWehggeJdgKWf0MEl4RlRqXP60vAlVSgaImpLgTu
	/qvO8q0s45arYQPV4ITCyBaBGj9uZ+6eSeFUdOeqM0sndcEfFWkxR6ytjVof+eGRFK1PsZ5k2/N
	3OP4mhv+ss6s1dm4NhtNvcotlF4sxq4h7xBYwKuSj9lNoe0bcsmgj/u+H1BseVE92EItrO+5Rl1
	pQDvm+E8D1gNSbZVFVv3+GjAT3EN8vijt4yx1y5P0YEJ9ctp1mul8K5nTcmVuV9UuiUEKPEqIZw
	c4
X-Received: by 2002:a17:90b:180d:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-36e30e1463emr2622048a91.10.1780477963038;
        Wed, 03 Jun 2026 02:12:43 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-36e30e1463emr2622022a91.10.1780477962441;
        Wed, 03 Jun 2026 02:12:42 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276ef2sm2446369a91.11.2026.06.03.02.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:12:41 -0700 (PDT)
Message-ID: <650c1e77-b46c-4474-9c22-49256fe45479@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:42:38 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <20260602093827.6C04B1F00893@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602093827.6C04B1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0Q5tSVtnWhAjD8lmhT4J88pKvrvX1y_J
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ff00c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jqUvXgUuF1ok3IJxvasA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 0Q5tSVtnWhAjD8lmhT4J88pKvrvX1y_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA4OCBTYWx0ZWRfX/BSOOYKaa00A
 oyYGB6yt120B70Mh9e/LbrcqZWI3AO2PnjfqLuVUp80+Esm7ScfDQ9ucfZYTXmrjrPTCDpQSlQy
 3OrSAaWX7AsSwk/ArW44ae36kRWWPJorf1ZMolnI1ohdamE4GHM+/32wFi+iRQ73UAquA82qyKQ
 J276yyIHvCwA9q8G0gDjFmfsu6iC+wUpzgSmSJZ2Fm2PPy8Q/uN7noKar6hRygmH70q3kXAzVvN
 Cqt58o+AqSh2fhvG5yzLuo5huakrhOnLohgW57Ef8+SaM+EulPrjWQDEHmkeq1hHItQUlh+j9V1
 2PQvydl5xlCAbwl1p0QN1R69uai3Ow8EqCWyj+sQ9mDpN+BYFQVc/VFHMni4U6pqXxypPi61TQ1
 yuKQw3yz+WsFSLTOFZcPLTqHRdpQQrWU5rewxOW0CSiC4zSWpkamLdgWtWcp1qigPjsInZQ3Sku
 Y2G7rj0f2XNvWRftwSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030088


On 6/2/2026 3:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Silent failure when DT clock properties are missing for a device requiring clocks.
> --
>
> commit 526ede5fae05c2893929b211a8654512286f1196
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> regulator: qcom-refgen: add support for the IPQ9650 SoC
>
> This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
> driver. Unlike other SoCs, the IPQ9650 requires its clocks to be explicitly
> enabled to properly bring up the dependent PHYs. The regulator is also correctly
> marked as REGULATOR_CURRENT based on the hardware design.
>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
> [ ... ]
>> @@ -106,10 +177,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
>>   	struct regmap *regmap;
>>   	void __iomem *base;
>>   
>> -	rdesc = of_device_get_match_data(dev);
>> -	if (!rdesc)
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>>   		return -ENODATA;
>>   
>> +	if (data->has_clocks) {
>> +		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +		if (!drvdata)
>> +			return -ENOMEM;
>> +
>> +		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
>> +		if (drvdata->num_clks < 0)
> [Severity: Medium]
> Should this check also handle the case where devm_clk_bulk_get_all() returns 0?
>
> If the device tree is missing the expected clock properties,
> devm_clk_bulk_get_all() will return 0. The current check allows 0 to pass
> as a success, which could allow the probe to silently succeed without having
> any clocks available.

This validation should be performed by the DT schema and the drivers 
should just get all the clocks from DT. So, I think we can skip this 
report. Please let me know if I'm wrong.

>
> Since the IPQ9650 explicitly requires these clocks to bring up the PHYs
> properly, could this cause a silent failure downstream when the unpowered
> REFGEN block is accessed?
>
>> +			return dev_err_probe(dev, drvdata->num_clks,
>> +					     "failed to get clocks\n");
>> +	}
>> +
