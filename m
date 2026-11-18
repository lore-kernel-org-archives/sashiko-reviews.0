Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040850;
	b=NX3uhy6TDBl90M07pX2+6IW7jBgE1dLwbU5Dkh7w8zTzuLwttPbv6XNbdNEYD1ErAnVb
	 UHPdwtiOEnc2rPusI3Sv9XHaWye/gd0/mL0QuG+pO+bJ8hZXjYgOL88QaUU0203vqfND3
	 FsFtGG//gztbG9AEZaaFzbkefOkNkskAXG8VQeWq+jRtozBO1TMTebj7JmgSNuyfE1yxD
	 IALAe03ZLXqdfa9GPA1he4LaP54PDU6bZqW0qZInMmvvchK/ResLsDos7yl3axjAVp2G1
	 yIDOU5/DzppzydDOWbmYgCMYU4TDp019sySeHZBMcO+oR3E21aWuXmaPI/PD/eMl0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ftD8DmGQkcZjK15m6DJUKldknKn9HL86+LXMBeEyEhA=;
	b=V7hhZIepIQhgLHocffxmkbkxtGUY3nB0L2PmrEuLMiI59X/cd1nIMiKDXwsA+G1SwrkT
	 zjFhCXlagzbfUNp5mGjqjcX0asIepq6H8J7VuFX6cH/9ACYyjqULAi31Alxcfxm5bR7XV
	 UV4xtvMs8wfBuTpJeKtUsBPBQhyhKeyrngIM+uOXlWFkDDBuZL8rZY1979EP0ETZXe07R
	 SZzmpI0cjV51PUkTx8A+xMir98uZA/WR87GE9+a0fEnE/CFhiRnsFY5Pegki7RtjjLIsy
	 tzF8LFIad/4uQvnjK0mMMGqjkqDYa/C87lHRGXcAZ14guJZt5JOGCw2/J7f/0RaoclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hr05ilKQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ4ygBRJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE7606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AE7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hr05ilKQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ4ygBRJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILPfMQ327998
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ftD8DmGQkcZjK15m6DJUKldk
	nKn9HL86+LXMBeEyEhA=; b=hr05ilKQkSd2mpJcHe5wzTnd1c7tIC+Fgh2zfTpS
	jAGjCz235xJ623wENGYLYV4Knp2AkwvmEPnIa4VA7C2Uq6bKM/ofFt++Az4NWK9m
	7q23WjxSc1LaXexEtl/A7etlb6allS3ICI4uEp91zDmcxHjWtJjWPK3U//QCBlWQ
	y59BeTvCw7nQXV/eWetnCNIpFdzAh0h669KZUSyIeKz1CrpmeAF5eB9n7W+R1dix
	FRiEs/wMzAwrdB8oLgrgIJU6HXGepMWAo9td4pOgfTJOrajXaSAeQ5DRPoZdcqzF
	Ghtv8b7M990WEEVuPsjmRZVx3RJ/ged0QNBIjUe3r+HJFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg1h1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:27:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso305237885a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 14:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795040847; x=1795645647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftD8DmGQkcZjK15m6DJUKldknKn9HL86+LXMBeEyEhA=;
        b=AZ4ygBRJXu2qrliUvwcuZWgPCOKRprbVEtycUkdGUJjq7pJWO6V9YxhubaCeyU8yHw
         jwADQEPej9CncwDWixmywz18heFsUDQpF4fxC78LBo5MgRd6MfgYMqFLnBhFQPzml9wQ
         Iqt/x2paWMaspE+CHBaqlQfbH8zn29wtBypdwKXSwNFvZ2/GG4uCu4s20ZAgUQhFuzSC
         arDoFldEOOam+lworwSLp7wyzlWXnnU6+5R2rw3hZX2GFo2BIKyNR5aWK4tumD5QoVz8
         5ZgxspCBCCDUELwPAtwg/xMbamFqCcYLwh62ZxptpmlCppTGQc5tp2iWan/SavE2S/0g
         VBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795040847; x=1795645647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftD8DmGQkcZjK15m6DJUKldknKn9HL86+LXMBeEyEhA=;
        b=1wCoUFljokXSBoQB1ZVko5aSI8T+9gAy6Uz2WNi/mCKNCdbVSer8TrFm9muF8iPZl3
         QakrDcSg2o2mlEsW+0n1DvaIAhD26buN0FcmudRw8w+Pp0TLshZTRDunlOEPHx7Ldace
         ep/HUsh4P5hs6O2u03h59XFB+3fC/yLkBCl3UGDvnGDi5ZUkBk4oeEBDB6QSZeidkaWh
         aR6IC7ucoPixJJrJmYdW5qjhvwSeY365H4xhwbd/5g6YjJq3OmWGXPCbXoGrXWMkVAc0
         iwYWQ/UkPNg9wes+9zgICuC4Q2IbmWiaHv7qXLlgM+7nXZHFF9j4TAitru/nT4zaHR5n
         crcg==
X-Gm-Message-State: APuU4Z+NzjpPzWW5XIFORVkx4d/fNyzA4M06xGrE3pjfR6fSd60YCR1U
	1XtSXzh/KresiAKQLx67RC9IxkAn7E/IFMHNfI/LE7p4/8k5LXeOOQZTb0I6hOV1883RkOdgp+S
	9OMUlMu6gdrbP+UMcffiAJ6bDMc2howOUiMzafXYc1tzWKPka5qK1cUzymCJcOj6CWDDXv68cNM
	gRy9KlYg==
X-Gm-Gg: AYBFou2qXTa+j1yGBwhrSLwZORC3MOueS4C6NnekFctbIT/7ShG0F5YQQts7inMRn40
	vLZBNT5/HxyezL+OW/7w42emPPdl14v/i1KfHfOjSKUAvxieCjf7PjcPyHmdTo+8q9Er6IuC3h2
	p8Fbq3LHwjrrxWucR/OE2KlOdCTeASBvlgp0scoJZ/HzfdpfOzab2g9UQIJOHIe6rUcyrQkt9vU
	0/SvRIFD20texXFGt3s/tEFjpy570alSJ1z84C239GsUnwnYbGiv5U38wle2ohkGy44Qr5ruy4+
	2QM0d9wH4ilv8xHLnlLCs1FOa1jJgcQXxpAhOHdmZrjMOaBmXQq1Krm8oLr0tgj7H4c5O+/kFPj
	QjIjaf9mTFv0yjtWUWifHWymZ6QaXsm5FxJ4pH++xigNtLNoUjymfs3EM0i+BVP0=
X-Received: by 2002:a05:620a:450a:b0:949:94ff:9967 with SMTP id af79cd13be357-9499964e541mr712020985a.82.1795040847191;
        Wed, 18 Nov 2026 14:27:27 -0800 (PST)
X-Received: by 2002:a05:620a:450a:b0:949:94ff:9967 with SMTP id af79cd13be357-9499964e541mr712016485a.82.1795040846469;
        Wed, 18 Nov 2026 14:27:26 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb845229easm2906505e9.14.2026.11.18.14.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:27:25 -0800 (PST)
Date: Wed, 18 Nov 2026 23:27:24 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix num tx queues in
 stmmac_xdp_get_tx_queue()
Message-ID: <av4mTCg0yVhGXQdU@lore-qca>
References: <20261117-stmmac-fix-xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com>
 <sashiko-outbox-221383@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C73daWWgzx+5qrlj"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-221383@kernel.org>
X-Proofpoint-GUID: F_oHgGY6700qkiXT9wI4nS_t5UbuaEi0
X-Proofpoint-ORIG-GUID: F_oHgGY6700qkiXT9wI4nS_t5UbuaEi0
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe2650 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=9CbV9yVBjN83Sfyp3LgA:9 a=wPNLvfGTeEIA:10
 a=nsqPKTQ3wIGvu-rJs_4A:9 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX4WpFy2NZZZ1J
 ofNtfjlrOUsj+EOXr2etSDohIqfD7XjR0xFV7+X77OMMDSv6E7jip/xSVK0RmnUwRgs20dOb3Ue
 h5cR70KenReSJWD7/VU98UMq8NPjuHA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MiBTYWx0ZWRfX3mi+b0NL72c8
 2LEQFRz3He7IhDJwPGvc/i7HnJBNeuvXh5PNSesojb8rOoOHOXRkVQX5vkHqXjGu2nvF5aNqhZu
 HP9Nuob05M4i1EgwzklbwiReV7XeArgqD+x09+OyMENgmlMZ1/UUKbulw8XpQYlFmBKPijruHzu
 3vhzG7uRuZkwq/AKpvIO4J9NQ+RVIDcp2L/jcAb5qt4nynl1xw/TEK1YdfsC7hzbIQDYdUz4/1x
 4zdNgHesK41C8wFpDY/PGZF7/TxjSXjWFrUSHaRwNkhAV1U/1Mge7diTszNAt8Uvf2FRknEK/8K
 ln2jy7bIniZwN4ZCBzj1YpHcr5QUEDuw30KY9rLal7Ksi//g5TaghsIoqp5zhXOciX+p1yPDGkC
 pbXQrg99IhnrJ0YCbXKIFLDEKOUxicNuyOg8zdNxM+TNyndYV8nF9xRpkKOzZ83t8x+k752wm6v
 Ex4VOIY+fgH+YTkj6HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180082

--C73daWWgzx+5qrlj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: stmmac: race on num_tx_queues in
>   stmmac_xdp_get_tx_queue() skips txtimer
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] net: stmmac: unchecked return value of
>   netif_set_real_num_tx_queues() [1]
> --
>=20
> commit f55af370614a4d0bb79d7ac40f036cd36c0c9e78
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> net: stmmac: fix num tx queues in stmmac_xdp_get_tx_queue()
>=20
> This commit bounds the CPU-based TX queue selection in
> stmmac_xdp_get_tx_queue() by priv->xmit_qdisc.num_tx_queues instead of
> priv->plat->tx_queues_to_use to stay within dev->real_num_tx_queues when
> tc-mqprio offload is active.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 25894771e9e9f..cf87afd273439 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5408,13 +5408,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_p=
riv *priv, int queue,
> >  static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,
> >  				   int cpu)
> >  {
> > +	unsigned int num_tx_queues =3D priv->xmit_qdisc.num_tx_queues;
> >  	int index =3D cpu;
> > =20
> >  	if (unlikely(index < 0))
> >  		index =3D 0;
> > =20
> > -	while (index >=3D priv->plat->tx_queues_to_use)
> > -		index -=3D priv->plat->tx_queues_to_use;
> > +	while (index >=3D num_tx_queues)
> > +		index -=3D num_tx_queues;
> > =20
> >  	return index;
> >  }
>=20
> [Severity: Medium]
> Can stmmac_finalize_xdp_rx() arm txtimer on the wrong TX queue if
> priv->xmit_qdisc.num_tx_queues changes during an RX NAPI poll?
>=20
> Unlike priv->plat->tx_queues_to_use, priv->xmit_qdisc.num_tx_queues is
> updated on a running interface by tc_setup_dwmac510_mqprio() and
> stmmac_reset_tc_mqprio() without stopping RX NAPI:
>=20
> CPU0                              CPU1 (<softirq>)
>                                   stmmac_rx()
>                                     stmmac_xdp_xmit_back()
>                                       q =3D stmmac_xdp_get_tx_queue()
>                                       stmmac_xdp_xmit_xdpf(..., q, ...)
> tc_setup_dwmac510_mqprio()
>   priv->xmit_qdisc.num_tx_queues =3D n
>                                     stmmac_finalize_xdp_rx()
>                                       q' =3D stmmac_xdp_get_tx_queue()
>                                       stmmac_tx_timer_arm(..., q')
>                                       <-- q' !=3D q; q's txtimer not armed
>=20
> Because stmmac_xdp_xmit_xdpf() only sets interrupt-on-completion every
> priv->tx_coal_frames[queue] frames, uncoalesced XDP_TX descriptors queued
> on the old queue can be left without a completion interrupt or timer
> cleanup.

ack, right. I will look into this issue.

Regards,
Lorenzo

>=20
> [Severity: High]
> This problem wasn't introduced by this patch, but stmmac_hw_setup()
> ignores the return value of netif_set_real_num_tx_queues() [1]:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_hw_setup() {
> 	...
> 	/* Configure real RX and TX queues */
> 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
> 	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
>=20
> 	/* Start the ball rolling... */
> 	stmmac_start_all_dma(priv);
> 	...
> }
>=20
> Can netif_set_real_num_tx_queues() fail with -ENOMEM during stmmac_open()
> or stmmac_resume(), leaving dev->real_num_tx_queues out of sync with
> priv->xmit_qdisc.num_tx_queues while DMA is started anyway?
>=20
> [1] https://sashiko.dev/#/bug/linux-1bc77f7b-c8d8-4341-a8a0-49092e607be6
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20261117-stmmac-fix-=
xdp_get_tx_queue-v1-1-4cd74ee7a76c@oss.qualcomm.com?part=3D1

--C73daWWgzx+5qrlj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav4mTAAKCRA6cBh0uS2t
rJV1AQCnviCQwmto8ElWVktDx7u3UYI3e80KwQ2VPBGPIwgbIAEA4/BKyVksjYBS
QozICoYQwmzliuxbjmyamjii9kNzIwY=
=kcC7
-----END PGP SIGNATURE-----

--C73daWWgzx+5qrlj--
