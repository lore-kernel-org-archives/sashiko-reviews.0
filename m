Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428F57980E
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882964; cv=none; b=k+tZ6r6tVYkv172WPxCht3VrQaG1PNT8Pzu8uPu6dg3x+TB1V9G7mfXL+8/0EybUfisCTxgr9C+GYaWrTvK7S+UKhB/fmgKphx7e1XFFvHSouyjRNJ4piv75ZlLQz8anP/CGDtWzXY94rvb5EQy+V80U1Zy4L5iIqxyCm+et+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882964; c=relaxed/simple;
	bh=QL5L+A2yGQ34ZpBsYQOIJvzrGtfmknTxQP88+80LkUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5OTizzgX+WBLfjeAmdicHqZ/ohhGOlxJde+NPkrKEiF2uvOkQApKDrH9+Jr2vMqE/w7pw/4f+Sd3/V9yHDgRYVq4NSLY0NbqYUQ/MsnaCmNo1pUIvLjfUTjBWIUmKpJHkGO2Mpku+Rtgpb2O6XZX3jI5DMxzSpCkLR2cIVMnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kooBFhSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHG9htVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kooBFhSo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHG9htVZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdYQK3964227
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 15:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPGlSzCxvKEhEBnf+V1GdR/a
	VyM0v2zUfriGXpEq5JA=; b=kooBFhSoYPZpcd7fJTvC5LyE1Yq0K9yhJ3EDbkaF
	ptQpa7DSfHJH+NVPBV98XhdaxRYcmswEYEcODIbTFckRuqEybqDkaydgXIepNz/Y
	NGnka75NW+Gtjq5UwHbyQO4P8WQCtqqV79hw5cipPGhSsjmm72I+Y7J8mlj5ZB1U
	s6Opr1exbhdoXa308Hoyld0Yhznxl33+BlGlk2KXfOHkvohvYcp/TLG4Rc9yyuTU
	w7KMGh/aTtrddPRayMdteunf2Y7nxnRqRaHwQsF6Y79RE6IkqLsvzVb38rEjpcs+
	UTxcStMjP/Z5vMMj0FlpbtKzNMOFZ9izroRHDNhLuKobtg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49mrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 15:56:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785827e6073so628896137.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882960; x=1789487760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPGlSzCxvKEhEBnf+V1GdR/aVyM0v2zUfriGXpEq5JA=;
        b=HHG9htVZ/Yz6UMxrqIOZ+RXDBsofAbOc+p4jICzn4gLWq0vtbqTCBj6wwgn/tYWbEa
         M4hoTaRKX9KHHe4VlS/PAXd76z3JZ542mxyxM++K3fHwc61bjAzPWAG93xge0Yd6Sidb
         KkHlQLkfbg1z6asjp53+mUzvtavC1pm5Lqrv7XZhbC0RPDTfN3+KYvjLna1a/Jf/Ahdl
         qUUMpw/BRm28YMHmY3w4/IvqI42pxE8kqodrD33483pHLQO3mSxezVWjKWt6Chfr+xN5
         istBMUjFHEAMp6wa0d9VIQtYBTZ9bDrmIU4DW0CEbGiRKiuSVA3dQu/1mXefsowxa13f
         jLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882960; x=1789487760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPGlSzCxvKEhEBnf+V1GdR/aVyM0v2zUfriGXpEq5JA=;
        b=HXAWQXdA6mEAVH/QeswFuXQTAPXXZaedW8WYJGjhKYHe+MUtkm9boTjb57V34aw+rA
         tqgL8QbiKREcQ7l5/M41S5QaUIIeWVCctRb8g0gf+s97EceZcxAnWNFoEHXVsMYuEjGy
         DOLlfiqRn1bx0cK4rrNCcSFV6nhG7Ctejxgwj4U//w4GbmVSiMA2hJBw5I68qOX7oI0O
         MIR/yKdBhlIqjiN16jJJAHrW9MW1oxkVnYx/JzR1ACZP6EvJY4JjDIfGZMI7Lod9hzPv
         XRxlZtwABRc3wNXhu2PXndZTjh7FG8W/GXqseQRULv0Pw58CYW8OADiK9Q9pr5edxv1u
         nb8g==
X-Gm-Message-State: AFuF++lQcCQ/fuHwXBj6u7/qhWgWjJGLO0IpqiKO7RGjBXoobeqjKQZZ
	ZnBjRC7YsYz6c6qBmoHIvunIYE7VK7nv0JWxdjsZeQ1VaWSmefXueBWAa/Qi7DU0I6TzEtzbJRA
	vwjAl8CZn//gw0dT+gSnvEITtbl45uImJ7kBWZSVlwZ1Z1/HfYZ6mDmqU5QVK8TELDPgGZAEs4W
	n8j1Y=
X-Gm-Gg: AYBFou0ZaJdwjIolCxVmhc+67QMNNGPeou0UUKMI4p2C/bCi9hwK7n8oRYfKszI7+6e
	OuRP13x8iJvyfiLRceffkUbRZPIiXVE7bqbEujplpATtCBar+4dxqSgzbc9MVenN3jL4QsNHjDA
	3Zs/5Vuvzn1vOQDfqUe3W3eik9sQm0f4K/K9RFJ9Glxeex7r5rpplAXCGYHRUyQMBw23KfGEFX5
	ebTRidPYlWcWFt/9GIbF6cTkWTJ5a7svNklmg/tgaeOM5ZS0DpLTZue7AdB9bLRdBFi5AL0tLVv
	zsAawQCLtk1jDyxteOWg6rAIh6iECagaPUiiCrwL2k6gtu0lXAsKgwSr8Y4tQGJ6OkYSDhFZhp+
	ShEnJF5bUUerqkg==
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr11120381137.1.1788882959823;
        Tue, 08 Sep 2026 08:55:59 -0700 (PDT)
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr11120128137.1.1788882954099;
        Tue, 08 Sep 2026 08:55:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm31793932f8f.5.2026.09.08.08.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:55:53 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:55:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
Message-ID: <aqAwCH5XoNaUymVG@lore-desk>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
 <20260908-pci-tc9563-aux-v4-3-c7fc7778292b@oss.qualcomm.com>
 <20260908154519.4C63C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zgcgrj2tDjCexuVQ"
Content-Disposition: inline
In-Reply-To: <20260908154519.4C63C1F00A3A@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa03010 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=v4o4Xi0_14dk3J3qoC8A:9 a=wPNLvfGTeEIA:10
 a=GrwQZHf9fWOBeuU64NYA:9 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: sS0IZMBJablHcJwH_YhCTYETSWvxonMV
X-Proofpoint-GUID: sS0IZMBJablHcJwH_YhCTYETSWvxonMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MSBTYWx0ZWRfXwFeI/emw2zTd
 yu13RWHeyVddMlG+LD37Z6WiWcnTgOAjJSWjR1eqEDgZQzz5st9a5GWkzhzIc5knrKtWlQjKNC+
 Sb3+lE+M5tBOoxtYLLix7kleRwkMwW+1UQ3PokkzvIGXkguM3xg5brcbaMn3kTWZhH+9UVi2r7I
 tqy0EozENM6IlUtRQuw2kCngTT5kbvzSN+T1qYKdFiM/J1u+LiVyjYIKbLf4ZE386snaTvgZs5y
 frVvqgDyCxLjJ/m9/t5315+fms0FICAULT3yvCQ1kIPIZLJxzPW7AaCJ0tJ/F9ijmxxhCWDcN5w
 rrsFHzArXy2+i8cLKVqWXst8l1WrsqdNs66sLCmVFY+QQn1wuEcIMHJXrQnsH/HUiflkjZrHPUQ
 wm4P+656TRNhfz5vdH29muNgzVbaVlVKcJpBj6YGk9KvIhld/Ihf5BUOyZ/pwKjCoiPRo9n0D55
 4GsS4XbSsfC5XOY5PHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MSBTYWx0ZWRfX+vcHS3I32YjI
 Tu4jqJPmub0U7Q8rIUTO/eThStcO/Xg484sVKrXn8ahUzSrqH32DBWw6Z+Uzjl1YWQddlv5Mkor
 743K8dEMOicJmegad47DmI+0f8U+ysY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080171

--Zgcgrj2tDjCexuVQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Devm vs manual cleanup ordering bug: Auxiliary device is unregis=
tered via devres after the hardware is manually powered off and the I2C ada=
pter reference is dropped.
> --
>=20
> commit ee51cc5ce17159f5e9569310449014a414a8580e
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>    =20
> The commit adds GPIO auxiliary device support to the TC9563 PCI power con=
trol
> driver, allowing a companion GPIO driver to handle per-port reset signals.
> It passes the tc9563 regmap to the auxiliary device and uses devres to
> manage unregistration.
>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index 59ad219c26c02..3fb862105fa58 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > @@ -393,6 +398,77 @@ static int tc9563_pwrctrl_parse_device_dt(struct d=
evice_node *node,
> >  	return 0;
> >  }
> > =20
> > +static void tc9563_pwrctrl_adev_release(struct device *dev)
> [ ... ]
> > +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *nam=
e,
> > +				   struct device_node *of_node,
> > +				   void *priv_data)
> > +{
> > +	struct auxiliary_device *adev;
> [ ... ]
> > +	ret =3D auxiliary_device_add(adev);
> > +	if (ret) {
> > +		auxiliary_device_uninit(adev);
> > +		return ret;
> > +	}
> > +
> > +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev=
);
>=20
> [Severity: High]
> Does registering the auxiliary device unregistration to the devm cleanup =
phase
> cause a teardown ordering issue?
>=20
> Because devm actions execute after .remove() returns, tc9563_pwrctrl_remo=
ve()
> will execute first:
>=20
> static void tc9563_pwrctrl_remove(struct platform_device *pdev)
> {
> 	...
> 	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> 	i2c_put_adapter(tc9563->adapter);
> }
>=20
> Will this cause the hardware to be manually powered off and the I2C adapt=
er
> reference dropped before the child device is unregistered?
>=20
> Could this lead to I2C transactions on a powered-off device if the GPIO
> controller is accessed during the unbind window, and a potential use-afte=
r-free
> if the adapter module is unloaded while the dummy client and regmap are s=
till
> active?

I think this is the issue already reported in v3.
I guess this can't really occur since i2c_adapter refcount is 2 after probe
(of_get_i2c_adapter_by_node()) and devm_i2c_new_dummy_device()). During
teardown phase, the first reference is released (i2c_put_adapter()) but the
second one is released just after aux device is destroyed.

>=20
> > +}
> [ ... ]
> > @@ -596,6 +672,10 @@ static int tc9563_pwrctrl_probe(struct platform_de=
vice *pdev)
> >  	tc9563->pwrctrl.power_on =3D tc9563_pwrctrl_power_on;
> >  	tc9563->pwrctrl.power_off =3D tc9563_pwrctrl_power_off;
> > =20
> > +	ret =3D tc9563_pwrctrl_add_gpio_adev(tc9563);
> > +	if (ret)
> > +		goto remove_i2c;
> > +
> >  	ret =3D devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
> >  	if (ret)
> >  		goto power_off;
> > =20
> >  	return 0;
> > =20
> >  power_off:
> >  	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> >  remove_i2c:
> >  	i2c_put_adapter(tc9563->adapter);
> >  	return ret;
>=20
> [Severity: High]
> Is the same teardown ordering regression reproduced in this error path?
>=20
> If devm_pci_pwrctrl_device_set_ready() fails, the code jumps to power_off,
> which manually powers off the hardware and drops the I2C adapter referenc=
e.
> Then probe returns the error, and devres will clean up the auxiliary devi=
ce
> afterward.
>=20
> Could this create a race window where the child device is fully bound
> and accessible to userspace or other subsystems while the underlying hard=
ware is
> already powered off?

For the above reason I guess this issue can't occur.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260908-pci-tc9563-=
aux-v4-0-c7fc7778292b@oss.qualcomm.com?part=3D3

--Zgcgrj2tDjCexuVQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqAwCAAKCRA6cBh0uS2t
rP9GAP4gXjDD7f/hxcb9iAM4lkRxXhVRhZccxzCkY6SztZ+KAQD/fuC9rwFcruAK
yL/xrSa6laWDpjRGCRds20UbNEM81g4=
=Gg8o
-----END PGP SIGNATURE-----

--Zgcgrj2tDjCexuVQ--
