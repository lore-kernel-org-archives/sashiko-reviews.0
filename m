Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258003BB117
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198550; cv=none; b=Tsb0m1SvTvYIehg3LL8mLe2kfssGDsvUM7qnGTAqBDKMBMMUPzFl/LLJhtwodwHz/aQ/YttHIBbL4X9pRhnQrHpn1CXzmHKgCC6H3FqN1mYCm5MyIyJmqeKNYCs6H7RyXQ/PtC6lmf4/4ghqJDv1Sc7mcvAYVVlnwm8Q9MKtg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198550; c=relaxed/simple;
	bh=+lxjAfe6wEYUQH5kHI10jNSfjIWCZOMpz/WaS1Y0Kkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjpaViCa0dMRlHcxoM4Wl48q6H9ogyv3Jm3GcPBtbGAPtMeUyZPUEb3ej9nJolx5q+B6ITSM6Xu1E3M2fz9Oma6DI8+Zyoy3U/SUDYuBdRWOtGLjeON06fZJSd8pm34Y15aAbdVijQEkfq4/picDohMsnmOyCac8x+8OqqkL/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOBUXJM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC7ZnCwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOBUXJM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC7ZnCwG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEs2nj873396
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 17:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=; b=fOBUXJM8nBBWSiQW
	Dsl3/OsySuKXJYVvkutyz7epGp/u6YW9bqF5KbHF7p+2AX0xOYzA7UjuAGAP+t/K
	uRmqipE9b2YbeN60VmsdZMg17q1cjV5Oh1/tXtCDxh9k+PUj+Lef++4flf8HAXMA
	5mA+k/Z24QAGMr6yOeE2QEFJMmiUidYwGBjYlFAGZf9tluLhlNPIs0JZ+AB07VrG
	CEdVV+Qp3RmjKhZ+FTjl085yUBghCqDeaPZ13bc8zT376V+q1QAYk/GhBJihOd3J
	v2LXjHt2WqKwzmyDz8gQ49fwLehXewAimF67hG/lgsWcxwbD+JGgmWtc24CHPsqU
	avGGrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6smt66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 17:22:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf160f7191so438315ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781198544; x=1781803344; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=;
        b=jC7ZnCwG3Z2L+udLuudFh2TGt684mbWYXLWaBN0Ockh9LcX7rCHyw1kGbqRtgnj6rP
         2dalYcckrhA7FuWGgPZ2ugopQlVTGranDD0LKweyYGziBTpyKuJ3veRzimD7hrldYHCC
         Tg13FMYq8vd3F6MyVU/zuifyNG2MY22Vvcx76OrGKfQWCq7YI+beenXUrzaSVJ5JjSQk
         XRYjBW2oTKZhjs216WUhlKko0BKQuNUkh7CcxuxsFIkTIwtL8klylAmTBgQ1Q7Y8+nPk
         J/Bg3FumwwTRBoMdwMNwTuAlUGzLq/jizcMse1zJk9tuehMc5iBZZ5rehUxta3P8USJp
         qMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781198544; x=1781803344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeFocb12chtGwgRowRCL9ILbPc1n/e3pDIXkrLx6bWY=;
        b=HNHp9p3+0sc/qLabuXn4GywL2UGw7ghtSvJ70tW22492S5Cf5RYwm8aeAQ69IyL97D
         x8tvTNdnMFCw9WdWfmCpqGs3DejqLnb2q806vI8kCBuFWgssT1MQDaK7ZaTFsmRm9mgS
         1JEpOyT+89PfWXGH7bh1FyMemVBZ7kPvFRrc+XFNv82DtmkD7JJj6YuLbPvpsRllt2sW
         yVBqATMp0I/jLP+9iveKqB+SaLKbRtD6ukH+iWXkRb4rJIydfnwPsj6cr1F5cVDfcqBM
         WssLQ+4LsFDHcXUyDKndAb2O0yigaGgOIZbud2Xo6PPaKVIUtOcDfGUke0OygHGZscaw
         QkfQ==
X-Gm-Message-State: AOJu0YzRVEvv4V/AWPuIlE444HmFo7ft1R7hhAKJ5d0OT7DTfrB7wBAQ
	Wguta+qbSHfm1WsJ882bKywzSejG59zVnjIs/mrMHV12332uFySq0y2xRpqrvTilqiUnxHf7DAA
	F9dMBMSTTVQxD/61Mz+3asnnXVOm3VaUhSe9upQlEO7x0FAReFbV9AIoQ2PCXWm9GJ/ZGkg+Gwk
	9gQCc=
X-Gm-Gg: Acq92OGeBuUO5Zi/sz+4aW4jlt9L5Ik/xxaXrIoQAMVwuNcwCTTVvxGo2cgVM0SJKjs
	iUHN8hkLshutERgwEKJ0l4hsZO3yzo4IcHx2LAObk+RxPzfwAz/GrB9UUfvEaEbXLu7QHdqEr8J
	ngIRE7UgftcpP1f173QVlYmjDE3oWC73E6dCMP+NP1Use45mDuCwZU+JjsSwNsfpWWMlM3U2Y7w
	WUgcYusrwu8xMOKb8L8GdGnUyhFCiIZGplc0XjLvLkVUQhAXmNCJ/V7XFkM7ssngpNKvWxGNu0n
	OAiVHNlCnxcmolTm5XJQzdRj/XnLVgKXiYhOXMkgKoKZ7sLXPOvxO/d2KE8fg0Q0N83KqxlhCSW
	whqYXFsloQU4hUoQX8sKwUaO/6DdRbpW0XbN01xEgb3mMXseU
X-Received: by 2002:a17:902:cf43:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c2ef1870c9mr46091155ad.0.1781198543524;
        Thu, 11 Jun 2026 10:22:23 -0700 (PDT)
X-Received: by 2002:a17:902:cf43:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c2ef1870c9mr46090585ad.0.1781198542864;
        Thu, 11 Jun 2026 10:22:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f85de1sm284705935ad.20.2026.06.11.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:22:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:52:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260611172217.zi2u6b22r3c7jn2d@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <20260522202145.9AC631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522202145.9AC631F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2aeed0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eJ65ZG8ybeDIfqJBo1AA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: PzMasPZZuGRCVPx7kPAwjwXHiYs_K-79
X-Proofpoint-GUID: PzMasPZZuGRCVPx7kPAwjwXHiYs_K-79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX+qpfrjxreKLB
 S6otR0x5v3mUQXr3bGrsmF/ZGO/xi3tI4dldEK2PKArdJy1WK/yPTxEdX+FOch7hbwSaxG10Zqd
 AhjAqhzNONQO6sxK84nmQaG1+OeUCW1msiMKmd6OYioHkK3YrjLNRb3NNZdcy+OuFny/OVevT2B
 popY1IKS3owYWqDQMQ1vKq0nZwYwI51r7XEYrMHHBDVDhVbeuoXKzrQI+KjVygi0fNBvoBgHVrq
 PsoaKscccXj2mqugAGU9T69DxABO1xgE3Kqx9RQvtsF2ys+u0ygayvdXtplAlYWiHtcQJd9aXzh
 1HuVab/bmDkivoVXpM8ayc+X80xWdVQBxcCqt+pU14wO/RKehtoy2P7aHwisY+QKd9CfK11CaY0
 EvjB1NpYhH3thDo5LolCydS+wfqerKW5bbSYjJehdTbqQuDtsxnVQmwUyHXMsK/GYji5WUQN4Y6
 RxhDQ80LW+JIy+62hUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NCBTYWx0ZWRfX0JHEXhmN6QGe
 s9IIZCMZlDXS93Wp5GqSsSgbSyysMidpUhhNPsn01QZ5DLuRAaRfwad3moTtzrLbpOZtBAFZXqL
 FEvnDKQsskOC1VyzkO3bWxDdadTBC5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110174

On Fri, May 22, 2026 at 08:21:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing smp_load_acquire() when reading the global __scm pointer in set_download_mode() risks a race condition and stale reads.
> --
> 
> commit de197846d8ecb70e3382c65171f1e37949d3d114
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> firmware: qcom: scm: Add minidump SRAM support
> 
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. This commit adds
> minidump SRAM support and exposes a minidump_dest module parameter so
> the user can select the destination.
> 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> [ ... ]
> > @@ -568,6 +583,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  
> >  	if (ret)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> > +
> > +	/*
> > +	 * Write the destination into the always-on SRAM so boot firmware
> > +	 * can read it before DDR is initialised on the next warm reset.
> > +	 * Only written when minidump is active;
> > +	 */
> > +	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
> > +		writel_relaxed(minidump_dest, __scm->minidump_sram);
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to read the global __scm
> pointer here without using smp_load_acquire()?
> 
> The driver publishes the global __scm pointer at the end of qcom_scm_probe()
> using smp_store_release(&__scm, scm). Module parameters are exposed via
> sysfs before probe completes, allowing userspace to concurrently trigger the
> set_download_mode() callback.
> 
> This callback reads __scm using a plain, lockless memory access. Without a
> matching smp_load_acquire(), the CPU can observe a non-NULL __scm pointer
> while still seeing stale or uninitialized values for its members, including
> the newly added __scm->minidump_sram.
> 
> Could this lead to an unaligned access or page fault if writel_relaxed()
> is passed an uninitialized pointer? 
>
> Note that the newly added set_minidump_dest() correctly uses
> smp_load_acquire() to prevent this exact issue, but
> qcom_scm_set_download_mode() remains unprotected.

Will raise a separate change for this fixing
qcom_scm_set_download_mode().


> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
