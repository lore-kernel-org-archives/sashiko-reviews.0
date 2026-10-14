Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCD417BD2
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007574; cv=none; b=i+EYaXg2A0H2xyxcMp29Gpn6f3aPDbaP8YkrA1J4GsWnM1EQKHyW2fMCIf5z5RndGZfOyLX6wzcMZtX3ilf4PyHtw69g/uEM68JjnUUHCB9j+2klWcT9fPguGSj+g3/swh1398g9nowt030invQ9vFdAveeArC8xVEc8cSRQxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007574; c=relaxed/simple;
	bh=ReFpRRAgkKoEWbjYXMpmQZT0kUFVcs63CwxVD7BMpAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SihIRxXoNQAJGf4BnmyPzTf4pmjc/NuHpW7DdrAweGAnVgM+9kXiU+GY3wwJOSyh+qOQF0t7L/bcqjhBXRkAbZpN9ikF6sUPJp/7GLdcf8xUKRWt++qtvnNpJefcdfPwQ2R9b3mHQPa86vTWRVPPcxfFKCZzNMCWAC/DMkTScxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqUfeNxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAAsARiQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqUfeNxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAAsARiQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0F8905401
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 19:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=; b=BqUfeNxk/WSzdUE3
	vl0PdSWOEw0v47QE/lklo92yQJkQAIwDKW/Qeb5beUwZEfqpX4mjWsHI6K3mEhTt
	vJEUAgSi0LqaB8ciRHA0bvm6WeLVyjF0vLCIAbSYQXiigtzLPnuVMyXishzv30eP
	ixHit0zngfExkW79Lo8ql+njNmrVjO/6CCFN7GTJCAT5Ph0LnHDNXdQOGc0jtZjy
	P/FOB9Kj2eRt4RbwKwkv4KOO70Trmm+EQZriClV5JwNAi5DN5VrlH6h7udCUFFW+
	xc8brsaV5lYnL/Ya+YjbsNVZZAdAL8Y5EskIx9HxOwrUNS4D3GMRoMqza2/VcsYw
	hS38mQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p3anm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 19:52:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea9ea9d13so131681285a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792007570; x=1792612370; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=;
        b=ZAAsARiQ9hIUIDGJSAdxNBeVnv2LGOaMZ3WxpzsyaTZ/zPFdzy5iRxUOMH3UePqFUR
         prfiXjLcvhEQ1vJHzJ8O4NvE8ZtfVhbXiGPA2O8Wn8BKCG52jcxFmrnKdDAG7vXfkSnQ
         hlzLDbHMmG8w01u5RQkOYMI1nl47wY01ih4l48yREFqa680Xv0+yB95bcxVZADFS/pM8
         0SKThU0vZcYhpITed0YttXRHFyvAH+0cfXQyBYJ+JLDRqwGyApJWKShcCJKvBGDx+5nh
         igwRVeC4PiwMHM16LLn3fHM61xCnzepxTHGppgBksiYdPIIUGOxuMUFkSN6QN08Vjm1x
         gVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007570; x=1792612370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZFLeKS8LbCHuSy15Plp+ehXfZaNLPig+CMGbpTyt8=;
        b=STUgewofv1YhbQjrvKytZ4XYjhLRDzwSlDa6AZfhE7l9x+oE0PEHgwzalveJn1ZEej
         eQVKcPBdEGmVKlvUgbUWb9CVCYw5knDmd2gud6f/jylj1MlLwinRAXKSMJypYJXkrUO7
         PFidOUo37JrztSEIK64gPxFvgGnnqTJChbbnLkR0znSADukmyYHiOAvIy5AhiTMMFPS9
         BKnMX0hxZx9PxGTOdVsypfJQE3SbWNxbGMCgF31L4u5Cxr5vvs8EBX3iYFLsOTQqqWku
         SdKmtvQKnpc2DaHHa9fXxNUdqSTcvjONW51qS/OHU8U9+H1AptFi3z/CIUjB3eoKwE4m
         oL1g==
X-Gm-Message-State: AFq9FYKi2IuLVTC2rYnUSAxREzBoKSnSe0SzuMAjo0IS34QBgRQmhMHt
	lWDQGMM1mnZYpyabBqEdukyScLBDB0kXSv+1WlcvHuohSOuFTPs8jQVAM6glEBr8pPpq0Aiv9ra
	1m6HX0LBMmhEJVQEbkjrH0+3CdCfEdODY6lcJWX1LBsDe8KMYpjWC9WQLI7MNjA5h23lkgFmKJS
	1ITIY=
X-Gm-Gg: AYBFou2V3KcdFI2C89Po5r1tIkrLMRg7nJD5d7SwhBaEki1f8+Ol9U7LiyzjcG4kGJd
	y58NhKspYxcNqJ5ZV0uhlMV/wo6go8+D2JYjV9FIiNCn/ZY5i+PZd4sGyvEidfrDTrNFQHzeXhV
	SsTq9kqojWUeiWa82o0EiBD4uKM89W7JZxDrMfKDC1HhbTW817o2nGXE52bIIzVO5pqGw+EQFrN
	ck0Yf718HaQmQklbVkNRlBYFbC/nhMiouKmobyMCGBo+gVXeR147PKPJJBBGgknvDaAGZr269Ux
	GO/yLh91IUo8cUqXlIVqI6pFxHsvQzKCje0kQHTxzDKiI1dInrMjPTh377GF03fVO5P/1WR0wAo
	8dSrtKXlPwfvStx9+R4VnmGScofQa+fMNEYEf7og+i2t3cSCwLY8nerSIOpKJKg==
X-Received: by 2002:a05:620a:450c:b0:93c:66da:ee12 with SMTP id af79cd13be357-93ebd1ba9dcmr2766271385a.19.1792007570447;
        Wed, 14 Oct 2026 12:52:50 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:93c:66da:ee12 with SMTP id af79cd13be357-93ebd1ba9dcmr2766267785a.19.1792007569945;
        Wed, 14 Oct 2026 12:52:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66c5e6sm10626005e9.2.2026.10.14.12.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:52:49 -0700 (PDT)
Message-ID: <6496e610-03c1-4d7e-9061-34c05aa7f356@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:52:48 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <sashiko-outbox-171811@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171811@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX+MLDeK0N4rw1
 Q1+W1RIbdv3oML89nIDS+FHi8CZR7Phi5S1lraCkG3x3je9DQ/lD3uxAo6gqYtbeF7ARdxaH7j/
 QV2u5VlDvKwySevC5bpF3DNRLMEagn0=
X-Proofpoint-ORIG-GUID: 0zL48SgQJI7HMSyGP1eldS6oERoDJhwy
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfdd93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RCLMfyQtFAjoeX1RJPwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX9nzNDHn3GH0X
 kcH8rpuTTnQn7kJCeENuVjMTWmZH9XKELpguZnmxDclvWV+U6/9LG5IR7j4bRnc6mH3csh8wup1
 5xbJGrsncdwnivMw5+ngUg2/6x/GpQMcCX0Tf3kiBR+5h+I2i/pf2yTCQSY8mn4T0k/K05SUGvx
 p++W8yyg+VMTNbb7/9MQ9e+upQHcciAej4cfYc0R11GD+MYJTzQqAnM90cl8KMmNwxDSbh3ru5A
 yvcpVGqRgPxd0yoJlxbE0S1DH4mdTrljzbITmHora/ns8u5N7SohZ1PeSDcPKUxmbH54HjG2huI
 RavpIKTtyu1n3FgKc1VOx65OpP9rl/WBfi/wM5T2zhuRpIyMDxt8ORc+DTE/Sp+9c6T/6j9a3Pt
 pMie+K+n//L7zNFb34VozOTX151F/4nFZtyZ7BxAArbGLzVYfAp3gWNxCaAWYJ0GeIW3lt6h+6W
 023/RQKcJa+JZalx1bQ==
X-Proofpoint-GUID: 0zL48SgQJI7HMSyGP1eldS6oERoDJhwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140079

On 10/14/26 21:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: missing #thermal-sensor-cells causes thermal zone registration failure
> --
> 
> commit fd5ef96fe4a4a5f82c85c0157e689c00a5a97d30
> Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
> 
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 0bee2a3d6e7a9..9586421553442 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -502,6 +502,81 @@ platform {
>>   			};
>>   		};
>>   	};
>> +
>> +	thermal-zones {
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> 
> [Severity: High]
> Does this setup cause thermal zone registration to fail at boot?
> 
> During boot, the thermal framework resolves the thermal-sensors phandle using
> of_parse_phandle_with_args(), which expects the target node to have a
> #thermal-sensor-cells property.
> 
> Since the target pmk8550_vadc node lacks the #thermal-sensor-cells property,
> will the device tree parser return -EINVAL, causing thermal_of_zone_register()
> to abort registration for all these newly added thermal zones?
> 
> [ ... ]
> 
>> @@ -1285,6 +1360,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>>   	};
>>   };
>>   
>> +&pmk8550_vadc {
>> +	channel@144 {
>> +		qcom,adc-tm;
>> +	};
> 
> [Severity: High]
> Should this override block include `#thermal-sensor-cells = <1>;`?
> 
> Adding the missing property here would allow the thermal framework to
> successfully parse and register the thermal zones.

False positive:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi?h=for-next#n291

