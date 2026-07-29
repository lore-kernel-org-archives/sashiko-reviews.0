Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990374B8DCE
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333802; cv=none; b=YoqkQbGnEUy+JughLGWtDV+SuLsk+De/nsAjWnKedQr00D58V7ahnL3TUPDCltzcWzMGqgvICPeqZda5MiwBMAJlTnOmFnJDtFRECAdeaYlNkd41GYxESRm4gD5f0Io5bXgxdy0P2cUkO9CWxgjMaVaMaMr4AMydp4J9q9ePsGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333802; c=relaxed/simple;
	bh=QmLgSexPSDuaMklr6fTnA3PvfMhj8nIpwxXtH/H637E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeew2za12DxloY9eeu6+1zn7vUZxJ8PPjgPOIJ6RXuEojxLycGBcxzR/lg9HTc81aIN9lO5odjp060uOeeW6mOjNb0ss+fEsEhlwkRZG1jOkRF/VURdVPkDvkE4h0oXp7Vmqj9fNPSZbctHNemQLRxrP1geOA8XhrZL42SN5S7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAL9je9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ug9G2G78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAL9je9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ug9G2G78"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD89161431805
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ujvd8GOIfYUMjRcKfMhwhrUy
	V9hWXOwPZ2H7jDD71XQ=; b=OAL9je9WOVjUmvQ5cVN3MtpxENNajJHA8Sny95dg
	NOtf0m14YapxC+4fD+f3JyKrjGTUeV9TfzO69xaGRg8GDHsw7bolIL4ZkexdUCEj
	IOZM2Jpy9yM811lKCQ7H5PUvwn8xplmuxJGoMamAmjHO10T10sJDZD2PGReqdV+b
	XiK0UpzDh0rbue1h6lXX3Pz7K01nVPUMcTrrht9F1RSTsvpk+JHypgJ0VMPATDf6
	54te2KsMTpmUfyuHvqqUkvgYitPftv6gksK/0QLdRgLdX++z4A6lA5y7JFghM16o
	U+vIUAwFqHLqEERc4bc3caAuXtWjJfEkfu5OffjNL79MBQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj0m61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:03:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f565a6e7so1249312a34.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785333799; x=1785938599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujvd8GOIfYUMjRcKfMhwhrUyV9hWXOwPZ2H7jDD71XQ=;
        b=Ug9G2G78z3IV4lsW3/SmROOu5NgYURSW3zfX3BF2zE56xtfcj41WRj3553yaQWDSQ7
         ZRlxb/eKYHDSpROvVJI/G2gxwiEIs/rZTxxdfWxxvL/+gxZdhLBLYCX5T94u8EuWK5Hy
         ooIwLbUNkU8eAzZAfqUwX0HF19gb/7sM7c9SFo0u4kCufXQwNvifJAqxs3AzkpORx3CZ
         97imxDq7E0MuuZIQuCOdNJ/P9KsjK/oSav56fi6tpZjTCgReUGvEOvUBiM8Pi+mQlCJw
         nANS6Q9dBeKP2ZRLWm0Sz7WS9vOWvtQxgUYU18F7wQB1mj7tiPDZIQX7lq4hc+8C6TqV
         mQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333799; x=1785938599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujvd8GOIfYUMjRcKfMhwhrUyV9hWXOwPZ2H7jDD71XQ=;
        b=k08eICMD1OdLc1fDcHlHCeRwzZyJbgo4AHlUNSaTRSmBRQtmXsGxbq2XdUQ773Jisl
         IIod6ziMOyvf2VuzuldRUZHMJ7siFYcafWBv1dzPZnMI91eK+m7SeeginblWaoBiKbOC
         QI6lxVyaznfdkr1+Dz7c24tzhZDeOQcSS1v0cg3eOecbhshcd/nSUQtc70B6ogptHWz7
         d3zUlQATjq10az8oIgY33tVwnNHPgmLTi0InzIwGg8bpah3MrT2QGBSE3eXuBL8qhKWc
         vPZKkyleJ3clMfROas1bUv+0YM7psXnyE3liZ+a7ylkjOfQvqvYz832GLUuuL9kyD84W
         a04Q==
X-Gm-Message-State: AOJu0YyRfgR5QqjD1l7X/enb0ZfQcmViODqXqNWQqnGEdXTvJVkmrRGq
	PJQEOnl2xSdoieJemjzWMIqU6Q5MmsrcPGndVqtaPKH+9pI2XzOj+wj5HtlIsRey+Tojs9eWgGt
	kOcHnp5Smaxe4lheX+sLNqFgQDGCuzEDfNyEqCugOYIMrVn85u6bI3gs6wMr6IhtDrt0sD4vie+
	M++UQ=
X-Gm-Gg: AR+sD12Rm0/y2uXh2VbbEHIWW8rrrerWiv2e2RGYJS7F8/TKTeqYzhl1OxkNs3hXwvf
	X1fbAlF7F04UTO7lC+Euwfu5MmonupAdE43x25BOz6YaTc+0+Ub7hsbdz7a2gaUTmkhDI3F34ji
	zn0kbN5hEX1eNTO4H2LWww1TeIs6AOMlDfcDSWI93sYri3TkbK0JKOvRoNYS4V54DAhRRbb93ru
	FVBgpHPbmE1QF2qo9L4nnzHclmusA1cqjOhLcf4SFe+yYhrkMk23Oe7ZckUe9nlhiPC2S1A2jzP
	Y1b0FTIhMKxQkqzfV7n4w5SAf5g1I/x7qVXxxIzAC53Z0/LVhjEbBAu140y/U0HAaRo0FeWZ1Uo
	rYr5rm/k/WT12VT0=
X-Received: by 2002:a05:6830:81ec:b0:7e6:da40:b7fa with SMTP id 46e09a7af769-7efff2c3b68mr3399692a34.24.1785333798557;
        Wed, 29 Jul 2026 07:03:18 -0700 (PDT)
X-Received: by 2002:a05:6830:81ec:b0:7e6:da40:b7fa with SMTP id 46e09a7af769-7efff2c3b68mr3399579a34.24.1785333797183;
        Wed, 29 Jul 2026 07:03:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cdf452sm119986666b.14.2026.07.29.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:03:15 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:03:15 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI/pwrctrl: tc9563: use devm-managed I2C dummy
 device allocation
Message-ID: <amoII3tD3wtqcH7q@lore-desk>
References: <20260729-pci-pwrctrl-tc956x-regmap-v1-0-20ce61a3ce12@oss.qualcomm.com>
 <20260729-pci-pwrctrl-tc956x-regmap-v1-2-20ce61a3ce12@oss.qualcomm.com>
 <20260729134401.8EAD31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z5q25nZ36hnRsEAF"
Content-Disposition: inline
In-Reply-To: <20260729134401.8EAD31F00A3A@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a0828 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=OCD42IZeh0mM_344py0A:9 a=wPNLvfGTeEIA:10
 a=KNR_7U3MQDS_PTxHe68A:9 a=EyFUmsFV_t8cxB2kMr4A:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: JvOi9vM_n_MTfhAxoKWVkaCgVIHEBVSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX7mgnNC58AgBu
 qg1KqH2l4SbG11rrpj9MzLNNE4bMF2eYOC4YISiatrYvuMYhC6xfjhmxrDfbKUglEdnzN+nqcXB
 aG/Q10P+2k2+ThH85mRY+oo4yYamfBLtyFD7BnCxVEURWO5ufxSboPxitExvm6yzPt5Iz20/khi
 Qf4OhFI2OLLXsQWJC3S23smuQYmg6egqE2VIgQIqvVvGlyQKGZqatFqcMpZxmMkZD0ww8wM6W2W
 BiCwnPG7UuBUy7cE5nlEd0+OkOD9cB6y0+/Av+oMGUckbwAJtJ4mcu11Fczsi3impk6NSKsTf+T
 sc3XmzJwO3Ql6oWtxKnyfWU4y7YcztyBUnNtnYyDMxNSVfy6bCXs8L4h/ZdoNJybarU+oqks4Sh
 cWPnbCZua8EOqqL7i/hCDuKjXF/0y3ejBXM5iMlRRgHZstN1If6Cxlp83YJ8d3A0x/q+eNi2Hu9
 e1eLWMetkm8dB2mnJ3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNSBTYWx0ZWRfX0iA0wDnfyn91
 SdeeaF49s6sezNw+xa4k2swXTVGFvmV1pUVp89G7ShQRM73JfDR6Ob2ljXpk0lGnNjuJ4dQpqW6
 /avgaIP+O1PHNn2ScCRWgM3PyOaWr0I=
X-Proofpoint-GUID: JvOi9vM_n_MTfhAxoKWVkaCgVIHEBVSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290115

--Z5q25nZ36hnRsEAF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Use-After-Free due to teardown order inversion between i2c_put_a=
dapter() and devm-managed dummy client release.
> --
>=20
> --- Patch [2]: [PATCH 2/2] PCI/pwrctrl: tc9563: use devm-managed I2C dumm=
y device allocation ---
> commit f54ecfd3f2485cf33e559cd8f58fa24de337138b
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> PCI/pwrctrl: tc9563: use devm-managed I2C dummy device allocation
>=20
> This patch converts the driver to use devm_i2c_new_dummy_device to manage
> the I2C dummy client. It removes the manual i2c_unregister_device calls
> from the probe error path and the remove function.
>=20
> > diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwr=
ctrl/pci-pwrctrl-tc9563.c
> > index 8bccf3abd1892..5b05e76f6c80d 100644
> > --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> > +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> [ ... ]
> > @@ -607,7 +606,6 @@ static int tc9563_pwrctrl_probe(struct platform_dev=
ice *pdev)
> >  power_off:
> >  	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> >  remove_i2c:
> > -	i2c_unregister_device(tc9563->client);
> >  	i2c_put_adapter(tc9563->adapter);
> >  	return ret;
> >  }
>=20
> [Severity: High]
> Will this cause a use-after-free by changing the teardown order?
>=20
> By switching to devm_i2c_new_dummy_device, the dummy client is now
> unregistered by devres cleanup, which executes after tc9563_pwrctrl_probe
> returns.=20
>=20
> Because i2c_put_adapter is still called manually before returning, the
> adapter reference is dropped before devres unregisters the dummy client. =
If
> dropping this reference allows the adapter to be freed concurrently, it w=
ould
> forcibly unregister all children. When devres later attempts to unregister
> the client, it would operate on an already-freed pointer.
>=20
> Could devm_add_action_or_reset be used to manage the i2c_put_adapter call
> so the teardown sequence happens in the correct reverse order?

IIUC i2c_put_adapter() does not unregister any i2c children device but just
decrements the adapter reference counting. I guess even if
devm_i2c_release_dummy() runs after i2c_put_adapter(), it will be safe. Agr=
ee?

>=20
> [ ... ]
> > @@ -619,7 +617,6 @@ static void tc9563_pwrctrl_remove(struct platform_d=
evice *pdev)
> >  					struct tc9563_pwrctrl, pwrctrl);
> > =20
> >  	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
> > -	i2c_unregister_device(tc9563->client);
> >  	i2c_put_adapter(tc9563->adapter);
> >  }
>=20
> [Severity: High]
> Does this also expose driver unbind to the same teardown order inversion?
>=20
> Since tc9563_pwrctrl_remove executes before devres cleanup, dropping the
> adapter reference here deterministically happens before the dummy client =
is
> unregistered.

ditto.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260729-pci-pwrctrl=
-tc956x-regmap-v1-0-20ce61a3ce12@oss.qualcomm.com?part=3D2

--Z5q25nZ36hnRsEAF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamoIIwAKCRA6cBh0uS2t
rGtTAQCTr76gdQaUnAXCA1uq48BrHGvhSkHQUTWk5njmzBe+VwEA9BABDezLRN2z
vdmHy1276oBBfUKATOHbB4+8SzSyLAo=
=fdpK
-----END PGP SIGNATURE-----

--Z5q25nZ36hnRsEAF--
