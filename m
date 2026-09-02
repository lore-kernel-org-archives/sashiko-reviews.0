Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C047A895
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350173; cv=pass; b=PU7udQh5kxPxIpNcLA+wIFarHPEEoPmCxa7ZX69IzjYc0uXHo1nlzabMjm7T2sPnj93iMJHk7qDDFVM6gtnHd/e2cECWr/p4Sz7yTPpq8ch2Nni53HBROlnvrUVDt+aTv8Pk47zMkWO/6aze9R/04q1N7GLR0JZ8cAdHOp1vMi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350173; c=relaxed/simple;
	bh=9aTnB/VsolXmMC6foR77V4yJLHZj5i7uyuB5JvSk0e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DATiT4WLjiUUzJtK8YARqYqmIhEsn240SllPE2BWAekSN039mvpSq8Fzzc+S6TclcLxEn+Lr3M1nUhOibMDUdG6+N7oDF1XSuesAX27L6AAqZzuImtX7reov1J0HG1ntR9yD6MjmAt3He86eruZwLSQTGYWTxfHnT4JZg/kWgm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKDg8Dkq; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKDg8Dkq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso2078338e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 04:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788350163; cv=none;
        d=google.com; s=arc-20260327;
        b=HydUHuajt+B1gyS/4/SqWYY+Au2HSyINFRXSaunA+3G/DYXa9fp9/V+gMyqvjI/M2s
         bTVUq4yaKi3AtkebgxMaY0q0rAJ2k0JK228ndN3U7uoaZmDA7A9eL86EpouBoC6rnGjY
         wUQQ9cj4ZjqmQ+e4TBeeeuB8j9+gx/RLCQRyNfAUvRBIHH5yZ9YBEPBCo/c9STmRzZiI
         krSZtcs4izai7ESOeDeqBTxkIAtKKwRzI8h6yPnQ0P+NfXdLpmUzWlmgD4DJNom64dDV
         mPlqy3o1bKHyXyzZyxQZ4ndyON0QqIIJZLiRy4QZlQPSVmzgGpA/pAJ9NqN7cThl+atB
         jwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y22TOZ6sV36PcowpSzMqJvb3Bgbt/VKIj2SdBO0JWFE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=LeX+Db85S4a8u7j1H/2aLzMxt8wLW2QXkZuYVUe7A3SY2LGSNYBNG6CODr9ZEoFMUM
         DjEqr9/BMyiwTJ6eYoZur8eNYRsgHdUkaM2rDBqyJm1dHSphqqQsA54VgZPpYqbjWhyU
         7u8rlk+aSWtTd61EqRFcMGbdjyH8SBs2trwBHSFX/DGhv85S0OFnbWfhU62jWSlKI0sm
         6THDXCIFLyVlrvPHKlB1uJvGb+BU0nCbcpXyn/E1aD+YJnLs0z2WsX93ZiHD+oVxxXC/
         5q0fSEbvy0C4dXSbx//RB62bwx8t9qTvhoMfsulREvx71pMcPi99mLyIIXoVX7hhWefO
         tbzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350163; x=1788954963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y22TOZ6sV36PcowpSzMqJvb3Bgbt/VKIj2SdBO0JWFE=;
        b=cKDg8DkqBYJiuulmtz6A7bCNe/x81io9uUYbNzMJVTu7WFqj7pTEzEkBa+eAmoW0R3
         tGlmWIirATouzg43/WlD3CFfpHjryEHMasSTtbi7wAh8h04Ud+tjpF12WucUEjaJXdfF
         I9SzyoUh9pqIRoLra13RII4vGDg52BhZ63DnozwHDIavpHgYOTMc0gVUslKbKUMe1kPN
         XBKlzgX2rX1mjfsedw5XBXwjirekMr1W0Jf0aJmdh0CLB8zzjkVi9cvtAa3FHxLZozR0
         cagO/4IpE+i7wf04Mw2H2yhZWewEz+LL4XrMk2WD771fj2gyd6RlTvRPEORYlpAkaHpr
         BouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350163; x=1788954963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y22TOZ6sV36PcowpSzMqJvb3Bgbt/VKIj2SdBO0JWFE=;
        b=eh0a5Q5JxsT9gROOUVyyRJNEeIllO6DImCFDkur74lKEdfvvSrFXBVLSPevCk4xhby
         9ArThcEYPO7JB2wGkWQXpRBRDDHzuXH9/uKkEWl9XWQMIKbuDSk1Q8QAtzOvBGVX/nnu
         CyVplzeNcffVQO3h4yQ93EBA2C9r9HBEmDgE7tyodUSYeumORMKGuhnZpE2cNeiJIHK2
         xKXHke3LSS9Qo2+bvbhtfIebwgqR/wQBxbEgdY65JKvLgJfD+Tc6hh42hAdUo5jjk1O/
         jlKH5Wr8nbQonfN3PDab0fp5SAQhGKa9tT4y5U6PXawt4iwEvAmxl1QHHT6neXMdTz8z
         f5Vg==
X-Gm-Message-State: AFuF++mNYiYBGow4fvIOMfCBfWxdevHKYtbr4I2wn4WaXglfKw6+8R4N
	evqR7skmmNXYIjBa+lf0R5p2FMb7yRMwYUJOwAX5JUmUQ5MmR3HMA9dpzUR/OmftF22tcDbKOUz
	6J3xsr8EliqztgFQA0ZE6E6yfU1lhZvMMorSDoOU=
X-Gm-Gg: AYBFou3WaLnYgc7jiz3cXN0c85qHgGrnYNSkR1wo7y/Yi7eQy4jWe9s70TvUVsiy/7E
	c1/7kNTuCp2Bj3mUeT/NCo1JBKjtDpcTqxR8YFupX9DwPAWW9HWAG3m2/WsPBp1Rxuy/XeORl5y
	MMAZ0YxLJIC2M7ENYtj45kmiiCiX4YlMtTbX8OnW0nnR6fNnnjemro4L+w5vHtWc4BiJJcjXJg1
	iAV2AlXoWLOGJDeZgxdJmIVEiyZteWK0fukm1I0TICVPdLvx9555v+q26F8ALUj/k3cjbKQEs6T
	9uEgZ8dBbtSsc6Ke0ouW7p9sjDLjH0C5jIohJvQmRx9RH3FZSxWk+mhurDEgMURUz6dxaGsg5cF
	I8GWtSnjgCn+GsAw1Z9c9YmwUr4ISQ81YtVvSYPDF1P/Ml8v7tqBFQ2feGA==
X-Received: by 2002:a05:6512:130c:b0:5b6:421:8adb with SMTP id
 2adb3069b0e04-5b60c31a2bdmr833645e87.16.1788350162785; Wed, 02 Sep 2026
 04:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901083325.3445-1-kerneljasonxing@gmail.com> <20260902083344.1D9311F00A3A@smtp.kernel.org>
In-Reply-To: <20260902083344.1D9311F00A3A@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 2 Sep 2026 19:55:25 +0800
X-Gm-Features: AcwNN1UKyixZhZk_9axNe7uo1mtPY0hJ2kYRqzyzHcRHmsAWEFEpNH_CSNhZsJQ
Message-ID: <CAL+tcoBBqzUo5cKS1MSUSvYd9P3obf210tKZNdUEhz538KPYhA@mail.gmail.com>
Subject: Re: [PATCH net v2] xsk: set network header on skb at generic transmit
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The patch incorrectly anchors the network header at the L2 bou=
ndary (MAC header), which violates standard SKB semantics and contradicts t=
he AF_PACKET convention it claims to follow.
>
> Pre-existing issues:
> - [High] Missing initialization of `skb->mac_header` in the AF_XDP generi=
c transmit path leaves it at `~0U` (0xFFFF), causing out-of-bounds memory a=
ccesses in network drivers that unconditionally read the MAC header.
> --
>
> commit 8222314e7d9b572394dd3fc2b9acb0b3706abd3e
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: set network header on skb at generic transmit
>
> This commit fixes an issue in the XSK generic transmit path where the net=
work
> header was left uninitialized. It adds a call to skb_reset_network_header=
(skb)
> in xsk_skb_init_misc() to ensure the network header is correctly anchored=
 to
> the start of the frame. This prevents a crash when the skb is handled by
> tunnel drivers.
>
> Closes: https://syzkaller.appspot.com/bug?extid=3Df16c1b285c9f63994eec
> Link: https://lore.kernel.org/all/20260826012052.51028-1-kerneljasonxing@=
gmail.com/
>
> >     Reset the network header so skb_network_offset() is valid (0). Note=
 this
> >     anchors it at the start of the frame (L2 for an ethernet device), w=
hich
> >     is the same convention AF_PACKET uses on TX.
>
> [Severity: Medium]
> Does anchoring the network header at the L2 boundary (MAC header) here
> violate SKB semantics and contradict the AF_PACKET convention?
>
> In AF_PACKET's packet_snd(), skb_reset_network_header(skb) is explicitly
> called before skb_reserve(skb, -reserve) prepends the L2 header, correctl=
y
> anchoring the network header at the L3 boundary (after hard_header_len by=
tes).

I will remove this in V3. I misunderstood the boundary in AF_PACKET logic.

>
> By anchoring the network header directly at skb->data (the L2 header) in
> xsk_skb_init_misc(), won't any subsystem, offload logic, or tunneling dri=
ver
> that relies on skb_network_header(skb) erroneously parse the Ethernet hea=
der
> as an IP header?

No, at least until now. That's why resetting is sufficient.

>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 33475b180ea6f..2077bb6299ca9 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -947,6 +947,8 @@ static int xsk_skb_init_misc(struct sk_buff *skb, s=
truct xdp_sock *xs,
> >  {
> >       int err;
> >
> > +     skb_reset_network_header(skb);
> > +
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it also necessary to ca=
ll
> skb_reset_mac_header(skb) here?

I think it should be merged as a fix:
https://lore.kernel.org/all/20260817153957.3177627-1-poros@redhat.com/

Thanks,
Jason

>
> The AF_XDP generic TX path allocates packets via __alloc_skb(), which lea=
ves
> mac_header uninitialized at ~0U (0xFFFF). Because AF_XDP generic TX bypas=
ses
> standard egress paths (like __dev_queue_xmit()) that would normally set t=
he
> MAC header, the SKB is handed to __dev_direct_xmit() with an invalid
> mac_header.
>
> When physical NIC drivers unconditionally read eth->h_proto via
> skb_mac_header(skb) during transmit, this evaluates to skb->head + 0xFFFF=
.
>
> For example, in drivers/net/ethernet/intel/ice/ice_txrx.c:ice_xmit_frame_=
ring():
>
>         eth =3D (struct ethhdr *)skb_mac_header(skb);
>
>         if ((ice_is_switchdev_running(vsi->back) ||
>              ice_lag_is_switchdev_running(vsi->back)) &&
>             vsi->type !=3D ICE_VSI_SF)
>                 ice_eswitch_set_target_vsi(skb, &offload);
>         else if (unlikely((skb->priority =3D=3D TC_PRIO_CONTROL ||
>                            eth->h_proto =3D=3D htons(ETH_P_LLDP)) &&
>                            vsi->type =3D=3D ICE_VSI_PF &&
>                            vsi->port_info->qos_cfg.is_sw_lldp))
>
> Dereferencing this out-of-bounds pointer crosses page boundaries and caus=
es
> a paging violation (kernel panic). Should skb_reset_mac_header(skb) be ad=
ded
> alongside the network header reset to prevent this out-of-bounds read?
>
> >       err =3D xsk_skb_destructor_set_addr(skb, addr);
> >       if (unlikely(err))
> >               return err;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083325.34=
45-1-kerneljasonxing@gmail.com?part=3D1
