Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DE52C11CF
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733740; cv=none; b=RAN544y8na6WJpwD29qqg2yB4QWugNJsoz+ky80X7XBuwRadZGUbq1PrBAlRDOpjitBB4NiIxW/vAxRAul2rc6n1vJAKJVenaRau+ExhcAKQvUb7QM1WnXUQ38tzFMEjY3ekrDUVAZfWLRiMuranCuglUs2FCRMTp5zF4gY9yrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733740; c=relaxed/simple;
	bh=tUGgw12GXUTNfxwG+MV+4xDKkocFA1wjnlghMhFlDoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWcKB5I7ZcWQJYDeQReHlrlxZDMLP1szw9zxi8nVjow8aJj5BtWAoSP26To/GVDdmqweQPaCTpxuiZ4omDRZNB5j41doqVUJkXxfabVdrJ6PH/eqNWFUm/Ql0yKXaSuB1u1S/rzURJVIfSmluQGxJZuV9zp5KHurTm+OBl75QJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KljXYDSE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9t7BDIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KljXYDSE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9t7BDIh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7UKJE3272892
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=STSvqtYC3jQxrnHRxquHS2J0
	Fwws+dd4nvdb7Vv4YSs=; b=KljXYDSEh6Op3gBy3d+v7jPnZEmpC/XWH+UalwJw
	VevhhJO8afqx08skrk845f5PH0MYRn1sImnT/Uns+sPVVwst0brGmNWWB0/GKKaU
	iVOdckL256TpeHFv4NrSy819idOEzkOLSyipWDmprgKCsXBLb6JP4/g2LcrgsMqx
	JGmXagwrqkl+op8L2RwA7U4RZIZPn1y6/Ay1MP1K3CbWVTiDMvovMTGQPcVXzwC/
	UXfmrlZDIffK+OCX4zYZfEU/2qAllU7QakXf6ccOezG0nnWN9LzWMTGuRJGhQndP
	KBrxt3e/VGTbUXNKETi5bha8/q1cymCnczYNbSvgyXGLMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthr9cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:42:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dd69b00cfso8001721cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733737; x=1788338537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STSvqtYC3jQxrnHRxquHS2J0Fwws+dd4nvdb7Vv4YSs=;
        b=W9t7BDIhk4BP5E6UwLkrkk20Dda2j4KYEFE2/WGt/krmylnnOLdtCmQilT4L4jKBIc
         4okfzd3Pp31D9lGAZFuD03iQHZQJ+82xSmHXJKAtb1Yqj68o4hVZ0Cp4lSHS28JZH6G1
         43TJBGYMfOEF4MjDVL1YLLWVsTqfjdg6jx2sCDLM/Xzd1mrVFdGOWjMR7BUO4kXintvU
         sytcWKdlg1m2T6nKOymnb9td2r+FPQpGgZuGtY5g8j7WziFfsJ58ACGtP3a3dSn5dfvt
         +JPC1/Oe4HaGRWNgtB98t1uQ7+fPt8hVy1Mbn6s7AjXDR1Znj2UniDh5LgbzBtaJCqFd
         IvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733737; x=1788338537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STSvqtYC3jQxrnHRxquHS2J0Fwws+dd4nvdb7Vv4YSs=;
        b=BDywnIEf96gQmxI/t6yq9nehtf4c7t0OHQ01BoBGF/hPJ1ditiNMWFICA7DXEPVUEQ
         5/pvge0+b2/hrJLhDmC+w25FfGg2X8CGxfOSLwg5neiAqYWyfOaSXR4h2vYEJMvm9eM6
         L2iyDseT6tg0JsVzgD4gNcTn8duMJyJnzKivUZ9DVnAO3Sdb1o/DFvIej3jMvju+4Kyb
         MAiU4Jek/jb1Fpob73sycQsxm4TeOjc6NFBCpB+IAxg2DtkzDkgp9/+u8u2QXpXKnHGd
         NzgCdmOuJW1j4SkFxlnsVmOg4tL6S8qoSTvGX88YXet+5jOMPxMwEQNj6zby7Y3qZWER
         flqA==
X-Gm-Message-State: AFuF++njQrRnFTJgzS15psi3uUOKii+b6Sr2Y1+/jo3vW0wwyBxLPkcE
	fqG9O373SvSFEfeAeqyditVaEiZyQk0kC15EYAHJbjnh45hSMxSxv1hYkfHfKUN7w93f/tuaTJC
	D5nMYLyNhhEUFO3gmI9HRaQu9oHScsvC7HvFjWG4hay/bK9F7zz0x27YE4qPUa+EmrJzmBD6DXh
	FCBPs=
X-Gm-Gg: AR+sD11OYo3Y9b/8KkfRCU0MFDMHEZJ1ed70f1N7PaSaLFgwBeOQ56NtxPla/IMmykx
	kjZuK3XB9fp31sHWf4LoCg+QO2p1YcolTwPDC8DlPN3CZS/42rqz2ERVVPVmr2k8zmkkNEgcZa0
	FJjxWpZgPvTpUlWRb926rdIrOIWr+RhtLvps4p5tH5uIiRqSKt4FuL1VCviXtC+4KZqD07khPt/
	KS5gB1YHHq7mULdEAfpSNCiY7HUAq97fQnPlE2Rdjv/o9IIezRHxn4x9fBa8pqT9ECTn7sQ5sfh
	1G/x5sCT7stKaAbNp1qIst//Z5IGAwR7kVWibUSRrD/VRANj3YRJ7VWhHN9ZY2z6GZ/g8M6zPJs
	WJLotmt75h4l5rQ==
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr50824221cf.13.1787733736665;
        Wed, 26 Aug 2026 01:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:52e:119c:e82b with SMTP id d75a77b69052e-52e4228d40bmr50823741cf.13.1787733735949;
        Wed, 26 Aug 2026 01:42:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25271e4cbcsm159514166b.18.2026.08.26.01.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:42:14 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:42:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI/pwrctrl: tc9563: Use gpiod_set_value_cansleep() for
 RESX
Message-ID: <5ypfciwn2wavbfewlludahxsrhil563h2pspw33fvm53nxv5rx@6l6b3npaezkh>
References: <20260825-pci-pwrctl-tc9563-use-cansleep-for-resx-v1-1-0dbe7cfd8200@oss.qualcomm.com>
 <20260825115246.8C8691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825115246.8C8691F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ea6e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=evFOPUGr5BWtyBnKTxUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: F6Kvr_O_RZ5Iq3h3XaTX9h8yIk2PB7W0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfXwC+yL/6C/wTz
 vAhUnfj2VM+2LLfmC1CeuaoFNByhvvHFpFp62jMfNU3NnYTKdHh6WkBqmORzNKcEYrr6vj2+FLO
 K81GH2EE3xMaNlsHgrguzq7Lin+pXcCLIeUViU65vtI6HCt1c9KSJpKySwhpx76KRBD02KAfr/L
 ydZ/TA9Qpf4zfv1pxsnwF36vZia8yaONqVLYh+J6+qio8XT4pci4TZvb/lsEShsjpcKAkBWANh4
 g9BVbHB90GvfLJVz9eggsB8u5DYn7T2jlDRLT6gaaFEGHeBE97suMRd4iV2R0gs5WE0wpG6Kx0y
 orfi5LSgNByK9x3bHNBCT1El6gz9voBiwh93dLB7UAUmawGOoNF2wzSs/cUA5m0F8n4rKeb8DRQ
 VwMCG1txp+jOwi6kf1Bq7UwAPw8tNTabP2A7A6Dw7M18pD9qucqMpvS4ElKjHl7UpWzUHM3vbWF
 Z7PMOugOWlMCTf5RtpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfX/lKzCwLBnFKW
 5uWhQev8Yo0dchZjcibR5kmrax0qlALyWdM90kUvcXYj6udCOzX8s/0vZQMK6faPxZPHIyXJ91y
 aqq+ANoYU/qDAak676Sn6fSSCQqMIOM=
X-Proofpoint-GUID: F6Kvr_O_RZ5Iq3h3XaTX9h8yIk2PB7W0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260071

On 26-08-25 11:52:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] I2C/SPI transfers during the noirq phase of system suspend/resume will timeout and fail if the host controller relies on interrupts.
> --
> 
> --- Patch [1]: [PATCH] PCI/pwrctrl: tc9563: Use gpiod_set_value_cansleep() for RESX ---
> commit cc5d1431bebcee3e75ac6e1b5150b5971fe40f41
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> PCI/pwrctrl: tc9563: Use gpiod_set_value_cansleep() for RESX
>     
> This patch changes gpiod_set_value() to gpiod_set_value_cansleep() for the
> RESX GPIO in the TC9563 power-on and power-off callbacks. This prevents
> warnings when the GPIO is provided by a sleeping controller, such as an I2C
> or SPI I/O expander.
> 
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > index fd53a7db9875d..1b7718d07d15d 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > @@ -481,7 +481,7 @@ static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
> >  	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
> >  					    struct tc9563_pwrctrl, pwrctrl);
> >  
> > -	gpiod_set_value(tc9563->reset_gpio, 1);
> > +	gpiod_set_value_cansleep(tc9563->reset_gpio, 1);
> >  
> >  	regulator_bulk_disable(ARRAY_SIZE(tc9563->supplies), tc9563->supplies);
> >  
> > @@ -501,7 +501,7 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
> >  	if (ret < 0)
> >  		return dev_err_probe(dev, ret, "cannot enable regulators\n");
> >  
> > -	gpiod_set_value(tc9563->reset_gpio, 0);
> > +	gpiod_set_value_cansleep(tc9563->reset_gpio, 0);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but it makes a pre-existing issue
> more apparent by acknowledging the GPIO's I2C/SPI dependency.
> 
> Will I2C/SPI transfers during the noirq phase of system suspend/resume timeout
> and fail if the host controller relies on interrupts?
> 
> During system suspend/resume, the PCIe host controller executes
> qcom_pcie_suspend_noirq() or qcom_pcie_resume_noirq(), which eventually call
> pci_pwrctrl_power_off_devices() or pci_pwrctrl_power_on_devices(). These
> invoke tc9563_pwrctrl_power_off() and tc9563_pwrctrl_power_on().
> 
> During the noirq phase, device interrupts are disabled system-wide via
> suspend_device_irqs(). Because local CPU interrupts remain enabled,
> i2c_in_atomic_xfer_mode() evaluates to false, causing the I2C core to use the
> standard interrupt-driven master_xfer() rather than master_xfer_atomic().
> 
> Since the I2C controller's device interrupt is disabled, won't the transfer
> time out and fail, potentially causing a system freeze or suspend/resume
> failure?
> 
> This would affect both the sleeping GPIO expander and the I2C bulk writes
> performed later in tc9563_pwrctrl_power_on() when calling
> tc9563_pwrctrl_disable_port().

Duly noted.

Needs to be addressed separately.
