Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583040;
	b=hmURygeol6ScdKlWBmVld9PynuvDq/xZygAcwWPeayAn2leX0CraPikcYT+JjoDnBDdH
	 1mr5SqZvY66tg2CMpfEmO5j7SyRGlsYZtYHQ9RafHEuux0f2815qQ5uAWuS4YalS9qaoD
	 1gHm6PjHqJT0O1AZ+jAU+NbEnmJ15SMugTzq83NkA5lqJtJ2R5ZI+hKLDhVA3ZhZVz20/
	 NBbc9/TpDA6iHck+gbymRUIxztyxo22oQ17RtfBkaBc2dDgkq5aMkbp0H1mH9G04Z7/Cc
	 jBPl0uBmCdr3QBrTjA40jdkEX8tfl5KxQ7gsRpu+HMhldVXUl4tYq0D/NAm8L4qvKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
	b=Kj6ayl36PWLl2agQ5pP6+FCN2TTyvH3CSAEEuI+30AOPvEvJUWtYA6AzltV3yp7cRBjr
	 AQI1IBe6W4Nh5YF8pRizNhKY9zSOCLZ3lDURKJJnRcE5oyOo1r+yLF06UuMKX7hticxUz
	 bqlGvhTR6VnvvgEPRPYphsc699MRgnj19avR6v30c8oebDTxYrr9u9Uw1+RYWqYpuZQ9M
	 GN6F96ITYOFAGaFV6/nmVfSIGKAEHJJmBXaiySCMlZcadK6GzoVtWwtXUvu+rdljTRmhw
	 zoXIiKk75OgKEd1v8Zsaz1PKYJw9wJIBAy3WLt40ZI41/gBjxotbERfeHgc0ItxLCNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyaCsiy4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyFaMgyy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E5606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9E5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyaCsiy4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyFaMgyy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgOLo1054604
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=; b=jyaCsiy4aRW2CehF
	5U2ELI2XhD/nJsn/SeqVsAyvJpvuVqUuDoTe8ANndyE9mJuGJPfohQMIGRVotJMW
	syNqmJR03oYobhS3xe9DBgjGjjgWxw8h5tCNh/JtltZtbL3yHzTxFg4mk0sJ7gpS
	V3pFFIoAyzW124ZTpK7FApBHz6e3hZlPICy3gIcQ7/EKhapEFY7wuHkiLd1zkIQ3
	YmkZd9rKdD4XIz/IHUa94hyqbBugwbLgh6G06s17bBgJdpI6ue3KUnF8BzytFQMe
	Z2wXnSDdoQBLoC+KGYjdDg71g53ungFzt/wzo+EKZlTKr1EbTAmFXhAwcpT20nLx
	OwQLyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkpq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:43:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so1117207eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583038; x=1793187838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
        b=OyFaMgyy67JQ+6bWp3y9Gs+tBtBPk4u3U/CjwVOjZWv6v5XVoAcBNEhELG8kDcDC7a
         oMo15gaSKOCE37Pjk/MnLQhaU1NDofyA+1htYIiSPT9ulY2hXeN78rgQzxCn03Soa3lV
         i1dvL8YN8YpaIBbLwhffYdGgx9rpIE/KPwhNoLW3r034tWJ6WvV5F6eGTgUG2uhPpuBy
         9AjajnbGTZDnL5qfxzXwl1mU+vmrptJygRZE17HkaKVoXXe9v2TYgbgICujd53mGNcVf
         G4amkywmMXmxai1po9jj8SshMk8xCuEo8MnJ7nx/PLolO7zVcMFsMHY3WYe2h0K2ZSZv
         tc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583038; x=1793187838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIPW256AZ+imGupCIhtsV229OdDYpy+ktfp8HqshjI4=;
        b=p38rNm5VCKATkkuQJ50UnIh5fH3g5hLjkowp7awoPSordQq9+Reg+VU4hV/M01RTkX
         7cF8Xrda7kSIKjMntuTXafzjX5QGzLGy9Lu6gPcDqf0Xlt/ezVklyv8tpGRRZVCxAj5S
         453NkJnjq3e+gEQMeUJX0y6Jb42uka8RHZHlKUvAgOx5Db/n9Ut9OHiTNxFmD7T/MSky
         uMRXmnteIMk/1HjN2qADNPEO3O4EZueVQNGMW5KkEGTYsU/Ler8qQ9vatgzqK4jHKpoU
         vegagmIIDKZzRyF5Y8C7f7f0XkeGKlwf44Xws7hu5t+wwWDc//8BE+VAt6mbW0jYMAr4
         rJCg==
X-Gm-Message-State: AFq9FYLI37y5b/vTB+7pgyyFNyjR1KjtDeTNwVPFOHwX00h0qS1uspQe
	ULMEOdy5wcndR/poVFQqGXeZ1Vza6pVePKoHGszdnEDDSt1YZmaaj7dvVoAINkTSZ8hz+X8EL4a
	CC9Gh2TpHF5g9vKl2OcQXOC9iduZMjO098LKm4wGql9fRrHOiTLpLcWfnO5FH8U6Jzy1CBLzM9Z
	qs7C8=
X-Gm-Gg: AYBFou0aY4EoYuGK2uQu5WegWYXXxWXJNHqbH/fpZExajVjQ77NERhkVKDngxocRFSw
	bedX3jMqZwHYFU7t0GKdFMtUtZP99+vY4abqvfEaSHpjTyrcTFdQXC/YmUDrMVq9ijSSsI68KXZ
	kneQk3Za2PCjFe+HCOdtYsn+CqFEa7QF9nNipD7mD/VJXMOLbE1iEjfOxjuFY0/O1QXyeGpR+OJ
	GVxlgvl0EorlLAQ7YAKQ6sxg7WMVfq2GJ8HWE9T9bWMkWcZbLhBGY3FFR/QIMXOtCzRs8borg5x
	kAzM29z1ssTeG79f4Fzofljfff6OWxVQhtpBWZ/72ueIlLL1vNgMGcEQOek0LiJMyIpHqf+kUck
	13DKwTLidfjkP6Y7whyr79I41AZs6s7Dx
X-Received: by 2002:a05:7301:e116:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-3674e0521f2mr2798227eec.22.1792583037733;
        Wed, 21 Oct 2026 04:43:57 -0700 (PDT)
X-Received: by 2002:a05:7301:e116:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-3674e0521f2mr2798191eec.22.1792583037124;
        Wed, 21 Oct 2026 04:43:57 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm8009104eec.16.2026.10.21.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:43:56 -0700 (PDT)
Message-ID: <be848b5c-8d66-426c-8dca-4358317e2a89@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:13:53 +0530
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
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
 <sashiko-outbox-171513@kernel.org>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171513@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX8Ln/lOGjDkYn
 cRxzjB0ZH1kSer9kgqrIpVbkTTlOLw3dGDOimOJs2KBo/vqON8RwrFzI7YKQFEKpH38cbbvN1FJ
 3TUChb9wdBTeYwq1rK02PedZ0vrN6tgl+mOiPiwCPbwPmmxBYf+9e9q/HvQAL2RpClKQpsilDQs
 ap63aF/JoOtsCqZS41o+B4MUORo8krZjTu+G3kFbmnj/SXTDfPHNJ0yPiCR96YUF0KmqVZWI5PS
 yapFCYMNIRd1paXSBKKnNvSLBWztpUpcsfIqFj4fl3pR0z30/0lZQ4kR9cCdFQD92zg+6ketiUe
 Jp0Dcw7djduDzjzjPAFPJysWFO2Aja12GOxuwlpZsRKF7NjsatEtVFnGApBG7aSI7NXqkocpgyM
 /kv1nmnqf4wG5Y7K8tqETx/pwhanuDFRGrcfgFqhi3iS5GQpNZq+YmsaRwixdOoV0WIjMdldjs2
 sDsRNg024rbxkd65DjA==
X-Proofpoint-GUID: A0WsE6E_EGnEIgmX8-XwqrVDImjZ_Baw
X-Proofpoint-ORIG-GUID: A0WsE6E_EGnEIgmX8-XwqrVDImjZ_Baw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX0YsMemw6nEOA
 PZ1eoCsFO7Emc3xo5Gs/ShopW3O/7RNlqedqVv0PZElFj5xd7SRJPOQmVt/7cxfMWz8NmUU1kcP
 WPvot2W+3A8Z2ZvkUbc9oaVrcOsjjcs=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8a57e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A_4eXHUubm_z0tGzWTkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046



On 14-10-2026 21:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing maxItems constraint for legacy interrupts
> --
> 
> commit 50febfa0c04f4bae15f676db2e6662c8855b0e3c
> Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> 
> dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
> 
> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
> on a dedicated interrupt line separate from the existing TRP/DRP cache
> ECC interrupt. This commit allows an optional second interrupt in the
> LLCC binding and enforces both are present for qcom,shikra-llcc.
> 
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 2141e5d4de63b..3546cf7c25195 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -64,7 +64,17 @@ properties:
>>      maxItems: 18
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
>> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
>> +          on platforms with an LCP/SRP block such as QCM2390
> 
> [Severity: Low]
> Does this implicitly raise the maximum number of interrupts to 2 for all
> compatible strings?
> 
> Since maxItems: 1 was removed globally, a device tree for older hardware 
> could erroneously define two interrupts without failing schema validation.
> 
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: llcc-ecc
>> +      - const: llcc-lcp-ecc
>>  
>>    memory-region:
>>      maxItems: 1
> 
> [ ... ]
> 
>> @@ -234,6 +244,20 @@ allOf:
>>              - const: llcc1_base
>>              - const: llcc_broadcast_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-llcc
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +      required:
>> +        - interrupt-names
>> +
> 
> [Severity: Low]
> Should there be an else clause here to restrict legacy platforms back to
> maxItems: 1 for interrupts and interrupt-names?
> 
Valid finding — without an else clause a non-Shikra platform can declare
two interrupts without failing schema validation. Fixed in v2 by adding
an else branch to the allOf block:

  else:
    properties:
      interrupts:
        maxItems: 1
      interrupt-names:
        maxItems: 1

platforms except qcom,shikra-llcc, which requires both.
This restores the original single-interrupt constraint for all

Thanks & regards,
Mohammed Faiyaz
