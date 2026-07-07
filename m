Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8642254D
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432296; cv=none; b=LqZLoqe7nQdKRWlrgdMPdw2qWi8rKh8vdOZKSsT4v0qSR3U7Rb6Rbh2emZX3/aiOxVzlIvQwCh0/gKIB1FP9OUwhUv8R8xsvdKDA+KsPLf9Bq/ZgKhiX0Fz5Qn8UeKHag7fh7HUjsuSGHw6T0c42MVOGtkL6cMNraCq2Auu4sqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432296; c=relaxed/simple;
	bh=PefjsNStBfDeB2pFXgcSFlCs1Z8xJm1iv2575Ply3HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwbQPHBfogXHsPdSc2SGNLj+35Ze29OnB3Qiv6m+uK5LrN8J7vu3ai++py9a9dVrEkt6C0d6XFP3uhcHh7QonUaiynL5ajVaM3SiJlji/o17mS+7Hnj24DnpjdTlpRcKPETf+YrgCJMvR3Gayv91sMiwlnhku6nENZjAQEv0Jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsMtSmMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8Pec76z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsMtSmMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8Pec76z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8feT3606110
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 13:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=; b=EsMtSmMpCg9TB+i3
	/jyw+VnHDv4Rax3S0iynZG2hVL4b2j4ZzD7k3HVUX4KM0ld3JhtL95A5x98PfMz3
	0stNVdd3EeOyTIZQc6ip3VTIaZSX/EmyOnHyBO+428ZmxtAHPBmc1FhejwIISwDO
	8ZQdQqFbuJKJbm1UvzQz/jtNZzd9QXElTTYyeUKc9S3a8u+OW+ZcSYkpiEolsXhe
	4sQ59g0TRpkU+zhiaTwYxNuILCToU+nD7gHS5DonmJhHEpQ2VPSa1XCqjRL6mjqx
	DBc+0PxjEHvAL093m2+Yk8nS18jPV+4rq6rkcxcGoIGtW7ilRFRIn5pqCot2VJc4
	9PasTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j996-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 13:51:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso73508191cf.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783432293; x=1784037093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=;
        b=W8Pec76zUKAdYSS4F+mhEbvdXgLuJQ3GqKJp6O84oU38YPShIbNC/Krgj256eXa+aP
         oQtXeck+SiU1rC4YTmXghrAzk49UuxEsSYsat/ksMyg/fyNaK7en3cvJej1yXAa5oWjW
         S1PAjICpSbt8dbgf9tzoT4E5TPiw9UNUGsy0otqul05DIeiu/U9VfxttdV5o5lCEVJBM
         RyT74BC7DfiyYizILrqQAj+HsgTr5QchWtrTHnuWqwuS2qA3coccr3D4VF2fmJ88au+S
         7LmJDEKIBL0j0+QH/2CuO4APZCQEtC5/LAfXppfm4C0VBGkZMv9/LonmI0IzCbQx+1xI
         h1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432293; x=1784037093;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=;
        b=OdGLPaX4uvTreqfE3LDH5gYVAEg2MAFnmqXj16N0cRz/pXaFvw6O+useOjKf0I62yg
         q05Ip5rd0zW9gTYl/w+N7UwNT3OHsHD7Mnj7BsPyfstshE4bFzU99J4Rt/schUqeS4aj
         L7Ixpbpux2YeT69JZ7TxZ2shPNYd5gEuylBVaH6+ku7ZbZ8SvXyQpmrmXDB4bb78l5Aq
         HFPMr88AH33rtzSF9eCuSWnR3r6nJW3NBIj26z78d2hFsxuIrFq+h0BMWsjuZuwy1hGz
         Yeu8NjStQ9ksQyXjsgt9GMkZhpe/1da/d1DYkgvUSubfVO/IftR2jVXGdqKsJ9/1k/h0
         SrXw==
X-Gm-Message-State: AOJu0YxoS55aMHAUz6rxoKakzHH3hjqcUul+kJc6QbmBDyM2oEQiT5uN
	FVcg6uXJEbedn9AsI5iLxbAWIVOtkKYyMDQSAWAEaOzIPW/TqFzQUjUfGqoq8weh7/OEp5SmaRl
	iLquvTpu35gSawIlw/1Zspt5GFzKl8K3PsRJWDOsdpQPe5q0kcpof/YM+WWN1fA95Wld50wghu3
	zUfJY=
X-Gm-Gg: AfdE7ck2vAgdGo2gnVuhXAn6t92h3q+I9V8OGBjuXscuGeBkidfeQoPUPKdeTWjTG8S
	pgNRNIBGoQOELV8Ut4JRayECCi9kU3PpmDs8QKC0BISO/Znt7Vu/ktjQDY9u6JS0u9jCNY256zM
	YcfwtczuP6uKq5ILfqEcLhUVx8/RkJzxl5UZRtVj6PkyxVf+pWehQP1VNpaD9D5jbZEoVKHJf9v
	kRP8Ass5cjuuo0I18d2mYt1EurUEAeN1d/AAOK5OM3ESls3+/5XMnIc5uGLAzDgUFK3Jv5yEEPL
	47uYg8N97NU08VF++KpiJ70hts/UZNIel5qItfznkbOMy85iUACvp9vOjVL8gzRLWK+Al4jNfKS
	cO0hd0MUhJG4GrNv8I3dwH5Hd8Ipyck8Ev+ui3geB
X-Received: by 2002:a05:622a:1448:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c748e0298mr55122981cf.61.1783432293454;
        Tue, 07 Jul 2026 06:51:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c748e0298mr55122691cf.61.1783432292920;
        Tue, 07 Jul 2026 06:51:32 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm31224164f8f.34.2026.07.07.06.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:51:31 -0700 (PDT)
Message-ID: <ee11c1e6-2674-44bc-bb92-07686906b502@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:51:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
 <20260707134830.F28FE1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260707134830.F28FE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNSBTYWx0ZWRfXxCzJbXSe75Za
 mZpfJAPA4ueGzHVy/VhqNuwzpf9BI1WMgEG86f5FibxNxF3KL/N3T8LQiA5FFz/9NugIPtPAqfR
 tjl/y3Rs6T18LQTMb7q5f0vMnJw6gprfS5z2mDaDbyLxP6CH6ERH6miIQrNJ2yGrSLHPnvy3KhC
 XcsF4IjsTVkzOGfL2VQ4asExwtOj21CaCoHU17KiFQOw7mqUCNSN8ZI1DMATNsGVq41wK9zaZLj
 R9egKMZTfuzGq2z2J+iv8HY/QlVq6jvGkskF8WzsXV5KlqqiwTISkxoni1UI2gk1Qg/Ii6BNd+b
 Z4sfjrncjQQE63DBPPOMUAhoGIHCYjZOOA5N+1unvvzdmE5wYHGeWpnEL3eoWaGqyjC6YyAgV+/
 M8vKXTQSOHG6c1kQ7vzWCTJSYGMPAzFHt7xQ2Dqmx2FPWsbvASwBWheN+Eb0yuTkekKSMokPrnY
 CuyjGpLI0ec++OI7dmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNSBTYWx0ZWRfX+oZryQTOv7X1
 1sf83Ye5LFxuY24UtmbfBVSQ9BRzuOTu5pU0+2xq+vVNL6By7eiOOFfUUVB2PhSpnlWkkK8TwTf
 RAB2Lt/R+FEIZeXTNAeWeuvf+Yg4Fsk=
X-Proofpoint-GUID: gGxxGadtzIDyMgHSHjcXs562xVXINB85
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d0466 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3o2FgGCN_BR4YKjyAHAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gGxxGadtzIDyMgHSHjcXs562xVXINB85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070135

On 07/07/2026 15:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Schema validation regression for legacy SoC component node names
> --
> 
> --- Patch [1]: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names ---
> commit 345707be3cd74ebefeb7a14bc7aebf31883f9f6b
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
> 
> This commit updates the devicetree schema to allow proper compatible naming
> styles with explicitly listed new Qualcomm SoC codenames (Eliza, Kaanapali,
> Hawi, Mahua, Maili, Nord, and Shikra).
> 
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> index 27261039d56f6..fecf9dc05b67e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> @@ -25,7 +25,7 @@ select:
>>      compatible:
>>        oneOf:
>>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>> -        - pattern: "^qcom,.*(glymur|milos).*$"
>> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
>>    required:
>>      - compatible
>>  
>> @@ -36,7 +36,7 @@ properties:
>>        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
>>        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
>>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
>> -      - pattern: "^qcom,(glymur|milos)-.*$"
>> +      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
>>  
>>        # Legacy namings - variations of existing patterns/compatibles are OK,
>>        # but do not add completely new entries to these:
> 
> [Severity: Medium]
> Will this cause a schema validation regression for legacy SoC component
> node names?
> 
> Since the select.properties.compatible.oneOf block matches any compatible
> containing the new codenames, legacy-style nodes like "qcom,scm-eliza" or
> "qcom,apss-wdt-shikra" will be pulled into this schema for validation.


They are already there. False positive.


Best regards,
Krzysztof
