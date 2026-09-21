Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDCA44C502
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980681; cv=none; b=WdMIDKFlbwaaEUFvwrX1X9QGVA8EDierfNW9eFbAVKH7bw9BtzcvLiFxkvdk0aAYEJYk/qt0WUuvuVwHxAq1vlsamPzKWLbCBTvWWzAbOHIB57JXuWU/5jzrcMB/WxqH9c3/oPaSYIJazNMGQrzqjRS91vCZbLwEckr9Z3y9AvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980681; c=relaxed/simple;
	bh=UA2qswNCC4KFXd1yXSFusV/yF72GpwJUCYGfx3jAk1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/lkXzyqIM/RUiky/+phXRPGbG75xCRIo1VtAq4mATB0CRThtgUn6OSb6H28ELhyQ9u8Dbz4ZfN/OzXXTXkmJg22LjuBWYuk8OyKzTVvtWarkdbRRCfQOMtmFhfZ4NBOjarZxgtJZ7b7dYmR2Of2BHG04i8bq5T2McxJzVoaDfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=astL5GQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4rR5p9U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="astL5GQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4rR5p9U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3bx957080
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p1CfrvGoTRUhg6G3d7D0A29V
	ToswFi0wovgwJblAtlM=; b=astL5GQI0xLgRlekDlFX7/5PPji5US6ECDqaFxmo
	2Fz15a404kZEPDO6XlMnK59QXElIJVlpxdBgi5/vIpcr0Pyb7F62mdTyfgtD+3FU
	vJ47ht1O32qTfxVOooQ2N4aoss7Nwm4BT8jg+PT8tP1Afxv73I3zydOGPopd5+5R
	Kyll8+e7CSs3gL/RHg5VGV40+CFhwnOp2/uif7VqtQKnphFxSWE+7Vq967Z1339J
	2zOjPEabhSstVNf0NE39oAuWpKJ2dhlSB7XfVut3LEeGhPoU6P9iILvvsW58Xa0d
	FO8TCXpYmaVkoUzncw8wi3NiilH4L/+tx6fP1C44nIFIHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0bxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:51:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso286654285a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980673; x=1790585473; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1CfrvGoTRUhg6G3d7D0A29VToswFi0wovgwJblAtlM=;
        b=E4rR5p9UwUOFoKjbEynT/KkuYehzFfb3cO1BMcalRHz5KXYP6jtgRkeLksDSWwwrmO
         Qkjxq8GshdrsiZomcQsh9rKkxbr3GRAniE+WQ0H55GfowgTrU6jq6K/brSN3Y+yKP5j9
         iXKlVLxXj2gZ/vGKBcj8IFOA/nbDtDTTIKLT6phIaCIrmgwXAO0pMwo2W3sL+C/5nqu5
         zaNVDjxihI2yTq/4u1zBmw5drRrFCnDH/6RpeOBW+EzONTW97LXkVxZScaxZuzSahfnq
         UKqeU4VRVEx1sLwKG9KEUFtpXCwii4Udq98jMAwoab6vIQgKgTcy9vYqq/l9RBlkzwjN
         2n5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980673; x=1790585473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1CfrvGoTRUhg6G3d7D0A29VToswFi0wovgwJblAtlM=;
        b=ERqfO2Y4pKl1bT5qaYQQ6TkFLQpXbrs/gLzF/GM/jvYxTFTpguwxsI66NfVhFK5pQd
         Z2IEAz2kT0vIZFKujwR8xJmNdmvkbEi2fb7ETcuVZazGiL8gNSMEyAm/MM7IOz2fty8b
         hArxGSLA6E3lsdtxaC2ujuq7/cF+rkjBBANQ7mtaW67SW9G5I/Up8S1VSKFHLfZfBk1+
         kpqNf9N5+6uOeSUMzOsWB23t46UQWXweUfJYzVsNEMzrAjXzbwVdW4xolqj0wmvAJrD1
         SxWPgaPU3YisJGmrDTIzP5sqerf2qQxn9K/RA6h6kbEBlprC6XeZCENaEEpNsCXphkAs
         5FRw==
X-Gm-Message-State: AFuF++lyNo4yiMRqmAAPfAPtlyhIYd9ofwCwrHKxV7Hd++rLyLe8/L21
	UxTF3aYh2XAsD1nHO1gNWYw9z9CzvsCIn84stpVlKLLd8aBmADiCnZuFWelwhCOi2lsm3yldDcv
	/eT1DIjV22DLTySP/Zfwz7Ojp4Yz/hZKqbWp2UtjzIKAk2FPqHmIR/udll8s5G1dP6PGyJWxbqJ
	ZV8J8=
X-Gm-Gg: AYBFou3j7Qf+2OAAZ+RJwYYBQmK0W1b/rJHAAATqJ8s9FKOasO80t9R44Rsv/GXY25m
	fkBJTTW60OMzZ4MCWHYYJ9625BygyzlBtiPQVJzVBTp2tT7SWYmE2gX+mQ/xUm6NV44VmH9OID4
	MIJonhOC2xX4G+BVVGxEkCnZsJPd8kHtIavdORZ8i7rUNdM6cCY9OAdVwVHt1Ny03TIG1oaRYVH
	zaU0itp813NUcJdcSwvrBFRZ2A0uVUoQN8p8f1nu2Ok2RBpG0BGLoiIVYuDzjMFgzk6UEdHNzHf
	P0g9d8OwQReLHTDvIwcN99/qT2wv+NmWEFFETmvhbKeWAG4q/IycihsjsocyyAxg8vj6UKsv8KG
	xcge8toiV0PiFUQ==
X-Received: by 2002:a05:620a:618e:b0:93a:3ab6:caa8 with SMTP id af79cd13be357-93bf551bacemr865378485a.4.1789980672702;
        Mon, 21 Sep 2026 01:51:12 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:93a:3ab6:caa8 with SMTP id af79cd13be357-93bf551bacemr865376085a.4.1789980672042;
        Mon, 21 Sep 2026 01:51:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm208921365e9.13.2026.09.21.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:51:10 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:51:10 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: rework stmmac_rx to support XDP rx
 multi-buff
Message-ID: <arDv_snSh64pcSP3@lore-desk>
References: <20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com>
 <20260919150838.4B09A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xfOxl7a6m36ljBvI"
Content-Disposition: inline
In-Reply-To: <20260919150838.4B09A1F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: qC1h-IC44w466raKie6TLXGQY0T2VqIO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX/EBWQE3i6ulG
 G04/bkYhDmbIW/yONsbG0KVZSU28USx8FBbIftcy3O59NY7Mq93hVHZKaZbcQkQho0FDXVCoi1p
 F6JaXn12iuNctLAmT9bYHWDSGeHMX7E=
X-Proofpoint-GUID: qC1h-IC44w466raKie6TLXGQY0T2VqIO
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0f006 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=9glrN42jP_Nv8INrPvgA:9 a=wPNLvfGTeEIA:10
 a=XTngdorz1_1m2fKTPJMA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX6QE16xgJjxAW
 4wextp25kDU1gfVA0pfEEW3gUaYswW2rMmpmE0T2Rqgs9kCxk59xt2snpyHdH1VMlBGR1fT7mHD
 AEB21jYnzee6OaQ2ytOjkOyqSCdzBxO2CQuFS/HkozN/uLgMFD32hpJ3S64htok8cC5PaBuWpi5
 HevH2ljXZ8MPTN5DbEmnRDeZhrEHfPhlxK3fDUwo7CNBkyu/9+BPEIKfnswRcpDFUl4Q89uekuW
 PUt2TQ72gJUh/xIxSVia6JIewHvmtlL7n6dG/20of8yDiPGFYd1VBR/nA+LRQFBcA8hAhaXAJB0
 yzeneClYFFVa5GFvh1B5bOoD+SCpfFirS49ixaIAjmVrf2Ef3Lyii0/Jmk7VOpRtszvxjWYBzqF
 fuScPpT5r+rmgO4vDdbjiEWEbEAz9KNKuGcNqJ10Mzb1qFtiAPZiSIyUCeVuC2asCeU//oEZ2mJ
 c8i+UMLXcZmvmPDE06g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210126

--xfOxl7a6m36ljBvI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] stmmac: loop state leak on skb build failure causes panic and me=
mory corruption
> - [High] stmmac: uninitialized xdp_frags_truesize corrupts socket memory =
accounting
> - [High] stmmac: silently truncated frames bypass checksum errors and cau=
se data corruption
> - [Medium] stmmac: unconditional rx state clear when NAPI budget is zero =
leaks memory

I will address sashiko's comments in v2.

Regards,
Lorenzo

> --
>=20
> commit 342011b18b585ad2ea2189dab3bfe7efcf08625c
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>    =20
> Build the xdp_buff by accumulating all the descriptors that make up a
> frame, so the XDP program runs on the full (possibly fragmented) packet
> instead of just the first buffer. When the frame is not consumed by the
> program, assemble the skb from the head buffer and the collected
> fragments via napi_build_skb()/xdp_update_skb_frags_info().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index bf9e7e4cb1c31..1de8d9626c640 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5735,6 +5737,82 @@ static int stmmac_rx_zc(struct stmmac_priv *priv=
, int limit, u32 queue)
> >  	return failure ? limit : (int)count;
> >  }
> > =20
> [ ... ]
> > +static void stmmac_build_xdp_frags(struct stmmac_priv *priv,
> > +				   struct stmmac_rx_queue *rx_q,
> > +				   unsigned int len, struct page *page,
> > +				   unsigned int offset,
> > +				   enum dma_data_direction dma_dir,
> > +				   struct xdp_buff *xdp)
> > +{
> > +	struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xdp);
> > +	dma_addr_t dma_addr =3D page_pool_get_dma_addr(page) + offset;
> > +
> > +	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
> > +
> > +	if (!xdp_buff_has_frags(xdp)) {
> > +		xdp_buff_set_frags_flag(xdp);
> > +		sinfo->xdp_frags_size =3D 0;
> > +		sinfo->nr_frags =3D 0;
> > +	}
>=20
> [Severity: High]
> Does this code fail to initialize sinfo->xdp_frags_truesize, leaving it w=
ith
> uninitialized memory?
>=20
> If the XDP program redirects the packet, generic XDP handlers like
> xdp_build_skb_from_buff() use tsize =3D sinfo->xdp_frags_truesize ? : ...
>=20
> Could this random non-zero garbage be added to skb->truesize, causing mas=
sive
> socket memory accounting (sk_rmem_alloc) corruption and subsequent drops?
>=20
> > +
> > +	if (sinfo->nr_frags < MAX_SKB_FRAGS) {
> > +		skb_frag_t *frag =3D &sinfo->frags[sinfo->nr_frags++];
> > +
> > +		skb_frag_fill_page_desc(frag, page, offset, len);
> > +		sinfo->xdp_frags_size +=3D len;
> > +
> > +		if (page_is_pfmemalloc(page))
> > +			xdp_buff_set_frag_pfmemalloc(xdp);
> > +	} else {
> > +		page_pool_put_full_page(rx_q->page_pool, page, true);
> > +	}
>=20
> [Severity: High]
> If a packet exceeds MAX_SKB_FRAGS, does returning the excess pages to the=
 pool
> here silently truncate the payload without marking the frame as errored?
>=20
> Because the hardware perfectly validated the original full frame's checks=
um,
> could the truncated frame be passed up to the network stack where stmmac_=
rx()
> will set skb->ip_summed =3D CHECKSUM_UNNECESSARY?=20
>=20
> While the IPv4/v6 stack might drop it due to length mismatch, could bridg=
ed
> Layer-2 traffic or XDP redirection forward the truncated payload with a v=
alid
> checksum, leading to silent data corruption at the destination?
>=20
> > +}
> > +
> >  /**
> >   * stmmac_rx - manage the receive process
> >   * @priv: driver private structure
> [ ... ]
> > @@ -5831,6 +5911,10 @@ static int stmmac_rx(struct stmmac_priv *priv, i=
nt limit, u32 queue)
> >  		if (unlikely(error && (status & rx_not_ls)))
> >  			goto read_again;
> >  		if (unlikely(error)) {
> > +			if (!first_desc) {
> > +				stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
> > +				first_desc =3D true;
> > +			}
> >  			dev_kfree_skb(skb);
>=20
> [Severity: High]
> Is it possible for dev_kfree_skb(skb) to cause a kernel panic here by
> dereferencing an error pointer?
>=20
> If stmmac_build_skb() fails later in this loop, it jumps to read_again and
> skb will contain an ERR_PTR(-ENOMEM). If the next frame has an RX error,
> this path will be taken with that error pointer.
>=20
> >  			skb =3D NULL;
> >  			count++;
> [ ... ]
> > @@ -5914,51 +6014,13 @@ static int stmmac_rx(struct stmmac_priv *priv, =
int limit, u32 queue)
> >  			}
> >  		}
> > =20
> > -		if (!skb) {
> > -			unsigned int head_pad_len;
> > -
> [ ... ]
> > -drain_data:
> > -		if (likely(status & rx_not_ls))
> > +		skb =3D stmmac_build_skb(&ctx.xdp);
> > +		if (IS_ERR(skb)) {
> > +			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
> > +			rx_dropped++;
> > +			count++;
> >  			goto read_again;
>=20
> [Severity: High]
> Does this jump skip the loop header where skb =3D NULL and len =3D 0 rese=
t the
> state?
>=20
> As noted above, this leaves skb as an ERR_PTR for the next iteration.
> Additionally, since len is not reset, could stmmac_rx_buf2_len() later
> underflow, producing a massive unsigned length for DMA syncs and leading =
to
> memory corruption?
>=20
> > -		if (!skb)
> > -			continue;
> > +		}
> > =20
> >  		/* Got entire packet into SKB. Finish it. */
> > =20
> [ ... ]
> > @@ -5991,9 +6053,9 @@ static int stmmac_rx(struct stmmac_priv *priv, in=
t limit, u32 queue)
> >  		count++;
> >  	}
> > =20
> > -	if (status & rx_not_ls || skb) {
> > -		rx_q->state_saved =3D true;
> > -		rx_q->state.skb =3D skb;
> > +	rx_q->state_saved =3D !first_desc;
> > +	if (!first_desc) {
> > +		rx_q->state.xdp =3D ctx.xdp;
> >  		rx_q->state.error =3D error;
> >  		rx_q->state.len =3D len;
> >  	}
>=20
> [Severity: Medium]
> Will this unconditionally drop previously saved state if limit =3D=3D 0?
>=20
> If stmmac_rx() is invoked with limit =3D=3D 0 (e.g., via netpoll), the lo=
op
> while (count < limit) is bypassed entirely, and first_desc remains true.
>=20
> Does setting rx_q->state_saved =3D !first_desc unconditionally overwrite =
the
> saved state to false, discarding any partially accumulated xdp_buff from a
> previous poll without freeing the associated fragments and causing a memo=
ry
> leak?
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260918-stmmac-rx-m=
b-v1-1-0b4517d404af@oss.qualcomm.com?part=3D1

--xfOxl7a6m36ljBvI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarDv/gAKCRA6cBh0uS2t
rEIrAP9holad0HbELME3+Z22O1qB4P8slvEGzOsMl+S5JSbUcAD/co60WJW4Ynxi
M0OB0N3AMwYNyQ9n/YO+mFkIG6fVDAE=
=V8kP
-----END PGP SIGNATURE-----

--xfOxl7a6m36ljBvI--
