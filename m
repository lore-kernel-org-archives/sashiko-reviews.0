Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94743437476
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784681; cv=none; b=Bjmawi4AP3lxdFvI34H3WUKbroDl0GSJ7fPjBsO4OlRKi5TCVU9mqr4oPezH70fTtxIZ9tNBd8H5dZy/yG1qMES6jUYx3lZJSWmmbddtSP8qUU49aLbNw6Fe9ozFl1tKArOyUfNmXLsK7aRw9rctnOPui5HWJ+xCpmt+DyPIIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784681; c=relaxed/simple;
	bh=GyqRxIWFe2NtZzbEBfI/BcT4uX66KMapq3ElB/uV/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+hmyO9ukci6fBAC/meEI/sVfQs94ZmYez9P0EGD+DgFc2PjyXvpgYBK4kQ3q0auXPaorMLtSN31/ad+G4h+7736/7spWFOWH39F3F72TPoiDk7gmY27Mn/kjgUQXtLhRXwk7yWwcf5FFcZLgVKGW1+AmOJgieWCEq9o5rdt3Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZi6COh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjxiGBmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZi6COh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjxiGBmG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H7Hpj1535996
	for <sashiko-reviews@lists.linux.dev>; Mon, 3 Aug 2026 19:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KRPjAdCw6C93bb715vQS7riK
	2PYzmQqIqKXKyNnULY0=; b=CZi6COh9Eq4EzDR3dgJRaTINRnCMPhwhIdBt5ktI
	NWZnSTIP/HWUjN7T51i0xFz1eoQHm2jb+S7txkXswKD5RugG6csF1nRW/joRV28p
	1sq3A3Ds8rY/Z43cx3FcZNWorSTDtUB/YNsIjgnk16seMWqngHpAhCAIwDcSW0FZ
	/saV6RN7hVxu4/LjBZSEo4uoiKQr/7+1LpG+5keWHyb4HZzxQUKtYpD+URSHfo49
	l2inNXVAIi4Mgi6VEM/VMfrb535IACV1Lze9eabbYpbtHnPHbuzAKpET99zoNKZM
	LbF9QkbZgQWoay+AOPon9qNNqNWc70oyw3K73c8i/CfSkg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sgjpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 19:17:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so200963a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784677; x=1786389477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRPjAdCw6C93bb715vQS7riK2PYzmQqIqKXKyNnULY0=;
        b=WjxiGBmG4O4mqIPbFJ4nS/dkS6smvE8T+KBnadhYlPTOCyiBa+yV062Yxr3LBXzY4m
         D50v7Yn2bis9tZl34+GDQ0EMH6vxXYyC+IQe5uq3k8hsnpW/9JOpVl2fEYb66DF/IEQJ
         B5Jm/lqP6t91FAkHwTqMf3a3K9SOLFginwPWHBZ0cC8oCxLE3GAcyOTsrjPX2lD2ycKN
         G+fNd0ka9LkbWQ42EYF1pauY533NY5xu6JBtD9EPJ1DLO0ZhtHzPt5m8wyTXmL8uParz
         XMDt0LSJQzAHiSRWLJ6q2ISyDUwsZXfY6qyzkQEG8eTUPa2SeU82fE1pziwgPDNepLfo
         AWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784677; x=1786389477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRPjAdCw6C93bb715vQS7riK2PYzmQqIqKXKyNnULY0=;
        b=NnkicjUxqfCTakLYORBB7zYiBLoN4lvZs2nhaLQZB5JCWrNlDS/xNPBHi+GgVZLiQ7
         Nt4oxtSh5Qd2TGrUBMFv2pe2gbXXMM7wUbbBp0pq+Ai8HbeXquTLwyW0GwSt8Net9+zd
         K7WcXR9Jmi1qkqH4/Du+B86auaJdklK5ToVUEgToNo/IzmSVKs2dFUDTewBJ9TAH8K0n
         ITglRpP0OCe8oe20yBKm3oZTQODwtOGSSi3En/B3o1UBxin5aPqbRI8hEB4Q+2+d75vZ
         W69K1KcZcg8Xtspc6YIjrJk2x9v1PBn8/lrwNtzdY3y7MTl14AsqZby5EN2Ti2cEHMVc
         Cr3w==
X-Gm-Message-State: AOJu0Yw1qm0358XtOWNbdSDu9/hH0Js3HEyblplKYhpmSNC98o96V3Aj
	/DLfgnbp4Gware56lsT7m8g9xsgR5/x7l+OBcNiMv03JooyzVe1tyyx3YcS0BSCDafL9FVReDI5
	uh/5YGFzJomciYeCdBmtV4JQDF4F4zz59UdaQrlbp0QkIbi6pWZrAuvlgsaixplSBcg/oFkU=
X-Gm-Gg: AR+sD10hdiC0bqMp89pbf8sq7jswAKW2aR8gD4nEd/etrHqan6twkLafeabY7dOOUuE
	HNVEbXaHas/rUIfx6oX8XFR4Ivkz/VCEaoZ3SYka3ulKSq6uEJu9a/+zw37qo35bjzyQXAkCOog
	GCFW0cgpN27CSu+mbH356yVeK02eDNfBT0zHfgv7cpGYwShUDELSdlAjzuZOHmrZ8QpAjVGkW9z
	cw93YSfnbQHNCttHhJRf0zl7Y62Jir3DycDQ/OA/9/CzKGSsrc34K/+ts9DNAMoo379nNbT2SRU
	yFOxzsu5DYOaPZFeQ9KKz0PED1vkjPHhFMh3PkPtc8Ld9n4XkWjf+U4Pg8fqkcLNou8hCMjt3LS
	G2fs0Pc9DYCkvcAy/b9g24Y9hag==
X-Received: by 2002:a05:6a21:a517:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3cb6ca94992mr635522637.34.1785784676978;
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3cb6ca94992mr635493637.34.1785784676491;
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab25227bsm33419253c88.7.2026.08.03.12.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:17:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 00:47:50 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <anDpXv7HXgHPI5Gh@hu-mdsor-hyd.qualcomm.com>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-2-bda216bfaf37@oss.qualcomm.com>
 <20260728112614.BF6721F000E9@smtp.kernel.org>
 <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MCBTYWx0ZWRfX8aHhYQRlvsSx
 knNMBFabFZDekQ5EE83xdwZxlnkA3AidvxKHTXVocZYGFOx5cqHZSPHCWhOUaxRU7y9kMrFSGPF
 i/06bFGXhwu/8W84iw40CQJMT10bZcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MCBTYWx0ZWRfX4TCi9ocCYueW
 EAaCU5zrAy+tndXNp31ARiv5oNvm+EwAS8W7WKi14vmBjoXCEuV1A8i++HqEGeePJARAldPbXVt
 DgrtLrl2zInMc4/v1VnDTXbY+DeE/gbXBMnuhP+WuLi8O/neginlS2qfx+v9SkeOlHLcoPm5DJs
 ahQIkQUnT4oh9hXGxSd3PHqQv/3VjlPhGPgfbCwFHk9OCZPwBjOJAdly1kCNZW4dCDe3BCtuexz
 oKO+4Rfov3h7fNhREjqwaNy7ZdnWxAtdI3UFFX48nLeCu4HJNlaXAWL7bhqgdtX01WaVQ5t2ABV
 Bi1Us2od+cvMEqLEGrzoKYJRdo1HVTk05KVb692K2/euVIHldseryk6UzPKrf9PfwOclDqt+3WF
 iuaFxHUH0euTDn/lHO/bO2NLETVA8TFZmYsk8bgP0EnzImKNPvpUY+bG+bFUnMtiTPV4yZZpXv3
 44L7kwg/SPdc932KcNw==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70e966 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=CNQlw8xw5aM3HEDaa78A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 1-EHT9NZwLK7RDNbPobwdacOY8FChK37
X-Proofpoint-GUID: 1-EHT9NZwLK7RDNbPobwdacOY8FChK37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030170

On Wed, Jul 29, 2026 at 05:05:15PM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 28, 2026 at 11:26:14AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> > - [Critical] Recursive locking deadlock in `lt9611c_hdmi_audio_prepare`.
Will fix it in v9
> > - [High] The IRQ is enabled before the hardware reset is completed during resume.
Will fix it in v9 by changing the order.
> > - [High] Premature manual teardown in remove() conflicts with devm_* APIs, leading to UAF and timeouts.
Will fix it in v9.
> > - [High] The IRQ handler incorrectly clears unhandled interrupts by writing an inverted bitmask.
This is ok, as right now only hpd interrupt is there in firmware.
> > - [High] Early registration of the DRM bridge exposes it before resource initialization is complete, risking use-after-free on probe failure.
Will fix it in v9.
> > - [Medium] The return value of devm_drm_bridge_add() is ignored.
Will fix it in v9.
> > - [Medium] Selecting REGMAP_I2C without a dependency on I2C causes a Kconfig warning and build failure.
Will fix it in v9.
> > - [Medium] request_firmware() is called while holding the ocm_lock mutex.
Will fix it in v9.
> > - [Medium] Missing `regmap_read()` error handling causes uninitialized memory usage and broken firmware upgrade logic.
Will fix it in v9.
> > - [Medium] Incomplete error recovery in suspend callback leaves the device in a permanently broken state.
Will fix it in v9.
> > - [Medium] Synchronous firmware request during probe may permanently fail if the root filesystem is not yet mounted.
This is ok as fw_version == 0 only occurs on factory-blank chips and
synchronous firmware is better.
> > - [Low] Firmware version is not updated in the driver state after a successful sysfs upgrade.
Will fix it in v9.
> > --
> 
> Please respond to Sashiko findings.
> 
> 
> -- 
> With best wishes
> Dmitry
