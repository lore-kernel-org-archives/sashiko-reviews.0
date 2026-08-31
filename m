Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B6435501
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184435; cv=none; b=pC6bDHshcRK0xHMBaX8hgdS0E1eCauAkN2ZQX/zzkMT36OXHMFqf4jt1dwpZfVPQV3JLobDdTPZshBKIcm3MeLlYnjiTBOg82VlqU1Tr1/5UmX3EcbJI7dYgD98PjJIFhjbMMdDWBE0kYreGWKzQfCmj/W68NTvMB/snfFqYBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184435; c=relaxed/simple;
	bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naxBW1Lf6cGui5HPLVlB2znslYd6doe+iLj+fv3FzAGo9D1+d2epnbBqiPtDV3/in/mkyoWgO7KuXdBB80dPAMB4PuBQO1Ys9+IFlX7ILl9a4jeTVxkT0zvPx31Kj+095UPuYSgkS6o8ECIkFKCjZewgxCCLLn04c518yJYBGBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1gvb/DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFx+Nf2s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1gvb/DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFx+Nf2s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA6pH320837
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 13:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=; b=C1gvb/DH6TlLc1AZ
	iAepWOve9Aa2BzSBpYQW9XFNuQbQIzzOgtB2ZiHWIyY/ZKKySSR0Eiz/u0pb4BM+
	638PgobIVBl4w+kud3x+1X4kg+BFSPzu0VVMRfDGQz4PPyHo13LLLbKFdEQcNgkK
	Pgz/rG4DswvK1euBuk+EDrYdrFCUB/HRZHz98q+cxUPKwAfEVuCCWnw0RppaMUJr
	o1ioTrh9XWqoize9uODLrJmPPNI+a/hwKPh1DG4ijNeczR8lgJE7y0jB7ZRqzNzM
	KZ0WmH7S1A49B3yGLPEXovTGoIq2pzUleAvV54CnC2E29N4KiiDYX3BxPy9X4KH7
	gnbe9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvrpxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 13:53:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so725867885a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788184432; x=1788789232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
        b=HFx+Nf2szA1uuf89JUyVtneoiZ+5vhulKHBawmoh52gADVyNWgmDlPGgb4W2LSbfOj
         vwG4RyamAA8LvnUWXc5WFYhgkFIg7BdZOvgYFt5byRsHS9vv4MmPnXOzB4ZEhUZKzgJV
         cn/+Pl0J8kUKYPJFxOLr/EkdgK2AN1wCwaOmdX7CR0hsIPdXJBxoByIBvVUKtAy+kVxr
         Z8Yqac/SVvh3U2z4SwhxKZu63O8vyTKHzERGGKTVaQrQz78xG8d4i85AVO2ZT1OQ6r1r
         WdaNgWY2tVjCvVTUoTlKIJRNxfDt5C4uEtZrmA06TFfEVFzBofxyJHbuFVjpAKAc1ep5
         nMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184432; x=1788789232;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUqh2X9awgVdQ5KkHdaoibkAOyLtmCtEGhzRBJfqysY=;
        b=C/LyDf7TIDCc6WTfrtV8wRdgOuFAsmjdfQF/Ek/OkHEzZFeWXBf8fXSN4U+AhUUt17
         J0abDDwv4q006GgZO5j15HOfkJbE8vNt2gQBmYAVZH5iy65dKD89Zeu16dH3Lmp/bF43
         bBhi+CfAfZko+uZafkMKvTaq6dxngQrj65M8mSa5QZQ4NB5wu7JC/ci8yhODduD+Z8Bc
         DuD+keHhwYFC3XKc3Tkx2mzANrlJfJIdJTmgOaX7LYtZa8EIkkQakyd3EJXIdOB6k5gh
         gjtkbNnTaTKp4EnLxH1UOxL/UtcVIQko0lAS8dYKHY7fixfRICm0r2YiQcm2y/YHzGhi
         S3bQ==
X-Gm-Message-State: AFuF++nFCElfgb7XXuSypJCS81Nf9pLOkCgu7m3yMRkWqPMc/IV18+Tr
	9WTwTnVemeiksBAQFol/cyB/aumQ1kHwqNTVL2njWD3MgWXLCddg33l5gMh+WvTuib4I8kG7m7j
	ChYjVjmF/X6h6AwOKLZ7BuARvE5wkwreJ9M/bPE+fVEG8OWTfARlOLT/CwFCEnsXWuvgZHUw+F2
	x/Vwc=
X-Gm-Gg: AR+sD13zVVNiBPccfUOAOQfOwm7c0yL/gnXTG5kZ2+78Dy0wuUhHocvrNXEvKhXBNuK
	EWY5jmej8FQ50EClCztlp2LNyH9HUp7z+lhx1q4goqtTRV+P9j0NPUXkxxikSg3PhrOgxUXvnNU
	iGfw8OX0hPQaG3po0eqmXJ+mdQI4ARbFjteqtq5fWQfy65yaMSG+vuuFSiOGOf5b4HK0RjwKDZO
	wMr7kAdrQM3d3Vx81zNy2Xj4pslCTSJAI0RnQKBK/tDsNzshP7kPx3dJSUzxBtNHFLJRpDQoxMv
	Ir2DH3RvGPxSfgeHp8c/HraZKf+DU6xutgfZxPMQgWdeUR0ZEpz9UXAq80GDzMlPTO6F5xy0Vri
	gcFQGc46Ajujt065lAhbKXMYGyZ59
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2712199585a.42.1788184432074;
        Mon, 31 Aug 2026 06:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:939:f89:3688 with SMTP id af79cd13be357-9391397dc88mr2712194585a.42.1788184431596;
        Mon, 31 Aug 2026 06:53:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm181458645e9.4.2026.08.31.06.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:53:50 -0700 (PDT)
Message-ID: <4c9c442c-b1d5-45d4-9a0e-5ae7c10945e1@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 15:53:47 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 05/12] dt-bindings: display/msm: hdmi:
 Add Eliza HDMI TX
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org,
        neil.armstrong@linaro.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org, vkoul@kernel.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-5-67843277de17@oss.qualcomm.com>
 <20260828141223.1BF821F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141223.1BF821F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMCBTYWx0ZWRfX/lk2TWaeuQgK
 KKyRsdo5z/ltqhjHx6QS1NBsj117mA9geniUN8+lVyMfWETJiOMAMs45cRH1rqyVrod+6sqzfSz
 AliSCiKEetwoCoVXIHLq8xrobUefm4M=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a958771 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ryD-1BP75uk3LzTGFywA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMCBTYWx0ZWRfX07uahpJVpYnb
 +JDGy4ylvnXktGD3rVHD2Swx2ilI6oEqXQhvrCvjR34CPCTtDD4+jFG/h+TRMqC9Akx3gYt7y9p
 9O/fxQRqPSztyqJaI+xVWJR/yyAZoWZDQhNMPGZ8kJ7s402H+ivcmhZsa2v0hZD67TX0jl201kD
 m2TwjHXf5NKi6jAdZxJ8te9fF3NwFiFi2P4RVVxyQgt+z722unrQ3iKSaRfPx/DyJD+3RuV31wN
 8EV2kjMW/8j6Hl0UF1pSXao2FqJV7rzBsGeRJA3MEhyLReUyIgkoUDgDrFKx94XjKlkrWMdnxLd
 l+dTYH3n5i/B9xb4KwMaEl+aOeL15K07wJAYv9KQS6M2XlqMJXTigJ8Rx2OhNsGmr7Un7pB0AMN
 boSnNdZXK4N98ZKBwVzR081vQGIMRE8CwfuTLLUGwkiaxB+M7n8rYQuC28ZjyfbEG76SjVojIrU
 LA4nFJgVaAOG4EE14gA==
X-Proofpoint-GUID: znWpoKkxvZAcdzE9y9SpP3wjEI0Gygo9
X-Proofpoint-ORIG-GUID: znWpoKkxvZAcdzE9y9SpP3wjEI0Gygo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310120

On 28/08/2026 16:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The conditional `if` block for the new Eliza HDMI TX device uses an incorrect compatible string with a duplicated vendor prefix ('qcom,qcom,eliza-hdmi-tx'), preventing the schema constraints from being applied.

Ack

Best regards,
Krzysztof
