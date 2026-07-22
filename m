Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11411345CBC
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727191; cv=none; b=kkxLlh1K7/XbWBIpTSRZ1UgU98qifSilO6+wPi8Ov/xZS8Zb9T9RTdQ1TVtY2s+d3eCbbDn5f6uIhciCQWMXMFuSZFw05l2/RFHsLnl6cZMizWnkPigf/f0TLQ9tsHKWs/2h6mX8cHcvW1cH2nzb5L5V4ahZQC2KCj6DuO5hlg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727191; c=relaxed/simple;
	bh=/H1BBVdyEfbyljZhJZ/xf3pK2EeBXTnxYB4YYoc7Z+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tif93Vqj072PO8d4emeKGi2ZPQQky1WvxGjyZ3f6clGfjy/1536cGltJbjmDTIgmgTFUzh/QMvAT6NMS6V11cKFa4kJZgUxlpb6po+t74fWm+v2UXR3zb76QjhxCjInVUUtWELQwLyh/GuVoB2t6eJiEYU6RL4GXnYJkVFgoAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RssjBQuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3WQWU6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RssjBQuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3WQWU6a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWqGe1034081
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwQt8eRAxY30AWCxNoSfQv4m
	5dYVITqKyo7Nd44T5J8=; b=RssjBQuKLaX6D7xm79Md/BZEbVFl8bCwtcCpWUk/
	IONhInnGmXQgKEr0bAOLFhMGXbncw24Vkm99uq6MwNZp4pOZiWxSS3HRxP+sqitO
	Y2cWF2UZXkNV5wPC6EDtDfpPXVOCqR5+PvzWazc5N3of7aGmLLxluXMZuo/IfL6C
	DN8Pk0Xa+0PraCvCWdY8crIfPbRUXKmZU3p3cnpH5yAUzDkzYfxZ28r51jnFW4/9
	aKFwsNboPtGFfLL4X19XxS04cJCkanQu/TLTzFkmu9SwB6ZK84k51K4nFdzbpci8
	oiNRontgbLDHjeHYT5MG6Fpyu+dqrwWC/riUkKrWTpIgdw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdj26f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:33:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738b76cfe03so12077294137.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727188; x=1785331988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wwQt8eRAxY30AWCxNoSfQv4m5dYVITqKyo7Nd44T5J8=;
        b=L3WQWU6aTsTmv7nTi+eC1MPn8PMQro5JYqdkVvd4NRzhdiSfoBg37GvHU0/MYJFdOc
         kE7dr7kzSLpYrzsn+D1Os4WTcEmH2tdsPrGBU3+PNxW6T7de0exNJhWIJ3/mAkcSBtE6
         rJ5p7OcKA8dppWovmemXxgXKMsp5G4EabutOp+PzNQPa7gBEAaym24wn4a3Kdb81YQMH
         eY96Oke0rGuV/fHIEcXY0gOK6+wnBGycdYKhHimunQKyvEtceKlYqGY9kpk2Clfy2wBo
         kmukeiCOlnrU+pLVVifYW3Xx21c9OEDQ7WV1owym11GObR5CIGeW1RHLSLCTJvdkYXJC
         o3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727188; x=1785331988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwQt8eRAxY30AWCxNoSfQv4m5dYVITqKyo7Nd44T5J8=;
        b=rOHwxylDntzz8frfZzGmUDY6s13vfR8wLbxoPy4fT86jJML8gwUwI0Jd8uZbDoBgbJ
         cpvIKnrjMB/6bVgSL9LPqKADbzy0NQF4UjRRQ/GhgkzUlawpfAxYtfdIJrWNNl0Gt3S4
         y66vwJLMOJuqI1Or1C+PKc3s7bjisv7tX6M7EuCSpXMr0Y8wBZmURx/FefJ5e2/zTgqo
         EJD+Jq3r/e9mKzaDBEErgw5lxIvQsK7k/26fzlla6ycqICVXWgN2RNJRYIQ6gCKvnIAC
         J1w1uC0grOqnT4GD8d9jJ0Kcp16ZLAA1qwdlr2eeQJoIqRihcn9Bjnh/ug/j9dglZD5t
         xjiw==
X-Gm-Message-State: AOJu0YxpX2luQ0A5oLZMxL03NU3GYSottU+lj+WP2WmXGwvGWNDR/km0
	lMV0osBYSqRTKRZg2UfH7Ts/9Ek5tCTHA+zUA2Wlkwvx1P77TGfKhOCJ07zZEB7/g2NaX+GaGMf
	Shj1/WfSDU9TsYa5WUqO5u6icCAMWIIkg/1akiogDoWD9fmaBLUUXHaYdTmtROqxhc7xgeRY=
X-Gm-Gg: AR+sD11ifNWOUA/U/NUCv1k1hSYussq/P7yuOcGJ1R1KxPkLPUTFt59mgiVcxT2bqzp
	FynRH56YTEp/q1l+0eRgLRXKrM8f7wRsg0lwYwBdesDd2v7295C6XYTs3hR+H3BoWPSQy+EWY2+
	XXOkktAJTD5DpBjh0nHGXCxh7Wp/itBp4fLUq1wcLVxugxciMQLVL19TkUIa+C89L256HDYQ0u3
	Q8XSlm6tE543vvw+VCZLANmSOLwpjYWcqVHwwdcSnoiA+xgWutNrnKnB6QkIk1bH3rKumB0FLlw
	nmZlDlxfRTTb2Ts5BQMVAUzkx07k3Isv+G5Ax/rgkNw5C3GsJyFbSbiBVjzdCZCqRscHVBWXkE4
	j3L3PkpOtlJoMdnRWr9iznR0x/93+IGmRSzWYB5txwOr7IE6+bXI22YbHTOut1zZrzoXXUcQHuH
	ee73hNtskkrvlPiw==
X-Received: by 2002:a05:6102:148a:b0:738:63ac:62da with SMTP id ada2fe7eead31-74753711ee5mr8596813137.19.1784727187932;
        Wed, 22 Jul 2026 06:33:07 -0700 (PDT)
X-Received: by 2002:a05:6102:148a:b0:738:63ac:62da with SMTP id ada2fe7eead31-74753711ee5mr8596797137.19.1784727187447;
        Wed, 22 Jul 2026 06:33:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888542sm4239001fa.1.2026.07.22.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:33:06 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:33:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
Message-ID: <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
 <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX7+0zU0GGj+NX
 lcKiALkpU92lViPlmn6NP6Qs867OFxpjeBLe8/4pLRo7MTZYX1jK8cqDqM2M4RU6f/+rNoWuvdE
 Q74Pu4vhViVh4WVyoH8iXd3eZlhj9qyVmGn7MrKvV/3zaOfny0lqV7u5cKaSNY+BmCFwaZHYTTM
 4q0EWNaHx/LDqk1JfuY+Z8JhmcFxEbzrwP0s3suj8keUKTKKeL9jPXqTp3zafJUC5QjgsQRP+e7
 1xOaQq98/F9H0r8kV18nsVaPOWI3MobG3aptzje+Rw/3UCNfwQFtlUwHObDZF91qWYoYrgadw3u
 f3o3Ch3nRwAdjowQQFY0kummG2WTUxCN7t8RelNzxhQw20dh5UOjGGfHeiGgRWTRNl6EBXCXyai
 gb1aXIuQ7dXn5TcN2jCRCuFnHJ5eg0sZk245PZLmRoEpWriquV9b3YzOq/YW0f6UI30QHn3eX91
 T6uQms/t+VziHc/bMbg==
X-Proofpoint-GUID: 1ZfhG-LDDBxOfp42k9Izr3EDo2HqCSkC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX2Tkh2Fn1xYpp
 FR4L61lzz2wX/G9enwsVYUMQi5EGtxLent+vyPiTBcEt7Pq0sXfMv9Mm+igURLqNKjoJNQJ/Dc5
 d+jSh6zEGsN72jxsZkw/WwiJsoMI8Qw=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60c694 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=793AhHw_EzWDBmsHl04A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 1ZfhG-LDDBxOfp42k9Izr3EDo2HqCSkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220132

On Wed, Jul 22, 2026 at 06:55:23PM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
> 
> > - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.
> 
> The COMPILE_TEST concern is not relevant here. This driver is
> Qualcomm-specific and depends on ARCH_QCOM.

A general recommendation is to make drivers available for COMPILE_TEST.

-- 
With best wishes
Dmitry
