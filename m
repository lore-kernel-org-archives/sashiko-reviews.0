Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E724219E7
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454829; cv=none; b=YPskCBw3suqoW9/iD7ZrQkcgWncu+zuxAZ5Gjn70u07KXqf6BF3mKE8H6lXaOoZTuLDYtKOas9B80uUgd/7Yw/WRLcU95da2dD5WyqffE9vKiydomqSLPKmkNuhoZIiYK5/KdrP9O6wiOMEpoZbJ8fE8V/fi0EyxViXIsM0uzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454829; c=relaxed/simple;
	bh=6mdSfMYPnFWA38MhuTWG+3NJpel6NTFfjMo/Yp94zGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhrlgStAfHig5YdRcslxDpBG2Ngv81WCL/Lz8ugX8Hk+SaIjhvPrTgTMS+pLtGvbLH4w3xu9ZEJWYF3LHikjqaRQkmT6K0C1cSZwUj/AsLupBKd6m3HStSaeRPOWfCYakYx3fVWWigw4tbNT1U1eC5VhCDBge+5Lob2EzLMHERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhKrQHyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OueG9rWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhKrQHyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OueG9rWt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrbvr2206472
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y+J6WIwTXDgGuxn91mCA8eYm
	uhXMp9TDSyjOUKVWPfg=; b=EhKrQHyoBDqEF/zGiAV4SBAig1CK6L8eKGoOe95M
	ERycjqEwZ2PiRaPcHfy0wk00fK0FpYhbvwX5uErY0HmlLdcfXa2btfjkQw0BMn8i
	BoSuHTIwAnrBrPXg6BOco6NrsJ4JPPiN1IVera4WqIrnhsSIEawcwNpwlxMeRxy7
	QzGQ4rb4qeiPD8iFwz15ZiggtgRbHTLNmqg/xpY8xqazWDVbNifKI8FlKLSXEGfU
	doshtpc3nNx1tvFd1GntPhZQqtCHi+qM1b/kANKh0DMpVDXQm4YIdqTp9KcO8GOW
	UfYVRSUFSy0L5yOUhAUXclabT9KSf6rnXbfVwWrkJor3iQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfrfr43b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:40:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso5059366d6.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785454826; x=1786059626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+J6WIwTXDgGuxn91mCA8eYmuhXMp9TDSyjOUKVWPfg=;
        b=OueG9rWtWU0ioA2LqK17kxrl3jZUml8skE17I7pR6zeCxb7hnzkfjMxHKVkTULfs/Z
         qKwUp9UbWAjEb/aFTdNJAbXLF0nYnFGunBW6ioOZjXN/UmABLwP5Xf7tLRk5xcBubUGd
         +m64MIs+vR2fSGtMcbv5CkC0hUC4QByKKnuc9Ad3OBGiDkDjt6/jtWEplJuYxVBNu1ON
         B/T/b7Jd8l/MaTb7GJ5/XULpQYFQm/RAKRPxfytrerBuDa5aOkMcbyTCGI/LvkmhcCGA
         vhHc+2dyymTG20GeROJxvty1w9ghy44Sb4MUbtgipcdV+p7VHUTSECbq5ySLSGUN3RvB
         06cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454826; x=1786059626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+J6WIwTXDgGuxn91mCA8eYmuhXMp9TDSyjOUKVWPfg=;
        b=M2bTmb3QJdKggxBX/LOjydLo++m9mGAY9wCXi16qc4z8nKjN4WgyGMqrscComOoFse
         4HpsxDyWrjIsarhDRW9vZARA449OKPwDITvUMwgpAis+49YEa0ltiXaY/IhQ9W8ITSw+
         /i+/tBahS92BJNbVmQFLkvASLG+6JrNvQ/cqrh8Som0+NxEmsYLhjywZTcFLcid5nb7G
         uee8TP0FifVN8FY8IbSTdy8jB1UHyVznDfiYfRVGVfF1kf+Oi/rgFi3m0gm9OaRqEbr+
         8KoCz6GURhMhic7ZYq/X+l4T8RGX+svK/TRZtmQZZRnRKVPM6u6PJyxyFWB5HENY9MgR
         0tYg==
X-Gm-Message-State: AOJu0YxAJOk8ZxUhQGjexy/1gNWg/khuc/02oenYeno5VSbu6bzChxEL
	frWoD2/Ah8AxwBfO43FP3BQt/wqF1AhFkUwCCYfFKkRwjzN3qJyypEzbM6FFhj3gKMItrf9aNr7
	ZgbI7VJ4j5kb2qd7T+gx9RnX3OOQrUy8IuRYhEIqCn8Flj2k1tsHCdwR16FuZDv2b9MJhOETxt3
	ARbwM=
X-Gm-Gg: AR+sD1100AR1eN+qcsTycMiqrN6IGvHLPJQNez9OkdkCCJRqiGbWF4C34PbTxHuTYq8
	djMEM5i2kRQKRnvj+b9BPW6Cxqq9uVtUJV8e5XpxjvhMuNdlUXP/rMEG7NfOAU1q4epSVLg6rIw
	i1Lb4QBWvKHO94/4gxR0hgt/ud3KF+ajQ/B67t/sDbf1T0WpFw1DdOFTn1OZzlvFowXaXMrSf0X
	WKMTM6OiY1kzpuV1WbDT0/rlUE2eysTcYtxzSA8cP32Ri+cRNDqULiNXRZQhRe0Q8D9kCTtYdQC
	3k5CO7lOBFFtFfbyrrTfilZBpr36mMraBfr964UhymnMP0LfDFaIPd5EyN2T4QxAp2BhuYoZ1pw
	0pYgOg5/QhqchkmfImpf0A8DAM1eAiCOd54z/hc7maWrCRZUmkbGpn/9bASxbF9vuaTylB6igk5
	48oADXZjXPCE4Z1A==
X-Received: by 2002:a05:622a:2c9:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b3865b6a9mr51751461cf.34.1785454825901;
        Thu, 30 Jul 2026 16:40:25 -0700 (PDT)
X-Received: by 2002:a05:622a:2c9:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b3865b6a9mr51751251cf.34.1785454825502;
        Thu, 30 Jul 2026 16:40:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acb98efsm5449241fa.39.2026.07.30.16.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:40:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:40:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org,
        robh@kernel.org
Subject: Re: [PATCH v8 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <v2por473v27dfyon36cuks4lig2p2ehkg74yy7awgaujt23rcb@jeaizpccjhpm>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-15-6597c08cea6f@oss.qualcomm.com>
 <20260730154732.905431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730154732.905431F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfXyRro4mpqGxHm
 SUd4xeFWJNuEdrzBeSXdFe+rI4iBcv8HlLqq0YXYa5nNBm0d6BZma1BNbQdxPAgEuNaqi1NEU6Q
 iajYxU3jLnuhunfQFQBmPcBQ4lRcaWA=
X-Proofpoint-GUID: KqfHv5Rxh8a_rVT7vW9g_Ts3laTEOaVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfXwHBV4B5TBXi6
 m9nlZB19pkULRZiuNUpPWAEmsONAl1gLoJCg3DQMVTlKCrgC2u3A6Mgr4TU6ryEdfWxvzoHMX8W
 QdOPNj0dAm2EqzGmAbpDgowC6TEQ4eTF3jZfQrXL2yi1QzYKd+9PhKjQ9Jy/0QA/75J3dz4Senk
 cy5tDmyvK+txRqhxZbVy8Jv8sszqc5AUqk+k+CtMr1XQlJakW/SgstM4gg1ff8l5ShVbRjgb7a4
 QrP3ZDGYB4y4RBR5+LfoKD4Mpv+z5CCRxDglmNLgsX1/Qolv0UtL4Q3F8nVwFWY2oWk+3szz8vu
 ZpM7l6ArSLiKmr7HhKWgkH7HkFaVsdlA78EtO9iwSBwCZnQJJ78MoYJ9eDPrfLpEi1vbY/gHs2K
 2DhQO3EffGUp1ft24mKVE0FPvpPfmuB0bXilqIFeTOBCLiCVabOtiCmS5V7CFblYeC7Mtc3JWld
 fgNRvJT+3vsM66KtLuA==
X-Authority-Analysis: v=2.4 cv=N+kZ0W9B c=1 sm=1 tr=0 ts=6a6be0ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=0IO_SnwM649x6-ejsqUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KqfHv5Rxh8a_rVT7vW9g_Ts3laTEOaVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300167

On Thu, Jul 30, 2026 at 03:47:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The AR50LT-specific VP9 line buffer size calculation omits several essential buffer components, potentially leading to an out-of-bounds DMA write by the VPU hardware.

No, AR50LT doesn't need those.

> --
> 

-- 
With best wishes
Dmitry
