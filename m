Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F91AA780
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 01:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784339196; cv=none; b=WO9PsdMROFKyHFL2dPQ1pD0XoMOkre1RTizWysXbJMsFZkF8nSwW0HsVdPa/2GQYv2wNoMmD3kTnLMg5WP1Jnnagen6k2ePG4E/nv5KYkdD/Vp3U+6inUXWfBuYXC63Jx+2+6eQvYToSum9dATXHU1JsLk0gfAcc9FRIDLL1mng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784339196; c=relaxed/simple;
	bh=2BY/jOU2jW5sGPniP+dSUc4YrnmOUUIUVFBJZBa6g6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhbRW6CuVE4qSlOBIyBoWdS+RpHfnlmlAaNS4OSDwS/tLpgnYz7NQuoF6NYs2IB4b24I8RY2ZWpb7lus2IBcNhPbnqgFfY10dF2g6bM8qDXntbYKKqvnDvxYJFZRKbgXqcDeJQlG8ujMlzU2rPhwZt59n4xQ3I520J3gD8E5ua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWPi8s1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7m8lL3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWPi8s1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7m8lL3p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEKPu3308495
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 01:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=; b=mWPi8s1eZ5qm6mx6
	ZGeDopPGp80MCU9jZsc7jqhi6DnX5KjdVv1NLCJslPAwENvwTkQG/Xex1V+pmdVS
	fu0uqF5MamA1ngEgCbUbAX9pIpS6oni3srSDDPxOCHljkPC/wRlta1wbTfCgqaEi
	MIZHnxr/73AxEI+DCNp8b8WaSovgen8T/dHCCKy6+17pEU+cOIBcvAbS06WLBJoh
	M2UZ81iRXDy5KIyOFvXSZFSgFSxnUTlnK06oFPaG7yQBwvdrkjMKaRew1h3TKjfV
	GinepD94Z6ZSDgTsI2/rbAGHNBlOcgLRqpcXNX2puD/cakkjTh+YcsW4L9eV7JC5
	tL+O/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrqd9g17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 01:46:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5260298a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 18:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784339193; x=1784943993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=;
        b=e7m8lL3p0Sx5Yirn5S2DKQTrUYUdHYjeXdvChK0EpAs3ZQ8EiyKxS6hsmSoX808FQJ
         /HTCvU0sBSGcakqpMTDSKsNk0LEbGEIObmJC0yuYgGJU8M27kgklFaDRf2fanN80QrrL
         /rGlhUrHMoaMvdZ/WxGVXeiU9Ta3kJLkd7Pdo2qKSp4HGpa788AaCGgbYqkuUkLuQEHs
         0U+Wd92MtLHpfG3nq3NRPICbFrEDL0xOTTtPXnNWjPbaHt/rsl5EYwhTwpPTjSMlFJOm
         S3mH0rfK+TJ1ljbMgI+MWu9WlTVx7Itqqh1qBPRPDGPAxQV7cBRwZZmvTnWcYfXnUOm3
         cX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784339193; x=1784943993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgCrjCImBhZvpsd46+fio8T962Fne8bdWlz6Aa88TKo=;
        b=odsilNJRToO+rKtXfN0FNk2eC/iN5NMc9eegZFrpRRpOVdqqTOlVjuhlPw1lPsCS9c
         PX2UJAu1jctCTwpyVs554ZqUiZucuT+0o0wGRukuIjlN41aM7bD6NYh0vt2/rbVlfLFk
         geTF+t4l+0MNO4A3KTcTSs46WuVI2RNd79iHagAtbB0xorKxplDUG19Bmsf6iBBE1iId
         zE5rIIMVc7+NOkIP8b+rXtwVJvkUVZSEfE64PpPWFcLVjIhbg8zRaBtHcv8zrn1Gcync
         9KCYoHuKBBNFytrA0IAaJ8vjxg5HBPXXl+O98d9LliEaULNKr59F5lKZE16nVD4pKEol
         cBxA==
X-Gm-Message-State: AOJu0YxvB/3QPHle305EYtHUKmMGONipx5MDX5Db92WdnNhD2gvulcR1
	i+Jt1X1EikfY6cOF1il32dWg/bPRvhRAJ3bVNwPp2f1iNpc/xLctgY1WYgAer/3IF+9Y9RsKTA2
	SMJw2qQngz4asAIzVHSP8K+uG0GWoWJ1WdIIkFUMWu0HDGdXqFAJWhf/c1LkG4jCliedEbV0=
X-Gm-Gg: AfdE7ck7jX8q6Zv0z21S2xn3drlzJOPL85NJAl9jHPXvY+OQsYPlo/2X25Hep+ucdkT
	kCPK0TOPk+bePM/hsNdSKdIR0tKtHuW9Mqe1GcMGq9G/B7DuK24U+5Bd0BBNP39U4S8pll2KXNp
	XX4kFvlscruqw62/zAtGZBmwXrdvRY+cB1x7yR1N3pg2usexSiKuPdURAv51GASfHHGpnJWXthl
	dJ9CGc8txjp2ABpzBqnfpn0wcG5zPt9uvkA0uMBkeZFFMP8eNyAbazlEsnTNq45LJDIkggXeB9i
	PjPlMu4/tFaIMrTW7XPAnezm5PwUAWM1SegbkNovWiGIVgO69kgMyRNhUYJO94GDbl0wDRKVJl6
	5CBpUBvcjpyHnmgU5
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr5098996a91.7.1784339193091;
        Fri, 17 Jul 2026 18:46:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr5098978a91.7.1784339192658;
        Fri, 17 Jul 2026 18:46:32 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc117sm1929803a91.3.2026.07.17.18.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:46:32 -0700 (PDT)
Date: Sat, 18 Jul 2026 02:46:28 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: sashiko-reviews@lists.linux.dev,
        Marcelo Schmitt
 <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Message-ID: <20260718024628.3e2872ca@jic23-huawei>
In-Reply-To: <alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
	<5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
	<20260716212838.95B3F1F000E9@smtp.kernel.org>
	<alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ib56JlIgwLOqrguP4zAABePaaKk5o8vS
X-Authority-Analysis: v=2.4 cv=DbYnbPtW c=1 sm=1 tr=0 ts=6a5adaf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=8AirrxEcAAAA:8 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=Wwo5UH-IqIJyjYPLOEcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=ST-jHhOKWsTCqRlWije3:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: ib56JlIgwLOqrguP4zAABePaaKk5o8vS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAxNCBTYWx0ZWRfX+7Z3LfoXJGpq
 xbzF3jPMjoRGyeDoJIyF47djRPDtLnF9RhGT1aWK/txQSUfh37a7+cHfIPFRJNDwPZ+gFVxY+8T
 dNJGDBtWn+GjAL476WSeQlE3+ADLVs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAxNCBTYWx0ZWRfX0tRd4B21adxd
 0DOOHz5iscr6vMkd2typzScb3CNve6rh26/+MBm1nHoJjBoAOS75HmbXD7CNwvEVYOnhbKlAEAv
 o20sdVLOuQn2I/Akh3tFTowFtJnUbk8KPC/ZLUKozBzxSjH7gP+rpvdiKVtREtd7Y5+/5bOfu3d
 v9ESHJePSFXIyL5onNf3iWkZeoGnwbp5kH2Fun/Tw9v8uNYsMpCKtih+4Wt9iPLVbvw7XU6UU/+
 66XZGGEh5ghV9hKyqyyWCWE7+wX1RlNWBbK79b+fmBI2qFpAjyNujRiEKFUtuXur0Bzb+7vd3cV
 6VRONoC0PGQKBvE9WhiTI65cDZVLWPX5PbTva5Gk6V7ceDjbpyCwL/X5ZWAEjY06AaxC79ShWP5
 s3L75WbxAX2GMwNJvH2rPZ7GYkbkTT6VHyMPXzaSAGpyy16106gpRzRL2Rhrn//fpoNluTaEW79
 i9EzaTIOGxn1uTAt1Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180014

On Fri, 17 Jul 2026 13:38:07 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> On 07/16, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `LTC2378_DIFF_CHANNEL` macro defines an IIO channel that=
 is intended to be differential but lacks the `.differential =3D 1`, `.inde=
xed =3D 1`, `.channel =3D 0`, and `.channel2 =3D 1` attributes.
> > --
> >=20
> > --- Patch [2]: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC237=
8-20 and similar ADCs ---
> > commit 5710d5f25b45906977e2522567c1964b1d3219f8
> > Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> >=20
> > iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> >=20
> > This commit adds a new driver for the Analog Devices LTC2378-20 and
> > similar analog-to-digital converters.
> >  =20
> > > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > > new file mode 100644
> > > index 0000000000000..5600c820c7f45
> > > --- /dev/null
> > > +++ b/drivers/iio/adc/ltc2378.c
> > > @@ -0,0 +1,416 @@ =20
> > [ ... ] =20
> > > +#define LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits)			\
> > > +{										\
> > > +	.type =3D IIO_VOLTAGE,							\
> > > +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |				\
> > > +			      BIT(IIO_CHAN_INFO_SCALE),				\
> > > +	.scan_index =3D 0,							\ =20
> >=20
> > [Severity: Medium]
> > Does this macro need to set .differential =3D 1, .indexed =3D 1, .chann=
el =3D 0,
> > and .channel2 =3D 1? The name suggests these are differential channels,=
 but
> > without these attributes, the IIO ABI will expose them as single-ended
> > (e.g., in_voltage_raw instead of in_voltage0-voltage1_raw). =20
>=20
> For parts with multiple inputs and configurable differential channels (e.=
g.
> AD4130-8, MCP3561/2/4R, NAFE13388 [1, 2, 3]), the voltageY-voltageZ ABI h=
elps
> clarifying what physical inputs make up a channel. For differential only =
parts,
> the ABI seems to be flexible by only requiring a 'consistent labeling' (e=
ither
> voltageY or voltageY-voltageZ IIUC). Will set the channel with the differ=
ential
> ABI if maintainers believe that's the best way to have it. Might slightly=
 tweak
> the channel macros to keep .differential =3D 0 for pseudo-differential ch=
ips
> (e.g.LTC2369-18).

Whilst I get your point on differential only cases not really requiring the
specification of two inputs, I think that does provide a simple indication
to users that they are differential channel.

I would prefer that we make them 'look' like differential channels so make =
up
a suitable number for the negative side.

I vaguely recall we did once consider handling these as inX-inX but it seem=
ed
a little too weird.  Hohum. ABI was designed against the max1363 and I didn=
't
think much about device that always did differential.  What can I say, I was
young and foolish ;)

Jonathan

>=20
> [1]: https://www.analog.com/media/en/technical-documentation/data-sheets/=
ad4130-8.pdf
> [2]: https://ww1.microchip.com/downloads/aemDocuments/documents/APID/Prod=
uctDocuments/DataSheets/MCP3561_2_4R-Data-Sheet-DS200006391C.pdf
> [3]: https://www.nxp.com/docs/en/data-sheet/NAFE13388.pdf
>=20
> >  =20
> > > +	.scan_type =3D {								\
> > > +		.format =3D _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> > > +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> > > +		.realbits =3D _real_bits,						\
> > > +		.storagebits =3D _storage_bits,					\
> > > +		.shift =3D _storage_bits - _real_bits,				\
> > > +		.endianness =3D IIO_BE,						\
> > > +	},									\
> > > +}
> > > +
> > > +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > > +	LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > > +
> > > +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > > +	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > > + =20
> > [ ... ]
> >=20
> > --=20
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.178423559=
5.git.marcelo.schmitt@analog.com?part=3D2 =20
>=20

