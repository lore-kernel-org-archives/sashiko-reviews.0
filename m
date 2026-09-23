Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E937446C0B
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147521; cv=none; b=DJ9hXYArFJbjVo//EGRqYtO/h8fbwa4bZgRFav79cG/+sKSJEiEjf3psdTHK/k07mr5zcp2/dIuEamHS9Iy6VblFX5Mr/qhJ98yqaBBRJUs+evJ3xknKGOrE/KMdz6Fj3a9l5YjiQxETSN7SZ6LbEiardpu1B99lSHAHAWsylz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147521; c=relaxed/simple;
	bh=qO8NqbHssvyvKxNXSQHKf+ZV3+fXThxLtxoinfAMzXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyYQm8qQj/a5UoyoG4HEoMntjZgi69oY34GaRIpURhsiUIEEAtUsfGXW2SMSfwpfsWh3wt6CgvTZco/1D5qdzIcxIvsaDizt4ZZYiqK35HWh1zGVIldm1lMqcI07qgdpoNRVdSgUhsTVPd59WRyufubS2FBVtZwzqV2N3rdFa1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fu+58mCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWbEZnEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fu+58mCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWbEZnEf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79Y2s3174858
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 07:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4L7SwgTZYrU2uezs9VS8q650
	pkDvZJeXPq9cVPhYSHQ=; b=fu+58mCmTd2HqKq/5PDEcey26N4YxLaFzyNRYZf0
	uQEZI9CMHSYj5DFxnqns7q1xRIYzSgjPj5xladloCPBmpITa0d7OlGVY039iKvv7
	CtPCEloXulDcHVTOgFtnAyhnKJ5fd6gqBObskeCTbIFnMsTEIGo0MrOyBWY9G9u9
	nn+xHDlavS3QL1V3qqXHymzz/xpL3OK/VhhhfXn3TQ8cBDy8udJo6bjijZG5fllZ
	HFGRvpvqdCKKBf08YLLDZTACwcrhKoI5w3S4xEN4LOKnomUFWYT+DjwaOjDSibwg
	7VqgLRmKjmnLIWIeX806AxWQ3WSIPgLfhuhvs7UbprgnYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xu1he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 07:11:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so174876085a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 00:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790147517; x=1790752317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L7SwgTZYrU2uezs9VS8q650pkDvZJeXPq9cVPhYSHQ=;
        b=gWbEZnEfEEAsqQafif4vemI2fYihRbXRg4mTPH1+K3DaY5FSlMgtBLQ7vlDoLxUOCm
         kuqdR1aOYoWahgnMaBhdM089+R8wXzGL1m19/jPIhz8pd0AQ9s/utR0cz+Mi2ge7CR9H
         +4m95OMlZ/FpxxCw8RMY1onYgcTE2OGiMLafIY9pGC96qWgCYNf8YXvRG9SQs+EWzdpI
         XMfv069/J5Gc7JWL8No7Y2FMUvjt2VCvtTWpBmnpNi7Oe2aN9tMS4Fjc+kxSXyQYfc3W
         xx89BINd5S9v0YFmtrbrqKB3aXakJG/i5oAX6IdEjFuB9dWnyoiuqljVglx6aOgEWVct
         rSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147517; x=1790752317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L7SwgTZYrU2uezs9VS8q650pkDvZJeXPq9cVPhYSHQ=;
        b=G6j8Hw7wMzv8kpJSXFvdLGHeAyBxt7BpQInrhrmaTpzC8sIBMC8O+6FuWdje/SBx47
         rNhXJ5FxeQvFR9yxMm/VG4axw7JbO/aXDyYmLzQ7jyUtpxyxcdjJVvEfJ3epLveDY5Xe
         +gdODIhSzPqppYMlwvwf6WiyU+fmrz00bnrh2E4y+kpguTG0TMzuETgmFhgvEFA9ZmFq
         ce78ZFx/8F3gTf0isyfhBd4dBpaV27eu+9p8kFow7CaPt2sgEXx5jtLLaIZlMcfQypK9
         T0D0sdRh3jHMmBWsSrm/2PCqCNNMh05Z8o3Kgd1xcRNTHXEkEqt9dEUxBcGgAZsohVwh
         ZBSA==
X-Gm-Message-State: AFuF++k8hu13YU/r1JKl5uBbeyr5bgy13LyAIC2YuEeWHg6wudy6HiqK
	55HqKiyi6uLLe9DnePq5Bk7TuyE2pz1oWi8W9sjcAShLJg9Dilinn9kMBGk7GtsjjHTEV3mB7jt
	UjHU/LAHbdtu2SedkGLeaUH1EWy+NDkQa+v5m2b5JzBVeTKPEsyFB8HdShiX7fseU08D8vIT7Wy
	uC7AQ=
X-Gm-Gg: AYBFou2WhgU2v7tVVTIMWuZraB0oEcW6+hw5L3nPFFKErtDgkaeznEQz0QwKrimd7ba
	GI3Xid4o/JAtkBc8qsfn+6JZ5AwM5t9DGwVHE4ztwBvDdvvAo5qYKlu0ih2oLcGSfNKYSRlJDD6
	CrB6sGQ+N77yaqx/VFHvbGBrvmPAP7JyIB03L+e4G+uUGtWJTK2CoVlhJfe2U+eRHzjyFwZL+a1
	GZqXFRBmvhq6cveyJCdMouK7PIrjBIox/qb11qQZgmLxIHGL26z5lPHnQCcJMt36/ulJEzug1S/
	+nUHun8+DdZyo6FulgNsVS29BUyFRFhqVNvvkOrGKKyP4oxEv9IRKZxI8TMwEJ05k+7JztkHFz/
	2gPfnISxxoPvw8Q==
X-Received: by 2002:a05:620a:d8c:b0:937:1097:feb8 with SMTP id af79cd13be357-93c2511c4edmr299667285a.24.1790147516902;
        Wed, 23 Sep 2026 00:11:56 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:937:1097:feb8 with SMTP id af79cd13be357-93c2511c4edmr299663985a.24.1790147516395;
        Wed, 23 Sep 2026 00:11:56 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d978fsm49131775e9.9.2026.09.23.00.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:11:55 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:11:54 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix rx Scatter-Gather support
Message-ID: <arN7uiRGaQmO0eCk@lore-desk>
References: <20260921-stmmac-rx-sg-fix-v2-1-b6d88c5ac2d7@oss.qualcomm.com>
 <20260922144844.B10D51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1TNf89TMGOGdcDOT"
Content-Disposition: inline
In-Reply-To: <20260922144844.B10D51F00898@smtp.kernel.org>
X-Proofpoint-GUID: 2iLEz7EQVuHW4mZ3taM_2CrzMer5OJB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfX3ms/cU7cpfWd
 EvAQFarF/ytup9tSxyasix4cgwmYuutdRSPdvCS/4ZpWDJhS22Icwg8ovaU9WvNnOU5dsFO1z3H
 ku3e6hHPqoE9yefDk+hrYhHUBFQr3wd4RvHgqQDYytTROzRxwVdJvI+hNF2zpcP2snNEflqwZ1g
 bafTj/3/fpVwZXAaWVrNksw5yoQIrsFKJBkpuhwXvAqWN61MvF4jkMb8WPKTyo5QQDd/rA40jXF
 573+Cs8pYmb6HhZN+gwE3iQPukh6efRntqlM72YkmN0uDVk38oqUZZpN1u+1ZpHLJeqtyYF51TI
 inA5aacWomFlApNVLdOg+uhVSV9bT8Jt91SpEQ+22pSLSNRMnpIvJnkcoFpIomhehMKZPQFGhKz
 3N2NMxnTU5Y+HQ1mzVrSlDrXN3HVskqb5Rp/3ix6Gzl8wCg8IuqUv2j3pxONJmtwjcEg3DXlOIF
 Q/Mhv0BA983mlDheHSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfX4l92Ynt6T0/7
 Ao7lgU6AX3fG344NYudaR+ggFBtabi6iDcd3x8f8hs6Sv5byNxNN3BF0fe4ZdF2RmaA7e9BL3Lk
 jklycu+8z/7774Kd3av95sSPAbClt9A=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab37bbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=fb3CDrQzkRIv9xq4yYUA:9 a=wPNLvfGTeEIA:10
 a=QUrq7jf_cUBQkAu679UA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 2iLEz7EQVuHW4mZ3taM_2CrzMer5OJB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230028

--1TNf89TMGOGdcDOT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] stmmac: FCS stripping check corrupts payload on legacy cores
> - [High] net: stmmac: skb_trim() on non-linear SKB triggers WARN_ON and f=
ails
> --
>=20
> commit a400f52631710a5add56c0a39b6ab0128eae6a53
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: fix rx Scatter-Gather support
>=20
> This commit addresses SMMU translation faults on oversized incoming frame=
s by
> allocating and enabling a secondary RX buffer (buffer2) for non-SPH
> scatter-gather frames on supported cores. Legacy cores keep buffer2 disab=
led,
> and the FCS stripping logic is adjusted to handle both linear and assembl=
ed
> frames correctly.
>=20
> Link: https://lore.kernel.org/r/20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f72=
5f@oss.qualcomm.com
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5807,24 +5812,31 @@ static int stmmac_rx(struct stmmac_priv *priv, =
int limit, u32 queue)
> >  		len +=3D buf2_len;
> > =20
> >  		/* ACS is disabled; strip manually. */
> > -		if (likely(!(status & rx_not_ls))) {
> > -			if (buf2_len) {
> > -				buf2_len -=3D ETH_FCS_LEN;
> > -				len -=3D ETH_FCS_LEN;
> > -			} else if (buf1_len) {
> > -				buf1_len -=3D ETH_FCS_LEN;
> > -				len -=3D ETH_FCS_LEN;
> > -			}
> > -		}
> > +		if (likely(!(status & rx_not_ls)))
> > +			len -=3D ETH_FCS_LEN;
> > =20
> >  		if (!skb) {
> >  			unsigned int pre_len, sync_len;
> > =20
> > +			/* Each frame starts here: reset the FCS handling */
> > +			fcs_stripped =3D false;
> > +
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> >  			net_prefetch(page_address(buf->page) +
> >  				     buf->page_offset);
> > =20
> > +			/* The XDP program must not see the FCS. This only
> > +			 * applies to a single-buffer frame (buf2_len =3D=3D 0),
> > +			 * where the whole frame and its FCS sit in buffer1;
> > +			 * otherwise the FCS is stripped from the assembled
> > +			 * frame with skb_trim().
> > +			 */
> > +			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
> > +				buf1_len -=3D ETH_FCS_LEN;
> > +				fcs_stripped =3D true;
> > +			}
>=20
> [Severity: High]
> Does this logic incorrectly strip the payload on legacy cores for
> scatter-gather frames?

I do think this issue can occur since the legacy cores never set rx_not_ls,=
 so
the packet is always contained in a single buffer.

>=20
> On legacy hardware without set_sec_addr support, stmmac_rx_check_buf2_cap=
()
> returns false, meaning buf2_len is always 0. When a multi-descriptor (jum=
bo)
> frame arrives on a legacy core with XDP enabled, the first descriptor ent=
ers
> this if (!skb) block. Since buf2_len is 0, this check evaluates to true,
> improperly subtracting ETH_FCS_LEN (4 bytes) from buf1_len and truncating=
 the
> payload. It also sets fcs_stripped =3D true, which means the actual FCS a=
t the
> end of the frame won't be trimmed later, leaving a corrupted frame.
>=20
> [Severity: Critical]
> This is a pre-existing issue, but can this underflow buf1_len and cause an
> out-of-bounds access in the BPF program?
>=20
> If a multi-descriptor frame is received and the XDP program drops the fir=
st
> fragment, the driver frees the buffer, sets skb =3D NULL, and loops to re=
ad
> the next descriptor via goto read_again. On the final descriptor,
> stmmac_rx_buf2_len() returns 0. Since skb is NULL, the code re-enters this
> if (!skb) block.
>=20
> This check evaluates to true, executing buf1_len -=3D ETH_FCS_LEN. If the=
 final
> fragment only contains 1 to 3 bytes of data, this unsigned subtraction
> underflows to a massive integer. This corrupted length is then passed to
> xdp_prepare_buff(), setting a huge data_end and allowing the BPF program =
to
> read and write out of bounds.

I think the main issue here is stmmac XDP implementation does not properly
support multi-buff. I am currently working on it.

>=20
> [ ... ]
>=20
> > @@ -5924,6 +5936,10 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
nt limit, u32 queue)
> > =20
> >  		/* Got entire packet into SKB. Finish it. */
> > =20
> > +		/* Remove FCS if needed */
> > +		if (!fcs_stripped)
> > +			skb_trim(skb, len);
> > +
>=20
> [Severity: High]
> Can this trigger a WARN_ON and fail to strip the FCS for scatter-gather
> frames?
>=20
> For multi-buffer frames, data is appended using skb_add_rx_frag(), which
> creates a non-linear SKB (skb->data_len > 0). However, skb_trim() require=
s a
> linear SKB. Calling it on a non-linear SKB evaluates
> WARN_ON(skb_is_nonlinear(skb)) and returns immediately without modifying =
the
> SKB, leaving the FCS attached.
>=20
> Should this use pskb_trim(skb, len) instead to correctly handle paged SKB=
s?

corret, I will fix it in v3.

Regards,
Lorenzo

>=20
> >  		stmmac_get_rx_hwtstamp(priv, p, np, skb);
> > =20
> >  		if (priv->hw->hw_vlan_en)
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260921-stmmac-rx-s=
g-fix-v2-1-b6d88c5ac2d7@oss.qualcomm.com?part=3D1

--1TNf89TMGOGdcDOT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarN7ugAKCRA6cBh0uS2t
rBi0AP9hcsdpac8wgxMDEs+MHETqGtUGE2Hprlajiq3NcqG/qQD+OpZXz68yccaq
RjD45w6SHo7JfADDJWps4No434m5yQs=
=Nfiq
-----END PGP SIGNATURE-----

--1TNf89TMGOGdcDOT--
