Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CBD254B03
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255369; cv=none; b=auw6bPP383I0TEBC2xQ9d/bxA97e58GDs7S3wPNRZEQLivqrSyFTqiQ3fkhyE/qPZMWi/Tl7m67NjjjCYhyc/7zAIw1tOTnVenXdMvh9a187r2l/KlGjROzCQK4lWSRRVxZZH695wYPTrTUK5852Ir5Tmz/LWvubuDStKyYijTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255369; c=relaxed/simple;
	bh=K20z5KdEDNBYJjms9B6M7bbuf2L45raKVNV06fzhODU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nkqs6/42PbxKVgDGwJLWwekk6P1nFRE/WOOWRhkjw/AZN3Vf9foRxbD7O6m1dAlA4Zjok2DdwJvo0k/jQ5nUfoRS4imSs3XxsyzUzj6IlVWaPZzHy5oQjTdWe9gAOZzMNUpl7L2dIKwG+yKRzvO9JfQ004au+bqsWi0enTMjDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2LVtzll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpX+HfHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2LVtzll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpX+HfHH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4tqP1630816
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJblM9eQe24SP0aeNv4kejjE
	EyuI+il0QPjmzJ8Cpu4=; b=Z2LVtzllDpynAhqcIKhamXkCC+sXNPYYB1bsNP8C
	QjruEfbcuwmsw7u9uVcTBK1wnqWW+OzW6L12ceCjRfDCje5xV1Bs/B9a9U1WvymB
	tK5LkIR2A16H7fxj1X45tqJuB3XSQ6VTQrvE6tT8Yx9GmE4m1LSHvmWeckXPLJE8
	juf3Cpv3DGFPXIJRRdub1tuJL/pYQSqg4KtMSZzK7o2OfZS9rDL72H/BhV9R1aWA
	RF/DsHQ1UtQoFNof+lJwaXybrnmkrRF7EG7xvaabP2avSPfgg+DkVqubGL8dRxm7
	/7yq4Jz6SOOsH/k5yx+3c6gPhVJq6ZYI6teInCu5dW+wxw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90b6c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:09:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97caca2faacso268170241.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790255365; x=1790860165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJblM9eQe24SP0aeNv4kejjEEyuI+il0QPjmzJ8Cpu4=;
        b=kpX+HfHH7HAzLoHLZVNQmN0I6xrZmwcQqoUFwJsczK0HluSxbSg9qja9P9c3WMxi+H
         BMJQ6lV414tarrDi1+mv4ro4xlzrgl6V49BxtcBiwFnoztvu7Z/2x0GexpECc08A3uzX
         EP7k6Mv/2wCVevmYbn7VpFHtlgEw8MuCCwXWgU9bifbEqLufPTaBRb4VVoxASlqIWcEq
         s1INgUXf0ctItX/7vKl2ktmYBN0ASveOWXyCo1GpSyDFOT4/Sli3tWFn8G/7Cd4MrNpL
         PJvdtWvr/YsZG/O96OqysL7ATMbElDIaK244W6d2wPpWMM25UbI/4TcX2vH+Yz0aenZU
         9lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255365; x=1790860165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJblM9eQe24SP0aeNv4kejjEEyuI+il0QPjmzJ8Cpu4=;
        b=icEV2GjtNRr8jHEahbObPdNKmEJhfCf2ymnqvuAP7VA1IWRt6sU54mEL67HzPiwtbz
         z+f25vvA1Z/mu7JIrO3vfX7S1NDRONtaGjWyiMxs6nJR/gPqPHgs4G32CwQafqzxAez9
         9z5ycNsy+yY0iiYs7xSfIxmXwK5eE4PfxUxDaMXrWpbUv9bMC1X/QLD9EqUwojJKrEov
         NyNK4qXKO5D2BHpJuafqR5HbG5XqY690Xh8wXnsOrgFhqKr9sh4O578M542/ciCm+D4q
         XTrXgHZoBU3CFWoYHIJHSXIm38ccfaLV8JSIHPI78EX31VFPF2bs/luLz+646RjhKKWv
         0ohw==
X-Gm-Message-State: AFuF++luMGsM1zpDweoog/OgTJdPdfJWrwmr3Euioy2Nl0j0Bm6MS/Kg
	t1412QneGtpSOA6rFESbKjEJb623jjNCSVyjkY9B/JlLfS6uSwCcG+AZ9+BAZ7GHOD5wnsH85Ed
	b4DNowWOQcobKj8657WZneNOdQJwjnWHQasZPTSlp2udXqqKro0B9FFLfWjkYdRkLKOJFm0OAgH
	i/ENk=
X-Gm-Gg: AYBFou3XVICHQD5OGq1WgKYOv+BIxydoXuKbGnaxoJ2Xd36wZ6gnJXmnT/s39nye5dM
	LGqAxFjTzG8i6+9lh7nob4Xqh4vcP5M2m9JP35KhLGQhQvuID3tvc8biwTTlCt1WugaVVuW+fHw
	UwJWgaKrdC6CwIRpe5loWye286T+U8sNumXsZZgKti81AePsuG1pS68NymIUKzXiaXEfKyIgTdZ
	bJZi9bTY9juq/ZaYJz8Bvwl2b1GlttxEE1WzI0EgsO97hM3xzr4XtfR3ci0wq3JTnU5q565Hlzn
	qJ/nelK0XtEOVAF5zOEZqKL4ZIys9g/XAdm/Y69piavdJzhoB4xPOkFyu8VtGveIQP1CWbao0Ve
	k9LMy0KvdrbXwJQ==
X-Received: by 2002:a05:6102:809c:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7af1c99c6c7mr1206535137.7.1790255364478;
        Thu, 24 Sep 2026 06:09:24 -0700 (PDT)
X-Received: by 2002:a05:6102:809c:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7af1c99c6c7mr1206513137.7.1790255363640;
        Thu, 24 Sep 2026 06:09:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm15181766f8f.23.2026.09.24.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:09:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:09:22 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net v3] net: stmmac: fix rx Scatter-Gather support
Message-ID: <arUhAnZ_Kw1x_bTr@lore-desk>
References: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
 <20260924091530.0D9131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kJ0SgG2RFZtc+RiN"
Content-Disposition: inline
In-Reply-To: <20260924091530.0D9131F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX7TLqezH2+p1P
 SMAfWZyCsZdBMc3c5yXnWkLu+eSfkPrM0UQ0FT079UssupFOk60/x1nMbt398HJKAtlGhdqoPk9
 +a9dgzr8+4Hl9F7xiS5xnzRdkzdGRZY=
X-Proofpoint-GUID: T67mQ6SBDmCvqkEDI9Szqf27DS7uimvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX0bBJX+SyMjbH
 KQ785n1QSbt8cFVNgbvyu7zB3l4DmjHCABFC8doZOcwp1MKdpgCc1JJx7o80JvKuI2NfZOZfot+
 LPgzVwE6cfqY+9Hq+QCNCidxFgB90w4/t/RIUGGoWzIHm+q0P/40U3P5ccgVf9HduWxFVa0BHNe
 VDRHqGlADK1bwAyFecP+cT03QfaqA68IFEED7u/IWfOUBY5xcqXb7m7mbUIMoM3Ayc/oejUFkBV
 tCbQMcpcZ6GvF9mBF0/eFcjegmjtP7Gt0/7BFddmvrYG+9J6PEGvRWeMB3j+1Ye6Aj/GeL+JyNo
 MX1Xz0fUIjJt2k6U68h8GZf7lXQGlADs23vpvkAlUQyd86MHLXPhZvTP6R+nB+lAVrL1nTD4189
 cR8s//F89Ev+AbBcV4h5qRTpGyxrF9XcAe/hc5CdyNMDyJewz1C+UpzZnvBspXk993lAy8CTwNd
 dZBnClJR2mjOB+zAWEA==
X-Proofpoint-ORIG-GUID: T67mQ6SBDmCvqkEDI9Szqf27DS7uimvT
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab52105 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-FYCnWXEDJGIweOeXlsA:9 a=wPNLvfGTeEIA:10
 a=Uk23vyCusddH8UGuAsIA:9 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240054

--kJ0SgG2RFZtc+RiN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] net: stmmac: data corruption in multi-descriptor frames with XDP=
 on legacy MACs
> --
>=20
> commit bffa481d7cb386a04b24759408cee45add543fcd
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: fix rx Scatter-Gather support
>=20
> This commit enables scatter-gather for non-SPH frames on GMAC4/XGMAC core=
s to
> address an SMMU translation fault on oversized frames overflowing the buf=
fer. It
> also updates FCS trimming to use pskb_trim() on the assembled skb instead=
 of
> subtracting it from individual buffers.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -5809,24 +5814,25 @@ static int stmmac_rx(struct stmmac_priv *priv, =
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
> > +			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
> > +				buf1_len -=3D ETH_FCS_LEN;
> > +				fcs_stripped =3D true;
> > +			}
>=20
> [Severity: High]
> Does this incorrectly strip the FCS from the first descriptor of a
> multi-descriptor frame on legacy MACs?
>=20
> On legacy MACs, buffer2 is not used, so buf2_len is always 0. When a scat=
tered
> (multi-descriptor) frame is received with XDP enabled, this condition eva=
luates
> to true on the first descriptor.
>=20
> Because there is no check for whether this is the last descriptor
> (!(status & rx_not_ls)), it incorrectly subtracts 4 bytes (ETH_FCS_LEN) f=
rom the
> payload in the first descriptor, corrupting the packet data.
>=20
> Additionally, because fcs_stripped is set to true, the actual FCS at the =
end of
> the frame will not be removed when the final descriptor is processed.

This is a real issue, but it is confined to multi-descriptor frames in XDP =
mode,
which is explicitly unsupported. Within the supported scope (single-buffer =
XDP),
buf2_len =3D=3D 0 on the frame-start descriptor implies a single-buffer fra=
me,
so the FCS strip is correct. The proper fix is to handle multi-buffer frame=
s in XDP
(including FCS placement) as part of XDP multi-buffer support, which will s=
upersede
this logic. XDP-mb support is already posted on the mailing list for review.

Regards,
Lorenzo

>=20
> > +
> >  			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
> >  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> >  					 buf->page_offset, buf1_len, true);
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260923-stmmac-rx-s=
g-fix-v3-1-ed26fea7180d@oss.qualcomm.com?part=3D1

--kJ0SgG2RFZtc+RiN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarUhAgAKCRA6cBh0uS2t
rEs7AP91neyBZB2mEyZP1PxNK2PZNPyU86jzGSOqbd5buOwCuAEAk8YTqwSKGDn3
T0dNZ8C674N7jIOSTQABTvFyrzFd+go=
=EEEF
-----END PGP SIGNATURE-----

--kJ0SgG2RFZtc+RiN--
