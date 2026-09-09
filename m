Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D79577E4F
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968542; cv=none; b=XsV7YH2yQiC4MHPaHi7pyXu9bHRWVlgJ1MRRqgG83ojxOjSY0lRJ1N9yyL24g5PcjBBrDuP/eWj2bwVOofmfLeFBTOx7Yt0u/RMXUkyT86V05oQXXFpnLIsfSAmuATOBGRZhAr+Ysg9jfv9GwoGrT2iB1tBlKrciwPKpAV7rR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968542; c=relaxed/simple;
	bh=a64GDqnqJM5Gcxb2TXIlPcd98cEhnNLarprMbWo/s1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htdLz1BXeoBuwksYw9MjV/PcsjtHjGdFf9L7kcvapZpVdK2/vSjBbD7VFLT3vUAe6Oo/iSHoe3lt3PQBUTIQenDlw7cTSIkXNBPusses+JN4T3/lUs8tsJ9U/d2SbBymjzz+5ldr2S36POVrCnAJlG0RcLDVwtHvQJdcBpkboHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+9hzrD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgYy7Bnr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+9hzrD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgYy7Bnr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCjkp1400923
	for <sashiko-reviews@lists.linux.dev>; Wed, 9 Sep 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6xzuTsxy6Ya0ZQsG74zmxLXv
	e+omDninFQp6NvwxOLM=; b=j+9hzrD6omM2dcqkJYGS/06kGJdbLNA7gIF03v65
	NJ0Ybgr2c2XeVK6+ahLFI8aKvPcTgKEd4V+uzxUeDDZhIrgcAq/lMuuzBs8Xj/14
	OYppU/shGuPV8l4mYCGdyLl3DcGScFDLbkSWOHK9SrCGnjZV5JMPmaIeMNorp/ue
	hvchFKECrB83rUiLVsHTJ7sMsMSwv46MKHPki5PrCRb8XfjrL1ck3IMgnUkKukuR
	6It1xIHlMQ5uABYr5Pr+f41+gdOkEjrzgOzYFJ6ZdHC6z9RqKDOUtkDoSdG57+Lx
	lEnszGkss+LOkGcwhTUs4tIjzsc+8Ky3BYOMpcDFDDkYig==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0y4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 15:42:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3866352241.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788968539; x=1789573339; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6xzuTsxy6Ya0ZQsG74zmxLXve+omDninFQp6NvwxOLM=;
        b=IgYy7BnrgKTw1vLilEMwTiebgtG2XuHeOjcYC9xZXObv2bgh6kobIqb/cv7i7Mk3s9
         xyUVb34rmmnCrfx1XhWNaSCSCCa4gTc3PNJHVVqM5CXLwdZEfDK16vHByFV5T69+FG/j
         DiHM7E0Lhse2NFgPtBOR/x5G60YCx6TA7RP5sUymTKtDlQKMSfLPk3DQFdIqkgMVsGSE
         ahh99Oz7XShV2hyJofHp6dDNbYm2OL35RFzW/LToIenMyd4QcN7fxa+uQlFP0NdCJMyQ
         DFrcd9RM1qpf8WRxnBfln4AzVLBQdYL2tRPn/CSc8OhEfIH6u2dYWsdzf5xt0GiZjO6W
         bGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968539; x=1789573339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xzuTsxy6Ya0ZQsG74zmxLXve+omDninFQp6NvwxOLM=;
        b=SYZtW9LY6Kns1tHh9E0NFegTmBfN34P99FPRwDkIJCMiHlVOJlcX4C0Qs2Wbkzs0y6
         T9cYX/zPLVbC8zYneQh+RRhkXRr9HRSuqFaGjT+ZIVlypmQbQHq9A3kfrRAkZEmzoex2
         uhA2+Lyp3yAwiRQ0bDEfWja6WRict1bDC5fl4Zbwlc/nK+qgHAGDTUvM8lsr0e65vAfy
         /IVu0TeE5pP47It8xrM4VaISc8S8fyrl2rzN13V+9WiPuWJNKK9VdXsXdPrAuuCqgPqy
         Xb9TS3lUfoVUF9GQ0vaXjaYCyWyXnOSCGA4b6JxezTHq9O8Gylt7937so8glonahI+hr
         RgKw==
X-Gm-Message-State: AFuF++mBgS/0HTW49geNzBLBQEYYgwVAa8Dy8Zw9i3yzxgLnj+rMqkXF
	kFqUUkZww8VAUGF4V3vpNmeBYdfEpxxxPyKu/lN4wYw5htYtEFJ9ULhYfgLObpQElpqhY/GFemZ
	s/x1MMQtd2K4kyEQVmCKilKiDrgmhWv+GHKA7lOCL5Gh1RUib4h+DXljgSpi3ch4vWQ43OslgGX
	aS0Bc=
X-Gm-Gg: AYBFou0n8wkONMw/LCKy9ZhgIGyhUtsT+Xmfw67Cca7JC3eHoFsRQG1gW2cXfgiPM3p
	k3BFJYQJNtFkFnwnREdMGYm4xUJ5dWPT1H0lQTWy6PugVxdZVM8yK2fvt0FEsID6TFVAzscbMDU
	c676m90F9a43/CmS6HcgdzzckPgA7SpP/tNvOgB6033Kv1mmurPhpXRgvkUFqgMYrW9X33kFyFL
	hxB8ii5mNpg40Kt+SZPwpUagTUUjBrqn7zu1vZOSbu9pdRxETmYwPY6sC2ma4DvGCV3x3FKErRG
	GSk8ZY6XHNlO4cICeS0dr1jJBif4ws1C+7MD1vco6WKBnPpl2eO8oq14Uj7ILF9Dw5Y9lHF0f7w
	WuoYVTdF/+djZjQ==
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr16962557137.5.1788968538601;
        Wed, 09 Sep 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr16962525137.5.1788968538064;
        Wed, 09 Sep 2026 08:42:18 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43767403f8f.23.2026.09.09.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:42:17 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:42:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v5 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Message-ID: <aqF-WDtoSEbsstzW@lore-desk>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
 <20260909-pci-tc9563-aux-v5-3-c9b33f56c8d3@oss.qualcomm.com>
 <20260909151551.2DA281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIEZH1p0DJS2V+dF"
Content-Disposition: inline
In-Reply-To: <20260909151551.2DA281F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: ty_jCVQv-Mwz6V2ssX-BsWwWDp8un_n_
X-Proofpoint-GUID: ty_jCVQv-Mwz6V2ssX-BsWwWDp8un_n_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE3NSBTYWx0ZWRfX3g1mHK464Sli
 VE5SUYNguyeaCn2jVtGpCVyIg87eN7DM5ZzulIjANErtoVAnYZeawH5sg+mX6OfmfcKlJ1mkP3x
 DH5g+CGupGIiz5SLwHMg2c5s8gcX5fM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE3NSBTYWx0ZWRfXxC2ngqcOHZXn
 /CktAKRYWfl7QZCyw5yVeEVS8gHOe/Lk1lE/T7vXy1WY275N8qWpJJixmFKIGovMTpnBL2yNNyO
 Mf7SUPZSGVBZ1xPPv8b37gjf99tlFso4MlY+DBlzwuSbv8+2rZk95kjfAmLyf9Ik57B3Gg7C4g5
 gi8afLoC0VazrFaNHQGwY7nc5+vdiuOy73o0YnNAwxfRGFRSYM1FfpWo8yUBA+xYteS12TMmqkw
 uvcZ07QA47F3S48JOqh7UArx6nH4DqjRSf/sbAP2fLtniRHVRu5qJqxBuwXOD6F4waR/dOBZh7I
 /SJttDFasFmkM30+cHfiMCqajMfywA9mJqk4jhuwVAYhx0n4b9J5v7Z9dGStyb6mSrBCj819xFO
 PeIoacDnrdVoKXnYl2AnZAPhaZJpMIOx7df5RRUM6uTUBRU5gonK7VKOWkpsV22G6skTOnbniFA
 ZGBa3z/r8kUk8VbndEA==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa17e5c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=W8DIBEWQemVwItpymzoA:9 a=wPNLvfGTeEIA:10
 a=bTiFXxHaIdIL6kvNrrEA:9 a=o1xkdb1NAhiiM49bd1HK:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090175

--JIEZH1p0DJS2V+dF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Auxiliary device teardown via devres races with manual power off=
 in remove(), allowing I/O to powered-down hardware.
> - [Low] Missing explicit `select AUXILIARY_BUS` in Kconfig for PCI_PWRCTR=
L_TC9563.
> --
>=20
> commit 6f8a88de67f080d18050c0ce0599dc8854f71eab
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>    =20
> This commit adds an auxiliary device to represent the GPIO controller
> embedded in the TC9563. It passes the regmap via platform data to enable
> the gpio-tc9563 driver to register the GPIO chip.
>=20
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
> >  	select PCI_PWRCTRL
> >  	default m if ARCH_QCOM
> >  	depends on I2C
> > +	depends on GPIO_TC9563
> >  	select REGMAP_I2C
>=20
> [Severity: Low]
> Since the driver now directly calls auxiliary bus symbols, should this co=
nfig
> explicitly select AUXILIARY_BUS to prevent potential build failures if
> transitive dependencies change?

AUXILIARY_BUS is selected by GPIO_TC9563

>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> [ ... ]
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
> > +}
>=20
> [Severity: High]
> Because the auxiliary device is queued for removal via devres, won't it be
> destroyed after the driver's manual remove function executes?
>=20
> If the hardware is shut down and the adapter reference is dropped in the=
=20
> driver's manual remove path before the devres callbacks run, couldn't this
> allow I/O to powered-down hardware if another process accesses the GPIO
> sysfs interface during this teardown window?

During driver teardown phase, the aux device is destroyed first and then tc=
9563
device is released.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260909-pci-tc9563-=
aux-v5-0-c9b33f56c8d3@oss.qualcomm.com?part=3D3

--JIEZH1p0DJS2V+dF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqF+WAAKCRA6cBh0uS2t
rD1LAP9wbNdf1zUKYUrlR+yjRDTb9C3QrQZjvlyjjMPSUa49NwEAmE9UamdiPov1
1gWNEXt0HAz/GYW+07qobLMLmRHQrgQ=
=nasC
-----END PGP SIGNATURE-----

--JIEZH1p0DJS2V+dF--
