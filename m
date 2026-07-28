Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147053E638E
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234033; cv=none; b=Kz9xkuGWqpT7F6M2tBFvwX7LHuPlMJnEI1Ov8IwHMdnxTSwtmwjeJ4c64QQMSED4RUqzxMn2n/+QucKmKQCpfDQjwWLOebW5iEZ9nfnRiK90Z0ErGNoI9hV5wlODjGmZkHi2QqhgGQuocZaSEDEzAGjIosAVAhf2VOffD8iALc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234033; c=relaxed/simple;
	bh=AWPu1QYh/YkbC4gLDMzFOq+HLdgSiX43SmK40xk8A6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz9ayFcJMAYpSa7+r3BZ25mOISnO3o5gAADh8/fM/Ois5wjn1sSC8hh0NpDIwLbz+9lYlj0vWCk3JLJshhGgKa3b8gB2XLWrdlSSe3FEQLjoJp+rZKCckFKXqYrNpuMm9fRCMeq84UddmgLTSYmKEWSalW/1WU1G+HDDysLO1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUG0hYoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2cM2ayk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUG0hYoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2cM2ayk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82HI72128861
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=; b=YUG0hYoc1LFSM5AZ
	L/UFDaMDb3Tq1qzfxpGmtKiLfKNPOiva0SmtzAyPkf9b87d7N6mUngzZ0DCJvj55
	G2DyoKfly36fRrjRCa92hE6Bx93F+z+8qEJBmbOujVtEYhHJf8LDp3O52s9S1F0+
	l/RGibWNeCTXv7EmeU+dVCVk/t7OWSJqBFtEK+ltYcQ1yxxxODAkmdkT83vZUE4G
	02Z98EVC8Ig8QILCzRKbZ3QmaDZO2Ukpipyk63A7JaDchkMi2SZh80A3SNMmQnJg
	p29rvQ3oEcxdfeb0XHHpteA/Io/t9Jm/7qfpSfil9hXvdWy3muAefv+dkqzNLEhO
	V0e+LQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bq31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:20:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so66994031cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234030; x=1785838830; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=;
        b=K2cM2ayknzdM3iKmBEKUynWUKZytEPs2uv/eCNnENQuURrS5FJQQELjBP5Xdc4VzHh
         Z3wscgWeIsNESvAmiHUSizabk3GdzdsALxBvrdAX0UkC2hGgnn3C+q6+ODVeFayVJdhE
         P0DRXAl9dFucsIqwbnUxoUnEykBg/rUwyvlULjkwDgFmOXLnPb0KZWFdhgF8tzXUn3YK
         EUM9KUUFlWnp4ALZ5lzqhNCka6E4mhvF0vu16fUK+xN/Z+qrCZzL1rU/kdOohptCUeYB
         MOj4fLl9alkm9OKNj3WecLcf13vMnlN6BAkB/WWgMHwd7nloXh6bm6MdCAVDZF8aWSm2
         ehYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234030; x=1785838830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KLZ5WSf9P35tXLsEc25HzV/wI2h837sZFl1AcAxf2gA=;
        b=YbD+kIjYgY6qZse5gt8tV1cEnvEycPfozAr1sKHoLQt8BPZt2GEV5MQEnYTIT7yV5C
         WBxCFW9za35at3yZCZJwBJeXmotepEpmm8Nd9dEWV0jot3mb6A0jKXiuJ96ShuvZqsRj
         aYSE7ReWxNNZyrex+WluiOy8yn9q6mShcwtdDqSh6oMevnJRK6xysLlGGUkSwZ5JAw2Q
         d2GQic36oCEFZB1ILImceBvuwMQirnP/rvLRFSLur4vdc8DFYdd0PMU8q2GeQERCM7fR
         JlCZ1L/Rg/rRPIsHSM+9Gy7duCZZ13NF2kn9j24AS64hlcjQq/x5adIKwKyMbFmITd+g
         /xSg==
X-Gm-Message-State: AOJu0Yz29c+gY6A8MYBBNu69FivJb2ZmuL2PXwTes+BN5VFc76pWwAGg
	ieSMOzjAzu555S9ORX6Os/t13JtL00Al+Wyk3w3Io+sKf/dlsb9Z9K0bV2zXq4GAPbDOxb6zugb
	XpeoorAChrc+I+4pSimmnh9cpFMw/YsKSSdH/HKJqiT/YLxrg0c5ALD9qhsR6bEqXUvRo4eE=
X-Gm-Gg: AR+sD115stjhT5lPu8daIliv8IPf1RWpvIbz2l9ur+B0uMr6WjvSumy095otIvXw2RQ
	58DfAT4kZoQGrrNKCUGL0lOjicm6liMWHnq8OiuGF4VMYGohuR1udRzLujFCkc+PrXVe3vKjGe4
	z6HATMPcwmdr/+YrBWGN7xafJtG0rUxMMWornSJv/iPmjnnVFVv1z2IfKfLpOkeNndc5ReknKlf
	L3aur76wb0X2VMppxQ1ArrszzVvR3VVP19lC0YRC9FR2eYoh9DL/9jU0VgFUyNKqT2abHiQMNrg
	Kv1Lazal8XXH8yXSkyhXKlYUzOyqrF9u40p9gYhkUDxStywfLt0JEbYOIMUlFc7LNTdI20wosSa
	NkQJ2QpzhFuAMR4mf9uNECY1Cm+gKxoSy70V9HjRFabPHupM5IyLaFIwGl6Y+U4Jvax4FI6zKLN
	kggTh54UU6I85tOA==
X-Received: by 2002:ac8:7d81:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-529d7260239mr12226621cf.79.1785234029793;
        Tue, 28 Jul 2026 03:20:29 -0700 (PDT)
X-Received: by 2002:ac8:7d81:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-529d7260239mr12216511cf.79.1785234005745;
        Tue, 28 Jul 2026 03:20:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0806d8sm1946188e87.22.2026.07.28.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:20:04 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:20:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Message-ID: <kp6eg7dierl5iqkr26e3uflyshjxes4kxrzgcw45etqfzop7d2@os3chspox42p>
References: <20260715015438.2770155-1-syyang@lontium.com>
 <20260715015438.2770155-3-syyang@lontium.com>
 <20260715020616.B73771F000E9@smtp.kernel.org>
 <CAFQXuNZdwNxbAsnK7P4zs0eZnm4pN+6kKkO-aP6Q_higPEW-yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZdwNxbAsnK7P4zs0eZnm4pN+6kKkO-aP6Q_higPEW-yg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MCBTYWx0ZWRfX4TBQkOUu76Xj
 KBEzFtV0AfO1NOMfB3sRts9ng6IjRFLxa195lDmX8ItaZ6QBZFr7xgE/xaYkbtZJdBFCsSOSdw6
 C0SE8x+NoD2p5RX9fahskT2OYxFrXmfCx2O3ju4rUZASO1orfeSGwWVlaV7L/Byz7d/8GMviEj9
 kmBxY6sOL+Uri38pYoxYbwni9vwoSBpCBcg7ZGrmPBy1tnd3FNWRzhN8cE49g18YiKiQMG8EJIQ
 puepsDlaAoCE3Fxpouwt+y+wUr0jk3a1wFBlieju8UlThqdipxjBNiSJs2UKkbmbsdJVa5vF22W
 kxfP6kvsuYG03GHKUGFHWIkesa/yxaCF01/BxNgi6p/FVo7VCSTh5zYEtkFBMEW7uHmcJopojRM
 ngxRFvSAIsAyymtn9m8HAKQTMibv8pMixVK+MAkjKycYCTT6WONvGBijucExLLs27GivFpf+O3b
 OUcCq4vhyEWBTRCMNrQ==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a68826e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=tlYR4POETLUKK-67TRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: B1LFBVXT3rsTa4d7bIIkve3WTIJ6n1av
X-Proofpoint-GUID: B1LFBVXT3rsTa4d7bIIkve3WTIJ6n1av
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MCBTYWx0ZWRfX3hu5dRNCHbBa
 2kdoiJqv3yRGs17bjmad1wjrbhcNWoOCDGZpEv5TtEYFcmiPm0Sg9ZU3AYLo2jKUn+UOmXPFBXU
 DAhNS9kkg0bBAvjuPpgCthBFTjm2TmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280090

On Wed, Jul 15, 2026 at 03:42:55PM +0800, Sunyun Yang wrote:
> <sashiko-bot@kernel.org> 于2026年7月15日周三 10:06写道：
> >
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> > - [High] Missing cleanup of `output_bridge` in `mipi_dsi_host_detach` prevents DSI device rebinds and causes use-after-free.
> 
> Intentional design, consistent with cdns-dsi-core.c cdns_dsi_detach()
> (lines 1082-1091) which does not clear output->dev. Clearing
> output_bridge would allow re-attach, causing devm_drm_of_get_bridge()
> to allocate new devres without freeing the previous one, resulting in
> a real memory leak. The DRM bridge framework does not support dynamic
> bridge chain reconfiguration. No use-after-free: the -EBUSY guard
> returns before dereferencing output_bridge, and bridge_attach is not
> called by the SoC encoder after drm_bridge_remove().

Luca is working on supporting (more) dynamic bridge chains. Don't make
his work harder. So far:


- Let the DSI sync be detached and then reattached. There might be
  reasons for that (e.g. big DSI panels which use two DSI hosts). Ignore
  devm_drm_of_get_bridge for now (though I thought Luca has provided a
  better API for that).

- Use next_bridge provided to you by the framework.

> 
> > - [High] Sysfs attribute `lt7911exc_firmware` is accessible before the driver has finished initialization in `probe`, leading to a kernel panic.
> 
> False positive. The driver core creates dev_groups sysfs attributes
> AFTER probe() returns successfully. In drivers/base/dd.c
> really_probe(), call_driver_probe() (line 706) executes before
> device_add_groups(dev, drv->dev_groups) (line 725). By the time the
> sysfs file is visible to userspace, all mutexes, workqueue, and regmap
> are fully initialized. There is no window where userspace can access
> the sysfs attribute before initialization completes.
> 
> > - [High] Asynchronous firmware upgrade worker accesses `bridge.dev` without holding a reference, causing a Use-After-Free if the DRM display controller unbinds.
> 
> This is a known DRM bridge framework limitation, not specific to this
> driver. drm_bridge_remove() does not clear bridge.dev, so all bridge
> drivers calling drm_kms_helper_hotplug_event() share this risk. A
> proper fix requires framework-level bridge-to-drm_device lifetime
> tracking. Triggering requires root sysfs access to start firmware
> upgrade while simultaneously unbinding the DRM master driver — an
> administrator operation outside normal usage.

I'd say, I don't have strong opinion here.

> 
> > - [Medium] Driver illegitimately mutates the state of a downstream bridge object by explicitly modifying `pre_enable_prev_first`.
> 
> Hardware constraint. The DSI output stream (register 0xe0b0) must be
> enabled after the panel is powered on. The override is safe because
> transfer() is a stub — panel DCS commands are silently discarded and
> panel initialization is handled entirely by the chip's internal
> firmware. The panel driver's prepare_prev_first preference is
> therefore irrelevant for this chip. The comment above the assignment
> documents this rationale.

Commented in the driver review.

> 
> > - [Low] The `lt7911exc->removed` flag is read without a lock or memory barrier in the firmware upgrade work, leading to a data race.
> 
> Valid.

Should be fixed.


-- 
With best wishes
Dmitry
