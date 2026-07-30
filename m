Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F04746CC
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454637; cv=none; b=hOMbSnsRCw1LpznU9otb+pd8b9V+363qRnWwg5cmTKivqxYhS4QvlIxybhrI3iGTvtScGCngrfHBRgLy2WH9cvPsav9a2E2Kei5sHako96Pv2BwpZ+lj40kL+84J0zE8mUJyz3YZ0yeXtH/4c+2btIrJYIZWhhwVjKvpxBOj6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454637; c=relaxed/simple;
	bh=4lRX+v5ofI8pAEpVAItAgS5X5NxnSEovANu9RD25YUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NptNZgmgbI67avBUb2VRXK4c/6CSaABSJisMoiNOn5c0VBpXD4FZdrXHYyGG36EhyxiZxbat+QaxdscHKBIe6TFQVDN3zOdwXHfWwmi+/G2vfR26TFpCyVjNMnLhr97TzedwJlhBRdJRitgjqHCGVJOLBI+e1YZBjkT2GLLe/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DONNrXbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acPLNEA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DONNrXbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acPLNEA4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrbPU2206446
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QElqoxWPFZqN4pslZeJRYhEi
	+Ncp5rGlPM3D+WWt1NI=; b=DONNrXbzfhC/VkbFKsEz0WBFLnu/fE87Opq8jpKD
	gm0Y72aQmv0YjOKCrEOOU2JMrRKUkskh1yNrM4Rf7PyG8rhnrGwWAn4lNhYneJIW
	ICGTq+MU1ougpzZZ9/ibVPPfhnkhSIudlyMoHjzJvOqEkkFlE22uJbWHJSd3fzQb
	80RQBQl7BX23SUc6F15USrlUJE+D+8uDW+kDcuCfBkWf4qMrQmonPOukIDZAqNtK
	NL1HJRnhCOt7hTUECctb5OK4QAv+27F+wVNvo9yz6SK2FeAGR8zBLRkq9tVFk8eN
	3sDc9wO7Erx7idWamCH3rMkksWAZKJrgFJglzelqo2xsXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfrfr3v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:37:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e8004d60eso91017585a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785454634; x=1786059434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QElqoxWPFZqN4pslZeJRYhEi+Ncp5rGlPM3D+WWt1NI=;
        b=acPLNEA4cdu+mzaXOM38IcYqLrnYeW2lFXN0gqNgb9vjbHyV/xqemoXNlsbdyt4lKF
         BpzeJQ7xTpjyuoIo1pXP7P83QQv4uLO/eFF1YGSL4wFOAg1/OBcJUQiyAwfKCozEAZnz
         TibE3Mty55CBOJP5LImhjc3MiyoM7Gr0umgNQ4Ij2uIXN7qhg6WPNao8yJQlirOtpGgs
         dWl11w+Q4c+wpO4u3qzsCSJGr/DNiOEv1+hnM+6IyX9oaH8iNdJFl4Zp4cqNqdWJgSkm
         F83u+SEiyd5NW45BkAhXJuCXK8gHX4B3j6FW5u2IUehEjH5IOOF1LizjyJzYMx+sgJSD
         ys2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454634; x=1786059434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QElqoxWPFZqN4pslZeJRYhEi+Ncp5rGlPM3D+WWt1NI=;
        b=K0FbSw/VqG09bOaUR8n7B0MjimVZrYzK5apOgi3rAPG6iy6BwIHLRmuYBPe2xxWeLE
         UtTTeraCavu+Trokn6ayVKkxaWExq6CN3dBbvEjqWChMDv/8lWPop8kFfbu502QVYzlW
         /i6pu5Oy7kgb0aTHx8/61js37b+AeAdkX6autLmbMdl8+QzYuk3B31MgRx1ZwO5a57x8
         4umAbPeZwuUmeuIdyOIuPFBXEL8GQTdjv8gaJSuASBk/td1EO4PHe7NeGl8KZa1dFLQf
         4L6aa5wJv2XnuqCRCN5lzl49jEE6uSve5gUCdQShd1EpVZo6pMCMsUwbM7kmydsFN2Ib
         VDuw==
X-Gm-Message-State: AOJu0Ywip+13eVAEXQhhwJYWn64DhCnecrKazbq91kOuY8+lzyDx41mW
	oSiTV+XPC8n+gy1F4MDJ/yYu1zdI0hIJXqUFvbekVMIkscXAZyLyVYvyuBbSjAxOoIxTavHhyRw
	JdnGMosGW9Z6QczeO/YkG5Fe3o58rTJ1Wxs2cHoE+Me5k5jOqPjlKXT7fg7cHyFAf5Sy4fQcP5g
	Sgayg=
X-Gm-Gg: AR+sD10GZm0esnSDHJEGtPgFs47RLK2jbg6+w5TYZ5Vr0jP678el7cDFWp1l2CCY/zI
	nJimV9d0rtV0HJf/j3h67NNUujIOOZ0kgrIHWdWtUlXC+MnBUmLonIRmgiOYzVszbeHvcgyfpNo
	dmLXZHvEm28lguRmvAC+pWqnpJ6spOEF4DzpPpKRtjEQf+f4T4ZAa4f/ehhz+hyhAYsrM92/RAx
	iYLlNyJllegXm98xKC80XPcUi3Eftn9DE2evj7Fbj15zUQ0+nDLDFezZXaQRuclMpRoHo5JloqS
	koEqRF18XaRyMh9JJ+rpC1MuMS517dJNe37R9hnHhHa/OLFqEEdWx4tUqNEs/VoPprYHXgBQxDf
	Nfww0uZNVXGjU2LLiosnu+34KJecrwrKb5oqsr+IU2nKDRXsGL1Xm6Ery066sc5B1gqoMTTuCBZ
	1V4e6oFcVYSHk6LQ==
X-Received: by 2002:a05:622a:510:b0:51c:147d:9bec with SMTP id d75a77b69052e-52b38378b62mr50900521cf.6.1785454634435;
        Thu, 30 Jul 2026 16:37:14 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:51c:147d:9bec with SMTP id d75a77b69052e-52b38378b62mr50900231cf.6.1785454634026;
        Thu, 30 Jul 2026 16:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9baa0dsm640324e87.54.2026.07.30.16.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:37:12 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:37:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v8 14/18] media: iris: implement support for the Agatti
 platform
Message-ID: <tokophmqfjim6f4wrpwletnpojcasnn47prkww3k4nuz6byqwq@buuvvn7ls6j7>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-14-6597c08cea6f@oss.qualcomm.com>
 <20260730155444.C30F01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730155444.C30F01F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX/NHIU08AobIl
 EyhCsklAHsWKXUQk0TLbK3WcMyFlyF6uqAEgM3BHflahcKGKwDlBoWtKizF5YhmkZXB5TVGeBT0
 uSizh3nxSwSuoDo4l02DXAS2PznWvHQ=
X-Proofpoint-GUID: ycUXVduyctyPb_At-P1jCu6Sl1rL6h3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX+OFFuOEZfnq5
 vGJaDSoxQhgUBkhFGLi98CJW18W/4j1rIfULr+ZvnHlpZeqMxOsyBxPzeBYoARI/qQnjj6K1uPS
 dBZevGWZNS79VhRODBK7qp0w97Iv1tw+9e6mI4G9fdaz/p+kMY4byOaOzgmbkIwnLc7QOVQGxdU
 tQOnNFef8oguCChwvET9PLJGirE5WPlQLsE4jUNpoSvlCPX7xr5S7Z5AyLVJAa9IM6GZRsUWbhs
 CqAsUP8GqWO57iaWCVzODYBYggZJE2irtHkaf7zxw7cuHSRmSMa43ku52d5+gC8JhiN4eixxpXJ
 RrVLoiiANgSMrUyQhicqII4C8H56ZLRqvHMGybzvKs2zXUBTWaq5Oc2zRfvOBTh05hYX48KOWQb
 iXTfonjjKzTkAFzXB3q1rPR+P+ExQ2YxM93S9wFP8IvCUfvIo7mj/cy9ssUPER2JxacSYwzQO0C
 mU78diEDkwsvla4v4Zw==
X-Authority-Analysis: v=2.4 cv=N+kZ0W9B c=1 sm=1 tr=0 ts=6a6be02b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=LqHTJALFuVLZQZMk1bwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ycUXVduyctyPb_At-P1jCu6Sl1rL6h3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300167

On Thu, Jul 30, 2026 at 03:54:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Mismatch between statically calculated vb2 buffer size and the firmware's requested buffer size causes a potential buffer overflow when the firmware writes to external buffers.

I think the implementation is correct

> - [High] Querying buffer requirements for AR50Lt overwrites the DPB buffer count (fw_min_count) with the display output buffer count.

This is expected

> - [High] The AR50LT platform uses `iris_vpu2_calculate_frequency` but provides capability fields intended for `iris_vpu3x_vpu4x_calculate_frequency`, resulting in severely under-calculated clock scaling.

No, See codec_freq_data_lite, it also uses 0 for vsp

> - [Medium] The hierarchical layer bitrates (LAYER0_BITRATE_H264 to LAYER5_BITRATE_H264) in `inst_fw_cap_gen1_ar50lt_enc` use the global `BITRATE_MAX` (160Mbps) instead of the AR50LT-specific limit.

Corrected this one

> --
> 

-- 
With best wishes
Dmitry
