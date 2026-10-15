Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19DF3C8C52
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074824; cv=none; b=swhT3AJw/sQp1z5Rc+kqhBato5crea5cvahg3RVrEFWLAoB+tKgWLVRtWtGp54zx9HAGLh1pEMZk0cZM2ZAQgeFzLImhuIeL3EGTIOlqOyUkSrhKm1sAb6hIFKJz+LAEjbIZ9LNnd4+tWSeEXE4+J62MRAlSTyPN9RGdUPKqapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074824; c=relaxed/simple;
	bh=K5NTIEDtDfh9VNC1qqBCzREC+FQyn9ng7cT1odY9Qe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMHrMh3CwPnuU3SMhJeFd0ZNawF9ScYtLye8iUN7ULdEhyZolmrhQhC/adPGT129YRXkf+zPy29jBDANcLbTnRxo6PQV13xxINTkx2OTkCcVnbzxTyHoEXpuXR0m7dBVdt7Q8/VWKDUkZzi1A/yknZ2OWZCzXYPTNdjPwWwQIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1egkdP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmnY+V6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1egkdP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmnY+V6Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdQD4100190
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=; b=S1egkdP/s8sze7PO
	11YisQ/WT6eAhgjUGs27qG5utCsO+aYJGuOg5EQRatKSFhlxUXW6IF+5c86zrmFd
	ZjYbqE8l7NT2z/qtW5A+HFzxMpPuG7Wv7ysb8I9M+32VzSJTXqbzP9d+B2d58Vx6
	Il845XCQvPKaOVqI9fUbQldJMzWc1gRzJ6wp4Inn6mp66Jw/qWnVc1S0G7CRcFiP
	Iu5GyO9QqlJ/00DJsyVn3aaKld4TrNpQ8RaiPWcXoVMiEIjfdRGhDHAw4+fxb62F
	aP2gjDWWtmgY6j5bfjrHk3RDZJqgXtMtZ97PE2yQRHZSvrsUQo3LI291xXLwUcz3
	6Fwzjg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8xpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:33:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso213185e0c.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074820; x=1792679620; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=;
        b=cmnY+V6QNrexIXQ3sMshYYdvxdvu0WaITrIPMEaPqoLuMGJWWW9li53it5RuxjDLLr
         bm8dRK/gCuqVkosAzPYzNUvkuE4wj6GQb4X9RT+/CPOoGZFL7/63qDXgtgwp6kbHyHkz
         NjSyzaPaOg8u72qnNaIm53ACSCRjV16PB7iEUNTR+v66hWHsKtBUkCpfmo7Kelzj016z
         prAbwds9kbFuCvogJQTKsUyMlXqrEc2pIQMi6s8j8pRQLoD9+XT82wp0l/lEC0d1kuY0
         qto9bQZm42Qvq30HPabyY0xhPFUEgtXVvxstOo2o2VEKkHOV84STqJzqCvZBAELlZjBK
         Qm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074820; x=1792679620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=;
        b=Q5xoPCJtvGlpq3iEd9Edk9EUvaExdw7CKX+7NtXC8jIWYXTt5Z3Q+7Wsuo2JQ8kol3
         aOia3aSCtyoN2/KGWf6AZ+KOibAyX+BCPbvl0dno8ZR7zJ03EHe/9SSoN9SVtUycOVHT
         /+fK16R6fOQm5qRKy50XQtVz6ybvhX1Q2FsMbAijBdMgVoi12/tHDfzYlF/lWjX6PZ6W
         5pHcpor08cVErXBkIhITWLsF6E3Egs81mmBy5Wi4ju2CieZD/SFZ+IPwjhFraOraH9ed
         1gO0oB1jSqSm3dzgceyoR+kDcgVZwPi1ip0m82+1Z4P8mO5a5kLbb5cyWO8dYZ7YfffD
         LRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBznNYObXH+V9rGAkQKEVcPG0u9o5USf602BI/P4IuDjmR3O+4DWh49PJtvMC+0hDkqc4nvcq2+aBSE+ZMynYJQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYK1E+VNM0X472hZkk05hvSUKlv9LCWk33BbNFaXN1tnzwFt5FGa
	oKzje+Nukk4ZBySIMx5T4x5b6XH4nbfpNSKILlwFfaGzc/vzG6IOeimOnpW9ywo3uxartmdQkbZ
	m9rlBL9ecX/xUdmp6q3B0wq84Nkl0182VihgZ514CO/9X4vPXuVGcLMxWlYCYVANXbyvVjaE=
X-Gm-Gg: AYBFou0gkUW7ibL4U9dUwKuHI9wBHXd8Zn8ISQeWZWVPg7PGq0NcUjFQ6KrjX7XAaIR
	1/ZnR+Ty0yOz4WTXsJpAB972a/iwJQvgSK/ykqslGUqeqpGTvRqDMNZOnjXhpe3aaKoxp1bkZln
	+WVrtDtNzA/LP09zSz4T8dFvIP4PW0JGQ8XockTndPDpkfhrKGJ8+mmSA31MUO6Mh6KmKhsLJho
	SCq6slX+QANydhZJ5YOyCUP0Z8BM7NYru6c0dYB4YeBTe1aUyYmCyZpumRwQ3hz8ugUi/aaxEPd
	mmnoel/eRJx1Zqq5sJdbZEQlYLp2bMv6pU3XNF0yQLHukRagfCG3SlmHmwjbu2A1nspJwfuffNq
	Vhg64XsIaquwz6UH2neQE0A==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr4128535e0c.1.1792074820076;
        Thu, 15 Oct 2026 07:33:40 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr4128519e0c.1.1792074819630;
        Thu, 15 Oct 2026 07:33:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038ac6c1sm2663838a12.35.2026.10.15.07.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:33:38 -0700 (PDT)
Message-ID: <df64e5e3-0585-43c2-b6bd-844abcc4ea9d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:33:37 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
 <20260929214304.E1BDF1F000FF@smtp.kernel.org>
 <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX+FfGTYBi9yBA
 n+XqVQDgaK6WemTZOgpv3odyoz53jVfZr01GTUuzQTiiu3MqqyQeVOUTGKc1APtFW8oK7b33VZL
 p1TFy/n5tMqsxIBLpZEr/QeMq/NOerA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXxZevcSrBoCEl
 aYiot5+nJDvwh7nEEvpY8dybRQD1XpagLdpwNpGrAkRLeuJ7fsw0qI1THnMNTvL4AVe711bj4CH
 oX/CVzGrv0tmSy0T5o7Sa6rWirJOyQzlDC7X5WV4F2UJn/oM+6/o3vPY4OP2ceAEr8a8jg5sigq
 KimCMjn/v0qzX40sborGPb5HvYg0GPuTU9kI7CDOcXaZJ1zD8o89A0LzuTD406W6YXYjWVAF/l3
 9/nL/KvBpM+WtpqDz5c4UM4HWb1pZHk9pvwz4Q1z0y2uv9CuvK974yjbAmmsSSNoAUbyq7SOYKK
 A3XZc2bqbQ8YO3RoKkS4lL1K44eVz5trJNH5dq4Db1tDYqCmaORA8rLviLMT1R9HaC5KDSVXLs5
 XS+ozLySzFg7LehWiLqcC2A8Ch9YLqs0GHfWa3+4C6oKUFPglPTLP6/eGWKaM8xeTD5ZcRkzH0E
 CywiIjRXa1agqd5Rp3A==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0e445 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s2oEdsPTHuEvHUgcdc8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: YFQkLm4JW4XecnpH4s9HgqCmuZvvcufS
X-Proofpoint-ORIG-GUID: YFQkLm4JW4XecnpH4s9HgqCmuZvvcufS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

On 9/30/26 12:45 AM, Elson Serrao wrote:
> 
> 
> On 9/29/2026 2:43 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] usb: qcom_eud: uninitialized software state blocks disabling EUD on boot
>> --
>>
>> commit 16556b4a5664eacf6eb75fc1fe5031d31c087dc0
>> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>
>> usb: misc: qcom_eud: improve enable_store API
>>
>> This commit adds a state check in enable_store() to skip redundant hardware
>> operations when the EUD is already in the desired state. It also improves
>> error handling and logging when enabling or disabling the EUD.
>>
>>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>>> index 48e474bdf818c..e227d05cfecd4 100644
>>> --- a/drivers/usb/misc/qcom_eud.c
>>> +++ b/drivers/usb/misc/qcom_eud.c
>> [ ... ]
>>> @@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
>>>  	if (kstrtobool(buf, &enable))
>>>  		return -EINVAL;
>>>  
>>> +	/* Skip operation if already in desired state */
>>> +	if (chip->enabled == enable)
>>> +		return count;
>>
>> [Severity: Medium]
>> Will this early exit prevent users from disabling the hardware if the
>> bootloader left the EUD enabled?
>>
> 
> A bootloader-enabled EUD has never been supported; the driver has
> always assumed EUD is disabled at probe. Supporting it would need more
> than syncing chip->enabled from the register. The driver would also have
> to take the PHY votes and bring the role-switch state into line for the
> active path. That is a separate feature and outside the scope of this
> series.

We definitely want that usecase to be supported too at some point, but
clearly outside the scope of this series

Konrad
