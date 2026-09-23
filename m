Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0525372C8
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172247; cv=none; b=i1L++zADY6rqb0UsGGJIFv9FDtTL1vENC03Du34DRxki5fJDlSFn+byXqDTXJqEfUSJ8EaiBAcBW+YOmnybfkEgrOWNJYje7OmmaeiMZaOSxgWV431mUUACjR+KwTcb+s36yzK8+vNBc3rYzztuDP+PxZzZ3ibDhToc+wo3buTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172247; c=relaxed/simple;
	bh=DWXEVR/nImyjT52a2AkdJ0/GtEHNPHqpW8sgbYZ1058=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGErES8RAQ8XVRGwICn68zW0Z3sLPhIkje4IzZbvxem0lMAHerxDH/+mHRA3pLcXBpaHAWMxHzRLxBOfFajf3nEtWtmhZzhQawBrtqXqoY7BMnvBNTvGL3ztTBv1tmop4YWvswEzuI0EKZcymE3VQ0Ds0wt4GU74ejj1BIWaQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkkJ8wPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ8lwcJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkkJ8wPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ8lwcJq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSa12443257
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 14:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kJg38mn8rmBJsAk2QglOyCXR
	PXF+oFVPZQNgrbNVJQM=; b=QkkJ8wPGG4H7MZNmeQ3EgodSLg19SdxVhi8Zbcza
	rTv+DJrguxu+5nbIlEvRtRXgdd0PRSh4Q2udsnqEOazKFTvk8La8JEdgjmND6QoE
	rOSsZggtTdFUOuG+qp1oArYlSF89JiCyV0w9UDIv5WkuMh+wWc2WJ4MakL76f8jh
	JLRE7JLUfVbPlsnxX8bsUcOCAuMDADhdv5mITUOMEj2ksH38OYd2gAqObiLjzP9m
	UWp4GIiSMq5vdkeuz4rP5zApyrvTFFgnyugJWu3Cg6yoAWk16xK8r58yJFPvgdU1
	QnmSkofXWudNH6aQinm4rEGxyl+T0KnNjIuKbZ8Z41OTfQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7h58g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 14:04:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7ac2663eba2so772619137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172244; x=1790777044; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJg38mn8rmBJsAk2QglOyCXRPXF+oFVPZQNgrbNVJQM=;
        b=dQ8lwcJqXXsiL+4Li16GFKEmjNoKAk7yp7zHDMXwfjbqBrrzkbRYzrpSUV9zrQBVPE
         WL5bkomSEPgMB1d5h93rNIIhkFTNbibdBvPlMIJNtlRpJ0JwOR4UQ/+rcTOyUOJLhqfu
         OoPR5hjBLOBZ35qD9x6q6QZudEG66ZD5UKNgSElfIjsBMtXmpFq+GjdGCKeKsg8IXJ+q
         SBM98jUusMzgeFMhFSBYm755fuN0GGiLgboBk9TUFhBAjVyiOzzBXK98Jlc+7O3mV4g5
         ua+2mBPT1ZPtBYLP5KJOVPS6k+vOrp//Fty50Zgaq9znI0AGCXOrusJ5216be8pLlN5l
         f2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172244; x=1790777044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJg38mn8rmBJsAk2QglOyCXRPXF+oFVPZQNgrbNVJQM=;
        b=RHjYcgeLUPjcO5+oXU9w3VhjxnYoPvJqNZelQZlWa2pZBpVtxJgREclvsLMCSY77ZA
         HPHvHjEjFfdXCFzI2bLBcplMyPt9EwEOKviyT4CFwyRJCBlLXcqNVBh2Y0SnXcXHinby
         v4uwBKpP/T/Tl9CkfRN1drj8VYNoeVwJuJN6jSd8DZaJvjCEgvApFWV4mUT8kiSLpHyl
         0ZkOndXMOrCAmBLebXmO/qh/c2GdbFf2MoKtNDJRhZ3uq4RWxdY7jkBXY+L3kwvXcTTe
         LemFV2T7+9NpuTFzUtlw6JT1Jq6hj02oCgPkcIz0E5W/25MX47ELntDL+p7skz/Lcgwo
         auoQ==
X-Gm-Message-State: AFuF++lWaNtiWSGl5VPphODrYkQePT9w/lEC5ZRoMQ1+zwlS+USKKdcp
	SHtkGCvrIMTym7brUWCnQooBS4vGb72GzHb+qgCTyGedMOuHbuxBUMC+bAJ8h8Aya7SGaOWBapd
	WQ1x5AT2e022oUgyl74E41HdUSJbSqIFi6K463mXSGKLd+DROBykj0WgOZx8uzyMMB3hYL/oJDE
	k474I=
X-Gm-Gg: AYBFou3h3re1sDTKjleO9TCsfs46zJr889pz7zBXKtOeL2ApBhh25xWdvRQwz0YOki/
	pVIRnA7LxVgNgp7VL9ol5etBYaFc+c1EFikYXRCLfqEM1HDYvxCvfviQ+IiNE7fsLBGT+9TeIkD
	TTHxZpQ7Ne06S+XlaR+HRaPw4YO9BDU2lbE6WorOJps+38tRfEfxmxcZXIb8f/pA0zjfx+AsaB4
	7Bo0OQbYh82XEjoanJ7N7toum2im7glT5jyta+AnkOSWzp++RfMELAiofaHGsM06uZhGyh6Flo9
	zN4wh4ejooCuQAXLdG58CkYLx4mVJ5E7zGBu5wXhWVXHsqSPW9iGcHchdnS72yJiYy2rwxhf+Px
	lOLb3S1MMVd7U5Q==
X-Received: by 2002:a05:6102:5107:b0:7a7:198b:6747 with SMTP id ada2fe7eead31-7ac1da2b2d5mr2613442137.28.1790172243260;
        Wed, 23 Sep 2026 07:04:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5107:b0:7a7:198b:6747 with SMTP id ada2fe7eead31-7ac1da2b2d5mr2613382137.28.1790172242469;
        Wed, 23 Sep 2026 07:04:02 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm7168688f8f.2.2026.09.23.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:04:01 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:04:00 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
Message-ID: <arPcUDeg6_oclSHM@lore-desk>
References: <20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com>
 <20260922085901.1195F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMKPKGpkZGkhIFnA"
Content-Disposition: inline
In-Reply-To: <20260922085901.1195F1F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: wno0fH7gmXNv9CrEuvVALhWdI1ifLK86
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3dc54 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=hWlZslobsKYm2kuh_kAA:9 a=wPNLvfGTeEIA:10
 a=WFXUMWCSyfWjG0GqNEYA:9 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX0LXx0WktaaLQ
 yLzSVI5Dqh+ZNPJ47eVbfxzgyL1Fkb62jvjxclww5y2HXhGe+MJ+PiIwvFaNrp1hxmuARCyCteX
 0vzxnhOuWLERzrnfO4n5AnQWlM3yVuiuknnOog97RWcAErfjw8/vV44eBQoQUpZ8oy5gnHHn+5x
 FG8Wm5nVa3+Yz9+bO0ZfcEhNlgdLp727Z1mjq5I8katcCRSEA7uj9lptUqfudH4z8Ip2JSofqC3
 XxY+IKhxH1DXvgxH/rCc5bvid5Ltuta6bK89aaX4HN/VsllJfY9IC/3b1ZocTQoeY7l29ph1M5M
 bf2XQfEpy8REvVWRGBdkoQp2hnF2FjWkrwwmc3GhxxeON/6I40u2lvi6O+IMvtdANrxsUsBg1xA
 B2MhrnHO15PO5ZWLLnKJNeUslRgu72S1ay7IfSQUjZBYkB6CdS/I/vnrBQ1xi19EBKmVWgdjDbS
 hUh798lNxaExr8Uf/0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfXxuAMvHlSO6lI
 EGtBYcj/NNc2KkZHDrrraAjx7ZeRsGf2fBswrewgdutxMt5ePI9j3tnS47b35VhAy2xURt3oyN/
 Yf3xZ5OcUNLaIL2ur/lG85k3HXezI84=
X-Proofpoint-GUID: wno0fH7gmXNv9CrEuvVALhWdI1ifLK86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056

--AMKPKGpkZGkhIFnA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] net: stmmac: missing drop accounting when XDP fragment additio=
n fails
> --
>=20
> commit ec049e650a3e45a0def65bd264e60d42d99ff7f9
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
> This commit builds the xdp_buff by accumulating descriptors so the XDP
> program runs on the full packet. It saves the state in rx_q->state across
> NAPI poll boundaries and builds the skb from the head buffer and fragment=
s.
>=20
> Link: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@o=
ss.qualcomm.com
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index bf9e7e4cb1c31..7d1149511c55d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5866,6 +5932,33 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
nt limit, u32 queue)
> >  			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
> >  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> >  					 buf->page_offset, buf1_len, true);
> > +			first_desc =3D false;
> > +			buf->page =3D NULL;
> > +		} else if (buf1_len) {
> > +			error |=3D !stmmac_build_xdp_frags(priv, rx_q, buf1_len,
> > +							 buf->page,
> > +							 buf->page_offset,
> > +							 dma_dir, &ctx.xdp);
>=20
> [Severity: Medium]
> When stmmac_build_xdp_frags() returns false, the error flag is set.
>=20
> This could happen when receiving large frames (e.g. Jumbo frames) on hard=
ware
> configured with small DMA buffers, leading to many descriptors per frame.
>=20
> Will this cause the packet to be silently dropped without updating
> rx_dropped or rx_errors?

ack, I will fix it in v3.

>=20
> > +			buf->page =3D NULL;
> > +		}
> > +
> > +		if (buf2_len) {
> > +			error |=3D !stmmac_build_xdp_frags(priv, rx_q, buf2_len,
> > +							 buf->sec_page,
> > +							 buf->page_offset,
> > +							 dma_dir, &ctx.xdp);
> > +			buf->sec_page =3D NULL;
> > +		}
> > +
> > +		if (likely(status & rx_not_ls))
> > +			goto read_again;
> > +
> > +		if (unlikely(error))
> > +			goto error_free_frag;
>=20
> [ ... ]
>=20
> > @@ -5989,13 +6036,24 @@ static int stmmac_rx(struct stmmac_priv *priv, =
int limit, u32 queue)
> >  		rx_packets++;
> >  		rx_bytes +=3D len;
> >  		count++;
> > +		continue;
> > +error_free_frag:
> > +		if (!first_desc) {
> > +			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
> > +			first_desc =3D true;
> > +		}
> > +		dev_kfree_skb(skb);
> > +		skb =3D NULL;
> > +		count++;
>=20
> [Severity: Medium]
> If we reach this teardown path due to an error, the frame is consumed and
> the polling count is incremented, but no interface drop statistics appear=
 to
> be updated.
>=20
> Could this make debugging MTU or fragmentation issues difficult, since dr=
ops
> (such as exceeding MAX_SKB_FRAGS) would be invisible to monitoring? Should
> rx_dropped or rx_errors be incremented here?

ack, I will fix it in v3.

Regards,
Lorenzo

>=20
> >  	}
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260921-stmmac-rx-m=
b-v2-1-6e826e1ff306@oss.qualcomm.com?part=3D1

--AMKPKGpkZGkhIFnA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarPcUAAKCRA6cBh0uS2t
rIbyAQCB2k2lvjMwy1yrSABsZIrY8BYsgfVYbS4r36VlHKfgrAD/V5MEZqQOmNJc
0Sapm6EkCgFfU+AF07MBj5d6KMQF/wI=
=WVtv
-----END PGP SIGNATURE-----

--AMKPKGpkZGkhIFnA--
