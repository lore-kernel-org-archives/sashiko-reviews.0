Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088064502F
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868988; cv=none; b=F8MD2eP9H15WMMx47aJddzmNXi+/cytyUn7CcK8C4m6B5H730iqo7bifcaFCAXm/2rdcts5SNigm42A/fXUDL22D4aK69gOMF/oy2Hf/O+4JWJ0s1GUgXdyYS5hQyEUZt5GyucWEYkjWgP1ok1SKjEAPZnakPGb/EGskUXqD3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868988; c=relaxed/simple;
	bh=pXEj32bnaEuxuRPrXJze1vNWEsA8Azc+N3fhn1syoWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxAZ6Dt4m/jdGbIDtplH7ZpbV3IyiHyzIo0VlnzzvlkrSJ7iDfn3lEensoYzrWDE/fkI97QZEUjiozwxN4VZhdHf9wGewFPMRTAb8z4Mi8lxGwlNiUkhB0jSPV6m2DxTgI2VxqasYjyWmGfVwLfWfUY0lkFc9v0TapPdMLudtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Getk11YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FT82gm40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Getk11YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FT82gm40"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkQZC336630
	for <sashiko-reviews@lists.linux.dev>; Sun, 7 Jun 2026 21:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DXaTqNY2M+Ko03CtW9NBM5EV
	LlM8nxl7MyFTV+TpHHY=; b=Getk11YKZm/doRTM+2tdazuapP57I6wcDT6SXi+d
	Dh0MTS9id86Zb8GrbXJs4y8Qy9jmq73wGMBP5N/8ikJs3DBWJ0dukV1VIfK2UKBB
	aeJMGqxAxNPvRqEoMDG0Yxb70CUE8/AqGZYrUiBtnZEqy+C1G03VwBncqURUdtf/
	FcrwNgxxwzDkIszVTL+FqMn55C8Qy942MplHzIC1OLOBGN6JNfPex/1YuSvgv47o
	9ahf2E1E/s9NtJALNTBlzJMRISJ6TR+iPQYcdGfYRS82TDaVWigyQwfjN3r56QnH
	fxocFsj54qDWf0cKWxHSmH7gr2sRoAOm5oSildqySyDj2g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvjfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 21:49:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59eb9191180so2634227e0c.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868985; x=1781473785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=FT82gm406SWoSZD///oHpkb9Ky3R0mWBdBez7CM7aSzUFr3uUu3jAfdRbH53DYUvv6
         wXmMyLTGpLGFiTwkj9EKDAgqsS8r5lxQpm0ciRpoQtIJ9v/HUGhF08j5gAhv6ZhUEoB4
         NMPEzswXgyipd1qCRBJWbvScjWHLBqO/Tu6PTcfTYjlefCmAEmAhITa1WCxBmDnRpT0+
         l8ZbVr3NkSnt8qQsm+dEhK2EaihrcOthVG9ABIjwpw3jr+nzHfHaNeT1SNxdLHoBDCny
         7cpIPYQieZxrSJ6BTM9DWa0FDDu3/XDK93NMFBUaSV72XNX5gIxAsSUix53s4xi9xUdr
         wAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868985; x=1781473785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXaTqNY2M+Ko03CtW9NBM5EVLlM8nxl7MyFTV+TpHHY=;
        b=ppVNr+0ko8/WhTry3vOKLztT44A79jW710FAvusdcEApOJDuYjbGHW4OOa4IXoN+8q
         RMEbR1zf3lfMkBG8xbDSci20uRqd3WUsfz8WGEAG8w1jbFb+pIdT18mXwqnYeHAnfNtJ
         RwyMvwy6mjs9kXL1I9kfNc1y0GbqB7vJnRSyOx9GKswCYvjPE5/bYwNf9VConlx1G5Rf
         H1DtEAdu5KvwxBNyCFyGNoJINOsY2AuSKASOtfOOckT8Z8B3PyIMr2sQJH5Y6lbjqKCO
         wG5Vo1BIlmnvJAzhQomXN1w5RYFVynr4q8Dxhop/RRIm1pzZhuAG8yGXid9sxMltfrOI
         ZMGA==
X-Gm-Message-State: AOJu0YygDmd+t2ZYqhCx1wrL7UFdCku7zPK4wlc/kZ4s8W6ATdkDJjYM
	5kILDMOdZkreddstNfy2CTNSjeXIRNv+BF12WYox7syb29CzySHaUnnUx1E7wz1X9KduZHRpf1F
	WrVp51KOvNO4obGxknIi+Gu6UgOILyTXL08USLnRtBgIX3oy7rAtnF7VtQs7DF/MZh1flbkqjXv
	mxmQg=
X-Gm-Gg: Acq92OHEMjjrf/vd4FtVWaVIyb+Cgiid92FphLAXjxFgcrRgA408cA0y3cl1VraMAwv
	oqT47o4YJjFXfxBufz12phW8X4ZM1KBHKTzWNpbK2zEoZuc41NwrkK/PkPzl31GXNRGqLZku63m
	9VnmRT+KiS/L4+/13TmNsSVw3tyKlNAF73CHI2sqbe8XfuSPhVsoGobkOl8GErfd3wReVumb/eN
	pWj+YXR3EL8nAtZkyMDJq09qNIw9uoPu/VKIw8s6Ca1sacAqAJGQ5/rDNihd5TNEDrxA3ZqSf2N
	e9tKKw2sq+hdS6IRQ5T+bpvnUEjJZcDTAZmK182EJONrMbxZOisKqRVsWkHnjjWohY7LGDzScTy
	/gRZNJOkG7DS+x/63+gj/niqXuKldKvxjz5yBX8e7O6EvCSXyDiQA4ZsUgJ7LY3yz9FxnQiw5qU
	xEtzCovFiT87mRXR2MdQ7hUjZS055+nLUNK6Il8H6Jq+7Bag==
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781906137.3.1780868985414;
        Sun, 07 Jun 2026 14:49:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-6feef48d3b0mr5781894137.3.1780868984978;
        Sun, 07 Jun 2026 14:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8f6sm3317851e87.6.2026.06.07.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:49:43 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, robh@kernel.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for
 dual core platforms
Message-ID: <n3sltwjzpp4cl5b53w7sfxvdrsnjus7vmydqzyfa5d7rao2sro@72ac4cxxydoz>
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
 <20260603144434.928EF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603144434.928EF1F00898@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e77a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9tgJAH-OFjpxVSOFymEA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: hVeMbTpQfuimI9IxM0jaahsdIoGyIWDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX3hWg0/gXv2B5
 EuyE5FfE948gaFcaQU7X2dX5vdnnqxOXst3gDThsBR8iMsZyQgDoqAXZhrblTG4DAWdPVc09Rb2
 fU/SEkIFPRegdMKqlh5tVi6tkMJU6CfnBtu/SsBvcdSjMCnPZWhhD8ZyRJZxfIoKBh7E7LI03ks
 HZlAzzmZ4I37JT1TM1adJnPvjc2/jGTpNRIKl7vQJfzW6h9eGWwvjIgclDWbmCmtv79IyBeQpLq
 OXUQbhW00muJ2qbTs/M19QVc4I98KrRNdNmmi+Ll4DOXYEo14f+vFNKSw7Su3Mifc8IuZMSWnez
 hj9uhzT1o5nVmSZK/SFKYsg5VMkWgVTwUaq9DhC5+LXrFxBMxVN+lNuqCgakdZxd0B9MmmUXARm
 amXh5gsf4uLc66E1Jc9RnaoK9xZEa2jox8rrSPAsOwt2gtaRlynNVAwkZrkbA0kIfDMAQMRQ3xo
 D9gzqK0RI15DLkG5vcQ==
X-Proofpoint-ORIG-GUID: hVeMbTpQfuimI9IxM0jaahsdIoGyIWDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219

On Wed, Jun 03, 2026 at 02:44:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamic core assignment logic mutates `inst->core_id` during streaming without firmware notification and without holding `inst->lock`.
> - [Medium] Initial core assignment bypasses MBPS constraints.
> --

Vishnu, I'd expect at least some reaction to the reviews. It doesn't
matter if it was performed by the person or by the AI.

> 
> commit 2b81abf719d22ec30cd3764b2bba16be2af15168
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> media: iris: Add support to select core for dual core platforms
> 
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 

-- 
With best wishes
Dmitry
