Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1E363C43
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160322; cv=none; b=FIy6Fim0mILSSgYYeNEUQWuAaF8RavvcgGHTesWf/l8X0NFoQMNzkqFJzQcjjZsDXnE2ljzoLzukgGG6mOsAZgUuGCXrHydIlnNa5sxxPdMrLvBriYZsEZLQuaC9oW1L2lXNHpkywcKMbCcp2BlyWVt5lQqhkoHhKBQvatlK9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160322; c=relaxed/simple;
	bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk+pqqNpAAxQXQbTN/3OMjJu2X/Nz010G/pULjKeq5fp902iV0f3zDxpJo3QTsAyxchK6DSAyMPxg7cIArDLE3zcJhc/0lkqlSaItKhtBBMMmNS7DQsL6wPLPF4lhqPt5PAtgT3xC9fycr1cf6XNdEZtB+wZhPVkCBOjWyUn8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+7jG9G8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSJFX7M2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+7jG9G8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSJFX7M2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GUP93846365
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 06:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=; b=R+7jG9G8MoLz6rXG
	fx2X6k90uoPEmMbrcTrpc499l+eZmfc8Wkx8EXlBrNUH7gg6+yGgYkKi572UFzIv
	pa8tE8l/Es5PuZgdMVV/JqGVn1ARBsSFhuVjWVdazTUFbF88xKOUIWadshViqUfr
	o0Bm6GtywRll0ETscvSVXX0yVrukjzAdwprRIPdZhw7/xqv22BrD1rO7f5kTB82+
	PZwThqIYUHPbXMfdHXXQsYwJYkyrmrUkBH0IgMFaaewbTjkODk7BkH355hPRaGTO
	7Uv7GlrL/8hMKR7YSpooVV3HYG3LCbbRxzvu0Lknq6nxwcmcXUHOketuhrvCdAqP
	Kr/hIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u21c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 06:45:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51787404d3eso141834141cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781160320; x=1781765120; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
        b=dSJFX7M2qaSC/H305hUUBpZBNFrRl8hpYgfanx8RJoik0fzkqzfwkUxnWKadkgpBKg
         A2sBWNCmb9pEr6LKzizch0EzADf6rUpxUrTGyCkReZq1okSnmh4aYxo6WZSbe5NbvEHr
         akQcyggMN8yr2GpKxezHcnSnsG5QfZ5Qugh1Roq4R89fnw/0xsJY8/3kNJxC1n0AOKKJ
         9G/T9v6oc2l/v8nmMdAXRbPPiQCwe/qvW6wwcWUvpc8Y126eEa1bJl0vlFNGAQebR9iY
         tVMzgpBtbqArKri4XpnZCqfWIeLeiH5FAn9mEDGzGOi8vRD63rCaP5qsEw9GP6ZnmIT0
         7LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160320; x=1781765120;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
        b=KDmFUX7R07mV6vdfeeocWnb8OgLecrP0yGPDTHItL3x5hZYttMEdcalpLCmQg5vbEj
         d/0QrulRnBtIDiK1OsUziX28Xx+c6aNdIfqwTsKjaj73APhVBs3ol4My86/gtK4tU7YM
         rnU1PkG39TlIn3nbW7Q3PpH20LVbwYejmLbjjcUscf1vzjXGirtCO5FsHfNWsTa7urq4
         sOVwQzPkseeTSQpbXJK2OtkY+yuZ3rqAQhE2ss3OmW7cgZxtN/pBagT40/eUmOWlv6Rs
         2OkSL1932Q2GlL4rAVKTl6kqQ+VKioW8/CW2PwIjvkxqL0xl1AjTJli/iBPH7YluTxXH
         1G+A==
X-Gm-Message-State: AOJu0Yzya4jhqIW4WoJs/OlLWsHDQV/mex0t+BBXRXGEbx2oAVExoaKt
	9qG3cr6k/Jry0/CHhehXjcggKAchhHEcYuvmDLQo2oksE660MvEpVlTMz8F6kbzWzurX/hVEyjd
	vIvqCt+uLZGecy9uHjmMFxKYYzAhkFwlWAP30CYC257dCEyZmxNnuZEn2umHwiOkLRoUzhd2cZE
	suvTk=
X-Gm-Gg: Acq92OG+PUMPHEKySpPAr27qe4LfJ4WuKHEG4ltlbHVbSG5v8kRYHJGX8FKq2d/I2Hv
	uxIp2fk1QKtwU4Iri8ZkJOXb1RfXJOMcvfaYfzKFumf/IXKlevna1O/tXfeE76ufkzF59uYsTqn
	Hp+Xkpw2aWa5TbQsoTXcBUp9+64RK05pmevGtnfdd/BoIucxzkAxnRFWWbrWLVuFTVuI5nD/H44
	aQ59g3kM8K0zAOjtGxo7duZi86TNUe8WGxdfZ3IjBWafXSqxQo7oQ/7fAh++3SU6rk0Bobwng3b
	+QoFOe01JytORnUh5HwwcRuX7YLFuM+3Pba/jd/y3qdPSxyrkW6vYneet4CId3luR2Kkjm2hBsj
	3Syf3mme+G8eP0Lmar5v0e0ZJFWMhDmF9+gYkWdAOcXkToHLlhgMvP4/9PlIN
X-Received: by 2002:ac8:5853:0:b0:517:89d0:b8d0 with SMTP id d75a77b69052e-517edcd8308mr26977151cf.10.1781160319732;
        Wed, 10 Jun 2026 23:45:19 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:517:89d0:b8d0 with SMTP id d75a77b69052e-517edcd8308mr26976671cf.10.1781160319248;
        Wed, 10 Jun 2026 23:45:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm78083201f8f.20.2026.06.10.23.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 23:45:18 -0700 (PDT)
Message-ID: <5a838452-5532-4527-a24f-d4869d24953e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 08:45:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260610125349.55A6D1F00893@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610125349.55A6D1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a5980 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Gvj4pEdW6wu9SCPdPsoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zwCzEgrmLxJsLde5-Fe8HJRB-paACtbi
X-Proofpoint-GUID: zwCzEgrmLxJsLde5-Fe8HJRB-paACtbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2NCBTYWx0ZWRfX+6Khv/eULB0M
 Hsl13aIA2r1AAiewb/sIfDkffKrxv8koN2IOkadN9r7TynsuJ6hjMosI8/ZLugRDgMDGtDye70c
 PtHjjWFJ4f2EWE4T0hdVUchG4//HKbx6bbjStZC4I/JXkmH1rusZQZxFGqjAZFs4W8E/De3uis8
 5YWVKtbtzLEtoIQTtxunJdMm9CVVeuWPhBZyWldAl00LEq2UBo6M335+tQ/Zn0T1L8MZN19ZNOS
 pehadZW3cA00EXr2vW2fo8a5x3DCn83B/VR5fULUUiqpR96boZ4wits1QEgLjF7MqXaw105XsZE
 9FrhCnlcYqV2XQ0s3hWp3Aq5uhGA8QrMv4vqOlkQQ33VAdW4eVwi5LlgfL6mY0f7LI9h5/8Aepx
 f3GKforr56RLmhws02NlvOOZwQ+E18w5VK59xT8EG5jpYZlXzi3Ni6I2I70tzxI3don9F5EF4/X
 M6je6UoTsW9HtFJ0i+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2NCBTYWx0ZWRfX5Fl+cwFHqvmN
 9sHOdDvsp+uEzFs8c7hzwAAGo+CBhUY9pezYA3CCpSAQn182LV38D+aCC80eNHwdSBWuod/RFGZ
 DuMkIVABeYQhsAzWuRsCn9BJiAt01cQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110064

On 10/06/2026 14:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The new `qcom,pmk7750-gpio` compatible string is missing from the C driver's OF match table, and the binding schema prevents using a functional fallback, making the hardware impossible to probe.

I will simply add fallback.

Best regards,
Krzysztof
