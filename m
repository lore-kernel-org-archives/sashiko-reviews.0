Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2978F26
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253010; cv=none; b=TsD7+ZL0EbWccZEv+fYLaYjAYuYdIS+e5M8+tH9p5ihJd2bHvAfEpDQeb3bT7Vc0L2rvY1Szkv0wrg3scmlRMI5sg4lTMESHXTBuruIzy005qqJNlEODM+qd9Z+ekF7v2TVCTCe2qMBSuZodARs0Gy1UnB3a+lIGJUEG1OyaRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253010; c=relaxed/simple;
	bh=rLoP+8AdeVcNoLEUQTPMwpKqDoL+RwcmyyA/MCerNQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqzJb5sgRrdyky+a8EE5KjDO7BDgALOx90DPtuIANDZUPJdPbSDv5vsgPFcH9PNmcp955hE5F0R/jddAqhB2T+LHJbdYlEzA+yn2G5FQoA9qE/UXZul7vmv6JLPJLzfsi3EREfUVZm6jZiM7awvVssoxO/89hk1UMwYfwtUZ+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eD+vxzK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg3J98Ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eD+vxzK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sg3J98Ma"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4UXq3282819
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7KjYp97LSimxNB6wnmcIUULA
	nNTLiQ96GWyrzK4TKGg=; b=eD+vxzK5sxi0mRDRJzbPXBMRPA+j7uKS6c7F3hH6
	yCnWyl4FgvYDny5SCN2QcKlq4WwQldTj8guiFN6lcaNWH74nwZta7VKxaOMUyOhv
	hscbYnWj6JngdHYQakFg+DhE4LfOqMwlQD+9DZSpb+fqyjTZeDyJ4T++DP75DUKs
	FlU3NXR4gsJ0FNPC5o6Ezq7RNbNPAXATtE0LYeGuMKEV6yWISgrqKo41fvtKJe83
	Q2LNJ0V084UEqryWtRruIFUkbvax9hGyJoDb4CAdhtnsj4DU/C6cfek079/S1q0H
	9PuOsWiKCD25kbBJl4LkJuKJ9MP6XXqkHske4gebWdGoIA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujk5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:30:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so573570137.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790253007; x=1790857807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KjYp97LSimxNB6wnmcIUULAnNTLiQ96GWyrzK4TKGg=;
        b=Sg3J98Ma9bL8O8O+LmRy3XIRldOEwFaY7Wl9iv8lySgEVuBBctrF3BeCkWNRe/nGqp
         goHxaw0vV9UFWkRdlyoIG9znuhv4sokoDfRYKELzONs6dq5z03fW/qho5+v2AaIenwdT
         Z7ebBv6DCP+oXMj8UVNnrzGhFK2v0ZG2et3mwwSGi7vQlxqaMqjr+Nkv16lijWGsf9Ar
         3fSGo5ATR6M66R1ZnE0F68Je+M/2wyHR/XzRg89DFKibDGTm/gO6T2TKh9cD0oHdYgdc
         qnKFZj0HeJ+6nWtqY2t5TzwXoc1ikj8bVgbHgNXOS/gZxNS1jEl4wN3bORU8j84zgcVU
         GuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253007; x=1790857807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KjYp97LSimxNB6wnmcIUULAnNTLiQ96GWyrzK4TKGg=;
        b=Wx8Xt7h3dD4ibJ0IjHBiGtHFeMHGjQlCNWX0xQBGSW+Ez4y2Qtu0h+aJyks6NbhqNF
         pfc1SUaxNIOijCZI8OIWYUCt9PzrEXvCofrTEbrwZdc2d/MMZxGDnTJdgIKWd99juRhe
         +Cwo2sNG1hFsQOF0BJP3FA16kZqSRftmvaeb3dnO4LQJ5hWxtFnxi0B/grFKrw583uWv
         safdntJWDDi8/Yq7NSxe0leP6F7E4Rhp22Gi+i0r+oFmX8HfME7g4roSstyP6iuM/H6y
         0v1c6RzHugWA4nHZ2MlSHfmN1rS+Y6C5xav/MTF0uC7mgYVji/SGR6+TGODubWSGUrKj
         nmfQ==
X-Gm-Message-State: AFuF++nnlCFXlkTR48i7oCc1HJZnDZfMaKaaT5UflpEHHP2LQ/StpOHW
	gR586aB0t2EhJB0v9CsPtrw1kc+qZnNlKny5PQmyliz+Es1v6YQydVlmKRCq6BmKbw2c/Iem2He
	2PfCBXzqvEm3iXN4/PSgEAtfe/y9W0KUoz0LqBHUCVuVZj3aMS70pq/NDSVLzhZYNV+pqUlVUif
	NTmNE=
X-Gm-Gg: AYBFou0e2tRSiWVcqTq2vT8WkFxMOJnheSHe8APeRkRZKPsuxsoiLT15FJwrhxR9lkj
	USYg0R+KJsR5c75y/Abq2yg1KKvd/VGaO3R8H1u6q1GI4IOPCmA+Qd3+IyrVKhXtp2Oa58Iu+lz
	rasHHDUZRO+mfAtQGLTvKbqG7pK5AuvvBtIXy040W9SnkxJsGPb94qzNcOHS3q2F2NjLmpRgtVF
	chlfS0IXRCKYRvdzCdPnitwNpK9Ri5IAkeS7nZWuNZYhLukxaPFJII/jfwBQsRI6oDS1LC1lG0L
	1YqEIwlvDrEW3C6EagC5w0bSLlJLq4RXJLmSssGqEpWm/3hnl7ht9eY/66Ga/sjxB3akhnZM7gW
	1pn9Q2rwwGuwIzw==
X-Received: by 2002:a05:6102:1489:b0:7a7:ad9f:53c7 with SMTP id ada2fe7eead31-7af1cb95fdcmr1018456137.11.1790253006773;
        Thu, 24 Sep 2026 05:30:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a7:ad9f:53c7 with SMTP id ada2fe7eead31-7af1cb95fdcmr1018447137.11.1790253006112;
        Thu, 24 Sep 2026 05:30:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b44db6sm71327215e9.0.2026.09.24.05.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:30:04 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:30:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: add XDP multi-buff support for TX
 side
Message-ID: <arUXzOU6V-VeWOOd@lore-desk>
References: <20260923-b4-stmmac-xmit-mb-v1-1-a71a1c522142@oss.qualcomm.com>
 <20260924100004.F06341F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUjn4NdSVny70mPK"
Content-Disposition: inline
In-Reply-To: <20260924100004.F06341F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX1Pbi92a0a7q2
 3BRLIHf1yyrYuEaJ7dmUyS/Adxw+CrPMUgN7sHPHVF+ap3uU+UcDXrOzd1PnRAJNkagLSkw9djD
 rXG4IZzCOOkya2asv46U36wRnv3UdSQ=
X-Proofpoint-ORIG-GUID: c2LcUkmtJ6egyjEY_B37yj0T3GM9BPYO
X-Proofpoint-GUID: c2LcUkmtJ6egyjEY_B37yj0T3GM9BPYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX0TZrhuZLgpws
 XrLgAkX7s1GJZBK35EVYfBc6OAzSdBYfTL4C34miU8yC/vNxFPcJRXvPJgfwVWFuBIT+kXhE3I5
 T/tDLG8RAQudtUANgdpqi2xLoI6ezjYV/Lho+zcbmMg/EMi1DY1CZyW9kZXOI/8r7gokucXwY01
 wV/oj2WBB2PiaOp6xtaLMbjEt05FH695GEZ/BaU2kxU6KISDP1lE91GcFyMBKMCiJ4PO/eEzA4J
 WCctJ1K2Pv31gYUvElWcLe+8S24LFbzq4QDt7pwCsVeD1cCvRSUgWJP80uLeZ4Wx9tO49gZLJ6Q
 O5ZLyTXVu93cqepwXuwd50HAWx4hTj38dZm7n7T+nZdELqvRcyTJRfb0HoTWyvflofpqNKdxVoR
 ITEE4XYMvZ8V5Z6oP5654VkrjxkFHaRHVgikKvuBU3yzouufq7rrUw+WhDH8nbW9j5TacSvg0oA
 LpwGFVH3PT2TGoXgh9g==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab517d0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=DCGDLcMwuHKad74a2KwA:9 a=wPNLvfGTeEIA:10
 a=3NKNv0CXayPCOFLLcBMA:9 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

--sUjn4NdSVny70mPK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] stmmac: exact-match coalescing logic skips TX completion interru=
pts
> - [High] stmmac: missing memory barrier before setting TX OWN bit
> - [Medium] stmmac: XDP frame check removes SKB TX threshold reservation
> --
>=20
> commit 4955fe9fec58eed4009939eaf9ed4fcf2a742ee7
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: add XDP multi-buff support for TX side
>=20
> This patch extends stmmac_xdp_xmit_xdpf to transmit XDP frames with fragm=
ents
> by mapping and programming each buffer into a dedicated TX descriptor.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index bf9e7e4cb1c31..41ccde6371ecd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5239,77 +5239,114 @@ static unsigned int stmmac_rx_buf2_len(struct =
stmmac_priv *priv,
> [ ... ]
> > -	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
> > +	if (stmmac_tx_avail(priv, queue) < num_frames)
>=20
> [Severity: Medium]
> Could this change lead to TX ring starvation for standard SKB traffic?
>=20
> The STMMAC_TX_THRESH check was designed to reserve a portion of the share=
d TX
> ring for standard SKB traffic. By replacing the threshold with a check ag=
ainst
> just num_frames, heavy XDP loads could exhaust all available TX descripto=
rs,
> potentially leaving 0 descriptors for SKBs and monopolizing the TX ring.

ack, I will fix it in v2.

>=20
> >  		return STMMAC_XDP_CONSUMED;
> [ ... ]
> > +	tx_q->tx_count_frames +=3D num_frames;
> > =20
> > -	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] =3D=3D 0)
> > -		set_ic =3D true;
> > -	else
> > -		set_ic =3D false;
> > -
> > -	if (set_ic) {
> > +	if (!(tx_q->tx_count_frames % priv->tx_coal_frames[queue])) {
>=20
> [Severity: High]
> Will this exact-match coalescing logic reliably trigger TX completion
> interrupts?
>=20
> When transmitting XDP multi-buffer frames, tx_count_frames increases by
> num_frames, which can be greater than 1. The modulo condition relies on an
> exact match to 0 to trigger the Interrupt on Completion (IC) bit.
>=20
> If num_frames causes the counter to overshoot a multiple of tx_coal_frames
> (for example, jumping from 24 to 26 when the threshold is 25), the IC bit
> will not be set. This could indefinitely delay TX completion handling and
> exhaust the TX ring.

ack, I will fix it in v2.

>=20
> > +		struct stmmac_txq_stats *txq_stats;
> > =20
> > +		desc =3D stmmac_get_tx_desc(priv, tx_q, entry);
> > +		stmmac_set_tx_ic(priv, desc);
> >  		tx_q->tx_count_frames =3D 0;
> > -		stmmac_set_tx_ic(priv, tx_desc);
> > +
> > +		txq_stats =3D &priv->xstats.txq_stats[queue];
> >  		u64_stats_update_begin(&txq_stats->q_syncp);
> >  		u64_stats_inc(&txq_stats->q.tx_set_ic_bit);
> >  		u64_stats_update_end(&txq_stats->q_syncp);
> >  	}
> > =20
> > +	/* Set the OWN bit on the first descriptor now that all descriptors
> > +	 * for this skb are populated.
> > +	 */
> > +	desc =3D stmmac_get_tx_desc(priv, tx_q, first_entry);
> > +	stmmac_set_tx_owner(priv, desc);
>=20
> [Severity: High]
> Is a dma_wmb() needed here before setting the TX OWN bit on the first
> descriptor?
>=20
> The new logic loops over fragments, calling stmmac_prepare_tx_desc() with
> tx_own=3D0 for the first descriptor. This effectively bypasses the intern=
al
> dma_wmb() inside stmmac_prepare_tx_desc(), which typically requires both
> is_fs and tx_own to be true.
>=20
> Without a preceding dma_wmb() before manually setting the OWN bit here,
> the CPU might reorder the write to the first descriptor's OWN bit before
> the writes that populated the fragment descriptors. The DMA engine could
> then process stale or uninitialized memory.

I do not think we need dma_wmb() here since this is the same logic used in
stmmac_xmit() and the barrier is already in stmmac_flush_tx_descriptors().

Regards,
Lorenzo

>=20
> > +	tx_q->cur_tx =3D STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
> >  	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
> > =20
> > -	entry =3D STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
> > -	tx_q->cur_tx =3D entry;
> > -
> >  	return STMMAC_XDP_TX;
> [ ... ]
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260923-b4-stmmac-x=
mit-mb-v1-1-a71a1c522142@oss.qualcomm.com?part=3D1

--sUjn4NdSVny70mPK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarUXzAAKCRA6cBh0uS2t
rE2mAQDUWRyR28r7qW9noRVrFq+1hrbppbhjx5CFpQ4kZUMuogEAqHYdpXIxc76u
XE3fBz00QLmevzugPas9/IkBIRK+lAA=
=JQJ8
-----END PGP SIGNATURE-----

--sUjn4NdSVny70mPK--
