Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C0503BE0
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546776; cv=none; b=obQzEdgp7q/ROMwZ8IrtMwKeNIhaTwCdFmf9AlKiPUNSPFh8AhHtXDY7ZZvn60si+t8LQil8vAydHTB6LCsNO9Dpzbd55YIQ4w1nJ4hwWwUGttS7NUVvnCQFx9DUHUypc67ADYBDqjHBmxd74pUNEzg1g2gd5mqOxJ9Ldr6Wr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546776; c=relaxed/simple;
	bh=j+1ZOes4kWP7FAkpcojmQmiuJSCqnncwy86K3mTRxl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7/9sBUVEcMh8hLPLTFfWsiuq7B1w0rsIEqJ/3gdoJV0OBoBYcCKAkNfWi4VsB5jbhB129v+6G3yHQ4CK4Zt0IngUb7M2ftv/nEIN/+b+9drk4sZ8wzlmgyDYWCDmibFT+6f7PyQnXsE1jTw84x6x8J2wZzJxfsbF1ZhUGakYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULmMrf4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2DgREiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULmMrf4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2DgREiH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HRvRh3684083
	for <sashiko-reviews@lists.linux.dev>; Fri, 4 Sep 2026 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bvne7HECiZvG5t61nBxUCDlI
	c5mqbwFgVydcIZZ6aPE=; b=ULmMrf4rdQk4fHXC5NzSRck1gg0RthPnycO4EyKl
	6cQm7QUB5bvsd5eNmLl8cI9W38NnaDu0UB+qwVUEQsuDhE99yzOTl+WJfXLAPqao
	eWlZAxj6sLg1EghOi/+SJQYSYCt66uRnYrorFcW7qBl+in5m4DkMuLXAdvoEDCeZ
	FG/qLHDW1NM0zSqXpdjyx3EotyD7vqsH2H4mTdzyf1Z4wPnYFroiIHLe+LkAVLXC
	8xFCL/JSdtz1W+TL2z8pEcw31DNHdpZz+WB+p+cFgFSfvo7d1apP/69ZvvIX6q7a
	Kfd5NVDbOtR+mRqubut8q0m7LiOq5b5guRFl6Xg4DAAw5w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00y93qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 18:32:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785b66a7017so332719137.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788546773; x=1789151573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvne7HECiZvG5t61nBxUCDlIc5mqbwFgVydcIZZ6aPE=;
        b=V2DgREiHVGRSdYb89MX9lGsS/zcROrmAkiwYHDn29LbcmHdMmd57iFWZAjJrRnhpck
         MPPehnMdXttu8nDhvL8clDnCvGderdsuACO3gMxAQCZtnwwIZdit6TKgVTpvb71npbHQ
         5b8JjAMUaK1MTBb3PzSJmdWwvVqCaYBJAESv4B5dN+pFyIKvL0xNcUQderssUfCIKQQC
         Tg5jXXGte62rU0b4zgoBLCH6irR9htNIC2kcem695T0LITLZCqMFKjDgVJqRmpXlTPBD
         8vwqsxwyAUCfXshCDqYU/8VNsTVIWB/kdm4y3N8r6Iof34iYi8Tc3SHmfRObYoBRTxah
         GAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546773; x=1789151573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvne7HECiZvG5t61nBxUCDlIc5mqbwFgVydcIZZ6aPE=;
        b=ec2wTVwbxgN9k3gb8fr6J2VLwr6bmIjF3wJV0G7lRCTkgEpvTLNVluRawU1yuZma2B
         7jg3j7sCvHCCc64/J5o9wdiayfDKI39uoeOZ9a15TUDPG2CE+1zgvPmuK+QJG980EFrY
         0Wuka9I1J14RUkilKyeXncg71A5w2WZDPQdyZ+HmTFgoynI1AokHqForg0oOsPfJ3im5
         xp3xWRa9uHy4lHAux9z7hzsyC5YyTYKxR5DVmUUO0TmMefcI892UeIpm2SPV932rreLs
         ckOGbalUvS4ZzE0ClPmxCXqeAT4g6e9U/OQoBil4RpaLJQVj57erC+WFjVjgskwuz/zd
         /wjA==
X-Gm-Message-State: AFuF++mXlfdBUBrOz+vBM/qQ1/zcyGGUpsHulQZi5rMwpEelcEgtIMNZ
	K9vrKWtvWZQYH6KYPOd080PP+mPuBpn5cYgq+HbswE5qimSGa/meU36nkj42wPAKJU6quykwXfb
	0bCZSOAVuRseo88eJNBhkI82lDygJmDt8XduFIocBGUsG1DrxTHyhAwNvdJX3xvLNkk+ALRvXit
	0Jpv4=
X-Gm-Gg: AYBFou3ISGFHPWgL7kE6bUXzbzc71unWbxmQCzS/coz5Jx0vBr4GkPWPEXM0CY6hmYA
	ylXiVjzvEDnnwn4VzVUg4hvrIrrEKqoYt1Em5walOme1pmO0563Rh6eKCw3yb4THCXsmI0znlEa
	KXbB2k79QbJL92o6PKjahN5QhIdOmZUZN8PsZXWjD2rO+WVhbWQnn+En5vqQSL2DkJemkYf0d1+
	Yj4Z3zuyZp/AoshP2GX0KuD7FwM3lpB7W7qdi11f8wNQoECOTJRlaXAlcJ2xMLwDgebhO1WenkB
	eo9hHSb8jqGycAujtiZElVzS+F8OG63+BaVadLYau/AQM8TBxTC/dXUf3z3xPShVkrJz07lpcfV
	RG16syGPWq2BxdA==
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr2482594137.7.1788546773006;
        Fri, 04 Sep 2026 11:32:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr2482567137.7.1788546772398;
        Fri, 04 Sep 2026 11:32:52 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm168209295e9.3.2026.09.04.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:32:50 -0700 (PDT)
Date: Fri, 4 Sep 2026 20:32:49 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
Message-ID: <apsO0dPYIiCujiM5@lore-desk>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
 <20260904172114.2CF8F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewcNLQpfoQlfLSzs"
Content-Disposition: inline
In-Reply-To: <20260904172114.2CF8F1F00A3D@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 0j7Lkvyd8sJo05aar7W3cd0SjJfLMweE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2OSBTYWx0ZWRfXwmmSe/2xD+t4
 O/kDeXGXfRDZh34FLhFuQI0f13PuQIXm2NsBDaUWTqMq0LkmJ2jhdI/RfdeLNrNZ6+07kmRcsXh
 etJKB2X58mcku/ak8XOV9LSAxWurjdXrKLxynHpn5cXezIaskMiZ2Nal2CTl8vMNhZ2ZDbxS8aw
 Tub2jXZMX1tqWJoUf9BI+HapWSJ54yoMHUwOrSomI/JOrh/0jrlq2cs1zZhqLWlNLRlET04bQ/V
 He6jzgdHpz0Pghi1M2IPR5DXB6aiQUhLU6hJQF5oxmCHBytqCiUPDClAOp9qRdwuzkobvAn9TgQ
 jaNwkwoJtJHS2BtlL+G44f/EIUhl93s++EAmdJUJ6T1NMPmC9GqLT8tENZk7q9lpFjAxX/KUDHB
 LAGB38gB13UpUTe+OeVOaH5Z+djekQEow911Gr+qy65vnfHWoLiTBw8v9eijga3uyllU3kIU0hA
 Gz5qqxslB5WjyTdh3Vw==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a9b0ed6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=86Be0pIABdjnZPeXsFYA:9 a=wPNLvfGTeEIA:10
 a=kRZTEHTrMTxrHKFV5dYA:9 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2OSBTYWx0ZWRfX8AtuS+1rNoM7
 11cNu2xp51/jvxfOLCD3yYd241aLB9X6yk2jK3JQaddd8g6dbElL2QPhl/bCl57DIof2KHHopkn
 TsOKoQ6vWXAskTbWFT9GjDILpeQjF9U=
X-Proofpoint-GUID: 0j7Lkvyd8sJo05aar7W3cd0SjJfLMweE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040169

--ewcNLQpfoQlfLSzs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The 'gpio-controller' and '#gpio-cells' properties were added =
to the binding to document GPIO provider capabilities, but were not added t=
o the 'required' list.
> --
>=20
> commit 167159eda5a6932cbffa6730117f8dd7e23b2970
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>=20
> This commit documents the embedded GPIO controller within the TC9563 PCIe
> switch. It adds gpio-controller and #gpio-cells properties to the device
> tree binding, along with the reset-gpios property for the downstream port.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml =
b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > index f084830c6d0cb..c4cd162cb084b 100644
> > --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > @@ -31,6 +31,11 @@ properties:
> >      description:
> >        GPIO controlling the RESX# pin.
> > =20
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
>=20
> [Severity: Medium]
> Should gpio-controller and #gpio-cells be added to the required list?
>=20
> Looking at the required list in
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml around line 108,
> these newly added GPIO provider capabilities are missing:
>=20
> required:
>   - resx-gpios
>   - vdd18-supply
>   - vdd09-supply
>   - vddc-supply
>=20
> Without being added to the required list, device trees with incomplete
> configurations (missing the newly added GPIO controller properties) will
> silently pass schema validation when running dt_binding_check or dtbs_che=
ck.

ack, I will fix it in v4.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260904-pci-tc9563-=
aux-v3-0-5b1449d62ba2@oss.qualcomm.com?part=3D1

--ewcNLQpfoQlfLSzs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapsO0QAKCRA6cBh0uS2t
rAIPAP9ldnovE+inPbu1tazRg/kLnB87xWlHIQ/I9Tf1dz1JlgEAo4dME/cIbVWt
XSEfFwuOSDseGq//+7sOhx6dxC3CvQc=
=7vvW
-----END PGP SIGNATURE-----

--ewcNLQpfoQlfLSzs--
