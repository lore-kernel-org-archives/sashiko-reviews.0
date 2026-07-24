Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E453A5E7A
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892691; cv=none; b=f8G6aEydOwFe3Hp0MufDKltudEEeN/bEP2nIxW0jtTCQPggMaJI9pyIQOofl86hqaNGJWIiyB8hwMb6BBRY2oyfcq3rholR2MaKFZgMynWhD++DHa66Msn3IcYRS0c/MA6RANzhkiLf3giXL+ZklVjGipV8MaS7a2+ykDu2vICs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892691; c=relaxed/simple;
	bh=+gtvZWbeM6fmyh8yJ9VP7oNw91t4TkpcUTJJwwOdJOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiCXx1B+/+uQViZEZ1D/K7E8UgGpbMqIaJ8cdomSv2N+2mcWLYbsdpk40VKVmhHNCAKg/8q1FzGQR6Y9JS1h+mWtPUIo5YTmtAVSioUa+TOt68r5F7uqdIlNI+f2yKlqtdsmJMvRIzYkcjN9nUwnDG1nMBSa48bugyRQSv/nGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co9ICKsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwMXlG2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co9ICKsZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwMXlG2v"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADWRJ2478924
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 11:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GTNkUT54TF2iHLE+OsKEcqIO
	ZmWAIfsbQQVqRgnlUjU=; b=co9ICKsZMmtyK/qTMtmeYUH4nq+euE8xpuTXFi8R
	TzuzJz2pIWtxkqUGWlloj6zfO9dTZnOvdK3/QzU3TJ0B6wtDqldIZFMDfr+sWqHo
	GpXwDiQVNxfH5XHPjhejxUdHVaSR+BnutAr9Sac4W1WN07G8A6OZNV65zoumS/AQ
	rnaJrk6XwJucR/3R5WjR5fvlzPxK5aQ6s8HWV0pVaXUYzicnFlQhFyAhE73wL9fa
	wJeZwUORRxfL68KGoS43wgBZ2Qjz5oEww/h2O9sUx6BSicSEjPQGb3S3EBOMAQNU
	lTbcChxQZ6OrBiTD88KS2E7bmNrevUwvXGCj5M2CFK1EDg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx98fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 11:31:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9771c8f5045so221580241.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784892688; x=1785497488; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTNkUT54TF2iHLE+OsKEcqIOZmWAIfsbQQVqRgnlUjU=;
        b=iwMXlG2vyj12nOZn3a8K9HLJyGrx8jpyhHO6t/Kv1F96sl/UZ153UEh2k+FI1TnySi
         KqR3IRTSRHatzssFtQWTKE8l2H2ZIXKrcneDn0La2wGR7Odu4YgHbifRBWJo9mJFxrQk
         7e2kKEwH8zauaHAFYj+GBhPmvgckkE3A9QCbpQ05uxPpV7/684p8kwtP6IOZrpjgu9XG
         agcLnboe0NDBU9WXi9t6vEQi5LX4ImLAUiAN4dKFQDKcPlLIJBb/shWLl5cIF39neABl
         6klsuEfrVll4xbKgEHgI1S74kp1C882Fsqv4il8a1iyR/Fy8JigHm01mpncBcJX1ay50
         mr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784892688; x=1785497488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTNkUT54TF2iHLE+OsKEcqIOZmWAIfsbQQVqRgnlUjU=;
        b=OqD2bWqG+RsBs8fzGGRU+fqucv413apjszyXF6WD7wzLwDjXpFOmDppSdiPj0IPkU4
         ybihnNTXIa1EkfGbH9QqILNMJe8sDEQlSrWrhHbypKrpDvrn+hIi/+RiPCMfyRSEl3a/
         DYZpItNJhdgEdTMvfZlQNuzXEYkbNSmEFOv7OP6v3KaCdf0bov5V3Er7i06CeQ+YDK8b
         85PSVGET4Tsh+ls16e8/r+YfyBdUr81n+BteYySKpkdfMlEfV0XUM/3sbih5dzUvtl+E
         6+fWNnENxuZOI9JYDAVPutC758ANH/40IJnUqaOe1VzwV7tz5fquwWqFjIyyEOE8i1v6
         SlwA==
X-Gm-Message-State: AOJu0YwuDP+HeOQ/eQzD6znixKkbYSEgaagM+0E1d6QAlo2HssI6OeTC
	nVbcaL4I7wmM4bwEZpYdQUfPK4G2IS83KSdbGJ2nIrpiXi+IKpyhptVF61Sa38jRQQNsrzbMTI3
	YpYfIzI0Ai/ih21XUWXNcHhUERKJoteRYjcHAIdX0bj61r3tfbdlgqXaH7tGVKt1ba6t26V9i6n
	YZSVk=
X-Gm-Gg: AR+sD11o/oUucBQp9PH2U59pOhP7AP7TS3qD1vX7UUrOf3LuEB/lMN5B8Mweg5og3Xi
	bt4gcJK9+2+MSfDuEMT997W4rnqsEDUshhe7MnEGWLPCSc7a/ioWMqadrp03+6LsGld3DSPYwFM
	1By4YopAW1lsJz6ELQUfBL/FSY4Er0TSNKbL/i5R7OuIADHXW2Pg6nfjxmMNg78xDpTMkpDCXvF
	3CEoCQMD2SP8rCU1Vv8X74eHjv+9XCqXwNocwhCFvIEUiG+kAghLp69o1DxCg0lIBARHeMJD8Wd
	iCVh/Q20tigbt9DKxyIeomVKYfE0mep849ia4Od4bSWmD2Tgo8Oe890oovfdigFHJHrcZAAth0b
	TVYRo8t33GzHXeMxAcoTH4+ANFqtT5cYpanQ8vO7bfLKTMIlpnhHionGkEBWmPyqRbjr0IeN7pr
	xl+MKyVvqKHQO3Fw==
X-Received: by 2002:a05:6102:c53:b0:737:c272:92cb with SMTP id ada2fe7eead31-74d5fad6097mr3675422137.15.1784892687765;
        Fri, 24 Jul 2026 04:31:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c53:b0:737:c272:92cb with SMTP id ada2fe7eead31-74d5fad6097mr3675413137.15.1784892687382;
        Fri, 24 Jul 2026 04:31:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31d92sm1452667e87.39.2026.07.24.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:31:26 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-ID: <mltvafjdiapu6366kv7ezb6orvqa7cphuallfnyzm7fq6dl3u2@l2vucghdejdy>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
 <20260701082721.A81181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701082721.A81181F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: wvywU1clfF1ORkr2lWLsDM822UF_M9ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX+uOL7lmniddc
 aQ4BbYVCkaZETyvE+17OH4kRX5Y70xlVqSv9BsozHypMgZhz/VVMafgUl5z09YpkjCF869DHBFD
 vp9idGw/UX66pyCp+HQnE1da1O9ekPQ02hMPk1KEXXN9uNxuy8FIETJbNE8PO38i0z9FN2L9Egy
 KfTN7eAnUaxUuyaTya06yeX3tqeNMPurfTXVlkc/00+pTlrZRKlMUqzNMWjPqKiBeMo9cvBkexI
 E3ZTIxnTZFLPCEqpibre2aDljGMfFQ6kr1n7vwNvEAthJV2ykCjHTEZyrkOWsx41VlPpDQF+clT
 IIskiSLE5XmWcAr5IpvC5YxftZ4s7+Qetr7xJl+/XUgRM/fbud4rQKG5ltrGf+/UG/4iAmvSb4v
 7DE85ElkXondOVRq5J4u5N8XykwAz7c7HkoItPVgfZnrYAGKV9ucvmOB2Df9j9qXYbPlicDqfkT
 foJVhWlFau2z6x8lgzw==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a634d10 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=VtxIhMinv1Xa_-Hkk-EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: wvywU1clfF1ORkr2lWLsDM822UF_M9ba
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX54qJbqLXwx88
 BnXeDeKtH18sBmWB9Nx7xnHRFWs+5puG99JeVTOszztJjwcgRUDOlmhIgTMNTqpBR2qUUr6uJAV
 xfiM+HGGormf4bd78rZCyvWRADXU3JE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240104

On Wed, Jul 01, 2026 at 08:27:21AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Restoring an interrupted context fails to increment its reference count, leading to a Use-After-Free and Double Free when the syscall completes.
> - [Critical] Retrying an interrupted fastrpc invocation with a newly allocated arguments structure forces the kernel to blindly write output data to old, potentially invalidated buffer addresses.
> - [High] If a thread's fastrpc call is interrupted and it subsequently attempts a completely different fastrpc call, it will be permanently blocked from using the device.
> - [High] Double-scheduling `ctx->put_work` in `fastrpc_notify_users()` causes list corruption and a Use-After-Free if the async worker is already executing.
> --

Please review and at least react on the hose comments.


-- 
With best wishes
Dmitry
