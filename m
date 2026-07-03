Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2729C35A
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101006; cv=none; b=c0hLpVoAQFLsG46p0YZKm0vYrXjSnEXuOo0MJzWi804hDbKc76E84dIGmccsJSutlnawu9W05iLWoM1js//Bej+kAJAuL6sIVwEGPipNiI07x7noNwoJUbyf/3HUAZiQ8xZo7iTcSmkoVCzvi8wHRChThImd7WfCt+T9Vp8o/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101006; c=relaxed/simple;
	bh=UM1/QYhZL2jHpR7AM/QhV9xi/7PCDKlFIVODBk8Qig0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnzUGwgiAl+WQZS901tfjTrULFTIuSJCoZfJwdZ3q5zTZXOcniN0DMj+Fvzr12rO5ZifMTKicjblDcvcATJ6JM7OcR9ePv/5g/xeWU+138OlEztdfzxDSUteBCNk2bWXKCwnVqp0NK+DQP7XfGJaqC+AAgEOknybaEvZEyjp0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFIdkWe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDRNzqJA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFIdkWe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDRNzqJA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiWrS684726
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 17:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=; b=nFIdkWe1xdgbnSxN
	cRtmUEcVkoV34EN9UEa1uQmw8cAxIWbShoyHp3fXbtE1QXb1AhQPea8pXeWCpoSu
	TKd3LLcDG1Wb+sbMeAy2DNpowk5yKNJQm4RBNlMNdkg1rNiPXWNgIe1hdH82UGEk
	uSsp4q8OwJ2X4Sks7y2Jkn4XsAEXXxf+xMq62QL43vgqrFud9buGrI0EVVfD1a1h
	Qx7Xta5y1bbPbDOXAdj33nKO6MueVC4IQYaltkHnOWBY6/73i7UdN6J0l2SS02Fy
	pB4LdJYiaD7dQjQVqxm2bcY0NWxIOnj+s5GuXoEh8+Do6FublrsLfSLGgjju2uKJ
	cBlaiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bdud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 17:50:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so2186449a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783101003; x=1783705803; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=;
        b=jDRNzqJAMfoUGUokgeAbwhOtwXhDiS2yxC1UMmzaElxrNeM8cd8s8vw5AhNv3gMXUK
         1m2ex1gw6Jle4a/PfTNWFUfqXdE5FLYGSvaxLsZ77a9AcAwkBQ0Twx/ZOD1ReAAS+aSf
         ZPffcFV+UmYwXEPpTL/xlFDjuyk1Dw4gxNA3+5mmkFCuLHbklp/A8C6qfgZgLC7zatBP
         dHJaV75BiHGfAI18xbhyX9r9L17knDFBz6Sy4MDZ7nW5hnZNFHrTr2ybj5DClyr4H7HZ
         xww/hUoMQUQQg7rCyiGTrPYYaVltrpl7NLmGfmW7w1wqcO1pxRXrJd1lBcdJjnCxaGyU
         pJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783101003; x=1783705803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=;
        b=VXYamxr0gsDqzX4/aI279Kbl6YQGU/I4j9PuLXuLHo62F2B87eRj/sIVOucGIYd/DZ
         Mg8e6ut0C/gcAwg9eZSMb6SAXKaUK1yt1xzNhECnHxzvUZ+mVJSp34FcY4Xncc/74YH5
         nfUKuXP3KwS47QDJC10p9kp71N5EGlI1Bp74qyqvnT/M3zX/jMiT+qsXx2yKNiGkrQ9D
         wyc636r/SuUuqjpLIZAXDnbj38bup1lgrZ5GtqjUsoRMRM2OaEufeK9LKzmgZxq71iTe
         RuaIkMb4OXma/gBCpJkF8XbObpFlQIH5XjiLkeqZ7JAcSWA+Nf27RaByWCQr8SsECmum
         0/Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqpYlU+LgTFrKbNh8kjNukJk7nQh2pkNcpqVvNZGWfRbz1EdU+l/w+HqMpksc8HE+dRqTlhDIFk/bKSoCT3Epw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHyaluitQzP+B7NCFkqXD+/VSuA0zyqX8a/54Wv9lTkrHZMmPY
	cns+13j7IfuCGG96IWTG/OU92nn6HGA4Y9aIieqYN6rpCjNNhuE0cZGw8LtFbtsoYLTVzQGs55u
	kZDZZny1/50QK4ZHOQpvy9uS7eO7v7CEDxmYQqffQqoaHefjh/pYKql1LT6XchDsz0QqvKyE=
X-Gm-Gg: AfdE7ckskriNG7C/JN+oFhquFROzScBhwLgJb8JSf7IDHyeqtQ5YohQJFdHwiKooqjZ
	BuiKHAeVCUKo+y8MbssmZ0hod2tB7IbEprk5Q77uH5h3VJPXP9NGRNe3fEGtLI7DAqc4NpKwhNd
	4LSgSWrzZHrYqIs1+CdWI7GFMLwmFefVvWXR54WVVKrcvzBMgoR8jsfr8Q2edVqfUIFlPe2TgHn
	McKMej2tbK8jH9hwKJs4bgXQj4MsMAWLRZu+Rptt6DuRaktItLxwNXOHGfSV+R8d5Ag8W6kvpo+
	3c3X7+UHwWNQQvJz7BNzYDeo5Tmq4ahB06xgUQ77yIoVz7oeg0K/Amzi4/e+gZm1zSOu02xrB9o
	mYCC9OY6wgTqzkjCTnVz3ElIW+bavArM2GqqNCW2jiIEmZQ==
X-Received: by 2002:a17:90b:55cc:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38112063e00mr5494198a91.4.1783101003380;
        Fri, 03 Jul 2026 10:50:03 -0700 (PDT)
X-Received: by 2002:a17:90b:55cc:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38112063e00mr5494182a91.4.1783101002901;
        Fri, 03 Jul 2026 10:50:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.211.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm23319264eec.3.2026.07.03.10.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:50:02 -0700 (PDT)
Message-ID: <3c7f437f-110c-4cc2-8450-807afe1cd3a1@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 23:19:50 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
        sashiko-reviews@lists.linux.dev
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
 <20260514212353.881AFC2BCB8@smtp.kernel.org>
 <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>
 <akOUrV5BwU9/PuLJ@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <akOUrV5BwU9/PuLJ@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE3NyBTYWx0ZWRfXwgQ6fJ69HeSp
 SSa9E7ba9nJHVCVXsAdADbCU3AxcCUc4+qJG4d46Qnsb/ayF4o23cbDzVDbx6sM6xCTY/bJqvfD
 /XbPE5SwVhkktjuKHCbWfWv3G//2gZM=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47f64c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=rC9KOIhp3uddGQGwuJOTUw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=D0bSFzudHjEVgqge0mwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: fwTQn26RdOd-HKsOnLMC8gYjj5dkb_v4
X-Proofpoint-GUID: fwTQn26RdOd-HKsOnLMC8gYjj5dkb_v4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE3NyBTYWx0ZWRfXxQ6EiXdBBdA2
 tl0f5UI5bnHBOP2O1q3Sc1TlirEXJVmsPvPmvSngVSGhYiiaa5Fv4C1fdvEKLy+pTYq3Y6pL3yN
 SrH+bPLGiL8XTXBNAmtDmc4RstdBMvcW95X1Iupt0ijEWPgUxNA88OwTku5wmzgH3BVmvZQpOir
 ajk20MWA+T1PGklccluBsMBXoZcIoS8LyjK3Lun56nYv32kiygzDX73t9YHUwSW+uRpMqGC5HME
 sgAFxBgY2NLqqhOO+/Zo3Sh5+Lpyf9yWV9bXqmRHVHPJ+/EsX/WEV2JOo2RbZIsI2kcjh2nj9RR
 02BVRFi2GGjOyRrSXiulxca+u74+SngESbVHzgF2maIE3Yti3ot4zykueg7+OViMXpl+5KCBAHR
 w0dMsQYEfFLhar+x8Ei28ESv0ACo2VaOEGbwDihGMdMaZFrT5z6/+1W05SFY11kvfQTaRq7wrkK
 PWJZx5W9lnhqn/fqJHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030177



On 30-06-2026 15:34, Lorenzo Pieralisi wrote:
> On Wed, Jun 24, 2026 at 02:04:54PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 15-05-2026 02:53, sashiko-bot@kernel.org wrote:
>>> - [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie parameter to 32 bits, violating the ARM PSCI specification.
>>
>> Hi Lorenzo,
>>
>> Was going through this comment. The patch currently uses a 32 bit cookie.
>> The spec also talks about "SMC64 - uint64 - cookie". Can you please suggest
>> if we should add support for 64 bit cookie here?
> 
> I am afraid the bot is right, it is not correct to assume that the
> cookie upper 32-bits are always 0 :(

Sure so we should add support for 64 bit cookie?
Should we modify reboot-mode framework to take up-to three or more 
32-bit arguments?

thanks,
Shivendra
