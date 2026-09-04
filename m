Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E23546EB
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549906; cv=none; b=icqw03MYxefhbNEyV7rR6DFeWQGsx2a8uW1UHdEjQwtRQGbmCb5SRuw23xj2cpTflfLal3q4m0oDbHH+HwOhdGkLuod9ZNk5MvQIqqc+np3Lu0eJOmlGx7LfZ4AEepf6JXfYlZv09E0Tuow7f5Ad32B6rA2t/e32riFK6C38T6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549906; c=relaxed/simple;
	bh=UJeFAtYe10STMVEUUnTDYX1nceflfnaVoDzyQAljQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mc/2YAzE1L94GvuvuzEIRkmK7nn65K0xXxYLNQZlEVcjDu/3wCboG5wdyPn9CLZz7vFM5t07Us4QguWnhrdKa7f0/JpSZieMFCGRqsXaxwqDd+Ov7UGsQIx3H0UoZh9wt4gPddIYWw4rXlGoMpl7LuXD/g0gfexAAjQ2smtA+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbxGv7QK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmVaXSS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbxGv7QK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmVaXSS2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HRpDT332898
	for <sashiko-reviews@lists.linux.dev>; Fri, 4 Sep 2026 19:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7hAo/EqYLroAjSO5+aPYsTnM
	tvlfMRyQlddXLyFu1Ko=; b=SbxGv7QKbjsKPgYtb9tGitlfMJqSCyPgz6XnE50k
	Jx1SlXROacjX1aaM/uQjqWKUMFQIFMtstBf+G39ctUbofU4RgPvEXj2GUKpIj8pP
	oGUbs/NNZbPTvWTSy0PE2Vdwr0gAKpI0ly/SJiLfq3N33FH5xkhrPib25i6OPteo
	J4G8vH7b839Q4wkJ4ksakCCQKTtt5W7LWj1sA+x+pswlV2V2Zd5d6z3wBmZgs3zI
	b9XaUQG3DOnU05mqPDfl4xh5O923EUxVx7c+9+JzrpmTgJ+bG3qgsGpsRJU0mb3p
	jUGX7xWy713iZt1+Xun2JOfF1VnqruLlc2Jpm7fK4eP1Dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011hmr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 19:25:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so147430885a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788549903; x=1789154703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hAo/EqYLroAjSO5+aPYsTnMtvlfMRyQlddXLyFu1Ko=;
        b=RmVaXSS2D+OvsmhG1DxdYaQpsbwWI5HeZmCJh2YI3b+fgWskHQIwg3/kGx8jqBf4YB
         0kGFfWlXnyIa5ggjT+oJlt5M1J1O64mDpD4yNqFu5VcB1EN9/JuhquzZe9EZ+muWuB5o
         oM90SFf9uxT1d+CkOmlxrAUGgWZq05jR4N5AxcV2vtbxfJ7xLEQobffe2CD+D1pEE+Qx
         tRtMAxx+ICTjA6ydhUEpCftA1RCKQWqOPSK4pKnlvqv8e7NtT0MVb2aXzRan14xSl2jt
         SzErH7PegVFPf3XxeSY/u9EJ+oz7LwZ6GE57mL+R+2+xEE0pJaUw5p+osdz9jTRQFpRU
         JlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549903; x=1789154703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hAo/EqYLroAjSO5+aPYsTnMtvlfMRyQlddXLyFu1Ko=;
        b=HreVE4QBPCgQvmvswztxBZ/FEg7MEYaxND0pcMXhbfj5LZqeAiuCav7mrJ/mgC0nHF
         QaUWYOHI1XmydN+LX6oj+SwddywiaP0GEqAb8cYx/3jyI8zFTPCn2DgvJC4xZvQjA2+H
         VOQvFc6BbkwgkD/XE33433zErQpK0yPROxvnZE8znWxOF7FrLuag6HmpY1DHO/6SfoIM
         UGw/T6hHy4KJwQtlC0lpULUjzNDrGxzyi1xU7/+XiAHl+ZiWyYtdYifrgvFE9vHgIRl6
         /DTavNYgxFMwSvCUTGQltrEcfRK2j/5Nh3Ur7y7NNlr1EPB3wiIP2+0WncUmIgM6fRyk
         RETQ==
X-Gm-Message-State: AFuF++neM3oZ2Jvd3L2EgYoW9dpa5uvVOCp7m4oy+ZhlW1um2Ko6Y3rC
	KTg+T7Q7pC39oWHjezqlz0dHs8xRRz3hNyU5bZasTtLTap9g1b9KOjAW4x+4kKJ61peqT5EUh+i
	1QynyxU+wKz/AUue5sqeg3y9cSmVPLm2pBd4MguiSGDgaN9P2PI2+j+tkButYyFU9NUc0Atyojx
	PoaVA=
X-Gm-Gg: AYBFou11/3AZkm562Bzq/nTartM/pzUX9F+YnjoqJmF7Xu4m9zPDBKhQwej27290Dpl
	fmrs5skPv5cGGB29b4wXVEk0RYhM9//KC6lmAeZ9TZGGkmSDeS5xz7Zqeig/n+AM4JIL9eSwva0
	VoHjXerenheBfBBrmvJwKiwyLgHxQV92la4T9Qx15U/u8nMvtyIIffAj0x7LGFaurEUrJ+/EPa2
	HmVjfebz3uzkacU1kZPNNYLqLTSZDPasrdz7olDPauja11IdLLY2U5mdl/jg84rDX3Qm0neC1cl
	GazzHNIey4E6L31WxwuoqB8bMyzyBvw8DW/eMqm/7S6BHkEwyVbd311J0siY2psD4pFFwuutCWQ
	49Bge5tEgnl+8pw==
X-Received: by 2002:a05:620a:6e46:10b0:939:b99:eec5 with SMTP id af79cd13be357-939803aeed7mr605117685a.1.1788549902926;
        Fri, 04 Sep 2026 12:25:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:b99:eec5 with SMTP id af79cd13be357-939803aeed7mr605112185a.1.1788549902091;
        Fri, 04 Sep 2026 12:25:02 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm9823371f8f.12.2026.09.04.12.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:25:00 -0700 (PDT)
Date: Fri, 4 Sep 2026 21:25:00 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-pci@vger.kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Message-ID: <apsbDPrVkdoBY7Y1@lore-desk>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
 <20260904173403.B6A511F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o9YkjD5QX8i91XiB"
Content-Disposition: inline
In-Reply-To: <20260904173403.B6A511F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3OCBTYWx0ZWRfX1GkUdIOqRPHk
 UfJZakDuFcUzCOQYSYG6yCR2nIgpt9Nf20wZ4KDN3quYppMQ9IlFGcbpH6Osr25fetHl9D+Noie
 LMAHcG44lipsnItM5RLZp9lemLPyZuU2NBu1uougERNiGPnTfcJ19IKXaUKDQbGyoVnl4nJ/OyA
 YQQOMr+IwksJUA22WSslsPqoW8ufzs4kSTM6tDuV89rUORkqMaq/o+GqwE0JmGs+V38x+ed/A2i
 8/FRHPdKpeJbDIRxny8n9VuDkEOxDOB+ZbCPlpp5MGEmTw0qJgsEw7RIHg8eYznylQHImfmnMBv
 EDSLSTMla/JCK/94hhhO1RtH+7Ei7vq7o3V24H/b0OoEO50jWFisSLVrCoZOOxDuEviotK/cryD
 rHOM4PkVhwTDmQjwbZAys8skAWUFYgTE/S1t78HkXO5L9m8qfOySiUF3bwEvaoRSA5hc23Y1nw+
 W4YOoaahFkIiKnWh8ZQ==
X-Proofpoint-GUID: aCxHwUxEKFtXaoCYdf6Z3t9x6HCquCPh
X-Proofpoint-ORIG-GUID: aCxHwUxEKFtXaoCYdf6Z3t9x6HCquCPh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3OCBTYWx0ZWRfX5iBAjwgBmvSr
 wwHY+7jjUMssIKSeEXErUAi6khfeKN3rXoTPagl2W2wvRBdAT4AOsVm0c/ZgeyzMs2MLUVrn8Pf
 fyrPjt+WWV0A+A1C9NHdFFToMcPfbhs=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9b1b0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=4GtrQM0c771cZ9mzj4cA:9 a=wPNLvfGTeEIA:10
 a=Kg1eTzekZdi3fw47I_EA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040178

--o9YkjD5QX8i91XiB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] The GPIO auxiliary device is unconditionally registered without =
runtime PM synchronization with the parent device, exposing unpowered hardw=
are to I2C accesses.
> - [High] Hardcoded auxiliary device ID causes a sysfs naming collision, b=
reaking support for multiple TC9563 controllers.
>=20
> Pre-existing issues:
> - [High] Inversion of teardown order between the I2C adapter reference an=
d devm-managed resources.
> --
>=20
> commit 4ceb9152c94ce43b58577ae6c0490e74f1fcf9de
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>=20
> The TC9563 embeds a GPIO controller used for per-port reset signals.
> Create an auxiliary device for it so the gpio-tc9563 driver can
> register the GPIO chip and enable DT-based GPIO lookups.
>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index 59ad219c26c02..2230765950b88 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > @@ -393,6 +395,69 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> [ ... ]
> > +static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
> > +{
> > +	struct device *dev =3D tc9563->pwrctrl.dev;
> > +
> > +	if (!of_property_read_bool(dev->of_node, "gpio-controller") ||
> > +	    !of_property_present(dev->of_node, "#gpio-cells"))
> > +		return 0;
> > +
> > +	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0,
> > +				       dev->of_node, tc9563->regmap);
>                                                                   ^
> [Severity: High]
> Does this hardcoded auxiliary device ID of 0 in
> tc9563_pwrctrl_add_gpio_adev() (in drivers/pci/pwrctrl/pci-pwrctrl-tc9563=
=2Ec)
> cause a sysfs naming collision?
>=20
> If there is more than one TC9563 controller in the system, the first
> will probe and register successfully. When the second probes, won't it
> attempt to register the same name and fail with -EEXIST?

ack, I will fix it in v4.

>=20
> [Severity: High]
> Will unconditionally registering the GPIO auxiliary device here expose
> it to accesses while the parent device is suspended?
>=20
> The PCI subsystem manages the hardware's power state via the pwrctrl
> callbacks, powering it off when the PCI endpoint suspends. However, the
> GPIO auxiliary device remains registered and active without runtime PM
> synchronization.
>=20
> When userspace or another subsystem accesses a GPIO via sysfs or libgpiod
> while the PCI link is suspended, wouldn't the resulting I2C operations
> target an unpowered chip?

I guess this is not a real issue since if pwrctrl driver runs the power_off=
()
callback, it will disable device regulators and so the i2c communications
triggered by gpio read/write will fail returning an error.

>=20
> > +}
> > +
> [ ... ]
> > @@ -596,6 +661,10 @@ static int tc9563_pwrctrl_probe(struct platform_de=
vice *pdev)
> >  	tc9563->pwrctrl.power_on =3D tc9563_pwrctrl_power_on;
> >  	tc9563->pwrctrl.power_off =3D tc9563_pwrctrl_power_off;
> > =20
> > +	ret =3D tc9563_pwrctrl_add_gpio_adev(tc9563);
> > +	if (ret)
> > +		goto remove_i2c;
> > +
>=20
> [Severity: High]
> This is a pre-existing issue, but could dropping the I2C adapter
> reference manually here and in tc9563_pwrctrl_remove() create a
> use-after-free risk during devm teardown?

I guess this can't really occur since i2c_adapter refcount is 2 after probe
(of_get_i2c_adapter_by_node() and devm_i2c_new_dummy_device()). During
teardown phase, the first reference is released (i2c_put_adapter()) but the
second one is released just after aux device is destroyed.

Regards,
Lorenzo

>=20
> The driver acquires the I2C adapter via of_get_i2c_adapter_by_node() in
> tc9563_pwrctrl_probe() (in drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c).
> In the probe error path (and similarly in tc9563_pwrctrl_remove() during
> unbind), i2c_put_adapter() is called manually before the devm teardown
> runs.
>=20
> With this patch adding the auxiliary device via devm, devm will
> unregister the GPIO auxiliary device after the adapter reference is
> dropped. If the GPIO driver performs any I2C transfers during its
> teardown, it will access the I2C adapter after its reference has been
> released.



>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260904-pci-tc9563-=
aux-v3-0-5b1449d62ba2@oss.qualcomm.com?part=3D3

--o9YkjD5QX8i91XiB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapsbDAAKCRA6cBh0uS2t
rBgRAQDrdYdwWgkU4qJVaRd72oCcXjNw9sxHf4gGqOsnSo2ePAEA3jq0eNi/NB2A
9kC7ihHTbyYQzjTu5NvUVm4If9KiHQ4=
=l1yM
-----END PGP SIGNATURE-----

--o9YkjD5QX8i91XiB--
