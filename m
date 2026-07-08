Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973B370AE1
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517535; cv=none; b=PVb+qmmYp7/mZNPMI0+p4LvZUr6wPcbgihEoSSCcGqmqvPgsA4A0qs7DFdSZnGBsH2jiq87lVcf5u4agk3GaWuY3acGLViBcOi50sJkPDRoAHLX3efsHiaS9F1fkB3K38QEGIsuakQNli7LgWwG0sEu7iWVnnHdV70i4ls0QTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517535; c=relaxed/simple;
	bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVhWUU22gWvV3KBxdsuf7s1Y5O5PomgZnUJl9k5MxchXgAKWemXGAUOjaL51BfUew2wxtT+TyE5J6U2CPwKziA3Sxs+dNxA8Fi/q0G4fxdAVK3XOY1iK/vSuF43MaJpOcmRmxRRbK5Ts2dpE4u/gvmnKBl5jReqO0cqB+ay2WGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkhy8k6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfsVL4Fq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkhy8k6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfsVL4Fq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Z4w2579765
	for <sashiko-reviews@lists.linux.dev>; Wed, 8 Jul 2026 13:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=; b=kkhy8k6pjAhocsdq
	wMTDRC1XD2hisJPeyiFuVeZMMEh9UqOUrRYpEq9+3CnlIwyECICCqrlTeGMMgECB
	CVCxH6GnqETyamOUGT8BZcRZXyn4x/TwjgFNB+BstN/X50ngOrG0Snkz3ihWUlBL
	8WFIRz7xJfpbHOP2cd+buAIiUYR92zXXMhbkF9zwiNoHy/Xjos+MSj+djtMavxpa
	Fl3UYqnZB7XxbhZURXYYggaX8L/A0sOsB1y8ywNwZSej5y4gjkz+Qei/wp5qiNQ8
	Ff0WZIWliOQR31wFQoNQtO24Uq4tCeCAoz2oVh6LnthyckBgTIHEvKanmzrSbt3R
	CtUKLQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gaxj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 13:32:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692d7bee20so613553241.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517533; x=1784122333; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
        b=hfsVL4Fqd6A6WK0QghL0la4cJn5whCyY1Tf1u8Hii8nuvtcXOtvuF+lDfVnf6QdkeX
         N1EfnZA4czqC9RLvnechwWgWAZ4tOhrhLTB6S3OZH+agTfRVX4RqbkNoGSEx4bprwakP
         XLkaD/ILzIybRISgVABI3XI20MjnBpiPXEdC0Oy3quwNBhU2KevKDlRGTcmlgu5TLQYI
         /k+gLSF11MKJf3V+BmqieevOHzMIpmH5qk/tAJuv2Qyr4ORpsSwKnpe4Hz7PeaXWJr9f
         yxxvWGfAtnsdRoSHXol6ny+azJmtnBHk+s/bta/6bJdEGc5PC+6kF8rDHNWgFdyDRiTc
         Ohmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517533; x=1784122333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
        b=gv/6bIz7du+aqCfzCShAZ4b4dvKYzufJ1Oxb4AyeMyhg9nD2CmzJChM+EmTQU7y3tT
         Q1fx47h0vX3uBToFpMStLGsYvvuF228IEU8Q854Z7Gp5sJyz+oiBbEQF9+lskJDmVe/E
         nyQSzhIZogFnDPfBdeX/0aG9zXOEybMGm4eK9NlTC48WQUX18hUeS70nCPWvDI3tO3PF
         si32vYioEDCaN3pZud7TOnshws/1niHD4fj6ex3Q5u+GKHpmkdcGvdNYzLwALHY4jpCb
         zTFiQ8fIFInGFrpyV19Dieh/ULmM2GJf0r+15RwzEXYAF73YonRghvgP0FAxTemwnP+C
         HXoA==
X-Gm-Message-State: AOJu0Yx8RLok7bChK4nYFcGeICjAoPkW7/Zwn+G3FcGVxnc9jVHHfbdo
	1CbreJKPKhqmbNVyhKEfn+Zu9vfvPwisI2H6YWCxr4qdGpQ+kDkGrOnmuHqTlZTm227MsbKs+Xx
	YqULM3TLR6uwr+a9T+yA2k01j4lXLA3rMYAoAefpbGfTOdM8dhHoPJDXDCSmE8+qg7gNw79dm79
	oXoYE=
X-Gm-Gg: AfdE7cnGqAk6si1iVofwbaNScAjKt+AIz+l0lmU0cjYQm0w6hR3/SJhUNSwK8DwFY4o
	yNFU+agP66PgackqRDVQJsPmaYrQiIjeg8HNx6tVSCDbJwLKexOVpwtQ6nCSOjhEt/CxKekAHOW
	GfSFp3xqtoJyKYurZAhfb5aSd8YbjHBvNQS32iqPUlQtyff1UVbOOsygQJbnLinVVJCp4AK7Ydd
	EYUgLrfy+DSUGUnJNlUDzeO/c9sgsZwmiMC8clQmoXw3NBF0odgPlQuvAfg7PO51W13G0bFZ5W6
	R8Up+hy1vgH5/KBs0k7cW/9lJSOTtsT6AgpHI+hdcW2in1xTBM7fP9jmKWx+L+lXJWltVjQehNH
	1bLZiXjFLXPj0YbuLXdhJl6f5WL5J/pXkZ6996w0I
X-Received: by 2002:a05:6122:1d42:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bf75f00ecemr1174614e0c.14.1783517532848;
        Wed, 08 Jul 2026 06:32:12 -0700 (PDT)
X-Received: by 2002:a05:6122:1d42:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bf75f00ecemr1174593e0c.14.1783517532429;
        Wed, 08 Jul 2026 06:32:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f43912sm160008685e9.7.2026.07.08.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:32:11 -0700 (PDT)
Message-ID: <02dece0b-a105-42f1-b57b-5cb3b8beeb09@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:32:09 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dtc: dt-check-style: Do not sort top-level nodes
 in DTS by unit address
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-5-03ffacff9226@oss.qualcomm.com>
 <20260706160540.032001F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706160540.032001F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX94Aqeub3GpaL
 2ahfT7Krk5HwIP+EN3pLo9co0YDsaHLOKPXtfYIaMJxCxmbeWHLzhuElGs4PXl8TiFoGGUjx9VV
 ScBoO0AO9tMYxRpNq7LGqqXQLMdYoGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfXxahsbGtDuH69
 7jAtBo4QiEs09oZQ3NjRIgZ0aIG6UsL3GtbouGHt3YFxDC6ljrFP+uAsk2otGHn976sCTaBFaIe
 q4PZX2pAIQJfUNNbqd8lMFkIiEhgkr7eLQeEb5zpwmk+4mr5wTrrFfRBMck6n3RcVN/8e3R4rbG
 rIrLxDKoOCfHPX10T6ejdokOEvP7YS9yDfLgTElA3Ae/vIL9OC1Lbwh+a6UyX7JgOdmzl8HbfA+
 pnal+ZmkQK9CrFYy9TLDPY7cWcXL335osTyagfvYJgi71ToHFYjGUT6rdtiXnssmf1+M50tx70a
 27BTnCi+vpM0D1GHK6n9EjBr302CVmg0It7iyF45KVrQPKinxcQ56Mq1Spfhp5NxXPPcFD0h7jW
 wEhQ0TQGVDu15ofrSoIIARpx4sYHAPNbBHC9DMerqT0nT80KgISoy5YLtAwY6dDBS2ZludpZNBS
 3tBooP6vZFMOaWSS+jw==
X-Proofpoint-ORIG-GUID: fOf7VlJp0u7wtY_AijPx1pngrdyENiZ5
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e515d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: fOf7VlJp0u7wtY_AijPx1pngrdyENiZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080132

On 06/07/2026 18:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The checker script inadvertently disables unit address sorting validation for all immediate children of top-level reference nodes.

Ack. Added test case for this.

> - [Medium] Top-level nodes with unit addresses are completely excluded from both address-based and name-based sorting checks.

That's TODO, fine for now.

Best regards,
Krzysztof
