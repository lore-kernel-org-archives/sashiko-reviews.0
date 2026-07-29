Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A994ADD8A
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333922; cv=none; b=DJiUiDKmT9IQXtlNt5H26NR+DDSHxf69HJkiuNYNxt9rIjR+mAOlM7QKUriUUUeciWJT4PZteqbCScQioYBuzpc9Nvoo6FQG2+++44I6MXnI9waItJQyez+Gn6mgVA9Zc6kubjIqaBmaG2jjAeDiIxtWLwz8MLcB521cetwOlvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333922; c=relaxed/simple;
	bh=kedJqclyCyRJp/6i6+30OOv6NmXTkEEPXp9aMCp9oEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxdpTtdCgvsZj6yFGeZS9uRLz+u94CO1J2kHkpgQXOnTySvNa+KEV03+zjnvh783b3UZ+HCdM7+4h7xLCkIuVCPq0+OD+P1w/j/tTACSHEiND7TBQraCjPXmbjd6c790zOQJo7uGyEVMFSRPqGSg5jOXkt6yG87Ba263z1FpScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjYJjsfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qy0YcQHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjYJjsfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qy0YcQHD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD86PD1800887
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtdy+XMyJko6rbke1I+HYXXk
	E83TfRSaA1yEDFKgiGU=; b=YjYJjsfhT6NJP/PNCN02QupJhX46Ya30fQF/PoUj
	LET0fwlDTdhAuPeStwMMBKIOcrrQa1oaNjAH5b11a8Y4nFDbAzgroyHRoN1Lx54y
	mM/giatmvOdw9N1ByIGEICPlKL/Pn8he0P2ObHEIkXsfLRoAK6QBLTRBSXPVCNkJ
	K42Q1DcxRKwJUnLdYKOAJAgapp4tdtepZ+Ra3Yfn0Zt9D9/gmeuZlrFWpsUXglVs
	+mMc/kMTfE12Sf00VYi/oX3EVf8L8LWUl7tHHq8vtQYM93URIpUudMxvndo+t42i
	qymuK29z+D0q7/QjyATpuJWuEWhYAWPtJxo5icNlQXEZLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhgy8dyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:05:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c113ce8f7dso1071688e0c.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785333919; x=1785938719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtdy+XMyJko6rbke1I+HYXXkE83TfRSaA1yEDFKgiGU=;
        b=Qy0YcQHDocm3PtcueWPeqJwt6uh8Ggz7KtmReYuIfg068iofmsZa/xBEOuKARQLxTU
         FLhPKnYRfQQYK9Wfnl0Q2Sm2/9+lhFWlwTYk4VI56YKsHxRI2Lw7ewJMCedi8O+E+4xo
         hgDSrjHqbU7p7mOREoAdCW4A+VAmLYIjZ0qxHB3+ZmlyihMPY+koeT22h2KEGEbUgDia
         aVvd1kh1y+93vaINJoG8G8lmVQ0GDZvGQWzZ59zNf/SPzENF0PQM/Nq/zgCbRhoH6eSS
         P5ropalIEYrGElTuScZuLwX9Sbvgj5TXgdF8Jvkz3d3ntW+YkHYGo8bQK856GlngvgDc
         e4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333919; x=1785938719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtdy+XMyJko6rbke1I+HYXXkE83TfRSaA1yEDFKgiGU=;
        b=oUm3+/6+TBBXMYcK1tFuWY15B938xUvXhQ2uMOiUS2tMqc6sfAqBvnlJmquJJrQuio
         dtYSMLUCalfkpH3CyR6zXpHzhqTIpAaXauGUlndSwTm5qkGqi2SupmqovaFu7SA3+r0l
         7G5DndysG2mPdQVqBogbGw/hnz848kCBvFqGylzjSPvYhUYafwz/syGB3wCHmMSBYm/F
         YgB8xmvlhdnUaTj0MMF4S7NFMK0+KnX207rl7/AQxVszM6nbLq/PinrFrThjlk3EfqE8
         FxaOL4a2l2OGsBJVXXPPBLsRx0I+NWYshNhb3Ez+0i/Ss8aVjIARITs85HfNE5PpGf2R
         XkCA==
X-Gm-Message-State: AOJu0YwI7Ku9+4o+l24a6txO3FYo6rfR8E4SQnV0KiMlgWpuPTxwFXZ2
	R31xIeTRENY36J2LvlrQ6RszKuJI8X2gzcfSi+TW+k2FYvC4RKT5V9iA3wTNqCZt78ALwJWFLZp
	uPriNuqUHPqtGIlq1MIqhtfiety0pLHxYCI/Zi9v3J5NEZZxuRqoP2EqkqK+vmKZe9Foq9O9zx9
	zCBIwbrBt1
X-Gm-Gg: AR+sD13aaSv5VEC7lt52ZyoSoDuEy/33WqH6HjW1iBQST4ig7n3nOBzXouencDCE5bm
	LAID6AG/dypKzIxrAoGNCJkoJNzxmF0iGG0h0SPrronk8svkzWOXh+deIYaF/utz3CKJCwO2EXz
	HW0Hz2RPUSkGNxXd0VQu1d+NDriMFsvSFWxP6dGsUFJV6uStL17VIRcsivsR1qbHMaWeEVaBLnc
	pb0yazQhTdenFxYXklr/bDAZ22UX2vNxA4cfWqv2CkkOb9/ADQSHO2/bFudkW3DpYAOSdtRtahh
	lxiKUJv+BfjVGrORYyQ4wmq2U+Jf75Islu36FC0AnbI/T3Lnhb1s+9fGBA5Rr6O0FqVTtejnx7J
	z+MSgTYzJM1BlcsWCuBDtj7eHC11PxeDYW7+P5wJBK97r/6MXH19n3wpCrV9H8vcIUTzsTcdWAE
	OU5yixL0UbJBrB7g==
X-Received: by 2002:a05:6122:168b:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c33f94e88cmr3208365e0c.4.1785333918998;
        Wed, 29 Jul 2026 07:05:18 -0700 (PDT)
X-Received: by 2002:a05:6122:168b:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c33f94e88cmr3208312e0c.4.1785333918363;
        Wed, 29 Jul 2026 07:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f5d68b24fsm4265361fa.22.2026.07.29.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:05:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: mohit.dsor@oss.qualcomm.com, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v8 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <5xpvwwovgwuxltjqjnlchamwcvppdc4376fcujeqovm7fr3uhw@6r55ztlq47ob>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-2-bda216bfaf37@oss.qualcomm.com>
 <20260728112614.BF6721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728112614.BF6721F000E9@smtp.kernel.org>
X-Proofpoint-GUID: SYVqY2Y6skZBG2q1hU4x4vkm2cfbJOca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX5ESDScaMZny9
 6AWKPJi/xL690O7sjoFW5nFkTHxr3ALy3Ft7cPAk0fZ8QAoave4UHrcZ90JjDA3+xflaLh4o/S2
 quMm8HvpIPlPvhYzSYJgDAMoSb0PLjLHPP/GzdVjRZl5am2WvGP0h7tRdNaak0SsGTyY6rJdRI+
 KxtxteUr59dUrQzAd3KbDBmUrpzwqqMr1BeK1c7q2PJ7O5S4BWlgFNRYkmkILKm2SQFDOln5Fko
 Z7O+bogshWs854NWI5vRbMSBRYhoSrURr/rUJ2F04mp/9RD1F1DUiEAwZNQtzhmhj3p0H7M1cyu
 bt3tHbm0zt/C8gfZ5Ti4Dfs3MpzP5HB2nHndDlJSjMdwfn0qEfuAKXvhyYArHx1oJd6eGXDGq+1
 rcgoNFqn13nJyksWdt/rAUy54xKf/SaWBTgtPmeQISJnD84AttJv16492VkUyaCDg3I5WdZ6oDJ
 P15IGKdImc1WUdZsyuA==
X-Proofpoint-ORIG-GUID: SYVqY2Y6skZBG2q1hU4x4vkm2cfbJOca
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX7w6UGwBj5MeO
 CQXMwoNOZIPEk9VKyWgEvC4xYqhJ7yblmF62hZNY9Faym3Nrgf8IixAO1enAb4LjE/uHTG8SbmL
 Ncp0L/909UqikEEZZt1vix3s1oMTu7U=
X-Authority-Analysis: v=2.4 cv=VZHH+lp9 c=1 sm=1 tr=0 ts=6a6a089f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=CTjjQwyGzVbXpAY5hREA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290115

On Tue, Jul 28, 2026 at 11:26:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> - [Critical] Recursive locking deadlock in `lt9611c_hdmi_audio_prepare`.
> - [High] The IRQ is enabled before the hardware reset is completed during resume.
> - [High] Premature manual teardown in remove() conflicts with devm_* APIs, leading to UAF and timeouts.
> - [High] The IRQ handler incorrectly clears unhandled interrupts by writing an inverted bitmask.
> - [High] Early registration of the DRM bridge exposes it before resource initialization is complete, risking use-after-free on probe failure.
> - [Medium] The return value of devm_drm_bridge_add() is ignored.
> - [Medium] Selecting REGMAP_I2C without a dependency on I2C causes a Kconfig warning and build failure.
> - [Medium] request_firmware() is called while holding the ocm_lock mutex.
> - [Medium] Missing `regmap_read()` error handling causes uninitialized memory usage and broken firmware upgrade logic.
> - [Medium] Incomplete error recovery in suspend callback leaves the device in a permanently broken state.
> - [Medium] Synchronous firmware request during probe may permanently fail if the root filesystem is not yet mounted.
> - [Low] Firmware version is not updated in the driver state after a successful sysfs upgrade.
> --

Please respond to Sashiko findings.


-- 
With best wishes
Dmitry
