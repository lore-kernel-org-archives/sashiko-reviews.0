Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C44119FA
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856617; cv=none; b=Npe7bVf+b2+FUZqyetWfHEUcM+grPdPWMN84L+NzQclCiWtBG/PoeycRdQwDPXf3R2KzQL38hT8lF+QS4nT3Kloaa+/GF6gBz2cKAdi0eh+gUVxFsZPvHEzSwhm592vw4AgOus9TqH8Xb/iFqu0m0cc9Fd7W30JRTU93y/2Yszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856617; c=relaxed/simple;
	bh=knciZzeylxYeaS36Mo9T8ZXpRQkf+w2/+tkxWGB8knU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eq02Bny+hVolCZCtD9pvkwHFawH1pSP85pksJFRE+0KhX+duOJFaqZ45x8qAN3LaCbEBhlWYEuDckicxWeAfY+NMQYd5vDGypXanscaERGGQmqSE5C7OXjkaueVE31RvgJqOAMLtOl2I2H9ILWB4/tgPpSFQSESxcnzAdDOcLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3nz8CVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKs3rJPT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3nz8CVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKs3rJPT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MYIZ1647498
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=; b=f3nz8CVqx9DdA4Nx
	hSW8/csdCpEQoc+XuupdEMfT7bwFYtwuvwDCYGJVKT3FhUbpjSMGclKjVALGoTPy
	GnTWJKClAQ0270tzB+EDNYEHzJWb++l5+EbUpMM83CDxDhqYt5mF9eGQJ3WSfvoM
	nlgQEH4SCeI+WLCI+vt588WVu+yXX/4VI5Osv3tEWxjmETewBts8H4goPbg77GDF
	ObMpCG6/xGB7nM7PHAGtgc1evI93KFRi3WsMhEYqHwMjHG37dbmGHak1Kq74CA5d
	wKLly/Id4Mb1+FGJBq5DJzqgrl+sHcSo/GwjkmOlbLcTLGemvcrPm7dULenws3Np
	t4DOPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvugkcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 08:36:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso894968585a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856611; x=1789461411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=;
        b=SKs3rJPTWFPxqgUNf5/kwu1eSxnrOwf/pFFQZea1uDIzatNzAP/VdjY/P24j4PhuWr
         QsugJijXuR7JWO72XB52KCzc7sdqFIyq5oyNJHr6o2HxZKF1trmwr+8ziA7q6aaa4xK+
         YZ3wieUdyOINqNIfBqE7DjwYgcww5Ne/HC95+eJpZNLqj49dJZH2YwP9oNgyO00TYDAe
         /KYVVL2qvjm3OaiAu158oRfu1Fm9G89vu5HeNmn/Mvoy4Mv2BVFnk966d9CdxAQrHX1F
         DuLMx+Az4V/9dOR9rdYFWmkIoZ89L1C7vdx5uI8tGSh8QlsFOXH51PJ4M7qzMODizxJe
         rtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856611; x=1789461411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad0bKhP+N11QtS34YNu13QejnMaDsA1lHN5IGmY+Ajg=;
        b=nATySqmQkPRVrWIcUgXwilNxglTq3BtZYBVzV82v56S+Vip/r8ZNPXKK1TRkRNnkN7
         fEfKVwKoRR0WA9nW3I7BXzekvACYMZMOcKr2H7MY8iLPoRg1SAaRyL90Rud01c5lrcL1
         5BIo6YOWGzmbnCJGg0RzLa1PF00TQ5oYjsmiKRO8ffYf5/ctHSAYKvULKQse3GEKhSiK
         vAgZpRZwidbx/nvsw3Z7+F4Eto269SFo2fELyzSk0WmcBPyU5kLSP4xR679PXr0GW3uG
         RQKwmwk92cT1yzBLze7Ei9rtFxdX328e7geT8DuIqZce4IGvKar6OKPqcnClLsVM5h1Q
         BoNg==
X-Gm-Message-State: AFuF++khOzs5NtU8pGfYYMdJJ01RlB5M3St4R0Ab/xQ500FmXkHWMOlp
	2se/TnhDgLh8eB+d+e2zXR6Zm8Qmni/nr8xMhLLirFJLQUPhrOgEImVPwMSTcTqlJq63/sWg7yO
	csU4GCQJ1TADR8c0OqxUR8bIdPng4gyRQUYJQB4/g+UmWxkeEvwaVGaID6z++v6ooEly3mRdgjl
	e1lUo=
X-Gm-Gg: AYBFou3oxGsVOPkFjrfeoIojjwrf/iD3Oh0ABeTVaAB/B3g14sEInCPXV3v2p1z6PUf
	5f2mqoNwkjxWaEnuHx+AOGuHzdi3FY29+c95nQPJN4h9NK6AXaQcQgAgtP7mSJ3H+RPxZxBx+co
	/DAem7mi36D1GchMo0uqGFcUFzJVTY2rP63rctXA2iR2Kyfq3+2PUnuMb542xKZQg0qt2Ntc4cL
	uyvHXDBRliYzINLaO9i97peY3WwJ5azjU5KunedR+KWBjf6E01dPuTMjh8p7FcFWgzjAMc+TrBo
	t9AcU7PlUlmW4xd1Y2QRTP9+kRkoG6wrWQn/PzA6TuwcWmENEAKwMN2GqA7jLmCA45TK+1EIJAR
	XPgq8aND+T8Ok4tZycJZpVG5ukkvX
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr763283985a.44.1788856611394;
        Tue, 08 Sep 2026 01:36:51 -0700 (PDT)
X-Received: by 2002:a05:620a:43a4:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9398072e3ecmr763280285a.44.1788856610853;
        Tue, 08 Sep 2026 01:36:50 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm325117055e9.3.2026.09.08.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:36:49 -0700 (PDT)
Message-ID: <f16a09b6-9ae9-4a3a-ac31-48182bf8a179@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:36:47 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
 <20260908072335.611331F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072335.611331F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fc924 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=N0GlATqSIOfpj-D0eqQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZMZ5AL4rix0i746ZjMjykSG5Ef3ajZMt
X-Proofpoint-ORIG-GUID: ZMZ5AL4rix0i746ZjMjykSG5Ef3ajZMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX5tx8eSwMKPqw
 NjlwWuelrOMVVw6ajgHldGBTPnVu3YfAjaZfiqnLqv6F11manzWcIwuh128/o+tCGR0f9BtN/85
 Zf3TFzkel7N3jNYaSBOdUa4SSL2s3jF4Qvrf1mcnrF0HST2GxPWBAPCB6UlcjTb23A1UAvv0oJ9
 5m59jJ3b4DoP4C8LkcC1qmuJyyLBmXmv1wN6jCaJnuVsg41OEl/68ky81bwPm/ibYj85Kkw7CcN
 nuO1a6jxV/vKyqqa7lk8qFKQogS0J8Jvc4zxFJHSIN4JlljWqDLyFTYFpGcFVwNuFSBz+zUVHS8
 68npuT6zw4A6Y45BO7XRmQKKDxWCq2kkg6VDFFCw2ccLPQpkp8PudqHMxuG2BOEaR5kl5YmEuBb
 6G2449k7mg/1qi5myBfJqBBLISmGIxYTqG+d8+kwinLjirHyijJV6eylUxXPN5Rfw9GzeFJtKyy
 c7tWvIhCln5AUWQoLfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXwa7lZB9dWzOp
 WH2WHbcoZEAcZn+zXvWgdRzocny/Sk4Tr68b0ruXOAQO215LZlXup4/44JsC8uCjAT/TFaL4nPK
 AxOPmb5YweMCofIuTQTIDOBbpgPokuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] ALSA audio callbacks execute locklessly and can run concurrently with the DRM modeset disable sequence or when the display is fully powered off, leading to unclocked MMIO access exceptions (kernel panics) and register corruption.
> --
> 

Not fixing this.

Best regards,
Krzysztof
