Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F83D3438AD
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093245; cv=none; b=eRvDYTR9R5FSWa1r8bL/ur6hZkAseli9hOiBMo/gy+IBvzjlGkD8e0sOC1YzHGfuefkn6BKnnaidSvC+RveqjDxpMTaYXwaWTgZe9sOjvOoTOceSV0YKbcxJhRxHxbaQrjtIBJygSUU/DVeEpnClbIhR1EFVCiWfhJyxrHTntGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093245; c=relaxed/simple;
	bh=i++zW94PxMR8IYrKxOmUOw0j6reh6YFd7n9NS563VYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipTzRos/52ukqfTaWpVXGQsDjxX98/kma/D2NVzlLDUrQ8WzF/ur5uHHV+/6eMEToKk4Lm+L7suN5zQAXmZgW2MlJIgiFpmPT5vKJGvU9wYIm3eYfTtNm/uaqYUEsuXTudagXhgzS4pSlOZCzWDCCFS0SpVcJRC9EVcmaGtYMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIL1xFSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzrnNT6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIL1xFSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzrnNT6x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbUWT2427609
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 22:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pBvMLIb97/uwbiCsdTU27OQM
	5jD6wNRbqw0wj2EbdZg=; b=cIL1xFSXAzvZdOjBLOXhxT1LEVgwbTpGx6OTWLwn
	eq6FGTr4K8TXah7/h37zUIC/nVYVX/ub9fIW/wWkHP6wxX5MgTkXEH9aSSNTRWhW
	pnkFwdAvpdigTGDD3QKi//l1wbyOza303qp3YyphEWwRuyw7P0iNtUdtnPcpt5Z5
	JyOc5d/9S3oazTrUPrw8AUqyhOUmikRePjNt1n8doQyXfQrGZT1AEe56UbbxBHFs
	fCygxw1Ca1brhSELGJy/cFKgt84bK6YF5bMnlOXwDTD173arkJg1nH7StRo4nE7q
	dyUv2N7nDanIyQnSvmUVkIc5WQux1dxAlP8CTLzSxelj7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfn880v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 22:47:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so85013185a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787093242; x=1787698042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBvMLIb97/uwbiCsdTU27OQM5jD6wNRbqw0wj2EbdZg=;
        b=SzrnNT6xlj/IZFRlM5teJjHT4DOSi3MH0Bf7u2mSBzk23dnjFijwIFXjEGBKrKZ2Qb
         ZmblkozDB+NLH1aBCQSQEHvyGO3ZMckGGS8ASTcK+FmW4kAocfCOnscd7IsqZpj7Ny/D
         2myRTvDLPOZfCloUOfDRqtORQumIx0s7te53+I6vqr6dVE/FNA3OWbLJ51lUXr7zQTuf
         3H1qzy67n/GupvC0v6rT+tnLHLRy0RiIzZiCdXB4aZoeYvgCk/Md0UiyHKFe2tHR2bKT
         zzNbxJfKGZ7y2NI8xxcmm4kCLUDROsrW23F8NvkRQLrsKsjjl5iozPqV28hBl5l0JwiR
         +m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787093242; x=1787698042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBvMLIb97/uwbiCsdTU27OQM5jD6wNRbqw0wj2EbdZg=;
        b=EmOcthXe9ixILQQ50+p/5Lw4a0tXRXPUbsDP4sDZmcXHNNPmfB7w28lDshCNkKDpyx
         mDYCOuN7ylKcUap/Lgxq3yX6YT9QHWJpSZ/dZQNwn8tmJ9ZvXDfp3fhj3e8csG7k+xWr
         U7Tz2oNhXFLgI4PFHuucVozXYGhMBFgoA9GziZjA7Ts/KJWM4BjZ95PamZKW/LHVkwVi
         dRsddeMITLKMlTTkhNTN2iglaDzE4P3bapTX27BR4SM8g7tIicHJvb72uVq2+EVjjKCG
         qGQsCDhHktnYux5Xp0eRAaCk6wUNuJwiwLxxUmVdTxR1tzfs8Rfh8Hc7GrcPnMtCAZ+5
         3EoA==
X-Gm-Message-State: AOJu0YxnxWInksqcq6sdcJZsU3f2hiZd/8B6YAmmNwNeH7hZcFmJy+DP
	zLDCByohOEx9ECLyCKQ9ctqUZU8jhZ6qE6BwWdiPvUolwvv9J51/SHSrN7+DAfFgoGomgGNQkPR
	c+zfYe3KthcjhbTlUvgp4BD/zL8JCHKAklsdZTulx/lExcaoyPN87WX8yyHidgDbHWj16RKyUoH
	rlkylLxnNh
X-Gm-Gg: AR+sD13UgSygMYmlm1PVlyvbBb6VTtVIwv0FNxbFv8VLoFlJzCBkH25r4j1NnLAGSST
	lS4tA2PDIvLoSldoBO6pVo4/aWSWfpbo7S6igZ8phWN3YarIU6njG1quTg7J0v1d9hUsIJnoMA1
	Gr/Q0A9cWe3GK9EptNY96/Y+jeB8KijRNFhhuhMrM/Kqcy4tnsm3FwPltUeKXTTUfYcpwSMjZ1K
	oWYPMHCZV/59e0iEvVSlr74S5W3tOyoWMNW9CFZE2Hqq5YyoK3gBnfbOuKeTwvwQodLGZjujXh3
	GcZNqCcv6uRrGs/q84cpix12V5TiCq253SiRMiW9E8USIN5lwKltXCx/Y4zerImdl/v2SbAE5Xe
	soky2yAE9LCLiG81/YgnDpz9krfwVi7QYBvGqLx6mWRqyWN7UF7Nb5BtO/BVjHikCzHIIoI1Xz9
	5wdzMJrpmaGpda
X-Received: by 2002:a05:620a:43a3:b0:92e:62d8:1faa with SMTP id af79cd13be357-9371e636dd9mr72253185a.46.1787093242456;
        Tue, 18 Aug 2026 15:47:22 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:92e:62d8:1faa with SMTP id af79cd13be357-9371e636dd9mr72249485a.46.1787093242070;
        Tue, 18 Aug 2026 15:47:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853971sm45062e87.10.2026.08.18.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:47:21 -0700 (PDT)
Date: Wed, 19 Aug 2026 01:47:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Message-ID: <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <20260818160351.4E8F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818160351.4E8F51F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a84e0fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=vvLq9R5Q7EL3J8ZDTOcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nUi6bo3RoZhdYde_tIzdYFoZSu14TBCP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2OCBTYWx0ZWRfX6hLsbPxoy2bv
 Ac8qbYd0e0KYIDhLleKS4lV05Xy3NyvtaV6TpsfDYHKZDrN/yf2xn4Ay1L454F+3RzxQwHp63cb
 n3FVoftsVu3wARoVnn5BqVSSkK1R6vg=
X-Proofpoint-GUID: nUi6bo3RoZhdYde_tIzdYFoZSu14TBCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2OCBTYWx0ZWRfXztPcri6nJ56K
 hRoPnXv6mi3oP+aI3otq4eTGvLvkJ34K3TXVOrse2nyjJi0hKveQykV6LcSJt0UYB9m5MwB/RQT
 V7RbL6pHvve8DMPzgOqjqwhX13xILNANKqkqSDZCCZiQYrjb1ss77fDOSUvwAy20SGErFqBdclj
 m9kZx/ptDkokQf7kovCzennx+0ZrAVmwLBmnTRmtTrKiNSZz1E6p6DUiBNyx/rVpDw39A/e5kEM
 2APJr9nvTgtezLhWGu7Y7CoxOw5jAGBLksgZLlgltto3laZffJd8mVPrRqWxK/Dfq7EIClyqH0d
 fPZpb9zD5QFS69eA1lmaEQHlauXCpXsexA5vcAdA2NiqMIobekk0P56WJyCtx1VBHKy6MsOerFP
 8o4V4lcWX4FFHbrb0HQoEQ4imKSAw36BgDZViJWdn0HfYP46JjsZB2lwwnENBz5KS1ilw5q1Bbn
 NhbVIaP8p7WqH3GdUCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180168

On Tue, Aug 18, 2026 at 04:03:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dma-contig violates the DMA API and can cause severe memory corruption for non-contiguous DMA-BUF imports.
> - [High] The DMA synchronization logic for output buffers is fundamentally broken: it synchronizes the CPU cache before the hardware writes, uses the wrong API direction, specifies a zero size, and omits the necessary sync upon completion.
> --
> 
Please respond to Sashiko comments. Also, this PR is missing
corresponding change for the venus driver.

-- 
With best wishes
Dmitry
