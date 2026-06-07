Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B599302753
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869313; cv=none; b=lMUniILXf/Ft4A5Zhesp6CzcsHC4RJaSPK9BAej0dQpbfvYL+D599r3TAxzJFRQVT7kw83oDj1RTAtxsOC07GX+dj1TzgJSTm+0VRoGhAKTWF+BiPjEiFyFUyICZcq++J0nxL8feCmK9er/4QOJUm7Nz/QT7euEfXDcHC5aTIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869313; c=relaxed/simple;
	bh=zOEzm/VYCWCJBj3pPgJ7dY0h+kVgNqQ/raEinAKHbho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl2m++QTtD1rbPmTeWd7U6LWdyXZ3+W1f0o7KwwDC3Jegdngrq1XDWVf05fDBT55XbO811tcm8EQ7E4RFF4DCZnaqRnJ9YZgo9POcGJ+bAKxAGK6oHhDQg6vtbdx2bH2uyOK/XcIgcEjbJ0MNYo+RPw553SwQzb0bXCDNswH084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNKCdJuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6+AagbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNKCdJuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6+AagbP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El63N375434
	for <sashiko-reviews@lists.linux.dev>; Sun, 7 Jun 2026 21:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OGc3jEMT7ZP6mQqSI1cOL/G
	1ZjfZWPKtiL7dzICldU=; b=FNKCdJuZBdytcKuzX8grLCyzWIYxtAWCidcdFGbC
	L8hz+seOzQ0MS8T5hmeD4m9Cw9/aWpQIchkgWGjC83SO4TftIb4dGrlNy9uYBqD2
	B8lrcpF05qpcC2Bmn3BCmFf24XpVBgwJkJ6F5oXEdEAcPz6oEeMoNlX6M4MvE/Ex
	iVPVioUzahkDWMIsGz7aC2i3XfvlJ/EKU41qXNB+EY9y+JCQ4jQmqHaioeMLx8V7
	7gNGUcLDqNZm1GrIeII4pwaJoHz7gyitqxAvUSZVmBIuEZCUrmjzen4BWulMUxPA
	VTLjU4+GLCj4JYPVIZxq0A8DvTGj4j7vSt0hb9CoSc8O7A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvk8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 21:55:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a77f8bdc24so642168e0c.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869310; x=1781474110; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OGc3jEMT7ZP6mQqSI1cOL/G1ZjfZWPKtiL7dzICldU=;
        b=E6+AagbPLIlfwHtQhU+LJyXjJpXNDiLof8W+6CbXUaO2G8Fovz3E5I7otG8zOCNwVn
         e8Sw8sZ8Z+ppN2c15xTcGCnnjZhIPlmWVxW6Mwg+uw+PStKTU3NxdnQS2FcqK6xYpWIJ
         mMr7Rp1Uhtt5HpcjORjx30Y7ReSkEAZcEhwcjI0rSH3ixDz7mHDQAKO3Gu9RDhhD3Lym
         2u3CuG1WgPhzyv0e0j95bbZLTtrSPIL2LC8ZsTLNr08PPIbX9B06XJkxq+dB0LZ4ZKYw
         PWTQcAGMwLF/3qMfER3LMQ5EtK+Igq/Y9NmPwmym+BTC2Jfk8WSeDwIGfPFG8rbxSMlw
         /T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869310; x=1781474110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OGc3jEMT7ZP6mQqSI1cOL/G1ZjfZWPKtiL7dzICldU=;
        b=V4OlClvVp2ugL5EN9lsWUL+isdInAKZnSIYYLtt1ewmg3zUGz+2/dnyQ9RKg6wY5eD
         wtwlXrxRrLMTL0STMXhmdhwpduGSG7YzCO7kv6RjYzh1E2INMh/8uyl06cxaYkSbp4+M
         UCd7JR0HNCbVWT5WS+G3gSnuFHF0vdIUF1ptmMDgEMGHn5icfgbRiZUJSgURfEL1MPch
         8Eb1n1u4HbyLq9TEmucyMBADMVkYJJTEJ3/5nZbwG7Wc9pVd246SvhSUaxr7Vbo2sCZV
         0b47c0WSwSyN3V0eBlwA1aYSzd9dQH1i8FDW/LQ/JLUaig8Lj/9iSWyDwF2QLPEmVxG/
         Tzpg==
X-Gm-Message-State: AOJu0YzKO2vkxbIHIzYg5ybqOqXv81J3tBrDGIpFHRuoK/Jxf4EHZqHL
	1VYiZtmCvDi2wCRGxPGs4KsRsq0omt6RB0x8GEPUoRTCLj8fNOAjhGV8aRjyE489y5WYTXMTi3V
	zfOBgPs7UL3YI9+PJm4vNgBkWbVeNV2hSb2+6lzUyvz3gohZendMbEI0/OlgfXCQ0x7DkrD0HWp
	NuwBY=
X-Gm-Gg: Acq92OEIiwUCOJumw3pvhe5llbNfWzQTpr9jFPpt+AwzZwjLT5T8eSo3nc165KQMKxc
	n9DpI+M/SmNIz10cN369ZsYuTF+pf400rv7Y04aCUaF1mMqIvDYWuH9QSaYEy/vbjtWvLeY6mJA
	QwGicQhy2oCgzeVN7fVZq/PtMNxp0M7OUSEPr1GxLXrs+PAjO+OUzixVJlbfs2VyFy1vtRBehp1
	7BFgQ4vPnlsU9xpNcOSVwZJsQeqE0EBj6X9N4F1fsV6vDL6jiN1PaUcvvd9s+RWvLPdpV+hVKNp
	WROaL6G/AOb34yNEtq/rEaPEFb1iJqXojsYCWURZWk1BqtSzKX8j9EMFy2YRZvxUfCsplyfuX3+
	nOw9MuUThV5JPKDn+LWwennsL9xvnNILJMrh1e5UR8XSfFChNEYbO/dMZGkY5Yp6ryFA4DgXY68
	JQnArLtYhfCulhgP35dXoN4HPGHo8xRDdZRgSBG4FPs7voRg==
X-Received: by 2002:a05:6123:a1:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5ac548400b7mr6178618e0c.6.1780869310368;
        Sun, 07 Jun 2026 14:55:10 -0700 (PDT)
X-Received: by 2002:a05:6123:a1:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5ac548400b7mr6178612e0c.6.1780869309948;
        Sun, 07 Jun 2026 14:55:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3368954e87.59.2026.06.07.14.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:55:08 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:55:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 8/8] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Message-ID: <qvxtodvp6zqeohrb36kjxrglkk4rx3gohrx7uvz2x7zm5fxlyp@t7d25j2pm6le>
References: <20260608-hpd-irq-events-v4-8-30b62b335487@oss.qualcomm.com>
 <20260607214621.9586A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607214621.9586A1F00893@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25e8bf cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=aFa75qVXnfFcn4bRmZYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: pb9For1XVDsSBnXc3X06M0DV7uWF0wJ8
X-Proofpoint-ORIG-GUID: pb9For1XVDsSBnXc3X06M0DV7uWF0wJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIyMCBTYWx0ZWRfXzm6oQRt5k/7c
 IRFj4cWJWQve8Zaj2xL4w/avNZ+NxJHAo9S9QhEUDLooWfZlK6indK4N+VvasJJ9EahdC2vgQr2
 1vuzRrL0GLHF9zEWmDVCUDFfjNIHYXQM3Jqm3531DaiBLv181LMoRNdyubmm/SEmNxWkgPzjVnL
 zSwUWri/zsroXbNz6TJ2hzeD1qRSEdrmuJOamo3YpZqwXCuh26qlI2CHOygkjozvQUvZGxsyeBF
 /4XrH+H2M1moly5x4/+Tv3vexYdQN78OdITb/WDSNYISM6OSJRXORUXmHM1+yA2fIcGAUjtumLb
 OnF5HyLWI46zGgd2qe3gQxnadURCyoIa5coiYrpAR79dtalXbgKUDWFsFAZ8xR4pnF1totN/Awz
 +cw0n/cbT6v5mJ7fMbX1OsSE35324srlzV1HM72EZNd3NOXHhhI3WtSWv+C4sX5F0OTb3gBGjpG
 j5B4uloclucRWqqJelw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070220

On Sun, Jun 07, 2026 at 09:46:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Early return misses EC hardware acknowledgement, potentially causing an interrupt storm.
> - [High] Deadlock between EC threaded IRQ handler and UCSI notifier causing inevitable timeout.
> - [High] Out-of-bounds array access due to dynamic `num_ports` update surpassing allocated size.
> - [Medium] Undefined Behavior due to shift operation with negative exponent.
> --

Pengyu Luo, is this something that is worth fixing? I don't have the hw,
so I can't check...

-- 
With best wishes
Dmitry
