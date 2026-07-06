Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF233E5A01
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322828; cv=none; b=QQ8hyB1AHsFMsMq3PObi3jXfhjp6J/mZvbOyuNu1JGkCMt0o0lzz4P1opAgODkYAUf4ZRLU36FXn3tWOENCg+174tzxHmdL6Ca6jfTrN4XbdmzhEk2DANYHf2Y7gsmNV5HxKxHjjdfxMppkqKfsmAipMFFOw0GNaaNoQ5sJewhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322828; c=relaxed/simple;
	bh=VGLv6qBT0VwmOrPenguMQEV8wXTrjXIc/6Va/Ksm0l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZH53/RxYfFBpDGGAuzQPul/DB5SRKy5+/lLJN00Z+tMkRzAe5mOTqooP4X4QRJ1IjCYmmsCev5bKnxHB+08Hm5QwwzXhkMFOz3UFQJz3ijYxq71QZooNnmmbcRRF1UFXUvSgUrVSVfyhOB56t4hJZxxFa5QL3LkipmcE1umgy+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BD7VG03Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQktJuCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BD7VG03Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQktJuCM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Uog3623853
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 07:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGLv6qBT0VwmOrPenguMQEV8wXTrjXIc/6Va/Ksm0l8=; b=BD7VG03Z3Gb/2bej
	HnIKbVZXiOyTjbXtf+Pjc37AwitscG2b1e0NpsyXV9TRbBaYWwJqZe/mkH43WCyZ
	DqDQoOZ2Rn+2uKnis9swKKwfr7wl1erj05y15cGUGrE3UqWmzcjqd4xL9l3dfMtV
	HD8jEEVxHEX5ekm/UdjM8Dxfja4dXJdHcceHcAsRl2enWfrCCP54tQT4WPrxpydX
	t8JowvdhFm05lKp5VhXChODrELKO2xam3k9O9r6BApMReFIG4f3guC2csquP/fDQ
	mfNXfff29HQaYZ0StftSwLoeQWy5dNsKln5j/YMBeB7hi3i8cI22CQ+SHnCxj8dl
	8xdY2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw5jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 07:26:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92aea0d801dso247965585a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322814; x=1783927614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGLv6qBT0VwmOrPenguMQEV8wXTrjXIc/6Va/Ksm0l8=;
        b=CQktJuCMNeLDloT9VggoD1tT9IMRZ7oLJ8GtZD+8AcKGpWYbJ/bjizbaR/I84o//Pf
         cPrAwdNkLryt/hhUFFQs6dniTE/wwYZ0nDUDvuNaRQAoTYwMEk1XboPz0XaJdj55vxsa
         q36HLM8hOw0IRheHsrG1b/ZmF3JgQwGMYkeixhCUmDVUQb8iiYBtEWsHDkQwdmZfw53u
         G1So//OLLbdfRXgf5Xn2mPFmJRINwVD/nxZrmZUSYFNLRv6xJSMVQ0xZk15xvCpZUGl5
         QD+W5ojquAkjI5byqciuUNfZ3rofOvbPGKIevB0zCAdbpDFCA5GAImMr1ttqZNh01H/i
         SzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322814; x=1783927614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGLv6qBT0VwmOrPenguMQEV8wXTrjXIc/6Va/Ksm0l8=;
        b=Ceu57flWva1xemu3wjdahVwrb3XKCa+gS2QqhiejujXcFYT3bQ3mLrrMzvIyl1doW2
         F3tsW+NgZPRA+nHbkrnDd7DiDw0PxAoBUil+rBxZJml7ILH5sUHBDp0SyrNo09ElCQJQ
         4r2vbE9dzov7i/ovY/dWeINN8bm9enu7Be2BkmxeDriTlSKcldIk2EINY5RzXODL/lLS
         JIGBTvqJmPYnxBsJ9nvQPkBR6aiR08kMPzYB8xHdMVKEFRPntBn9Zrn0EV//JisGr317
         3zajW17HPYD0oDoHAlqTovsmwBMCnqbAdVd5+boPHfumhguIhYfozaXlEDHTakI0494Y
         ZqUQ==
X-Gm-Message-State: AOJu0Yy+Uxslv3N35vv/ysZEc2ntPW4uNaoim6SCA/AjIPPFGBN1Uh2G
	bX3TzMEpo62yQ9kn95Q8+DWecUbGLV28uWPgTv4RLDnsNfhzoOJBfpxC3k5xBd1pNSECjVgbIo6
	U9OAyJP7jhOPko+mXN4mxan/VAhF+KUN/kdN5ysSZcdA71t8gVZ/OV7rO1Lq3Ff3JgaUUOqIqt5
	cpiA4=
X-Gm-Gg: AfdE7ckPbiJ2ErrEazyeInuwGk0GsYeSW5nAj7kInHP962mcemgCymysm6qqvQwOPOo
	PW1pnvGX/++PnOMinsbibR42xtJmv3wWh/hvg8MhF4/7/i8Mdg1LEoyTJyjyblyfj8Ykb+6e/Ax
	XitP/yK3TRshdjHV2irh/2u8GRsaR5ijBvQnCd5ejZnoK4pe+zropqngdY2D8Gn2dexOVJZANuI
	PZxfigTkfW1wImaF/sAyDIuY0wQfYkP54RDrhGaBS1k7+1MO5r9zG16G5ZMLYvJJZt+2PIGLKsM
	bUsZONh1FWHi9CfhN0zjzCWu4AAV3aLYRU9jJL38XfsLz1JM+jJr5nZHLsgY52MnfZwwfwr4JcX
	L+laFs2x++AaolhvggxibSIQek/9K8N81WFJvr63I
X-Received: by 2002:a05:620a:4096:b0:92e:94a7:16e8 with SMTP id af79cd13be357-92e9a3544admr1391190285a.15.1783322813796;
        Mon, 06 Jul 2026 00:26:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:92e:94a7:16e8 with SMTP id af79cd13be357-92e9a3544admr1391187485a.15.1783322813384;
        Mon, 06 Jul 2026 00:26:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab3a8sm284626705e9.6.2026.07.06.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:26:52 -0700 (PDT)
Message-ID: <f5d2ba3f-ccaa-4056-b4f1-bfbcc1408941@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:26:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dtc: dt-check-style: Allow space-aligning indentation in
 DTS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706072129.965D31F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706072129.965D31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX60rfqDvVyCXG
 if9FwFKeOVYSIEUjGr/Pa7VRnXFkP5H/VZzDBiKe6IP/UdQjisEUst58rJd/wStwIf6WETmnWvR
 wfmE2qmnf+vTS4G7WPhF1Ca+aPkCr4A=
X-Proofpoint-ORIG-GUID: zHsfdDxGGIo5lX1T0REz2MWfOhqb37n3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MiBTYWx0ZWRfX/+/sssMPIpsy
 +nRH4Ix0cS2vPzwiOd+xx49D8p1eTRf6X9cYI2OLnTGJ3V8XNGggkucHrS+9S1xGD7R8in8aK8P
 xHtPVumGX2p7O1MkkZUJNz/gSvnkdfdXKq/daCFVwJIc6b3Vm0Da0rr9PThFrznf28cUxioTOkH
 NlKSF0LwxBRxgDVwQGEMe8uN9UJTjlYd2wfvTg5BO0VDJDf49wFPzwZIHSZAlFY7mwdKrCsIe7i
 CfOZwjhG4dMw7hQ0nO6+x1d6+wQxpFgfjBUr1cBDFDhvAWISjLGkOzzCEo8ABjx3hmXTfmuRAbq
 eQuUZPPxS8zwhl+vLKv4ufIIMaG9CJ233Z5CkR0RAoD4BmMi45yAxhXVizb2SMAsQAEqlY7XYf8
 QNCSd1dAIvaNsWdce0lT0Ri6lfO5QVUci2Kv8E8W2iU4DPZ+ZPTpdGtLwxrsamlolz5hx7KW8XU
 PqjCDWxeYxrV4yLkzjg==
X-Proofpoint-GUID: zHsfdDxGGIo5lX1T0REz2MWfOhqb37n3
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b58be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=v6m7V3VtAPdBGwaNRcMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060072

On 06/07/2026 09:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The relaxed indentation check in `check_mixed_indent_chars` permits the 'space before tab' anti-pattern.

Not relevant.

> - [Low] Docstring and rule registry description contradict the new code behavior.

I'll update.



Best regards,
Krzysztof
