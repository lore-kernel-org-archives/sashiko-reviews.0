Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D804437849
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565166; cv=none; b=upB1uxObi1q3J/MiSd532uHkZwr8LhP7+uDNzLzFKWcnzWDuSFhOezRPYOEGDvtfFTBs2JpQtgMcLlcHUYAkel4TWHl1XbTPshNam4m1mYmFl4EvzXx5dXqVUqdcN7sTJtLouU8sGdBO8SS12wnvhyhP0jETXpK0lC1P4yOkxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565166; c=relaxed/simple;
	bh=jjfg+HygRnWND3wPx4GCNln5mGhfWUY5eraXrZMGWsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZuYHGmZ4SsKou7HQ9R8BJaq88gFCJVR+8IwhXCxDVo0NqaNhRxlB8l64zKdxgFWOIomExDILYR9Y6/ZPujC6GFbUYBlQTm2vWsHbtoU/p7Ev/8VSfL8UoQHRNH1VNMGETgoo8za2gPIkgV9f8oBdM7mb8zv3S6YVRF2OBh9q4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojW8lg+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9Pt64gZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojW8lg+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9Pt64gZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KGOFrd3198491
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 16:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=; b=ojW8lg+8TVK7XaL8
	IcMQd21Csntbt/wxtsOedCuPlP28gPIXty1MNH5+rM/AimegrAj0Dw6W6v3rvf4O
	0DCTAVXuIoMQY6DY/vt9nk2v+wtIzVTkENmVcd5ixtKS/yCp14j/R4pDLSDt9fN4
	y8CL8DUb4zskYw7LBpc2cRUGupGWLTt2OKv965up2p2pt9nWe7dU2On/6dxKr7+h
	ziYgn5mvyj6HuVkUXXEBjpHbugzJ1NukaFEUbGi2FUf8o7mg2HCJDUp2lmmA1eVh
	ifpirbUsS8qTp4pCs7/+WhiqZwc1BDIo+NgM2ew/lQgGjc9os4LIImfOhOuWKNAQ
	r7np9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxj98e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 16:32:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so161789035ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784565164; x=1785169964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=;
        b=e9Pt64gZ8tebOtXjZdLSRQ+oi3vWtb17jUmobxomkrTBaqi0ebzr4VnD8JVzr/Wpjy
         nVzU8An+MW+7UTv7pKU8yi3Jtsd7vmCA4KpMskERsnBYVGfr38Z9VWuTf0PmCqzLQWG7
         SKVvzLdzrS8dxUEo6Im+y8gwVR3o3CwYk0RBRJPTmv5Z/HcNB/DQre+Zxph/qi7GgpNe
         1qS7x/W/4195xXwk98pOeDfq7sZ6ky0GpM+wCF3e1q3gLlQUoUmOVDB3BOGo9cRreDnb
         cXNcgcGSNota6C4mIWeLc6T8lr70fMQhi7Rr8+eb63A7uTZiuCDZ90sVKQMY85zWSwxF
         L5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565164; x=1785169964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ftf0tCwVcMbMptC5JGDd22nsJovvOTUz/SyN9TeQpGk=;
        b=mrYBxkO8iUGf7rC1C1v0MaKiq4IGa+fVXF2UCTQXH6Uhvt7gI5GijjEqJzP8JVfnTJ
         YejDCejrKPQ8qrOw0cjsZrLuM3Y+PiahsxFsJ4415HZ/lRxdPbtbCHChgozLTzzrnamA
         dumQeguTKx214KLYhqSL0uSQDWeaBIBbQByEEEQbBMaz1DXQeO2O4kIIa3CU7gAY/1Yy
         XeBy21qtqaW8WaqhBEhnzSPVe3Y9QkNPwT2exK+q48H3MEfwOUF7KU8D/t/PgDBUoqaX
         cxEQCJmBio2M8pwApkpJgkZ6of8otSqEwFuZk1fdlrQHdR9NHBQwCERNWLNpD9FEF+eg
         BZQA==
X-Gm-Message-State: AOJu0YxE2Q74Nk1c5ehqYc1ekDHBj1riEhhk1UD3YsgXbxSHMpdCZBJf
	5x5jsIcCdAYzlmzpbYDJ2JhSQE5t/keAJB4aBNHydhwj8A1bKiCmnEY76n0hQ8oIjG49o/ON4ks
	qk9CqbJ2+zzdHZQ4gq4e9GIQjIY9KtV8MReMKDYKwJfV608/bL7wK6qxrskiWKZu7YQ+Yu27BnF
	jTp90=
X-Gm-Gg: AfdE7ckS5ePI6zmLdLvQoY5ykefjYBc86OHe221dC7WfSo9LyJ+RvpDzFVkW606yRu/
	kBA4RH1kor53gx1qztiiHKH/SPrCbBjg4IceSLiQScTW8ADGEjl36Zy1SVabW/4BAmDrpiBYOQ9
	dpUQkqVughCSEHXmDtZWQI0KxdT/cK2RWovOgMCHS3EdFTxHY4v93t77fE65ZxjfEB2RZcjW26W
	2AhdFKDL6JAsfpht0xL8HCxMj7UNqWmNK7+/W0XDB909LW/lD/jxtsitfvvZ2mVzSbEbZf7ZZQG
	qH6bwYMDtEpuk2Ss1dUG7KlERykos2YuvTqpz008HCBrp8k9YUwuPOw0mS0w/eH4h9AQHvcbhEo
	TLY0WQ3sI4+EAORslJpy+MHJDy9SrgYYhvVoMYw==
X-Received: by 2002:a05:6a20:d52f:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c3ad938d60mr16715464637.56.1784565163926;
        Mon, 20 Jul 2026 09:32:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52f:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c3ad938d60mr16715410637.56.1784565163285;
        Mon, 20 Jul 2026 09:32:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.175.27.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm42732068eec.18.2026.07.20.09.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:32:42 -0700 (PDT)
Message-ID: <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:02:39 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720161033.5277A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260720161033.5277A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e4dac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=N7nrzEgeNKolxVRjxaDX4A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=llNIWFV95VOWQGKaZW0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE4MyBTYWx0ZWRfXxuFnvfBTY15E
 LjYTtauERDr014BI3mWIC+NQTJHv/EZwVhk7j7b2L8ti8Fduww14w36BVApNPY2k83w0vrlrO9O
 yQ6SvMjZqSkxtJnye2ian13Ta/8hb/0=
X-Proofpoint-GUID: Od0fPBalKWA1M8K6wI9GRQkP1Lnuzj86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE4MyBTYWx0ZWRfXyvMNeFXOa/n3
 NT46Y6b0Y1l86Ny/G8ZFogHt1RTjRpoE1806PTQjL5VEJm/LIcObFkn0lsbLS+3Foz+3vN6hjC3
 0DqNB8hztWfPB3pBPAjNSMeYeoyLHok2URMBYpnSnqZ8A+VvO/EZpZLfOTd4GCPpY0aKg0WnxKN
 4S0jeJWt1WXNHkhgdE5I2JarQO/OeRtoL1JO79iqGdF8Z1HsQnOrTJxYjVvGC3m/oxEJ/4k0ULe
 gyo6JNfFbLTmfc5clkj3vU1yP54r0nCuphJC3zFBWVtptXyZW2QD5AUoZRUtZW6pRwuvCoGKSlT
 rg0KGaS3dTfgqvHsqhuRIe8fwycZw4Pzkf1e83sEY3a0O0F391zzr0oiIp/HHBvWZPN3noAjmHc
 3JoLak7COZqlPUKTbkH3yEZZXB7fwxcEW89GFRYI4Aw1rEz4uxxBjJqfIeYnnyd0Aj6O3GiGhkq
 4XI8KH5QZfYuZxtJyDw==
X-Proofpoint-ORIG-GUID: Od0fPBalKWA1M8K6wI9GRQkP1Lnuzj86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200183



On 7/20/2026 9:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Contradictory array lengths and definitions between `clocks` and `clock-names`, making valid hardware clock combinations fail validation.
> --
> 
> --- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode ---
> commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
> Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
> 
> This commit extends the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes. It adds address and size
> cells to allow multiple DAI instances and defines a pattern to document per-DAI
> properties like interface IDs and clocks.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> [ ... ]
>> +      clocks:
>> +        minItems: 1
>> +        items:
>> +          - description: MI2S bit clock
>> +          - description: MI2S external bit clock
>> +          - description: MI2S master clock
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        items:
>> +          - enum: [bclk, eclk, mclk]
>> +          - const: mclk
> 
> [Severity: Medium]
> Will this cause device tree validation to fail for valid hardware clock
> combinations?
> 
> The clocks list defines 3 items, but clock-names defines only 2 items.
> Because dt-schema limits arrays to the size of the items list when defined
> in this way, providing 3 clocks in a device tree will trigger a "too long"
> array error for clock-names.
> 
> Additionally, do the array index descriptions mismatch? The clocks array
> defines index 1 as the external bit clock, but clock-names index 1 strictly
> requires "mclk". This would prevent configuring "bclk" and "eclk" together
> if "mclk" is not present.


The sashiko review assumes that bclk and eclk may be used together.

However, the hardware supports either bclk or eclk, optionally with 
mclk. A bclk + eclk configuration is not valid hardware usage,so the 
reported issue is not applicable to the valid clock configurations.

Thanks & regards,
Rafi

> 

