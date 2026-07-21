Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0F36D9F8
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636036; cv=none; b=Gq1giEnsxTchs4OVrka+aCtkr7qvR+U6i6SgUKrVkueqJLDINHGe3pGtIxWGLgJuXIc/iL/EdpIiUKk18CE9eYQ92tyKIXy2tCnlwjLWrWwrI2lWAkarcG8pP03LQzr0y4Bi1yy2pSuNk7+8SqFBKtv0BSgiWUaViBDnPpK1+H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636036; c=relaxed/simple;
	bh=Zv+22myXf63RdfXfVQr2PZFXaQzgGkHb4qWcgvxU+OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBVYtZkb942mk725CYl66Kpu0HmvpBviKCnWwJwmlXR7vHMQGqGyN+y+HqGEKqdHW89cqBHvNQvGvcPmKR+yRVhOPbxNRBCc4eRH8r7erF6eSb1OI2ENUD2GdGrKw1LX7mgbv7SQ16/hPGSBjzrt8kq7l2MVl7RoZ18iAtOTekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmyBkSdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e15tpx7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmyBkSdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e15tpx7r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARLwB1134799
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=; b=QmyBkSdGo7e5dKvR
	F2C4nSGD5CHdkxnA/wRJVfLNcct34WkyucfU35UCe276kts/tkQ1IeywQAGcrAHm
	j5j3XdBM8wOtZNL8EsOA1CiHJcRHKpSWuHM7K2DJSHbFe0jU22EoY7N/0YiIVIuO
	m2meMrscnIPrcXWJydmnVFBAnT11F7cA6OxWympr1YpSTrlB3u/Xu65zNgpAz3io
	MZFnUPjes9Lky/sOyX5TN5/DV4XRtyt/yc7mjLblpDVHtFYihKjsR+16qnabEqID
	hQmtRddro8kTbqF4xbqguyWMaWDknwwT3Iv9jecsmJ7RHpjFYqNGS29ESUSyQuBT
	5a5PzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2ku0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:13:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so222242805ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 05:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784636033; x=1785240833; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=;
        b=e15tpx7rAxj+6LA9uc1vajXi3G+KQJ22f7jLQKCW9Xxp53MJ/Nfc79z83YyG27osfL
         NT78Otkr0E2zwXMqDjHrtTlEt95Q8EKCvqxVedRY3UXWqBJC5xKu8QVVB+TTzUtrprAD
         G7JJklESYv8sszsff9n8cotSu2ffdNV6JbieTO+6IF1ldmn5wJfvF2maM24YCUde9zl4
         qMIjpcUaXwCIazVDSANDRyCzvw7XrCoQhsZRe3bzT/zM7yH/BOGco1kH68f2cDBlCH8d
         q6LnHaq6qJDB3rZr2IP0nIkZylI/rGl+h+EReUp+UWh0LWieCPvAqxThLZVzneCiKyaY
         oMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784636033; x=1785240833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEVVNDrYzu3iXWuovNWf0ih/Ik+7p0RKVKTCKu1foa8=;
        b=Tv17/6fuvdcgrZb9vuM4/ESYiCbovxnfd0hgB03csP7spkMRpqaggWCAPNiPERS0jh
         NLiXdkckIVzxl9VJdOCczlSPCFcIwjsih47fGb0BpwKx3REJ33yVBcyJiCDci7iW6+vA
         4PsBP0E5M9wpJxYeTE3iLXQe615dByzvZCqBzHM05yf4amLMDLL1356LBc77T6p7f0Aw
         kjVCZoBqTLNOlHX6H22eFw3hoX9jQ0cEhkM5Ppo2/oCXLfbZkgox1z3B+bi2l7uVbngR
         WaOHIo1Bj4CJayymbWH0C836P4iqvMRrb/Z1iZEH1n8tTpMO4Y7pKVEukN0APPKUEPsB
         Rosw==
X-Gm-Message-State: AOJu0YyDAIj2f4cUdimq6uNLK6XxoeojhFLNQf5Cci0ZyjnQh9YCT9+P
	T2z/ZNnumR65y1MNjS44PPuZ8jD29AwXk5ssnL7jHGLH6ciTjvnTR686dWSlWXQNg+m0k1HRLXr
	p512H4JbzdqcQUcY1Y3c934CyTKeENnd/MtXJ8pliHU47JomJoJ/m4WIBswCxXZvabxjKlpU+RQ
	ORzpo=
X-Gm-Gg: AR+sD11WNQkBXVFwNonIOLwQ1v3QabBrB5cC6U/icBbtBtILxYVNVdKx82Ohl9aTdJN
	o5ilwj1I53dfayXNLDBDW4zxWbFYYEOURAePSmqlCnTzi7U25J3kXsnEOpDCzNOL2OgxHsVmvT5
	KHCXHjQzGy50bOvbiPR96KczF36gOWvCeQPdZkp/SxCcfsaCTwLlizbo+rUkZAPWb6N26e25Fq9
	A5/gAZL4lQCQKiC/s1DqFL1cJlb2i54iXC15N3xfM7vdCdHKszWOa+RuMSNdVrtraOfBqNmoYXZ
	WUWAy4HIYlDlMLCgJUcwXd5PR3cjsrHCyHWXxCZgs7yXdeukToSn5NJcmbkCqhAoEMfyqUjmO1b
	rCfUR7sMClrbqkMXII+KXCUVEVf1qLTaTHA==
X-Received: by 2002:a17:903:26c4:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2cf34821a56mr194587045ad.2.1784636033366;
        Tue, 21 Jul 2026 05:13:53 -0700 (PDT)
X-Received: by 2002:a17:903:26c4:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2cf34821a56mr194586695ad.2.1784636032889;
        Tue, 21 Jul 2026 05:13:52 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1f04sm75694805ad.22.2026.07.21.05.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:13:52 -0700 (PDT)
Message-ID: <1d15aeaf-452f-48d1-9943-5e522f808b7c@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:43:49 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-4-monish.chunara@oss.qualcomm.com>
 <20260716143554.3AD711F000E9@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260716143554.3AD711F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfX53H/ngfFRJQ4
 vKimFcTsgifweAwIhAYuShsPOmTLVgLpHTSeYuPqOMbuU7O8br8D4BltaG8WOPUzGsjFuiPshrZ
 z8e9RF0fcNJzIn1KAklQF+cOq7V49561acPSEcGD8CuMKwp5npQNByo9Y4S/e2fIH1TptdwLp85
 UwIDmYDEr89+kdouVaTU4uwzvDyNZIN+57P4EYFAAn75EcfRyRJSJg/+GoyxjippNg6qGss3kZo
 mMyCYx7Bfs3TjxOrFjOGZ1gHSdZ8M246MgZikwzEYYYkXCnCbkjq/n6oVfIWiNE1CNfCeos4zLj
 szT56lmnC/yWhisOYpS2LoXO88rX45g7l6m15d9NtrWxMvLJ5TatW/eRyGzd8IBslm//yCZ3ywL
 3m4DLLVG4vFnj08bphpOupfhxBq0RBARoNeoiabRaEM1LxO5mfU9rMAb+jBJF0FwIskBAlnLefN
 gJv7O3fYbBt3C5+99hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyOSBTYWx0ZWRfXwWnAlIl8paqV
 1Yhp4oDaafLWstWDtVqci/I7G8J9CiKhOBZiF5/dl9BN02N9K7J/gft3P0NVyL0CAEUPkx3mAiR
 yAg9aLrSGIfcWmWSHXuMqVK7Q9tSNvs=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f6282 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Xn4vB__Uc2y1v2IptAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 48FHA12EaKcOVx-aFiKr552xcbeCfBdT
X-Proofpoint-ORIG-GUID: 48FHA12EaKcOVx-aFiKr552xcbeCfBdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210129



On 7/16/2026 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Alphabetical sorting violation in the Makefile.
> --
> 
> --- Patch [3]: [PATCH V4 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay ---
> Note: The format of this report has been altered to use a free-form summary
> instead of inline diff quoting due to strict recitation restrictions.
> 
> commit 9c47ebd2f8bd209fc994d382b210d2c4b6160e02
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> 
> This commit enables the SDHCI controller for eMMC functionality on the
> Monaco EVK by adding a device tree overlay.
> 
> [Severity: Low]
> This isn't a bug, but does the placement of the new monaco-evk-emmc targets
> in arch/arm64/boot/dts/qcom/Makefile break the alphabetical sorting?
> 
> The Makefile generally maintains DTB targets in strict alphabetical order.
> The new monaco-evk-emmc targets were appended after the monaco-evk-sd-card
> entries. Since 'e' comes before 'i' and 's', shouldn't the new entries be
> placed before monaco-evk-ifp-mezzanine? Keeping the list sorted helps avoid
> merge conflicts in the future.
> 

ACK

Regards,
Monish
