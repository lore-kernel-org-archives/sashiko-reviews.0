Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C260B41B356
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431056; cv=none; b=O/3/s48gE14XDEFgPoLvZ75SQDgyKvxpwoNuGcV9cPTQV+xDHcbQ1dHzuMpM5V9Pw1OnOA09vlJyahYsUfqnL5oK4/7eFvMkH+KrW2Y2U0wg1o3cNMbaQFjvav7Ip3+pkjCZ3JYN+Y7dvPgrrVkiN7Q6BdsEJQWDBOlopcuFIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431056; c=relaxed/simple;
	bh=el5leOsXCJlNZR7YPIXRPA1IYLaE3ipjFZKIGwggOqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6t5GofVOfshT7zGBof7kb5NKlv0Zym0TgxYgX19qXTB4XqgPpgF5KjSCtbcaCG4A3fH8YWVZP0s11dOJStHQ0eG6GK2KbRMozCQshA+AFxPi+RL8tY2+xHJ5yoO3fW4KR1CNyoZXElcX7yPuLsZmyQHcR3C7y76HxHiqq2Myuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfcXhchj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WieC6hoD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfcXhchj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WieC6hoD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9Lt03740877
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 13:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=; b=GfcXhchjMTrfztg6
	swTqY3IBC36649bwX3nk/1vaDs6SInN64gRZzQLIVJlrB4rhCyVOlMLSnDmrTpLQ
	y0wBBo4kpvkR6L4evuJzatEx6TM9DaSAhDf3h9GYeZXDIkEWD/pjbmxGa1Bc5U6/
	uMNLHOd3g7MeKSZOu5093En4G9Y0OFe9izLrzY35XM4ZM0X24cZ/fiLzCRDrj+1W
	GeSJZcdmkNKfvXCbTF8HrLtRHleoWtCY7bVBQhFJG3ezdICOr34CQmimcAsbyuAU
	P/oSwmDzYqWiH2MzzgwlnS8wxMVaIuQXoiEZpctWb4BTI0/xXIVM3J8Kh+SD98t0
	hgzQyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9nw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 13:30:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso25705285ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 06:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431052; x=1784035852; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=;
        b=WieC6hoDjuRmKFPqyEZ3pYrm6BMSOXGLjGVPj/TAMt6x14wvnw4Eb6qp3XWdmkH8EL
         lWmStIrtiGtEgHhPzvdVrFlyP2dErigtESO0W4g/D4EVt8lLDySiaE88TT6+VAHLMFx7
         hsfljPeaOaL9wrJJLbkJgZ1AKxPtcal9kHMolEywa1F5LxtRGwc7sB3NfLrPdrAx7CDt
         DzwrX9IdtGhUClEgwqq6zwJQlKWyrA7awu+al+ofIuYJAtqlPzumWrOpm8MWc+AobCl+
         0KN+cb4TtVQTxf8ELYSR6I2pHUkzlpeKNSLpf7+o6QVCCpSqrYKAe0RtKDKwjfCVBgIt
         Rybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431053; x=1784035853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE0NnWoCFLssW5xbg0/SxvH9BdegYqSbZiRxR835SuI=;
        b=CMjeCOeMcXBHThPz2S4GFFx5kqBCR8kt9B6R9xGCv89l4f0NqCXTMBI8GHhXd5Huvc
         r1mDUdzxLr4jNXcoj3cZA2rvzSPVtoZVbENnwbxvzmhlc22i52S/4b45LX07cdHUzab+
         HGyO+dZPnRbgVJUBATA+rtwb36+sl2cR6jiAtilnw7dSzam/nj6XSCIQXET7FdChpO7x
         1kfW8jI5HnmbIFswXs5xxexWe/CWc6XSscVo4Iq7v7aqSXSRK84zd6QoaZp9rzV0vD/s
         9FSrAni9pNIRfgRpB8koAfwjQffTtjVR1I4cpd3dxsieYMEL/16E17h5ZlPMb8rx/hvA
         8BQg==
X-Gm-Message-State: AOJu0YzEJXYvbGLgDATB52yv+zkJrCg5pS4WZJyvfQEt3CaKbZRq4Gf7
	Dk1NUNZJtk0Bot5msOlQfa9+oydH82NjBkUH0HXuOMMI+igkHOZM6eZXO4SNoy1vNnBw8jikwHX
	hmwWpuZ0BnE583gsXdci6h8VWe6MLWdLTNPA1jB60ZE6fRJLS4liUzDPuZLGu5FYk1MNZLHpduz
	xWvJQ=
X-Gm-Gg: AfdE7cmNVr7s9lzrp1eRxSN4rvrVtyakG7k0GAww943ECkv8WFn8+iplhtkiLe530ai
	+Qv7gqNFqyTCcdHpQX4HcC0XBhJ1mHEq4MeU9VtONMFNWpZ9uF3a3UChracC7oYM0hF+dXzLD6I
	RPp7BqkKdH/BAuMwQPkuxbXZ7NLMScxbAooWGrmn9PIPLtjq31ZMbnv+31nDM4omTt8nbSWSryk
	rzMIruKV+C6jVG6tXDN84h/U63ItAlXl1GEgzt1WMPwklZqX2rQvrnYyqDK4QuuswulrvDj03kE
	9jOH04S5zopOYqFw9LMXQUPl8ziKHy2BEm8RDaMTZRB/iE53xCEnjZ2de14zUpweEhtn8EQG+lA
	w1gRUZOEQUhLaIQVKQebSKEIISWOu1ixTZG7skLiSo5w=
X-Received: by 2002:a17:902:f544:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccd8073e0cmr11847075ad.45.1783431052550;
        Tue, 07 Jul 2026 06:30:52 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccd8073e0cmr11846505ad.45.1783431051916;
        Tue, 07 Jul 2026 06:30:51 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d968sm12072725ad.60.2026.07.07.06.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:30:51 -0700 (PDT)
Message-ID: <5face958-656b-4287-adf6-6dbeeaddf4c8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:00:48 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
 <20260614081546.585941F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081546.585941F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gpAWpqz-7H8sy80AUIj3sgqqoDjmpZyv
X-Proofpoint-ORIG-GUID: gpAWpqz-7H8sy80AUIj3sgqqoDjmpZyv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX2IxZ1vYo94lF
 R/R9J7Y9qcPdVWrYX+52/VkE+Yk8HXjzhHxfKJ4jmm4AzZolN/+A2E7Fr0BATCzh5KiBdP24QBb
 6Z99tcVv6wuuCEZLJ0LcXVI5y0xK5Tg=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cff8d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yq9WwLAiYoGSkMfMoKMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX5j9pjFsAUcNg
 gmQC0QrCYSrCzw4iuerNO/8F80UxUzZWmCm6yN/7OvB11gDROcOwx6R0vrO/iCQvca/dE6Obe4G
 owGkG2eAIAXzx6D6skGTxOE/FpRgdUOsB1qd1WBNxlpU3zbXZym7p/k3uUzXWQyjUgOPeTPziNQ
 xu8SWcIM8mXkoEd9xee0+3Pw02chb9PS0DR1veTduel+QH0dIsm4TUooYHdDTFgzMuriur599xK
 YK0TMobi7GAB/PJGYw96Ksi24kH4r2o59XJEYQn2gTIb5WgKSZ3otQF1TC8PYlxUfVMxYTeF8qL
 sp+xvL/7qCJN1L9MF0SXEVXabbnE5d0eC5Pnqa9nOGfWDwsjx/1Ph6HjWHnWJsGIwfURGmGe2pt
 p59us0jff9l0ymY22QJ2W8HuEfeWXttO2r2iGV0MC4ZIOSPQVvJz6tPNLmEpUqtTzzGxUIVTmtZ
 AZTH9uBPSfyVqDAQ5hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The ADC interrupt handler `adc5_gen3_isr()` may dereference a NULL pointer `adc->handler` if an interrupt fires before the thermal auxiliary driver has registered its event notifier.
> --
> 
> commit 2afa9a558734cf9fc6ad1120da9026df8390137c
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
>     
> This commit adds ADC nodes for PMM8620AU PMIC instances on the Monaco
> platform. It exposes the DIE_TEMP and VPH_PWR channels.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>> index e990d7367719b..232bcb942b54c 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> [ ... ]
>> @@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
>>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>>  		};
>>  
>> +		pmm8620au_0_adc: adc@8000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x8000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> 
> [Severity: High]
> This is a pre-existing issue, but by enabling the qcom,spmi-adc5-gen3
> interrupts here, does this expose a NULL pointer dereference in the
> ADC driver's interrupt handler?
> 
> In drivers/iio/adc/qcom-spmi-adc5-gen3.c:adc5_gen3_isr(), the handler
> checks the device driver state rather than the function pointer:
> 
> 		adev = adc->tm_aux;
> 		if (!adev || !adev->dev.driver) {
> 			dev_err(dev, "adc_tm auxiliary device not initialized\n");
> 			return IRQ_HANDLED;
> 		}
> 
> 		adc->handler(adev);
> 

At present, the auxiliary ADC_TM driver is not present in the code.

The above code block lies within this if check:

    if (tm_status[0] || tm_status[1])

This requires some channels to be configured for TM measurements
and a threshold violation to have happened, which is not possible
if the driver is absent.

Even if the interrupt is somehow triggered for TM violation, since
the driver does not exist, adev->dev.driver will always be NULL,
so execution will enter the error condition and return without reaching
adc->handler.

In the latest patch series for adding the auxiliary ADC_TM driver,
https://lore.kernel.org/all/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/,
the above logic is removed from adc5_gen3_isr(), so this issue
won't happen.

Thanks,
Jishnu

> If an interrupt fires after the driver core sets adev->dev.driver but
> before the thermal driver calls adc5_gen3_register_tm_event_notifier()
> to set adc->handler, will this result in a kernel panic by dereferencing
> a NULL adc->handler?
> 

